
<section class="pt-page pt-page-current"data-id=home>
  <div class="section-inner start-page-content">
    <div class=page-header>
      <div class=row>
        <div class="col-lg-4 col-md-4 col-sm-4">
          <div class=photo>
            <img style="width: 100%;" alt="${userData.name!''}" src="/res/image/${userData.id!''}">
          </div>
        </div>

        <div class="col-lg-8 col-md-8 col-sm-8">
          <div class=title-block>
            <h1 style="line-height: normal; margin-top: 0px; margin-bottom: 20px;">${userData.name!''}</h1>
            <h2>${userData.sign!''}</h2>
            <div class="owl-carousel owl-drag owl-loaded text-rotation">
              <div class=owl-stage-outer>
                <div class=owl-stage style="transform:translate3d(-1222px,0,0);transition:all 0s ease 0s;width:3666px">

                </div>
              </div>
              <div class="disabled owl-nav">
                <#--  <div class=owl-prev>prev</div>
                <div class=owl-next>next</div>  -->
              </div>
              <div class="disabled owl-dots"></div>
            </div>
          </div>

          <div class=social-links>
            <#--  <a href=""><i class="fa fa-twitter"></i></a>
            <a href=""><i class="fa fa-facebook"></i></a>
            <a href=""><i class="fa fa-instagram"></i></a>  -->
          </div>
        </div>
      </div>
    </div>

    <div class=page-content>
      <div class=row style="width: 100%;">
        <div class="col-lg-6 col-md-6 col-sm-6">
          <div class=about-me>
            <div class=block-title>
              <h3> 成果 <span>简介</span></h3>
            </div>
            <p>
              ${achievementData.description!'无'}
            </p>
            <div class=block-title>
              <h3> 成果 <span>备注</span></h3>
            </div>
            <p>
              ${achievementData.remark!'无'}
            </p>
          </div>
          <div class=download-resume>
          </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6">
          <ul class=info-list>
            <li><span class=title>成果名称</span><span class=value>${achievementData.name!''}</span></li>
            <li><span class=title>成果类型</span><span class=value>${achievementData.type!''}</span></li>
            <li><span class=title>成果编号</span><span class=value>${achievementData.number!''}</span></li>
            <li><span class=title>成果进度</span><span class=value>${achievementData.progress!''}</span></li>
            <li><span class=title>申请时间</span><span class=value>${achievementData.apply_time!''}</span></li>
            <li><span class=title>受理时间</span><span class=value>${achievementData.accept_time!''}</span></li>
            <li><span class=title>授权时间</span><span class=value>${achievementData.authorize_time!''}</span></li>
          </ul>
        </div>
      </div>
    </div>
     <#assign parent_id_prifix='achievement_' >
     <#assign is_in_profile_page=true >
    <div style="font-size:14px; margin-bottom: 30px;">
        <div class="layui-collapse">
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">成果成员</h2>
            <div class="layui-colla-content layui-show">
                <#if (achievementData.users)??>
                <#assign userList=achievementData.users>
                </#if>
                <#include "/component/list/user.ftl">
            </div>
        </div>
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">关联项目</h2>
            <div class="layui-colla-content layui-show">
                <#if (achievementData.projects)??>
                <#assign projectList=achievementData.projects>
                </#if>
                <#include "/component/list/project.ftl">
            </div>
        </div>
    </div>
  </div>
</section>




<style>

