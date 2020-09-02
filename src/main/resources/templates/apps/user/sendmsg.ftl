<h2 class="page-title"style="margin-top:10px;margin-bottom:10px;">
	发送私信给 ${userData.nickname!userData.name!userData.username!''}
</h2>
<form method="post" action="/user/sendmsg/${userData.id}" method="post">
  <div class="layui-form-item layui-form-text">
    <div class="layui-input-block" style="margin-left: 5px;min-height: 36px;margin-right: 10px;">
      <textarea id="content" name="content" required="" lay-verify="required" placeholder="私信内容" class="layui-textarea fly-editor" style="height: 150px;"></textarea>
    </div>
  </div>
  <div class="layui-form-item" style="padding-right:10px;text-align: right;">
    <button class="layui-btn" lay-filter="*" lay-submit="">发送私信</button>
  </div>
</form>
