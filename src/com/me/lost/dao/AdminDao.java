package com.me.lost.dao;

import java.sql.SQLException;
import java.util.List;

import javax.management.RuntimeErrorException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.jdbc.TxQueryRunner;

import com.me.lost.domain.Admin;
import com.me.lost.domain.PageBean;
import com.me.lost.domain.Thing;
import com.me.lost.domain.User;

public class AdminDao {

	private QueryRunner qr = new TxQueryRunner();

	public Admin findByName(String aName) {
		try {
			String sql = "select * from admin where aName=?";
			Object[] params = { aName };
			return qr.query(sql, new BeanHandler<Admin>(Admin.class), params);
		} catch (SQLException e) {
			new RuntimeException("出错啦！", e);
			return null;
		}
	}

	public void deleteThing(String tid) {
		try {
			String sql = "delete from thing where tid = ?";
			Object[] params = { tid };
			qr.update(sql, params);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}

	public void editThing(Thing thing) {
		try {
			String sql = "update thing set mType=?,tName=?,tType=?,"
					+ "tAddress=?,tTime=?,tDescription=?,uName=?,uTelephone=?,"
					+ "gName=?,gTelephone=? where tid=?";
			Object[] params = { thing.getmType(), thing.gettName(),
					thing.gettType(), thing.gettAddress(), thing.gettTime(),
					thing.gettDescription(), thing.getuName(),
					thing.getuTelephone(), thing.getgName(),
					thing.getgTelephone(), thing.getTid() };
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public PageBean<User> findAllUser(int pc, int ps) {
		try {
			PageBean<User> pb = new PageBean<User>();
			pb.setPc(pc);
			pb.setPs(ps);

			String sql = "select count(*) from user";
			Number num = (Number) qr.query(sql, new ScalarHandler());
			int tr = num.intValue();
			pb.setTr(tr);

			sql = "select * from user limit ?,?";
			List<User> beanList = qr.query(sql, new BeanListHandler<User>(
					User.class), (pc - 1) * ps, ps);
			pb.setBeanList(beanList);
			return pb;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
