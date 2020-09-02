<div class="main layui-clear">
	<h2 class="page-title">发表贴子</h2>
	  
	  <!-- <div class="fly-none">并无权限</div> -->
	
	  <div class="layui-form layui-form-pane">
	    <form method="post" action="/topic/save" method="post">
	      <div class="layui-form-item">
	        <label for="L_title" class="layui-form-label">标题</label>
	        <div class="layui-input-block">
	          <input type="text" id="L_title" name="title" required lay-verify="required" autocomplete="off" class="layui-input">
	        </div>
	      </div>
	      <div class="layui-form-item layui-form-text">
	        <div class="layui-input-block">
	          <textarea id="content" name="content" lay-verify="" placeholder="请输入内容" class="layui-textarea fly-editor" style="height: 550px;"></textarea>
	        </div>
	        <label for="content" class="layui-form-label" style="top: -2px;">描述</label>
	      </div>
	      <div class="layui-form-item">
	        <div class="layui-inline">
	          <label class="layui-form-label required">所在类别</label>
	          <div class="layui-input-block">
				<input type="text" name="cate" required lay-verify="required" autocomplete="off" class="layui-input" list="cate"/>
				<datalist id="cate">
				  <option>消息发布</option>
				  <option>活动</option>
				  <option>在校</option>
				  <option>毕业</option>
				  <option></option>
				</datalist>
	          </div>
	        </div>
	        <div class="layui-inline">
	          <label class="layui-form-label">悬赏</label>
	          <div class="layui-input-block">
	            <select name="price">
	              <option value="5" selected>5</option>
	              <option value="20">20</option>
	              <option value="50">50</option>
	              <option value="100">100</option>
	            </select>
	          </div>
	        </div>
	      </div>
	      <div class="layui-form-item">
	        <button class="layui-btn" lay-filter="*" lay-submit onclick="">立即发布</button>
	      </div>
	    </form>
	  </div>
	</div>
</div>

<script language="javascript" src="/ckeditor-releases-full-4.12.1/ckeditor.js"></script>
<script>
<#--  var layedit  , index;
layui.use(['form' , 'layedit'], function(){
  var form = layui.form ;
  layedit = layui.layedit;
  layedit.set({
	  uploadImage: {
	    url: '/topic/upload' //接口url
	    ,type: 'post' //默认post
	  }
  });
  index = layedit.build('content'); //建立编辑器
});  -->

layui.use(['form'], function(){
}); 

 CKEDITOR.replace( 'content',{
	 height:550,
 });

</script>