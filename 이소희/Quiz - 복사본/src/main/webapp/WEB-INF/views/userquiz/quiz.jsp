<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script language="javascript">
// 	var delay = 10; //시간설정
	var correctAnswers = new Array("a", "a", "a", "a", "a"); //정답

	var q_num = 1;
	var timer;
	var layer;
	var clock = delay;
	var score = 0;

	function show_question() {
		if (layer = eval("document.all.question" + q_num)) {
			layer.style.display = "inline";
			document.all.timeLeft.innerHTML = clock;
			hide_question();
		} else {
			document.all.timeLeft.innerHTML = 0;
			document.all.quizScore.innerHTML = "당신은 " + (q_num - 1) + "문제중 "
					+ score + "개를 맞췄습니다.";
			document.all.quizScore.style.display = "inline";
		}
	}

	function hide_question() {
		if (clock > 0) {
			document.all.timeLeft.innerHTML = clock;
			clock--;
			timer = setTimeout("hide_question()", 1000);
		} else {
			clearTimeout(timer);
			document.all.answerBoard.innerHTML = " ";
			clock = delay;
			layer.style.display = "none";
			q_num++;
			show_question();
		}
	}

	function check_answer(answer) {
		if (correctAnswers[q_num - 1] == answer) {
			score++;
			document.all.answerBoard.innerHTML = "<font color=blue><b>정답입니다.</b></font>";
		} else {
			document.all.answerBoard.innerHTML = "<font color=red><b>땡! 틀렸습니다.</b></font>";
		}
		clock = 0;
		clearTimeout(timer);
		timer = setTimeout("hide_question()", 700);
	}

	window.onload = show_question;
	</script>
</head>


<body>

	제한시간 :
	<B><span id="timeLeft"></span></B> 초
	<br>
	<br>
	<div id="answerBoard"></div>
	<br>

	<div id="question1" style="display: none">
		<div>
			<label>퀴즈번호:${item.quizid}</label>
		</div>
		<div>
			<label>퀴즈:${item.quiz}</label>
		</div>

		<ul>
			<li><label> <input type="radio" name="quizid" value="1">
					정답1
			</label></li>
			<li><label> <input type="radio" name="quizid" value="2">
					정답2
			</label></li>
			<li><label> <input type="radio" name="quizid" value="3">
					정답3
			</label></li>
			<li><label> <input type="radio" name="quizid" value="4">
					정답4
			</label></li>
		</ul>

		<div id="question2" style="display: none">
			<b>2. 다음중 광역시가 아닌곳은?</b><br> 
			<a href="javascript:void(0)" onclick="check_answer('a')">a) 전주</a><br> 
			<a href="javascript:void(0)" onclick="check_answer('b')">b) 광주</a><br>
			<a href="javascript:void(0)" onclick="check_answer('c')">c) 울산</a><br>
			<a href="javascript:void(0)" onclick="check_answer('d')">d) 인천</a><br>
		</div>
</body>
</html>
