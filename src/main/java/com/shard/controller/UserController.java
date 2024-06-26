package com.shard.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shard.domain.DeliverAddrVO;
import com.shard.domain.PageVO;
import com.shard.domain.ShardMemberVO;
import com.shard.service.AdminService;
import com.shard.service.ItemSearchService;
import com.shard.service.MailSendService;
import com.shard.service.OrderService;
import com.shard.service.QnAService;
import com.shard.service.SosialLoginService;
import com.shard.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/shard/*")
@Log4j
@RequiredArgsConstructor
public class UserController {
	
//	여기가 사용하는게 가장 많고 까다로운 로그인 + 회원가입 + 카카오 간편 로그인 + 마이페이

	private final SosialLoginService kakaoLoginService;

	private final UserService userservice;

	private final MailSendService mailSendService;

	private final PasswordEncoder passwordEncoder;

	private final AdminService adminService;
	
	private final OrderService orderService;
	
	private final QnAService qnAService;
	
	private final ItemSearchService searchService;

	// 메인 페이지로 이동 // 카카로 로그아웃 이후에도 여기로 이동
	@GetMapping("")
	public String index(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		log.info("index");
		if(email.equals("anonymousUser")) {
			model.addAttribute("list", searchService.AllMainLatest());
			return "index";
		}else {
			model.addAttribute("cartItemCount", orderService.cartItemCount(email));
			model.addAttribute("list", searchService.AllMainLatest());
			return "index";
		}
	}

	// 로그인 페이지로 이동
	@GetMapping("/login")
	public String login(@ModelAttribute("result") String result, Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		if(email.equals("anonymousUser")) {
			model.addAttribute("result", result);
			return "user/shardLogin";
		}else {
			model.addAttribute("cartItemCount", orderService.cartItemCount(email));
			model.addAttribute("list", searchService.AllMainLatest());
			return "index";
		}
	}

	// 로그인을 실패했을 경우
	@GetMapping("/failLogin")
	public String failLogin(RedirectAttributes rttr) {
		rttr.addFlashAttribute("result", "noUser");
		return "redirect:/shard/login";
	}

	// 회원가입 페이지로 이동
	@GetMapping("/join")
	public String join() {
		log.info("join");
		return "user/shardJoin";
	}

	// 카카오 회원가입 페이지로 이동
	@GetMapping("/kakaoJoin")
	public String kakaoJoin(Model model, @ModelAttribute("userEmail") String userEmail,
			@ModelAttribute("nickName") String nickName) {
		log.info("kakaoJoin");
		model.addAttribute("userEmail", userEmail);
		model.addAttribute("nickName", nickName);
		return "user/kakaoJoin";
	}

	// 카카오로 로그인했을 때 따로 만든 카카오 로그아웃
	@GetMapping("/kakaoLogout")
	public String kakaoLogout(RedirectAttributes rttr, HttpServletRequest request, HttpServletResponse response,
			HttpSession session, SessionStatus status) throws Throwable {
		log.info("카카오 로그아웃");
		session.invalidate();
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}

		return "redirect:/shard/";
	}

	// ajax로 회원가입할 때 데이터베이스에 사용중인 아이디가 있는지 체크
	@GetMapping("/idCheck")
	public ResponseEntity<Map<String, Integer>> idCheck(String email, HttpServletResponse response) throws Exception {
		System.out.println(email);
		int result = userservice.idCheck(email);
		Map<String, Integer> resultMap = new HashMap<String, Integer>();
		resultMap.put("result", result);
		return new ResponseEntity<>(resultMap, HttpStatus.OK);
	}

	// 회원가입할 때 이메일 인증을 위한 이메일 전송
	@GetMapping("/emailSecurity")
	public ResponseEntity<String> emailSecurity(String email) {
		System.out.println("요청온 이메일 : " + email);
		return new ResponseEntity<String>(mailSendService.joinEmail(email), HttpStatus.OK);
	}

	// 카카오 로그인을 할 때
	@GetMapping("/login/oauth")
	public String kakaoOauth(@RequestParam(required = false) String code, Model model, RedirectAttributes rttr,
			HttpSession session) throws Throwable {
		String url = "";

		String access_Token = kakaoLoginService.getAccessToken(code);

		HashMap<String, Object> userInfo = kakaoLoginService.getUserInfo(access_Token);

		String userEmail = (String) userInfo.get("email"); // 이메일
		String nickName = (String) userInfo.get("nickName"); // 닉네임
		int result = userservice.emailCheck(userEmail);

		if (result != 0) {
			kakaoLoginService.setAuthentication(userEmail);
			session.setAttribute("token", access_Token);
			url = "redirect:/shard/";
		} else {
			rttr.addAttribute("userEmail", userEmail);
			rttr.addAttribute("nickName", nickName);
			url = "redirect:/shard/kakaoJoin";
		}
		return url;
	}

	// 모든 회원이 이용 가능한 공지사항 페이지
	@GetMapping("/notice")
	public String notice(@RequestParam int pageNum, Model model, @ModelAttribute("deleteNotice") String deleteNotice, @ModelAttribute("file") String file) {
		PageVO vo = new PageVO(pageNum, adminService.noticeCount());
		model.addAttribute("list", adminService.noticeList(vo));
		model.addAttribute("page", vo);
		model.addAttribute("deleteNotice", deleteNotice);
		model.addAttribute("file", file);
		return "notice";
	}

	// 공지사항 상세정보 페이지
	@GetMapping("/noticeGet")
	public String noticeGet(@RequestParam int pageNum, @RequestParam int noticeNum, Model model) {
		model.addAttribute("notice", adminService.getNotice(noticeNum));
		model.addAttribute("pageNum", pageNum);
		return "noticeGet";
	}

	// 회원가입
	@PostMapping("/join")
	public String join(ShardMemberVO vo, RedirectAttributes rttr, @RequestParam("birthYear") int year,
			@RequestParam("birthMonth") int month, @RequestParam("birthDay") int day, DeliverAddrVO addrVO) {
		// 회원가입을 했을 때 가입 후 웰컴쿠폰 증정까지
		int result = userservice.couponAfterJoin(vo, year, month, day, addrVO);
		
		if (result == 1) {
			rttr.addFlashAttribute("result", "success");
		} else {
			rttr.addFlashAttribute("result", "faild");
		}
		return "redirect:/shard/login";
	}

	// 카카오 로그인으로 간편 회원가입
	@PostMapping("/kakaoJoin")
	public String kakaoJoin(RedirectAttributes rttr, ShardMemberVO vo, @RequestParam("birthYear") int year,
			@RequestParam("birthMonth") int month, @RequestParam("birthDay") int day, DeliverAddrVO addrVO) {
		int result = userservice.couponAfterJoin(vo, year, month, day, addrVO);
		
		if (result == 1) {
			rttr.addFlashAttribute("result", "success");
		} else {
			rttr.addFlashAttribute("result", "faild");
		}
		return "redirect:/shard/login";
	}

	////////////////////////////// 비밀번호 찾기 //////////////////////////////

	@GetMapping("/findUser")
	public String findUser() {
		return "user/findUser";
	}
	
	// 비밀번호 찾기에서 이메일 인증을 눌렀을 경우
	@GetMapping("/findPwd")
	public ResponseEntity<String> findPwd(String email) {
		System.out.println(email);
		int result = userservice.idCheck(email);
		if (result != 0) {
			ShardMemberVO vo = userservice.getUser(email);
			if (vo.getUserPwd() == null) {
				return new ResponseEntity<String>("kakaoUser", HttpStatus.OK);
			} else {
				return new ResponseEntity<String>(mailSendService.findPwd(email), HttpStatus.OK);
			}
		} else {
			return new ResponseEntity<String>("noUser", HttpStatus.OK);
		}
	}

	// 인증번호 인증 후 비밀번호 변경 페이지로 이동
	@PostMapping("/changePwd")
	public String changePwd(Model model, @RequestParam String email) {
		model.addAttribute("email", email);
		return "user/changePwd";
	}

	// 비밀번호 변경
	// 여기서 회원탈퇴를 한 회원은 다시 복구하는 기능을 구현(했다)
	@PostMapping("/updatePwd")
	public String updatePwd(@RequestParam String userPwd, @RequestParam String email, RedirectAttributes rttr) {
		int result = userservice.updatePwdAndMemRestore(email, userPwd);
		
		if(result == 1) { // 탈퇴한 회원의 경우
			rttr.addFlashAttribute("result", "updateSec");
		}else { // 일반적인 비밀번호 변경
			rttr.addFlashAttribute("result", "updatePwd");
		}
		
		return "redirect:/shard/login";
	}

	///////////////////////// 회원 정보 /////////////////////////////
	
	// 마이페이지 => 이게 가장 오래 걸리지 않을까?...
	// 진짜 쉽지 않았다.ㅠㅠ
	@PostMapping("/myPage")
	@PreAuthorize("isAuthenticated()")
	public String mypage(Model model, @RequestParam String email) {
		model.addAttribute("user", userservice.getUser(email)); // 회원 정보
		
		// 쿠폰 정보
		model.addAttribute("coupon", orderService.getCouponIssuance(email)); // 가지고 있는 쿠폰?이겠지?
		model.addAttribute("couponCount", orderService.couponCount(email)); // 가지고 있는 쿠폰의 갯수
		model.addAttribute("couponVO", orderService.couponList()); // 쿠폰의 정보
		
		
		// 위시리스트
		model.addAttribute("itemList", userservice.customerWishList(email)); // 회원의 위시리스트 정보
		
		// 고객이 작성한 게시글
		model.addAttribute("qna", qnAService.myPageQnAList(email));
		model.addAttribute("qnaCount", qnAService.myPageQnACount(email));
		
		//고객의 배송지
		model.addAttribute("address", orderService.getUserAddress(email));
		
		// 고객의 주문정보
		model.addAttribute("orders", orderService.userOrders(email)); //전체 주문내역
		model.addAttribute("orderItemList", userservice.customerOrderList(email)); // 주문내역에 관한 상품정보
		
		// 고객의 적립금내역
		model.addAttribute("pointList", userservice.customerPointList(email));
		
		// 고객의 장바구니에 있는 itemCount
		model.addAttribute("cartItemCount", orderService.cartItemCount(email));
		
		return "user/myPage";
	}
	

	// 회원정보 수정을 위한 비밀번호 확인 페이지 이동
	@GetMapping("/userCheck")
	@PreAuthorize("isAuthenticated()")
	public String userCheck(HttpSession session, Model model, @ModelAttribute String result) {
		String token = (String) session.getAttribute("token");
		if (token != null) {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String email = authentication.getName();
			ShardMemberVO vo = userservice.getUser(email);
			model.addAttribute("user", vo);
			return "user/userGet";
		} else {
			model.addAttribute("result", result);
			return "user/check";
		}
	}

	// 비밀번호 확인
	@PostMapping("/userCheck")
	public String userCheck(ShardMemberVO vo, Model model, RedirectAttributes rttr) {
		int result = userservice.userCheck(vo.getEmail(), vo.getUserPwd());
		String url = "";
		if (result == 1) {
			model.addAttribute("user", userservice.getUser(vo.getEmail()));
			url = "user/userGet";
		} else {
			rttr.addFlashAttribute("result", "noPwd");
			url = "redirect:/shard/userCheck";
		}

		return url;
	}

	// 회원정보 수정
	@PostMapping("/updateUser")
	public String updateUser(ShardMemberVO vo, RedirectAttributes rttr) {
		if (vo.getUserPwd() != null) { // 일반 회원
			String pwd = passwordEncoder.encode(vo.getUserPwd());
			vo.setUserPwd(pwd);
			userservice.updateUser(vo);
		}else { // 카카오 로그인 회원
			userservice.updateUser(vo);
		}
		return "redirect:/shard/";
	}
	
	// 회원탈퇴
	@PostMapping("/deleteUser")
	public String deleteUser(@RequestParam String email) {
		adminService.deleteUser(email);
		return "redirect:/shard/kakaoLogout";
	}
	
	////////////////////////배송 관련/////////////////////////////////
	@PostMapping("/deliverMap")
	@PreAuthorize("isAuthenticated()")
	public String deliverMap(@RequestParam String roadAddress, @RequestParam("orderId") int orderId , Model model) {
		model.addAttribute("roadAddress", roadAddress);
		model.addAttribute("orderId", orderId);
		return "user/deliverMap";
	}
	
	// 배송완료 이메일 보내기
	@GetMapping("/arriveEmail")
	public void arriveEmail(@RequestParam String email, @RequestParam int orderId) {
		orderService.deliverComplete(orderId);
		mailSendService.arriveEmail(email);
	}
}