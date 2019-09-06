package test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.bank.BSTMS.pojo.Account;
import com.bank.BSTMS.svc.AccountInfoSvc;

public class test {

	AccountInfoSvc accountInfoSvc=new AccountInfoSvc();
    @Test
    public void tt() {
    	Account ac=new Account();
    	ac.setCardid("1111");
    	ac.setAccountbalance("123");
    	ac.setCreditlimit("1231");
    	ac.setIdentify("2131");
    	ac.setPassword("1231");
    	ac.setType("2");
    	ac.setEffectivedate("123");
    	accountInfoSvc.getCardById("1");
    }
}