.page-header *, .page-content * {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
:after,
:before {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

.page-header {
  padding-bottom: 9px;
  margin: 40px 0 20px;
  border-bottom: 1px solid #eee;
}
ul {
  margin-top: 0;
  margin-bottom: 10px;
}
.row {
  margin-right: -15px;
  margin-left: -15px;
}
.col-lg-4,
.col-lg-6,
.col-lg-8,
.col-md-4,
.col-md-6,
.col-md-8,
.col-sm-4,
.col-sm-6,
.col-sm-8 {
  position: relative;
  min-height: 1px;
  padding-right: 15px;
  padding-left: 15px;
}
@media (min-width: 768px) {
  .col-sm-4,
  .col-sm-6,
  .col-sm-8 {
    float: left;
  }
  .col-sm-8 {
    width: 66.66666667%;
  }
  .col-sm-6 {
    width: 50%;
  }
  .col-sm-4 {
    width: 33.33333333%;
  }
}
@media (min-width: 992px) {
  .col-md-4,
  .col-md-6,
  .col-md-8 {
    float: left;
  }
  .col-md-8 {
    width: 66.66666667%;
  }
  .col-md-6 {
    width: 50%;
  }
  .col-md-4 {
    width: 33.33333333%;
  }
}
@media (min-width: 1200px) {
  .col-lg-4,
  .col-lg-6,
  .col-lg-8 {
    float: left;
  }
  .col-lg-8 {
    width: 66.66666667%;
  }
  .col-lg-6 {
    width: 50%;
  }
  .col-lg-4 {
    width: 33.33333333%;
  }
}
.btn {
  display: inline-block;
  padding: 6px 12px;
  margin-bottom: 0;
  font-size: 14px;
  font-weight: 400;
  line-height: 1.42857143;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  background-image: none;
  border: 1px solid transparent;
  border-radius: 4px;
}
.btn:active:focus,
.btn:focus {
  outline: 5px auto -webkit-focus-ring-color;
  outline-offset: -2px;
}
.btn:focus,
.btn:hover {
  color: #333;
  text-decoration: none;
}
.btn:active {
  background-image: none;
  outline: 0;
  -webkit-box-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
  box-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
}
.row:after,
.row:before {
  display: table;
  content: " ";
}
.row:after {
  clear: both;
}
@-ms-viewport {
  width: device-width;
}
.owl-carousel {
  display: none;
  width: 100%;
  -webkit-tap-highlight-color: transparent;
  position: relative;
  z-index: 1;
}
.owl-carousel .owl-stage {
  position: relative;
  -ms-touch-action: pan-Y;
}
.owl-carousel .owl-stage:after {
  content: ".";
  display: block;
  clear: both;
  visibility: hidden;
  line-height: 0;
  height: 0;
}
.owl-carousel .owl-stage-outer {
  position: relative;
  overflow: hidden;
  -webkit-transform: translate3d(0, 0, 0);
}
.owl-carousel .owl-item {
  position: relative;
  min-height: 1px;
  float: left;
  -webkit-backface-visibility: hidden;
  -webkit-tap-highlight-color: transparent;
  -webkit-touch-callout: none;
}
.owl-carousel .owl-dots.disabled,
.owl-carousel .owl-nav.disabled {
  display: none;
}
.owl-carousel .owl-nav .owl-next,
.owl-carousel .owl-nav .owl-prev {
  cursor: pointer;
  cursor: hand;
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}
.owl-carousel.owl-loaded {
  display: block;
}
.owl-carousel.owl-drag .owl-item {
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

a:hover {
  color: #ff9800;
  text-decoration: none;
  outline: 0;
}
a:focus {
  outline: 0;
}
.text-rotation {
  display: block;
}
.btn-secondary {
  text-transform: uppercase;
  font-family: inherit;
  font-size: 14px;
  font-weight: 500;
  line-height: 2.8;
  padding: 0 1.5em;
  outline: 0;
  border: 0;
  border-radius: 3px;
}
.btn-secondary,
.btn-secondary:focus,
.btn-secondary:hover {
  background-color: #fff;
  color: #212121;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1), 0 2px 4px rgba(0, 0, 0, 0.3);
}
.btn-secondary:hover {
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1), 0 4px 8px rgba(0, 0, 0, 0.3);
}
.pt-page {
  width: 100%;
  max-width: 1032px;
  height: 0;
  opacity: 0;
  top: auto;
  padding: 0;
  left: 0;
  right: 0;
  margin: 0 auto;
  padding-bottom: 50px;
  background-color: transparent;
  overflow: hidden;
  visibility: hidden;
  -webkit-transform: translate3d(0, 0, 0);
  -o-transform: translate3d(0, 0, 0);
  -moz-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
}
.pt-page .section-inner {
  position: relative;
  background-color: #fff;
  overflow: hidden;
  border-radius: 15px;
  -webkit-box-shadow: 0 15px 25px 0 rgba(0, 0, 0, 0.1);
  -moz-box-shadow: 0 15px 25px 0 rgba(0, 0, 0, 0.1);
  box-shadow: 0 15px 25px 0 rgba(0, 0, 0, 0.1);
  -webkit-transform: translate3d(0, 0, 0);
  -o-transform: translate3d(0, 0, 0);
  -moz-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
  -ms-transform: none;
}
.pt-page-current {
  visibility: visible;
  z-index: 90;
  opacity: 1;
  overflow: visible;
  height: auto;
}
.page-header {
  margin-top: 0;
}
.page-content {
  padding: 30px 50px 50px;
}
.block-title h3 {
  font-size: 21px;
  margin: 5px 0 25px;
}
.block-title h3 span {
  color: #2eca7f;
}
.start-page-content .page-header {
  position: relative;
  background-color: #2eca7f;
  padding: 50px;
  margin-bottom: 25px;
  background-image: url(/images/sp_main_bg.jpg);
  background-size: cover;
  -webkit-background-size: cover;
  background-attachment: scroll;
  background-position: center center;
  background-repeat: no-repeat;
}
.start-page-content .page-header .photo {
  max-width: 280px;
  margin-bottom: -75px;
  border: 3px solid #fff;
  background-color: #fff;
  -webkit-box-shadow: 0 3px 8px 0 rgba(0, 0, 0, 0.1);
  -moz-box-shadow: 0 3px 8px 0 rgba(0, 0, 0, 0.1);
  box-shadow: 0 3px 8px 0 rgba(0, 0, 0, 0.1);
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}
.start-page-content .page-header .photo:hover {
  -webkit-transform: translateY(-9px);
  -ms-transform: translateY(-9px);
  -o-transform: translateY(-9px);
  transform: translateY(-9px);
  -webkit-box-shadow: 0 18px 24px rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0 18px 24px rgba(0, 0, 0, 0.15);
  -o-box-shadow: 0 18px 24px rgba(0, 0, 0, 0.15);
  box-shadow: 0 18px 24px rgba(0, 0, 0, 0.15);
}
.start-page-content .page-header .title-block {
  text-align: center;
}
.start-page-content .page-header .title-block h1 {
  color: #fff;
  font-size: 54px;
  font-weight: 700;
  margin: 30px 0 0;
}
.start-page-content .page-header .title-block .sp-subtitle {
  color: #fff;
  font-size: 18px;
  margin: 0;
}
.start-page-content .social-links {
  position: relative;
  text-align: center;
  margin: 0 auto;
  margin-top: 20px;
}
.start-page-content .social-links a {
  display: inline-block;
  width: 36px;
  height: 36px;
  border-radius: 24px;
  background-color: #fff;
  margin: 0 1px;
  color: #9e9e9e;
  text-align: center;
  -webkit-box-shadow: 0 3px 8px 0 rgba(0, 0, 0, 0.1);
  -moz-box-shadow: 0 3px 8px 0 rgba(0, 0, 0, 0.1);
  box-shadow: 0 3px 8px 0 rgba(0, 0, 0, 0.1);
}
.start-page-content .social-links a:hover {
  -webkit-box-shadow: 0 6px 18px 0 rgba(0, 0, 0, 0.2);
  -moz-box-shadow: 0 6px 18px 0 rgba(0, 0, 0, 0.2);
  box-shadow: 0 6px 18px 0 rgba(0, 0, 0, 0.2);
}
.start-page-content .social-links a i {
  line-height: 36px;
  font-size: 16px;
}
.start-page-content .page-content {
  padding-top: 20px;
}
.start-page-content .page-content div {
  display: inline-block;
}
.start-page-content .about-me .block-title h3 {
  margin-bottom: 10px;
}
.start-page-content .page-content .download-resume {
  margin-top: 15px;
}
.info-list {
  display: inline-block;
  margin: 0;
  padding: 0;
  list-style: none;
}
.info-list li {
  margin: 6px 0;
  text-align: left;
}
.info-list li .title {
  display: inline-block;
  min-width: 120px;
}
.info-list li .value {
  display: inline-block;
  color: #9e9e9e;
}
.download-resume {
  margin-top: 50px;
}
@media only screen and (max-width: 1032px) {
  .pt-page {
    margin: 0 15px;
    width: auto;
  }
}
@media only screen and (max-width: 991px) {
  .page-content {
    padding: 30px 30px 50px;
  }
}
@media only screen and (max-width: 769px) {
  .info-list {
    margin-top: 20px;
  }
  .start-page-content .page-header {
    padding: 50px 30px;
    margin: 0;
  }
  .start-page-content .page-header .photo {
    max-width: 200px;
    margin: 0 auto;
  }
  .start-page-content .page-header .title-block h1 {
    margin-top: 25px;
    font-size: 44px;
    line-height: 1.2em;
  }
  .start-page-content .page-header .title-block .sp-subtitle {
    margin-top: 15px;
  }
}
a:hover {
  color: #ff9800;
  text-decoration: none;
  outline: 0;
}
a:focus {
  outline: 0;
}
img {
  vertical-align: bottom;
  max-width: 100%;
  height: auto;
  border: 0;
  -ms-interpolation-mode: bicubic;
}
.text-rotation {
  display: block;
}
.btn-secondary {
  text-transform: uppercase;
  font-family: inherit;
  font-size: 14px;
  font-weight: 500;
  line-height: 2.8;
  padding: 0 1.5em;
  outline: 0;
  border: 0;
  border-radius: 3px;
}
.btn-secondary,
.btn-secondary:focus,
.btn-secondary:hover {
  background-color: #fff;
  color: #212121;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1), 0 2px 4px rgba(0, 0, 0, 0.3);
}
.btn-secondary:hover {
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1), 0 4px 8px rgba(0, 0, 0, 0.3);
}
.pt-page {
  width: 100%;
  max-width: 1032px;
  height: 0;
  opacity: 0;
  top: auto;
  padding: 0;
  left: 0;
  right: 0;
  margin: 0 auto;
  padding-bottom: 50px;
  background-color: transparent;
  overflow: hidden;
  visibility: hidden;
  -webkit-transform: translate3d(0, 0, 0);
  -o-transform: translate3d(0, 0, 0);
  -moz-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
}
.pt-page .section-inner {
  position: relative;
  background-color: #fff;
  overflow: hidden;
  border-radius: 15px;
  -webkit-box-shadow: 0 15px 25px 0 rgba(0, 0, 0, 0.1);
  -moz-box-shadow: 0 15px 25px 0 rgba(0, 0, 0, 0.1);
  box-shadow: 0 15px 25px 0 rgba(0, 0, 0, 0.1);
  -webkit-transform: translate3d(0, 0, 0);
  -o-transform: translate3d(0, 0, 0);
  -moz-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
  -ms-transform: none;
}
.pt-page-current {
  visibility: visible;
  z-index: 90;
  opacity: 1;
  overflow: visible;
  height: auto;
}
.page-header {
  margin-top: 0;
}
.page-content {
  padding: 30px 50px 50px;
}
.block-title h3 {
  font-size: 21px;
  margin: 5px 0 25px;
}
.block-title h3 span {
  color: #2eca7f;
}
.start-page-content .page-header {
  position: relative;
  background-color: #2eca7f;
  padding: 50px;
  margin-bottom: 25px;
  background-image: url(/images/sp_main_bg.jpg);
  background-size: cover;
  -webkit-background-size: cover;
  background-attachment: scroll;
  background-position: center center;
  background-repeat: no-repeat;
}
.start-page-content .page-header .photo {
  max-width: 280px;
  margin-bottom: -75px;
  border: 3px solid #fff;
  background-color: #fff;
  -webkit-box-shadow: 0 3px 8px 0 rgba(0, 0, 0, 0.1);
  -moz-box-shadow: 0 3px 8px 0 rgba(0, 0, 0, 0.1);
  box-shadow: 0 3px 8px 0 rgba(0, 0, 0, 0.1);
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}
.start-page-content .page-header .photo:hover {
  -webkit-transform: translateY(-9px);
  -ms-transform: translateY(-9px);
  -o-transform: translateY(-9px);
  transform: translateY(-9px);
  -webkit-box-shadow: 0 18px 24px rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0 18px 24px rgba(0, 0, 0, 0.15);
  -o-box-shadow: 0 18px 24px rgba(0, 0, 0, 0.15);
  box-shadow: 0 18px 24px rgba(0, 0, 0, 0.15);
}
.start-page-content .page-header .title-block {
  text-align: center;
}
.start-page-content .page-header .title-block h1 {
  color: #fff;
  font-size: 54px;
  font-weight: 700;
  margin: 30px 0 0;
}
.start-page-content .page-header .title-block .sp-subtitle {
  color: #fff;
  font-size: 18px;
  margin: 0;
}
.start-page-content .social-links {
  position: relative;
  text-align: center;
  margin: 0 auto;
  margin-top: 20px;
}
.start-page-content .social-links a {
  display: inline-block;
  width: 36px;
  height: 36px;
  border-radius: 24px;
  background-color: #fff;
  margin: 0 1px;
  color: #9e9e9e;
  text-align: center;
  -webkit-box-shadow: 0 3px 8px 0 rgba(0, 0, 0, 0.1);
  -moz-box-shadow: 0 3px 8px 0 rgba(0, 0, 0, 0.1);
  box-shadow: 0 3px 8px 0 rgba(0, 0, 0, 0.1);
}
.start-page-content .social-links a:hover {
  -webkit-box-shadow: 0 6px 18px 0 rgba(0, 0, 0, 0.2);
  -moz-box-shadow: 0 6px 18px 0 rgba(0, 0, 0, 0.2);
  box-shadow: 0 6px 18px 0 rgba(0, 0, 0, 0.2);
}
.start-page-content .social-links a i {
  line-height: 36px;
  font-size: 16px;
}
.start-page-content .page-content {
  padding-top: 20px;
}
.start-page-content .page-content div {
  display: inline-block;
}
.start-page-content .about-me .block-title h3 {
  margin-bottom: 10px;
}
.start-page-content .page-content .download-resume {
  margin-top: 15px;
}
.info-list {
  display: inline-block;
  margin: 0;
  padding: 0;
  list-style: none;
}
.info-list li {
  margin: 6px 0;
  text-align: left;
}
.info-list li .title {
  display: inline-block;
  min-width: 120px;
}
.info-list li .value {
  display: inline-block;
  color: #9e9e9e;
}
.download-resume {
  margin-top: 50px;
}
@media only screen and (max-width: 1032px) {
  .pt-page {
    margin: 0 15px;
    width: auto;
  }
}
@media only screen and (max-width: 991px) {
  .page-content {
    padding: 30px 30px 50px;
  }
}
@media only screen and (max-width: 769px) {
  .info-list {
    margin-top: 20px;
  }
  .start-page-content .page-header {
    padding: 50px 30px;
    margin: 0;
  }
  .start-page-content .page-header .photo {
    max-width: 200px;
    margin: 0 auto;
  }
  .start-page-content .page-header .title-block h1 {
    margin-top: 25px;
    font-size: 44px;
    line-height: 1.2em;
  }
  .start-page-content .page-header .title-block .sp-subtitle {
    margin-top: 15px;
  }
}
</style>
