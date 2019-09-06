package com.bank.BSTMS.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bank.BSTMS.pojo.Account;
import com.bank.BSTMS.pojo.Bill;
import com.bank.BSTMS.pojo.User;
import com.bank.BSTMS.svc.AccountInfoSvc;

@Controller
public class CardAction {
	@Autowired
	private AccountInfoSvc accountInfoSvc;

	@RequestMapping("/")
	public String index(HttpServletRequest request) {
		request.setAttribute("key", "Sd");
		return "bank_login";
	}
	
	@RequestMapping("backmain")
	public String backmain() {
		return "main";
	}
	/**
	 * 
	 * @Title: getCard
	 * @Description: 登录页面
	 * @param card
	 * @param pwd
	 * @param session
	 * @return
	 */
	@RequestMapping("getCard")
	public String getCard(@RequestParam String card,@RequestParam String pwd ,HttpSession session) {	
		//验证银行卡号是否有效，true：验证成功(进入主页)，false:验证失败（登录页面）
		Account accountInfo;
		
		String page = "";
		if(card!=null) {
			//判断密码有效性	
			accountInfo = accountInfoSvc.getCardById(card);
			if(accountInfo!=null&&accountInfo.getPassword().equals(pwd)) {
				session.setAttribute("account", accountInfo);
				page = "main";
			}
			//TODU 验证用户是否存在 true:main,false:login
			else{
				//session.setAttribute("wrong", "格式或密码不正确");
				page = "errorlogin";
			}	
		}
		return page;
	}
	
	/**
	 * 
	 * @Title: 开户
	 * @Description: 初始化开户页面
	 * @return
	 */
	@RequestMapping("openuser")
	public String openUser(HttpSession session) {
		
		int min = 10000;
		int max = 1000000;
		int n = 200;
		int[] result = new int[n];
		int count = 0;
		while(count < n) {
			int num = (int) ((Math.random()*(max-min))+min);
			boolean flag = true;
			for(int j=0; j<n; j++) {
				if(num==result[j]) {
					flag = false;
					break;
				}
			}
			if(flag) {
				result[count] = num;
				session.setAttribute("cardid", result[count]);
				count++;			
			}
		}
		
		return "open";
	}

	/**
	 * 开户页面
	 */
	@RequestMapping("getUser")
	public String getUser(@RequestParam String cardid,@RequestParam String psw,@RequestParam String rpsw,@RequestParam String name,
			@RequestParam String id,@RequestParam String phone,@RequestParam String addr,@RequestParam String type,
			@RequestParam String limt,@RequestParam String litime, User user, Account account,HttpSession session, ServletRequest request){
		
				//判断密码不为空且两次输入密码相等
				if(psw!=""&&rpsw!=""&&psw.equals(rpsw)&&id!=""&&name!=""
						&&phone!=""&&addr!=""&&limt!="") {
					//判断限额
					
					if(Integer.parseInt(litime) > 20 && Integer.parseInt(litime)<=0) {
						return "limtimerror";
					}else {
						user.setIdentify(id);
						user.setUsername(name);
						user.setTelnum(phone);
						user.setAddress(addr);
						account.setCardid(cardid);
						account.setAccountbalance("0");
						account.setIdentify(id);
						account.setPassword(psw);
						account.setType(type);
						account.setCreditlimit(limt);
						account.setEffectivedate(litime);
						accountInfoSvc.insertUser(user);
						accountInfoSvc.insertAccount(account);
						//System.out.println("添加成功！！！");
						return "bank_login";
					}
				
				}	
				else {
					//System.out.println("密码错误！！！");
					return "openfail";
					
				}
			
			
		
			
	}
	/**
	 * 
	 * @Title: getBill
	 * @Description: 获取账单页面
	 * @param session
	 * @param request 
	 * @return
	 */
	@RequestMapping("getBill")
	public String getBill(Model model, HttpSession session, ServletRequest request, Bill billShow) {
		Account carid = (Account)session.getAttribute("account"); //获取session里的account内容
		String cardid = carid.getCardid(); //获取account里的卡号
		List<Bill> showbill = accountInfoSvc.getBill(cardid);//将获取的卡号传入服务层
		Collections.reverse(showbill);
		model.addAttribute("showbill", showbill);
		//request.setAttribute("showbill", showbill);
		return "bill";
		
	}
	/**
	 * 
	 * @Title: getBalanceMoney
	 * @Description: 获取余额
	 * @return
	 */
	  @RequestMapping(value="getBalanceMoney",method=RequestMethod.GET) 
	  public String getBalanceMoney() { 
		  return "balancem";
		  }
	 

	/**
	 * 
	 * @Title: 存钱
	 * @Description: 初始化开存钱面
	 * @return
	 */
	@RequestMapping("savem")
	public String saveMoney() {
		return "savemoney";
	}
	
	/**
	 * 
	 * @Title: saveMoney
	 * @Description: 存钱操作，更新账户金额
	 * @param paramMap
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping("saveMoney")
	@ResponseBody
	public Map<String,String> saveMoney( @RequestParam Map<String,String> paramMap,HttpSession session, 
			ServletRequest request, Bill bill){
		String save = paramMap.get("value");
		Account account = (Account)session.getAttribute("account"); //获取session里的account内容
		String money=account.getAccountbalance(); //获取余额
		
		float money1=Float.parseFloat(save); //类型转换，计算余额
		float money2=Float.parseFloat(money);
		float allmoney = money1 + money2;
		String all = String.valueOf(allmoney);
		account.setAccountbalance(all);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str=sdf.format(new Date());
		if(accountInfoSvc.alterAccount(account)) {
			account = accountInfoSvc.getCardById(account.getCardid());
			//填写账单
			bill.setCardid(account.getCardid());
			bill.setAffairtype("存钱");
			bill.setTradetime(str);
			bill.setTradebalance(save);
			accountInfoSvc.insertBill(bill);
			session.setAttribute("account",account);
		}
		//System.out.println("===+++"+password+"==233");
		return paramMap;
		
	}
	
	/**
	 * 
	 * @Title: getm
	 * @Description: 获取取钱页面
	 * @return
	 */
	@RequestMapping(value="getm",method=RequestMethod.GET)
	public String getm() {
		return "gm";
	}
	
