<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
<title>온라인 문제풀이 시험  - 굿스웹</title>
<meta name="viewport" content="width=device-width, user-scalable=no">
<meta name="robots" content="all">
<meta name="title" content="온라인 문제풀이 시험  - 굿스웹">
<meta name="description" content="온라인문제풀이, 퀴즈문제풀이, 독서퀴즈, 인터넷시험, 학습문제, 패키지 ">
<meta name="keywords" content="퀴즈,문제풀이, 출제, 인터넷시험, 온라인문제풀이,프로그램 개발">

<meta name="copyright" content="goodsweb">
<meta property="og:type" content="website">
<meta property="og:locale" content="ko_KR">
<meta property="og:site_name" content="굿스웹 - developer 개발자 입니다.">
<meta property="og:title" content="온라인 문제풀이 시험  - 굿스웹">
<meta property="og:description" content="온라인문제풀이, 퀴즈문제풀이, 독서퀴즈, 인터넷시험, 학습문제, 패키지 ">
<meta property="og:keywords" content="퀴즈,문제풀이, 출제, 인터넷시험, 온라인문제풀이,프로그램 개발">
<meta property="og:url" content="http://www.goodsweb.kr/html/quz/index.php">


    <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <link rel="stylesheet" type="text/css" href="dndod-popup.min.css">
    <script src="dndod-popup.min.js"></script>

    <style>
        .g-recaptcha{
            margin-bottom: 10px;
        }
    </style>
</head>
<style>
input.bradio{display:none;}
span.type{font-size:13px;margin-right:2px;margin-left:22px; cursor:pointer;}

label.classtype      {width:20px;height:20px;background-image:url('img/bk.png');box-sizing:border-box;position:absolute;background-position:center; background-repeat: no-repeat;background-size:cover;cursor:pointer;}
/*label.classtype_on   {width:20px;height:20px;background-image:url('img/bk.png');box-sizing:border-box;position:absolute;background-position:center; background-repeat: no-repeat;background-size:cover;}
label.classtype_ok   {width:20px;height:20px;background-image:url('img/bb.png');box-sizing:border-box;position:absolute;background-position:center; background-repeat: no-repeat;background-size:cover;}
*/
/*li { list-style: none }*/

/* nav tag */
#jodbdiv ul    { padding:0px;}
#jodbdiv ul li { display:inline;  padding:0px; cursor:pointer;}
#jodbdiv ul li:first-child{border-left:none;}


#jodbdiv ul li.num {
        background-color: #4e539a;
        color:#ffffff;
        padding-left:3px;
        margin: 0px;
        border-width: 1px;
        border-style: dashed;
        border-color: #3366ff;
        border-radius: 20%;

        }

#jodbdiv ul li.ok  {
         color:#ff0000;
         font-weight:bold;
         }


</style>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>

<div class = "container">
    <div class = "row">
            <ul class="pager">
              <h2><i class="fas fa-grip-lines"></i> 문제풀이 <i class="fas fa-grip-lines"></i> </h2>
            </ul>

            <hr>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">홈</a></li>
                <li class="breadcrumb-item history_group1"></li>
                <li class="breadcrumb-item history_group2"></li>
                <li class="breadcrumb-item active">문제
                <span id="spnum" class="label label-default">0</span>
                <span id="spmax" class="label label-primary">-</span></li>
            </ol>


            <div class="col-lg-8">
                    <div id="qzdbload">
                    </div>
                    <ul class="pager">
                        <li class="previous"><a href="#" lnum="0">&larr; 이전문제</a></li>
                        <li class="next"><a href="#" lnum="1">다음문제 &rarr;</a></li>
                    </ul>
            </div>


            <div class="col-lg-4">
                <h3>남은시간 <span id="timedey" class="badge">0</span></h3>
                <div class="progress progress-striped active">
                  <div id="barw" class="progress-bar progress-bar-success" style="width: 0%"></div>
                </div>




                <div class="panel panel-warning">
                  <div class="panel-heading">
                    <h3 class="panel-title badge">답안지</h3>
                  </div>
                  <div class="panel-body">
                      <div class="row" id="jodblist">
                      </div>
                  </div>
                </div>


                <p><br></p>
                <p><input id="quzend" type="submit" value="시험종료" class="btn btn-danger quzbtn" style="width:100%"></p>
            </div>
    <!-- r end -->
  </div> <!-- row end -->
  <br>


  <!-- 메시지 표시 -->
  <div id="dpr" style="display:none;">
      <div class="alert alert-dismissible alert-warning">
          <button type="button" class="close" data-dismiss="alert">&times;</button>
          <p class="mb-0">sdfdsf</p>
      </div>
  </div>
</div> <!-- container END -->




