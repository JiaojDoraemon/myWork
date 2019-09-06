package com.bank.BSTMS.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bank.BSTMS.mapper.AccountMapper;
import com.bank.BSTMS.mapper.BillMapper;
import com.bank.BSTMS.mapper.UserMapper;
import com.bank.BSTMS.pojo.Account;
import com.bank.BSTMS.pojo.Bill;
import com.bank.BSTMS.pojo.User;

/**
 * 
 * @ClassName: AccountInfoSvc
 * @Description: 登录信息服务
 * @author 哆啦A梦
 * @date 2019年6月26日
 * @since JDK 1.8
 */
@Service
public class AccountInfoSvc {
	
	/**
	 * 银行卡信息mapper依赖
	 * 获取数据库中信息
	 */
	@Autowired(required=false)
	private AccountMapper accountMapper;
	public Account getCardById(String cardId) {	
		 Account account=accountMapper.selectByPrimaryKey(cardId); //通过卡号查找所有属性
		 return account; //返回属性的值
	}
	
	/**
	 * 获取账单内容
	 */
	@Autowired(required=false)
	private BillMapper billMapper;
	public List<Bill> getBill(String cardId) {
		return billMapper.selectByCardKey(cardId);
		// bill;
	}
	
	/**
	 * 
	 * @Title: insertBill
	 * @Description: 更新账单信息
	 * @param bill
	 * @return
	 */
	@Autowired(required=false)
	public boolean insertBill(Bill bill) {
		return billMapper.insert(bill);
	}
	/**
	 * 
	 * @Title: alterAccount
	 * @Description: 修改账户各种信息：密码，转账，取款，存钱
	 * @param account
	 * @return
	 */
	
	@Autowired(required=false)
	//private AccountMapper alterpassword;
	//private Account accountMapper;
	public boolean alterAccount(Account account) {
		System.out.println(account.getPassword());
		System.out.println(account.getAccountbalance());
		return accountMapper.updateByPrimaryKey(account); //通过卡号修改账户
		
	}
	
	/**
	 * 
	 * @Title: insertAccount
	 * @Description: 添加账户信息
	 * @param account
	 * @return
	 */
	@Autowired(required=false)
	public boolean insertAccount(Account account) {
		return accountMapper.insert(account);
	}
	/**
	 * 添加用户信息
	 */
	@Autowired(required=false)
	private UserMapper userMapper;
	public boolean insertUser(User user) {
		return userMapper.insert(user);
	}
	
	
}
