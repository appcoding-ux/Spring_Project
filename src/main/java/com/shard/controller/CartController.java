package com.shard.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shard.service.CartService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/order/*")
@Log4j
public class CartController {

	@Autowired
	private CartService cartService;

	@PostMapping("/cart")
	@PreAuthorize("isAuthenticated()")
	public void cart(@RequestParam String email, Model model, @RequestParam(name = "itemNum", required = false) Integer itemNum, @RequestParam(name = "cnts", required = false) List<Integer> cnts,
			@RequestParam(name = "sizes", required = false) List<String> sizes) { // required를 false로 설정해놓으면 파라미터 값에 null이 들어오는게 가능하다.
		System.out.println(itemNum);
		System.out.println(cnts);
		System.out.println(sizes);
		
		if(itemNum == null && cnts == null && sizes == null) {
			cartService.dataCart(model, email);
		}else {
			// detailCart추가
			cartService.initCart(email, itemNum, cnts, sizes);
			cartService.dataCart(model, email);
		}
	}

	@PostMapping("/chooseDetailCartDelete")
	@ResponseBody
	public ResponseEntity<String> chooseDetailCartDelete(@RequestBody Map<String, Object> requestData) {
		log.info(requestData);
		// JSON 배열을 List<Integer>로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		List<Integer> selectedItems = objectMapper.convertValue(requestData.get("selectedItems"),
				new TypeReference<List<Integer>>() {
				});
		int cartNum = (int) requestData.get("cartNum");
		String size = (String) requestData.get("size");
		log.info(selectedItems);
		log.info(cartNum);
		log.info(size);
		cartService.chooseDetailCartDelete(selectedItems, cartNum, size);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	@PostMapping("/allDetailCartDelete")
	public ResponseEntity<String> allDetailCartDelete(@RequestParam("cartNum") int cartNum) {
		System.out.println("여기는 실행됨");
		System.out.println(cartNum);
		cartService.allDetailCartDelete(cartNum);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	@PostMapping("/updateExpectedPlusAmount")
	public ResponseEntity<String> updateExpectedPlusAmount(@RequestParam("itemNum") int itemNum,
			@RequestParam("size") String size) {
		System.out.println("여기 오면서 itemNum : " + itemNum);
		System.out.println("여기 오면서 itemNum : " + size);
		cartService.detailCartCntPlusUpdate(itemNum, size);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	@PostMapping("/updateExpectedMinusAmount")
	public ResponseEntity<String> updateExpectedMinusAmount(@RequestParam("itemNum") int itemNum,
			@RequestParam("size") String size) {
		System.out.println("여기 오면서 itemNum : " + itemNum);
		System.out.println("여기 오면서 size : " + size);
		cartService.detailCartCntMinusUpdate(itemNum, size);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

}