<script type="text/javascript">
$(function(){

    //시험종료
    $('input#quzend').click(function (){
            dndod.popup({
                msg: "이대로 시험을 종료 하시겠습니까? ",
                buttons: [
                    {
                        text: "종료",
                        type: "kakaobank",
                        handler: function(e, popup) {
                            //dndod.notice("Thank you")
                            location.href = 'quiz_end.php';
                        }
                    },
                    {
                        text: "취소",
                        handler: function(e, popup) {
                            popup.close()
                        }
                    }
                ]
            });

    });



    $("button.close").click(function() {
        //3000 : 3초, 'slow', 'normal', 'fast'
        $("#dpr").show('3000'); //천천히 보이기
        $("#dpr").hide('fast');//more버튼 숨기기

    });



     $('input.f_blog_id,input.f_id').change(function(){


            var wvalue = $('input.f_api_pw').val();
            var dvalue = $(this).val();

            if(wvalue && dvalue) {
                //alert(wvalue);

                    _url  = 'db_send.php';

                    _data  = '';
                    _data += 'action=C';
                    _data += '&bid='+dvalue;
                    _data += '&apw='+wvalue;

                    $.ajax({
                      url: _url ,
                      type:'post',
                      dataType : 'text' ,
                      data : _data,
                      success: function(rdata) {
                         //alert(rdata);
                         var arr = rdata.split('|');
                         if(arr[0] == 'Y'){
                             $('select.f_category option').remove();
                             $('select.f_category').append(arr[1]);
                         } else {
                             $('select.f_category option').remove();
                         }
                        },
                        error : function(error) {
                             $('select.f_category option').remove();
                        }
                    });
            }

     });

});
//https://sweetalert2.github.io/
</script>


<script language="JavaScript">
//그래프 / 문제풀이 시간
function msg_time() {	// 1초씩 카운트
        //alert('d');
        _url  = 'db_time.php';
        _data  = '';
        _data += 'action=C';

        $.ajax({
            url: _url ,
            type:'post',
            dataType : 'text' ,
            data : _data,
            success: function(rdata) {
               var arr = rdata.split('|');
               if(arr[0] == 'Y'){
                   $("#timedey").html(arr[1]);
                   //$('#ViewTimer').html(arr[1]+'/'+arr[2]);
                   $('#barw').css('width',arr[2]+'%');
               } else if(arr[0] == 'E'){
                   $("#timedey").html('0');
                   $('#barw').css('width','0%');
                      //dndod.notice("문제풀이 시간이 종료되었습니다.")
                      //dndod.confirm("Confirm example.\nClick the 'Continue' button below.", function () {
                      //     dndod.notice("Confirmed!");
                      //});
                    dndod.alert("문제풀이 시간이 종료되었습니다.");
                    location.href = 'quiz_end.php';

               } else {
                   //$('#ViewTimer').html(arr[1]);
               }
              },
              error : function(error) {
                  //$('#ViewTimer').html('-');
              }
          });
}
window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };

</script>


<script type="text/javascript">
/*문제풀이*/
$(function(){

    //답안지
    function db_jonload(f) {

          _url  = 'quiz_jodbload.php';
          _data  = '';
          _data += 'qno='+f;

        $.ajax({
            url: _url ,
            type:'post',
            dataType : 'text' ,
            data : _data,
            success: function(rdata) {
              $("#jodblist").html(rdata);
            },
              error : function(error) {
              }
          });
    }


    function db_qzload(f,r) {

          _url  = 'quiz_dbload.php';
          _data  = '';
          _data += 'qno='+f;

        $.ajax({
            url: _url ,
            type:'post',
            dataType : 'text' ,
            data : _data,
            success: function(rdata) {

                // alert(rdata);

                var arr = rdata.split('{!|!}');

                    var arrset = arr[0].split('|');
                    if(arrset[0] == 'Y'){

                        $("#spnum").html(arrset[1]); //현재번호
                        $("#spmax").html(arrset[2]); //최대번호

                        $(".history_group1").html(arrset[3]); //대메뉴
                        $(".history_group2").html(arrset[4]); //중메뉴

                        //var _dno = $("#spnum").html();
                        //if(parseInt(r) == 0){
                        //    var _dno_total = parseInt(_dno) - 1;
                        //} else {
                        //    var _dno_total = parseInt(_dno) + 1;
                        //}

                        $("#qzdbload").html(arr[1]); //문제출력

                    }

                    //첫화면 체크
                    if( $("#spnum").html() == '1' ){
                       $(".previous a").hide();
                    } else {
                       $(".previous a").show();
                    }

                    //마지막 체크
                    if( $("#spnum").html() == $("#spmax").html() ){
                       $(".next a").hide();
                    } else {
                       $(".next a").show();
                    }
            },
              error : function(error) {
                  //$('#ViewTimer').html('-');
              }
          });

    }




    $("ul.pager a").click(function() {

        var _dno = $("#spnum").html();
        var lav_num = $(this).attr('lnum');
        //alert(parseInt(lav_num));

        if(parseInt(lav_num) == 0){
          var _dno_total = parseInt(_dno) - 1;
          //alert('0/'+_dno_total);
        } else {
          var _dno_total = parseInt(_dno) + 1;
          //alert('1/'+_dno_total);
        }
        //var lav_num = $(this).attr('lnum');
        db_qzload(_dno_total,lav_num);
        db_jonload(_dno_total); //답안
    });



  //초기문제 가져오기
  var _dno = $("#spnum").html();
  var _dno_total = parseInt(_dno);
  if(!_dno_total){
      db_qzload('1','1');  //문제
      db_jonload('1'); //답안
  }



});
</script>


<script>
// 새로고침 방지
function noRefresh()
{
    /* CTRL + N키 막음. */
    if ((event.keyCode == 78) && (event.ctrlKey == true))
    {
        event.keyCode = 0;
        return false;
    }
    /* F5 번키 막음. */
    if(event.keyCode == 116)
    {
        event.keyCode = 0;
        return false;
    }
}

document.onkeydown = noRefresh ;


$("body").contextmenu( function() {
return false;
});

</script>
<body>
</html>
