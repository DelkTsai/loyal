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

        User admin = dao.fetch(User.class, "admin");
        // 初始化默认根用户
        if (admin == null) {
            UserService us = ioc.get(UserService.class);
            admin = us.add("admin", "123456");
        }

//		权限初始化及admin检查
        AuthorityService as = ioc.get(AuthorityService.class);
        as.initFormPackage("com.loyal.weixin");
        as.checkBasicRoles(admin);

    }

    @Override
    public void destroy(NutConfig conf) {
        // TODO Auto-generated method stub

    }

}