	/**
	 * 
	 * @Title: getMoney
	 * @Description:  取钱业务操作
	 * @param paramMap 金额
	 * @return 取钱操作状态信息
	 */
	@RequestMapping("getMoney")
	@ResponseBody
	public Map<String,String> getMoney(@RequestParam Map<String,String> paramMap,HttpSession session, ServletRequest request, Bill bill){
		String getm = paramMap.get("value");
		Account account = (Account)session.getAttribute("account"); //获取session里的account内容
		String money=account.getAccountbalance(); //获取余额
		float money1=Float.parseFloat(getm); //取款金额类型转换
		float money2=Float.parseFloat(money);	//余额转换类型
		String limtmoney=account.getCreditlimit();//获取透支额度
		float limtm = Float.parseFloat(limtmoney);//获取透支额度转换类型
		
		if(money1>money2) {
			float limtmo = (limtm + money2) - money1; //计算剩余额度:当所取金额大于余额时，计算出限额的剩余，否则还是最初的限额	
			String alllimt  = String.valueOf(limtmo);
			account.setAccountbalance("0");
			account.setCreditlimit(alllimt);
		}
		else {
			float allmoney = money2 - money1;//剩余金额
			String all = String.valueOf(allmoney);
			account.setAccountbalance(all);
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str=sdf.format(new Date());
		if(accountInfoSvc.alterAccount(account)) {
			account = accountInfoSvc.getCardById(account.getCardid());
			//填写账单
			bill.setCardid(account.getCardid());
			bill.setAffairtype("取款");
			bill.setTradetime(str);
			bill.setTradebalance(getm);
			accountInfoSvc.insertBill(bill);
			session.setAttribute("account",account);
		}
		//System.out.println("===+++"+password+"==233");
		return paramMap;
		
	}
	
	
	/**
	 * 
	 * @Title: 转账
	 * @Description: 初始化转账页面
	 * @return
	 */
	@RequestMapping("movem")
	public String moveMoney() {
		return "movemoney";
	}
	
	/**
	 * 转账页面
	 */
	@RequestMapping("moveMoney")
	@ResponseBody
	public Map<String,String> moveMoney( @RequestParam Map<String,String> paramMap,HttpSession session, ServletRequest request, Bill bill){
		String move = paramMap.get("value");
		Account account = (Account)session.getAttribute("account"); //获取session里的account内容
		String money=account.getAccountbalance(); //获取余额
		float money1=Float.parseFloat(move); //转账金额类型转换
		float money2=Float.parseFloat(money); //余额转换类型
		
		String limtmoney=account.getCreditlimit();//获取透支额度
		float limtm = Float.parseFloat(limtmoney);
		
		if(money1 > money2) {
			float limtmo = (limtm + money2) - money1; //计算剩余额度:当所取金额大于余额时，计算出限额的剩余，否则还是最初的限额	
			String alllimt  = String.valueOf(limtmo);
			account.setAccountbalance("0");
			account.setCreditlimit(alllimt);
		}
		else {
			float allmoney = money2 - money1;
			String all = String.valueOf(allmoney);
			account.setAccountbalance(all);
		}
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str=sdf.format(new Date());
		if(accountInfoSvc.alterAccount(account)) {
			account = accountInfoSvc.getCardById(account.getCardid());
			//填写账单
			bill.setCardid(account.getCardid());
			bill.setAffairtype("转账");
			bill.setTradetime(str);
			bill.setTradebalance(move);
			accountInfoSvc.insertBill(bill);
			session.setAttribute("account",account);
		}
		//System.out.println("===+++"+password+"==233");
		return paramMap;
		
	}
	
	@RequestMapping("oldalerpassword")
	public String getoldPassword() {
		return "verifypsw";
	}
	/**
	 * 
	 * @Title: index
	 * @Description: 获取修改密码页面
	 * @return
	 */
	@RequestMapping(value="alerpassword")
	public String index() {
		//System.out.print("111111111111");
		return "alterpsw";
	}
	
	/**
	 * 
	 * @param session 
	 * @Title: getAlterPassword
	 * @Description: 修改密码操作
	 * @param session
	 * @param request 
	 * @param request
	 * @param model 
	 * @return 
	 */
	@RequestMapping("getAlterpassword")
	@ResponseBody
	//@RequestParam(value="data")
	public Map<String,String> getAlterpassword( @RequestParam Map<String,String> paramMap,HttpSession session, ServletRequest request){
		String password = paramMap.get("value");
		Account account = (Account)session.getAttribute("account"); //获取session里的account内容
		account.setPassword(password);
		if(accountInfoSvc.alterAccount(account)) {
			account = accountInfoSvc.getCardById(account.getCardid());
			session.setAttribute("account",account);
		}
		//System.out.println("===+++"+password+"==233");
		return paramMap;
		
	}
	
	/**
	 * 
	 * @Title: 退出
	 * @Description: 退出页面页面
	 * @return
	 */
	@RequestMapping("back")
	public String outMain() {
		return "bank_login";
	}

}
