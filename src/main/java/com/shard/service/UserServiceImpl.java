package com.shard.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.shard.domain.DeliverAddrVO;
import com.shard.domain.ItemVO;
import com.shard.domain.OrdersVO;
import com.shard.domain.ShardMemberVO;
import com.shard.mapper.CartMapper;
import com.shard.mapper.ItemMapper;
import com.shard.mapper.OrdersMapper;
import com.shard.mapper.UserMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

	private final UserMapper mapper;

	private final PasswordEncoder passwordEncoder;
	
	private final ItemMapper itemMapper;
	
	private final OrdersMapper ordersMapper;
	
	private final CartMapper cartMapper;

	@Override
	public int userCheck(String email, String userPwd) {
		int result = 0;
		String pwd = mapper.userCheck(email);
		boolean realPwd = passwordEncoder.matches(userPwd, pwd);
		if (realPwd) {
			result = 1;
		} else
			result = 0;

		return result;
	}

	@Override
	public ShardMemberVO getUser(String email) {
		return mapper.getUser(email);
	}

	@Override
	public int idCheck(String email) { // 회원가입할 때 id 체크
		int result = -1;

		String id = mapper.getEmail(email);
		System.out.println(id);

		if (id != null) // 데이터베이스에 아이디가 있을 때
			result = 1;
		else // 데이터베이스에 아이디가 없을 때
			result = 0;

		return result;
	}

	@Override
	public int insertKakaoUser(ShardMemberVO vo) {
		return mapper.insertKakaoUser(vo);
	}

	@Override
	public int updateUser(ShardMemberVO vo) {
		return mapper.updateUser(vo);
	}

	@Override
	public int deleteUser(String email) {
		return mapper.deleteUser(email);
	}

	@Override
	public ShardMemberVO getUserEmail(String email) {
		return mapper.getUserEmail(email);
	}

	@Override
	public int adminCheck(String email, String userPwd) {
		int result = 0;
		String pwd = mapper.adminCheck(email);
		if (pwd == null) {
			result = -1;
		} else {
			if (pwd.equals(userPwd)) {
				result = 1;
			} else {
				result = 0;
			}
		}
		return result;
	}

	@Override
	public int emailCheck(String email) {
		int result = 0;
		String userEmail = mapper.emailCheck(email);
		if (userEmail != null) {
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}

	@Override
	public int updatePwdAndMemRestore(String email, String pwd) {
		int result = 0;

		mapper.updatePwd(email, pwd);

		String userPwd = passwordEncoder.encode(pwd);
		mapper.updatePwd(email, userPwd);
		ShardMemberVO vo = mapper.getUser(email);

		if (vo.getSecession() == 1) {
			mapper.updateSec(email);
			result = 1;
		}

		return result;
	}

	@Override
	public void updateSec(String email) {
		mapper.updateSec(email);
	}

	@Override
	public int couponAfterJoin(ShardMemberVO vo, int year, int month, int day, DeliverAddrVO addrVO) {
		Timestamp dob = Timestamp.valueOf(year + "-" + month + "-" + day + " 00:00:00");
		vo.setDob(dob);
		vo.setUserPwd(passwordEncoder.encode(vo.getUserPwd()));

		int result = mapper.insertUser(vo);

		mapper.insertAddr(addrVO);

		List<Integer> coupon = Arrays.asList(1, 2, 3);
		mapper.insertCoupon(coupon, vo.getEmail());

		return result;
	}

	@Override
	public List<ItemVO> customerWishList(String email) {
		// 위시리스트 정보 => 관심상품
		List<Integer> itemNum = itemMapper.getWishListItemNum(email);
		List<ItemVO> itemList = new ArrayList<ItemVO>();
		for (Integer vo : itemNum) {
			ItemVO item = itemMapper.getItem(vo);
			itemList.add(item);
		}

		return itemList;
	}

	@Override
	public Map<Integer, List<ItemVO>> customerOrderList(String email) {
		List<Integer> orderId = ordersMapper.orderIdList(email);
		Map<Integer, List<Integer>> orderItemMap = new HashMap<Integer, List<Integer>>();
		
		for(Integer orderItemNum : orderId) {
			List<Integer> itemNumList = ordersMapper.orderItemNumList(orderItemNum);
			orderItemMap.put(orderItemNum, itemNumList);
		}
		
		Map<Integer, List<ItemVO>> orderItemList = new HashMap<Integer, List<ItemVO>>();
		
		for(Map.Entry<Integer, List<Integer>> entry : orderItemMap.entrySet()) {
			Integer key = entry.getKey();
			List<Integer> values = entry.getValue();
			
			List<ItemVO> list = new ArrayList<ItemVO>();
			for(Integer orderItemNum : values) {
				ItemVO vo = itemMapper.getItem(orderItemNum);
				list.add(vo);
			}
			orderItemList.put(key, list);
		}
		return orderItemList;
	}

	@Override
	public Map<Integer, Integer> customerPointList(String email) {
		List<OrdersVO> orders = ordersMapper.userOrders(email);
		
		int memNum = cartMapper.getMembership(email);
		int pointRate = cartMapper.getPointRate(memNum);
		Map<Integer, Integer> pointList = new HashMap<>();
		
		for(OrdersVO vo : orders) {
			int orderIdPoint = vo.getOrderId();
			int point = (int)(vo.getTotalPrice() * ((float)(pointRate)/100));
			pointList.put(orderIdPoint, point);
		}
		return pointList;
	}
	
	
}
