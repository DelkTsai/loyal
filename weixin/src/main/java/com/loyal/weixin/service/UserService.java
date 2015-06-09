package com.loyal.weixin.service;

import com.loyal.weixin.bean.Role;
import com.loyal.weixin.bean.User;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.nutz.dao.Cnd;
import org.nutz.dao.Condition;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.Strings;
import org.nutz.lang.random.R;
import org.nutz.lang.util.NutMap;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

//用户Service，处理用户的业务逻辑，数据库访问
@IocBean(fields = "dao")
public class UserService extends BaseService<User> {

    // 初始化数据库访问对象Dao

    // 数据库分页查询
    public NutMap find(Pager pager, User obj) {
        List<User> list = null;
        Condition cnd = null;
        if (obj == null)
            cnd = Cnd.orderBy().desc("createTime");
        else
            cnd = Cnd.where("objname",
                    Strings.isBlank(obj.getUsername()) ? "<>" : "=",
                    obj.getUsername()).desc("createTime");
        pager.setRecordCount(dao().count(User.class, cnd));
        list = dao().query(User.class, cnd, pager);
        dao().fetchLinks(list, "roles");
        return rsOk()
                .setv("pager", pager)
                .setv("list", list)
                .setv("roles", dao().query(Role.class, null));
    }

    // 数据库添加操作
    public NutMap add(User obj) {
        try {
            obj.setSalt(R.UU16());
            obj.setPassword(new Sha256Hash("123456", obj.getSalt()).toHex());
            obj.setCreateTime(new Date());
            obj.setUpdateTime(new Date());
            dao().insert(obj);
            return rsOk().setv("msg", "添加成功，用户" + obj.getUsername());
        } catch (Exception e) {
            return rsFail().setv("msg", "添加失败，用户" + obj.getUsername());
        }
    }

    // 创建初始化用户
    public User add(String objname, String password) {

        User obj = new User();
        obj.setUsername(objname.trim());
        obj.setSalt(R.UU16());
        obj.setPassword(new Sha256Hash(password, obj.getSalt()).toHex());
        obj.setCreateTime(new Date());
        obj.setUpdateTime(new Date());
        dao().insert(obj);

        return obj;
    }

    // 数据库更新操作
    public NutMap edit(User obj) {
        try {
            obj.setUpdateTime(new Date());
            dao().updateIgnoreNull(obj);
            return rsOk().setv("msg", "修改成功，用户" + obj.getUsername());
        } catch (Exception e) {
            return rsFail().setv("msg", "修改失败，用户" + obj.getUsername());
        }
    }

    // 数据库更新操作
    public NutMap editRole(User obj) {
        try {
            obj.setUpdateTime(new Date());
            dao().clearLinks(obj, "roles");
            dao().insertRelation(obj, "roles");
            dao().updateIgnoreNull(obj);
            return rsOk().setv("msg", "修改成功，用户" + obj.getUsername());
        } catch (Exception e) {
            return rsFail().setv("msg", "修改失败，用户" + obj.getUsername());
        }
    }

    // 数据库删除数据操作
    public NutMap delete(User obj) {
        if ("admin".equals(obj.getUsername())) return rsFail().setv("msg", "删除失败，禁止删除" + obj.getUsername());
        try {
            dao().delete(obj);
            return rsOk().setv("msg", "删除成功，用户" + obj.getUsername());
        } catch (Exception e) {
            return rsFail().setv("msg", "删除失败，用户" + obj.getUsername());
        }
    }

    // 用户密码更改操作
    public NutMap changePwd(String oldpassword, String newpassword,
                            String repassword, HttpSession session) {
        User obj = (User) session.getAttribute("currobj");
        if ("loyal".equals(obj.getUsername())) {
            return rsFail().setv("msg", "该用户密码不允许修改");
        } else if (!new Sha256Hash(oldpassword, obj.getSalt()).toHex().equals(obj.getPassword())) {
            return rsFail().setv("msg", "原密码错误");
        } else if (newpassword == null || newpassword.equals("")) {
            return rsFail().setv("msg", "新密码不能为空");
        } else if (!newpassword.equals(repassword)) {
            return rsFail().setv("msg", "两次密码输入不一致");
        } else {
            try {
                obj.setSalt(R.UU16());
                obj.setPassword(new Sha256Hash(newpassword, obj.getSalt()).toHex());
                obj.setUpdateTime(new Date());
                dao().update(obj, "^(password|salt|updateTime)$");
                return rsOk().setv("msg", "密码修改成功，重新登录生效");
            } catch (Exception e) {
                return rsFail().setv("msg", "密码保存失败");
            }

        }

    }
}
