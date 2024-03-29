package com.shard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shard.domain.CustomUser;
import com.shard.domain.PageVO;
import com.shard.domain.QnAEnswerVO;
import com.shard.domain.QnAVO;
import com.shard.service.MailSendService;
import com.shard.service.QnAEnswerService;
import com.shard.service.QnAService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/qna/*")
@Log4j
public class QnAController {

	@Autowired
	private QnAService service;

	@Autowired
	private QnAEnswerService enswerService;

	@Autowired
	private MailSendService mailSendService;
	
	// 이거는 지금 사용하지 않지만 나중에 
	// 문의사항의 상세정보를 보려고 할 때 비밀번호가 우연히 일치할 수 있기 때문에
	// 이런 장치가 필요하다고 생각함.
//	@GetMapping("/adari")
//	public String adari(RedirectAttributes rttr) {
//		rttr.addFlashAttribute("result", "adari");
//		return "redirect:/qna/list?pageNum=1";
//	}

	// 전체 문의사항 리스트 페이지
	@GetMapping("/list")
	public void list(@RequestParam("pageNum") int pageNum, Model model, @ModelAttribute("file") String file, @ModelAttribute("result") String result) {
		PageVO vo = new PageVO(pageNum, service.totalCount());
		model.addAttribute("page", vo);
		model.addAttribute("list", service.qnaList(vo));
		model.addAttribute("enswer", enswerService.enswerList());
		model.addAttribute("file", file);
		model.addAttribute("result", result);
	}

	// 문의사항 등록 페이지
	@GetMapping("/insert")
	@PreAuthorize("isAuthenticated()")
	public void insert() {
	}

	// 재문의 등록 페이지
	@GetMapping("/Reinsert")
	@PreAuthorize("isAuthenticated()")
	public void Reinsert(@RequestParam("pageNum") int pageNum, @RequestParam("inquiryNum") int inquiryNum, Model model) {
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("inquiryNum", inquiryNum);
	}

	
	@GetMapping("/check") // 문의를 보기 위한 비밀번호 체크
	public void check(@RequestParam("pageNum") int pageNum, @RequestParam("replyNum") int replyNum, Model model) {
		model.addAttribute("replyNum", replyNum);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("reply", service.getQnA(replyNum));
	}

	// 문의사항 상세정보 비밀번호 체크
	@PostMapping("/checked")
	public String checked(@RequestParam("pageNum") int pageNum, QnAVO vo, RedirectAttributes rttr, Model model) {
		int result = service.getReplyCheck(vo.getReplyNum(), vo.getReplyPwd());
		String url = "";
		if (result == 1) {
			rttr.addAttribute("pageNum", pageNum);
			rttr.addAttribute("replyNum", vo.getReplyNum());
			url = "redirect:/qna/get";
		} else {
			rttr.addFlashAttribute("result", 0);
			rttr.addAttribute("pageNum", pageNum);
			rttr.addAttribute("replyNum", vo.getReplyNum());
			url = "redirect:/qna/check";
		}

		return url;
	}

	// 문의사항 상세정보 페이지
	@GetMapping("/get")
	@PreAuthorize("isAuthenticated()")
	public void get(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, @RequestParam("replyNum") int replyNum, Model model) {
		model.addAttribute("reply", service.getQnAList(replyNum));
		model.addAttribute("enswer", enswerService.enswerGetList(replyNum));
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("replyNum", replyNum);
		QnAVO vo = service.getQnA(replyNum);
		model.addAttribute("user", vo);
	}

	// 문의사항 등록
	@PostMapping("/insert")
	public String insertQnA(QnAVO vo, @RequestParam("img") MultipartFile file, RedirectAttributes rttr) {
		if(file.getSize() == 0) {
			service.qnaInsert(vo);
		}else {
			int result = service.qnaInsert(vo, file);

			if (result == -1) { // 파일 크기가 5MB가 넘었을경우
				rttr.addFlashAttribute("file", "up");
			} else if (result == -2) { // 사진 파일이 아닐 경우
				System.out.println("사진 파일 아님");
				rttr.addFlashAttribute("file", "noImg");
			} else if (result == -3) { // 파일 업로드 중 에러가 발생한 경우
				System.out.println("사진업로드 중 에러 발생");
			}
		}
		
		return "redirect:/qna/list?pageNum=1";
	}

	// 재문의 등록
	@PostMapping("/Reinsert")
	@PreAuthorize("isAuthenticated()")
	public String Reinsert(QnAVO vo) {
		service.qnaReInsert(vo);
		return "redirect:/qna/list?pageNum=1";
	}

	// 문의사항에 대한 답변 등록 페이지
	@GetMapping("/enswer")
	@PreAuthorize("isAuthenticated()")
	public void enswer(@RequestParam("replyNum") int replyNum,@RequestParam("inquiryNum") int inquiryNum, Model model) {
		model.addAttribute("reply", service.getQnA(replyNum));
		model.addAttribute("inquiryNum", inquiryNum);
	}

	// 문의사항 답변 등록
	@PostMapping("/enswer")
	public String enswer(QnAEnswerVO vo, Model model) {
		enswerService.insertEnswer(vo);
		enswerService.updateComplete(vo.getReplyNum());
		mailSendService.enwserEmail(vo.getEmail());
		return "redirect:/admin/noEnswer?pageNum=1";
	}
	
	// 문의사항 삭제
	@PostMapping("/delete")
	public String delete(@RequestParam("pageNum") int pageNum, @RequestParam("replyNum") int replyNum, RedirectAttributes rttr) {
		System.out.println("여기는 넘어옵니다");
		service.delete(replyNum);
		rttr.addFlashAttribute("result", "deleteSuccess");
		return "redirect:/qna/list?pageNum="+pageNum;
	}

}