<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="footer">
		<div class="container">
			<div class="phone">
				<img src="img/phone.png">
				<p>11111111111111</p>
				<img src="img/phone2.png" class="last-child">
			</div>
			<div class="leavemessage">
				<form action="<c:url value='/MessageServlet'/>" method="post">
				<input type="hidden" name="method" value="leaveMessage">
					<span>在线留言</span>
					<input type="text" value="name" name="name">
					<input type="text" placeholder="email" name="email">
					<input type="text" placeholder="phone" name="phone">
					<textarea type="text" placeholder="message" name="message"></textarea>
					<button type="submit">留言</button>
				</form>
				<i  style="color:red">${result }</i>
			</div>
			<div class="contact">
				<span>联系方式</span>
				<ul>
					<li>
						<img src="img/icon1.png" class="icon1">
						<div class="div1">
							<p>xxxxxxxxxxxxx</p>
							<p>xxxxxxxxxxxxx</p>
						</div>
					</li>
					<li>
						<img src="img/icon2.png" class="icon2">
						<div class="div2">
							<p>xxxxxxxxxxxx.com</p>
						</div>
					</li>
					<li>
						<img src="img/icon3.png" class="icon3">
						<div class="div3">
							<p>1111111111</p>
						</div>
					</li>
					<li>
						<img src="img/icon4.png" class="icon4">
						<div class="div4">
							<p>xxxxxxxxxxx</p>
							<p>xxxxxxxxxxx</p>
						</div>
					</li>
					<li>
						<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=xxxxxx&site=qq&menu=yes">
							<img src="img/icon5.png" class="icon5">
							<div class="div5">
								<p>QQ在线客服</p>
							</div>
						</a>
					</li>
				</ul>
			</div>

			<div class="copyright">
				<p>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p>
			<a href="adminLogin.jsp" style="color:red;">&gt;&gt;&gt;管理员登陆</a>
			</div>
		</div>
	</div>