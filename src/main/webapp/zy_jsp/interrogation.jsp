<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>问诊记录</title>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.5/css/bootstrap.css">
</head>
<body style="padding-top: 150px">
<!--增加框-->
<div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">增加问诊记录</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <div class="col-sm-10">
                            医师id:
                            <select class="form-control" id="teacherId" name="itrgtTeacherId">
                                <!--动态填充医师id:-->
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10">
                            用户id:
                            <select class="form-control" id="userId" name="itrgtUserId">
                                <!--动态填充用户id:-->
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10">
                            起始时间:<input type="datetime-local" name="itrgtStartTime" id="insertStartTime"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10">
                            结束时间:<input type="datetime-local" name="itrgtEndTime" id="insertEndTime"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10">
                            总价:<input type="text" name="itrgtTotalPrice" required="required" id="insertTotalPrice"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" class="btn btn-default" id="insertForm">提交</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!--修改框-->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">编辑问诊记录</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <h1 style="text-align: center">编号:<span id="upd_itrgtId" style="color: darkcyan"></span></h1>
                    <div class="form-group">
                        <div class="col-sm-10">
                            医师id:
                            <select class="form-control" id="upd_teacherId" name="itrgtTeacherId">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10">
                            用户id:
                            <select class="form-control" id="upd_userId" name="itrgtUserId">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10">
                            起始时间:<input type="datetime-local" id="upd_startTime" name="itrgtStartTime"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10">
                            结束时间:<input type="datetime-local" id="upd_endTime" name="itrgtEndTime"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10">
                            总价:<input type="text" name="itrgtTotalPrice" required="required" id="upd_Price"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" class="btn btn-default" id="updateForm">提交</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!--批量修改框-->
<div class="modal fade bs-example-modal-lg" id="updsModal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <table id="updsTable" class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>医师编号</th>
                    <th>用户编号</th>
                    <th>起始时间</th>
                    <th>结束时间</th>
                    <th>总金额/元</th>
                </tr>
                </thead>
                <tbody>
                <!--动态填充修改框-->
                </tbody>
            </table>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" id="qrxg">确认修改</button>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1 style="text-align: center">问诊记录表</h1>
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-primary" id="insert">
                    <span class="glyphicon glyphicon-plus"></span>
                    增加
                </button>
                <button class="btn btn-danger" id="dels">
                    <span class="glyphicon glyphicon-trash"></span>
                    批量删除
                </button>
                <button class="btn btn-info" id="upds">
                    <span class="glyphicon glyphicon-pencil"></span>
                    批量修改
                </button>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <!--表格-->
            <table class="table table-striped table-hover" id="showAll">
                <thead>
                <tr>
                    <th><input type="checkbox" id="allChoice"/></th>
                    <th>编号</th>
                    <th>医师编号</th>
                    <th>用户编号</th>
                    <th>起始时间</th>
                    <th>结束时间</th>
                    <th>总金额/元</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <!--动态填充表格内容-->
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="col-md-4" id="infoPage">
                <!--分页信息-->
            </div>
            <div class="col-md-6 col-md-offset-9" id="pagePilot">
                <!--分页条信息-->
                <ul class="pagination"></ul>
            </div>
        </div>
    </div>
</div>
</div>
<script type="text/javascript" src="/webjars/jquery/3.4.1/jquery.js"></script>
<script type="text/javascript" src="/webjars/bootstrap/3.3.5/js/bootstrap.js"></script>
<script type="text/javascript" src="/zy_js/interrogation.js"></script>
</body>
</html>