package com.shard.service;

import java.util.List;
import java.util.Map;

import com.shard.domain.DeliverAddrVO;
import com.shard.domain.ItemVO;
import com.shard.domain.ShardMemberVO;

public interface UserService {
	public int userCheck(String email, String userPwd);
	
	public ShardMemberVO getUser(String email);
	
	public int idCheck(String email);

	public ShardMemberVO getUserEmail(String email);

	public int insertKakaoUser(ShardMemberVO vo);

	public int updateUser(ShardMemberVO vo);

	public int deleteUser(String email);
	
	public int emailCheck(String email);

	public int adminCheck(String email, String userPwd);
	
	public int updatePwdAndMemRestore(String email, String pwd);
	
	public void updateSec(String email);
	
	public int couponAfterJoin(ShardMemberVO vo, int year, int month, int day, DeliverAddrVO addrVO);
	
	public List<ItemVO> customerWishList(String email);
	
	public Map<Integer, List<ItemVO>> customerOrderList(String email);
	
	public Map<Integer, Integer> customerPointList(String email);
}
