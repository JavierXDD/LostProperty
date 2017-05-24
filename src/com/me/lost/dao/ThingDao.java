package com.me.lost.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.jdbc.TxQueryRunner;

import com.me.lost.domain.PageBean;
import com.me.lost.domain.Thing;

public class ThingDao {

	private QueryRunner qr = new TxQueryRunner();

	// 添加失物招领
	public void addThing(Thing form) {
		try {
			String sql = "insert into thing values(?,?,?,?,?,?,?,?,?,?,?,?)";
			Object[] params = { form.getTid(),form.getmType(), form.gettName(),
					form.gettType(), form.gettAddress(),form.gettTime(),
					form.gettDescription(),form.getuName(),form.getuTelephone(),"未认领",
					"暂无","暂无"};

			qr.update(sql, params);
			//System.out.println(form.toString());
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	
	//显示所有信息
/*	public List<Thing> findAll() {
		try {
			String sql = "select * from thing";
			return qr.query(sql, new BeanListHandler<Thing>(Thing.class));
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
				
	}
*/	
	//显示所有信息
	public PageBean<Thing> findAll(int pc, int ps) {
		try{
			PageBean<Thing> pb = new PageBean<Thing>();
			pb.setPc(pc);
			pb.setPs(ps);
			
			String sql = "select count(*) from thing";
			Number num = (Number)qr.query(sql, new ScalarHandler());
			int tr = num.intValue();
			pb.setTr(tr);
			
			sql = "select * from thing order by tTime desc limit ?,?";
			List<Thing> beanList = qr.query(sql, 
					new BeanListHandler<Thing>(Thing.class), 
					(pc-1)*ps, ps);
			pb.setBeanList(beanList);
			return pb;
		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}

	//单个信息的详细信息
	public Thing detail(String tid) {
		try{
			String sql = "select * from thing where tid=?";
			Object[] params = {tid};
			return qr.query(sql, new BeanHandler<Thing>(Thing.class), params);
		}catch(Exception e){
			throw new RuntimeException(e);
		}		
	}

	//认领
	public void want(String tid,String gName,String gTelephone) {
		try {
			String sql = "update thing set tState=? ,gName=? ,gTelephone=? where tid = ?";
			Object[] params = {"认领中",gName,gTelephone,tid};
			qr.update(sql, params);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}		
	}

	//搜索
	public PageBean<Thing> query(String search, int pc, int ps) {
		try{
			PageBean<Thing> pb = new PageBean<Thing>();
			pb.setPc(pc);
			pb.setPs(ps);
			//得到搜索到的数目 tr
			StringBuilder cntSql = new StringBuilder("select count(*) from thing");
			StringBuilder whereSql = new StringBuilder(" where 1=1 ");
			List<Object> params = new ArrayList<Object>();
			if(search != null && !search.trim().isEmpty()){
				whereSql.append("and ( tid like ? or mType like ? or tName like ? or tType like ?"
						+ " or tAddress like ? or tTime like ? or tDescription like ? )");
				for(int i = 0;i<7;i++){
					params.add("%" + search + "%");
				}
			}
			Number num = (Number)qr.query(cntSql.append(whereSql).toString(), 
					new ScalarHandler(), params.toArray());
			int tr = num.intValue();
			pb.setTr(tr);
			
			//得到BeanList
			StringBuilder sql = new StringBuilder("select * from thing");
			StringBuilder limitSql = new StringBuilder(" limit ?,?");
			params.add((pc-1)*ps);
			params.add(ps);
			List<Thing> beanList = qr.query(sql.append(whereSql).append(limitSql).toString(), 
					new BeanListHandler<Thing>(Thing.class), 
					params.toArray());
			pb.setBeanList(beanList);
			
			return pb;
		}catch(SQLException e){
			throw new RuntimeException(e);
		}
		
	}
	/*public List<Thing> query(String search) {
		try{
			StringBuilder sql = new StringBuilder("select * from thing ");
			List<Object> params = new ArrayList<Object>();
			if(search != null && !search.trim().isEmpty()){
				sql.append("where tid like ? or mType like ? or tName like ? or tType like ?"
						+ " or tAddress like ? or tTime like ? or tDescription like ?");
				for(int i = 0;i<7;i++){
					params.add("%" + search + "%");
				}
			}
			List<Thing> result = qr.query(sql.toString(), 
					new BeanListHandler<Thing>(Thing.class), 
					params.toArray());
			return result;
		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}
*/

	public List<Thing> person(String session_uName, String session_uTelephone) {
		try {
			String sql = "select * from thing where uName like ? or uTelephone like ? or gName like ? or gTelephone like ? order by tTime desc";
			Object[] params = {session_uName,session_uTelephone,session_uName,session_uTelephone};
			return qr.query(sql, new BeanListHandler<Thing>(Thing.class),params);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
