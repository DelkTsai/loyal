package com.loyal.weixin;

import com.loyal.weixin.service.AuthorityService;
import org.nutz.dao.Dao;
import org.nutz.dao.util.Daos;
import org.nutz.ioc.Ioc;
import org.nutz.mvc.NutConfig;
import org.nutz.mvc.Setup;

import com.loyal.weixin.bean.User;
import com.loyal.weixin.service.UserService;

//程序启动初始化类
public class MainSetup implements Setup {

	@Override
	public void init(NutConfig conf) {
		
		Ioc ioc = conf.getIoc();
		Dao dao = ioc.get(Dao.class);
		Daos.createTablesInPackage(dao, "com.loyal.weixin", false);
		User admin = null;
		UserService us = ioc.get(UserService.class);
		// 初始化默认根用户
		if (dao.count(User.class) == 0) {
			admin = us.add("admin", "123456");
		}else {
			admin = us.fetch("admin");
		}

		AuthorityService as = ioc.get(AuthorityService.class);
		as.initFormPackage("com.loyal.weixin");
		as.checkBasicRoles(admin);

		// 开启数据采集服务
//		Server.start();

	}

	@Override
	public void destroy(NutConfig conf) {
		// TODO Auto-generated method stub

	}

}
