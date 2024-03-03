package com.shard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shard.domain.ItemVO;
import com.shard.domain.NoticeVO;
import com.shard.domain.PageVO;
import com.shard.service.AdminService;
import com.shard.service.ItemService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class AdminConroller {

	@Autowired
	private AdminService service;

	@Autowired
	private ItemService itemService;
	

	// 관리자 메인 페이지
	@GetMapping("/")
	@PreAuthorize("isAuthenticated()")
	public String admin() {
		return "admin/Admin";
	}

	// 모든 회원 정보 페이지
	@GetMapping("/user")
	@PreAuthorize("isAuthenticated()")
	public void adminUser(Model model, @RequestParam("pageNum") int pageNum,
			@RequestParam("userName") String userName, @ModelAttribute("deleteUser") String deleteUser) {
		if (userName != "") { // 회원 이름으로 검색했을 때
			PageVO vo = new PageVO(pageNum, service.userCount(userName));
			model.addAttribute("page", vo);
			model.addAttribute("userList", service.userSearchList(userName, vo));
			model.addAttribute("userName", userName);
			model.addAttribute("deleteUser", deleteUser);
		} else { // 검색하지 않았을 때
			PageVO vo = new PageVO(pageNum, service.userCount());
			model.addAttribute("userList", service.userList(vo));
			model.addAttribute("page", vo);
			model.addAttribute("deleteUser", deleteUser);
		}

	}

	// 모든 상품 정보 페이지
	@GetMapping("/item")
	@PreAuthorize("isAuthenticated()")
	public void adminItem(Model model, @RequestParam("pageNum") int pageNum,
			@RequestParam("itemName") String itemName, @ModelAttribute("result") String result) {
		if (itemName != "") { // 상품 이름으로 검색했을 때
			PageVO vo = new PageVO(pageNum, service.itemCount(itemName));
			model.addAttribute("itemList", service.itemSearchList(itemName, vo));
			model.addAttribute("page", vo);
			model.addAttribute("itemName", itemName);
			model.addAttribute("pageNum", pageNum);
		} else { // 검색하지 않았을 때
			PageVO vo = new PageVO(pageNum, service.itemCount());
			model.addAttribute("itemList", service.itemList(vo));
			model.addAttribute("page", vo);
			model.addAttribute("pageNum", pageNum);
		}
		model.addAttribute("result", result);
	}

	// 상품 등록 페이지는 관리자만 들어갈 수 있다.
	@GetMapping("/itemInsert")
	@PreAuthorize("isAuthenticated()")
	public void itemInsert() {
	}

	// 상품 등록
	@PostMapping("/itemInsert")
	public String itemInsert(ItemVO vo, @RequestParam("img") List<MultipartFile> file, RedirectAttributes rttr) {
		System.out.println(vo);
		int result = itemService.itemInsert(vo, file);

		if (result == -1) { // 파일 크기가 5MB가 넘었을경우
			rttr.addFlashAttribute("file", "up");
		} else if (result == -2) { // 사진 파일이 아닐 경우
			System.out.println("사진 파일 아님");
			rttr.addFlashAttribute("file", "noImg");
		} else if (result == -3) { // 파일 업로드 중 에러가 발생한 경우
			System.out.println("사진업로드 중 에러 발생");
		}

		return "redirect:/admin/item?pageNum=1&itemName=";
	}

	// 상품 상세정보 페이지는 관리자만 볼 수 있다.
	@GetMapping("/itemGet")
	@PreAuthorize("isAuthenticated()")
	public String get(@RequestParam("itemNum") int itemNum, @RequestParam("pageNum") int pageNum, Model model) {
		model.addAttribute("item", itemService.getItem(itemNum));
		model.addAttribute("pageNum", pageNum);
		return "admin/get";
	}

	// 회원이 남긴 문의사항에 대한 답변을 하지 않는 문의사항만 모아놓은 페이지 (관리자만 접속 가능)
	@GetMapping("/noEnswer")
	@PreAuthorize("isAuthenticated()")
	public void noEnswer(Model model, @RequestParam("pageNum") int pageNum) {
		PageVO vo = new PageVO(pageNum, service.noEnswerCount());
		model.addAttribute("noEnswer", service.noEnswerList(vo));
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("page", vo);
	}

	// 회원 검색할 때
	@PostMapping("/userSearch")
	public String userSearch(@RequestParam("userName") String userName, Model model,
			@RequestParam("pageNum") int pageNum) {
		PageVO vo = new PageVO(pageNum, service.userCount(userName));
		model.addAttribute("userList", service.userSearchList(userName, vo));
		model.addAttribute("page", vo);
		model.addAttribute("userName", userName);
		return "/admin/user";
	}

	// 상품 검색할 때
	@PostMapping("/itemSearch")
	public String itemSearch(@RequestParam("itemName") String itemName, Model model,
			@RequestParam("pageNum") int pageNum) {
		PageVO vo = new PageVO(pageNum, service.itemCount(itemName));
		model.addAttribute("itemList", service.itemSearchList(itemName, vo));
		model.addAttribute("page", vo);
		model.addAttribute("itemName", itemName);
		return "/admin/item";
	}

	// 상품정보 업데이트
	@PostMapping("/itemUpdate")
	public String itemUpdate(ItemVO vo, @RequestParam("img") List<MultipartFile> file, RedirectAttributes rttr) {
		System.out.println(vo);
		int result = itemService.itemUpdate(vo, file);

		if (result == -1) { // 파일 크기가 5MB가 넘었을경우
			rttr.addFlashAttribute("file", "up");
		} else if (result == -2) { // 사진 파일이 아닐 경우
			System.out.println("사진 파일 아님");
			rttr.addFlashAttribute("file", "noImg");
		} else if (result == -3) { // 파일 업로드 중 에러가 발생한 경우
			System.out.println("사진업로드 중 에러 발생");
		}

		return "redirect:/admin/item?pageNum=1&itemName=";
	}
	
	// 상품 삭제
	@GetMapping("/deleteItem")
	@PreAuthorize("isAuthenticated()")
	public String deleteItem(ItemVO vo, RedirectAttributes rttr) {
		itemService.itemDelete(vo.getItemNum());
		rttr.addFlashAttribute("result", "deleteSuccess");
		return "redirect:/admin/item?pageNum=1&itemName=";
	}
	
	// 회원 탈퇴 -> 비활성화
	// 관리자가 회원 탈퇴를 진행했을 때는 비밀번호 찾기를 해도 비활성화가 풀리지 않도록
	// 조치를 취해야하나?
	@PostMapping("/deleteUser")
	public String deleteUser(@RequestParam String email, RedirectAttributes rttr) {
		service.deleteUser(email);
		rttr.addFlashAttribute("deleteUser", "deleteUser");
		return "redirect:/admin/user?pageNum=1&userName=";
	}
	
	/////////////////////공지사항///////////////////////////
	
	// 공지사항 등록 페이지 이동
	@GetMapping("/noticeInsert")
	@PreAuthorize("isAuthenticated()")
	public void noticeInsert() {
	}
	
	// 공지사항 등록
	@PostMapping("/noticeInsert")
	public String noticeIsnert(NoticeVO vo, @RequestParam("img") MultipartFile file, RedirectAttributes rttr) {
		if(file.getSize() == 0) {
			service.insertNotice(vo);
		}else {
			int result = service.insertNotice(vo, file);
			
			if (result == -1) { // 파일 크기가 5MB가 넘었을경우
				rttr.addFlashAttribute("file", "up");
			} else if (result == -2) { // 사진 파일이 아닐 경우
				System.out.println("사진 파일 아님");
				rttr.addFlashAttribute("file", "noImg");
			} else if (result == -3) { // 파일 업로드 중 에러가 발생한 경우
				System.out.println("사진업로드 중 에러 발생");
			}
		}
		return "redirect:/shard/notice?pageNum=1";
	}
	
	// 공지사항 삭제
	@PostMapping("/noticeDelete")
	public String noticeDelete(@RequestParam int noticeNum, RedirectAttributes rttr) {
		service.deleteNotice(noticeNum);
		rttr.addFlashAttribute("deleteNotice", "deleteNotice");
		return "redirect:/shard/notice?pageNum=1";
	}
	
	// 공지사항 업데이트 페이지 이동
	@GetMapping("/noticeUpdate")
	@PreAuthorize("isAuthenticated()")
	public void noticeUpdate(@RequestParam int noticeNum, @RequestParam int pageNum, Model model) {
		model.addAttribute("notice", service.getNotice(noticeNum));
		model.addAttribute("pageNum", pageNum);
	}
	
	// 공지사항 업데이트
	@PostMapping("/noticeUpdate")
	public String noticeUpdate(NoticeVO vo, @RequestParam("img") MultipartFile file, RedirectAttributes rttr) {
		if(file.getSize() == 0) {
			NoticeVO notice = service.getNotice(vo.getNoticeNum());
			vo.setNoticeImg(notice.getNoticeImg());
			service.updateNotice(vo);
		}else {
			int result = service.updateNotice(vo, file);
			
			if (result == -1) { // 파일 크기가 5MB가 넘었을경우
				rttr.addFlashAttribute("file", "up");
			} else if (result == -2) { // 사진 파일이 아닐 경우
				System.out.println("사진 파일 아님");
				rttr.addFlashAttribute("file", "noImg");
			} else if (result == -3) { // 파일 업로드 중 에러가 발생한 경우
				System.out.println("사진업로드 중 에러 발생");
			}
		}
		
		return "redirect:/shard/notice?pageNum=1";
	}
	
	////////////통계/////////////////////
	@GetMapping("/statistics")
	@PreAuthorize("isAuthenticated()")
	public void adminUser(Model model, ItemVO vo) {
		int t1 = service.statisticsCount(156);
		int t2 = service.statisticsCount(100);
		int t3 = service.statisticsCount(64);
		int t4 = service.statisticsCount(4);
		 // 통계 카운트용 
		model.addAttribute("t1", t1);
		model.addAttribute("t2", t2);
		model.addAttribute("t3", t3);
		model.addAttribute("t4", t4);
	}
}
