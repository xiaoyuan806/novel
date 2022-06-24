<template>
  <div class="bodys">
    <div class="pageTitle">
      <el-row>
        <el-col :span="8">
          <p class="index_p1">杰哥小说网</p>
        </el-col>
        <el-col :span="12">
          <el-row class="index_row_s">
            <el-col :span="16">
              <el-input v-model="input" placeholder="请输入内容"></el-input>
            </el-col>
            <el-col :span="4">
              <el-button
                type="danger"
                icon="el-icon-search"
                @click="
                  $router.push({
                    name: 'inputnovel',
                    query: { novelname: input },
                  })
                "
                >搜索</el-button
              >
            </el-col>
          </el-row>
        </el-col>
        <el-col class="login_css_index" :span="4">
          <a
            v-show="username == null"
            class=""
            @click="
              $router.push({
                name: 'login',
              })
            "
            >登录</a
          >
          <a @click="drawer = true" class="" v-show="username != null">{{
            username
          }}</a>
        </el-col>
      </el-row>
    </div>
    <ul class="topNav">
      <li :class="[showHot == 0 ? 'active' : '']" @click="showHot = 0">首页</li>
      <li :class="[showHot == 1 ? 'active' : '']" @click="showHot = 1">书库</li>
      <li :class="[showHot == 2 ? 'active' : '']" @click="showHot = 2">榜单</li>
    </ul>

    <div>
      <home v-show="showHot == 0"></home>
      <novel v-show="showHot == 1"></novel>
      <ranking v-show="showHot == 2"></ranking>
    </div>

    <el-drawer
      title="个人主页"
      :visible.sync="drawer"
      :direction="direction"
      :before-close="handleClose"
    >
      <el-row>
        <el-col :span="12" style="margin-left: 8em; margin-bottom: 20px">
          <el-card :body-style="{ padding: '0px' }">
            <img src="../assets/info.jpg" class="image" />
            <div style="padding: 14px">
              <div class="bottom clearfix">
                <time class="time">用户{{ username }}</time>
              </div>
            </div>
          </el-card>
        </el-col>
      </el-row>

      <el-card class="box-card">
        <div class="text item" @click="$router.push('history')">
          {{ "历史记录 " }}
          <el-divider></el-divider>
        </div>
        <div class="text item">
          {{ "个人信息 " }}
          <el-divider></el-divider>
        </div>
        <div class="text item" @click="exit()" >
          {{ "退出登录" }}
          <el-divider></el-divider>
        </div>
      </el-card>
    </el-drawer>
  </div>
</template>
<script>
import home from "@/components/home";
import novel from "@/components/novel";
import ranking from "@/components/ranking";

export default {
  name: "index",
  components: {
    home,
    novel,
    ranking,
  },
  data() {
    return {
      direction: "rtl",
      showHot: 0,
      input: "",
      show: this.$route.params.username,
      userid: "",
      username: "",
      drawer: false,
    };
  },
  created() {
    this.userid = localStorage.getItem("userid");
    this.username = localStorage.getItem("username");
    console.log(this.username);
  },
  methods: {
    handleClose(done) {
      // this.$confirm('确认关闭？')
      //   .then(_ => {
      //     done();
      //   })
      //   .catch(_ => {});
      done();
    },
    exit(){
      localStorage.removeItem('username')
      localStorage.removeItem('username')
       
    }
  },
};
</script>
<style scoped>
.pageTitle {
  height: 51px;
  width: 100%;
  background-color: rgb(229, 72, 71);

  color: #fff;
  font-size: 1.1em;
}
.index_p1 {
  margin-left: 20px;
  font-weight: bold;
}
.index_row_s {
  line-height: 50px;
}
.topNav {
  height: 44px;
  line-height: 44px;
  display: flex;
  flex-direction: row;
  justify-content: start;
  border-bottom: 1px solid #ccc;
  background-color: #fff;
}
.bodys {
  margin-left: 180px;
  margin-right: 180px;
}
.login_css_index {
  line-height: 50px;
}
.topNav li {
  margin-right: 80px;
  height: 100%;
  cursor: pointer;
  list-style: none;
}
.active {
  color: rgb(229, 72, 71);
  border-bottom: 2px solid rgb(229, 72, 71);
}

.aa {
  position: relative;
  right: -400px;
  cursor: pointer;
}
.text {
  font-size: 14px;
}

.item {
  padding: 18px 0;
  cursor: pointer;
}

.box-card {
  width: 480px;
}
.time {
  font-size: 13px;
  color: #999;
}

.bottom {
  margin-top: 13px;
  line-height: 12px;
}

.image {
  width: 100%;
  display: block;
}
.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both;
}
</style>