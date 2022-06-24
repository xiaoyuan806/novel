<template>
  <div class="bodys">
    <div class="pageTitle">杰哥小说网</div>
    <ul class="topNav">
      <li
        @click="
          $router.push({
            name: 'index',
          })
        "
      >
        首页
      </li>
    </ul>
    <div>
      <div class="novel-header">
        <el-row>
          <el-col
            :span="24"
            v-for="novel in novels.slice(0, 1)"
            :key="novel.id"
          >
            <el-row>
              <el-col :span="8">
                <div class="novelDetail-img">
                  <img
                    class="img_noveldetail_s"
                    :src="require('../assets/' + novel.pic)"
                  /></div
              ></el-col>
              <el-col :span="16">
                <div class="novelname_detail_s">
                  <h3>{{ novel.name }}</h3>
                </div>

                <ul class="movie-info">
                  <li>类型：{{ novel.type }}</li>
                  <li>作者：{{ novel.author }}</li>
                  <li class="li_hit_detail_s">热度：{{ novel.hit }}</li>
                  <li>简介：{{ novel.introduction }}</li>
                </ul>
                <el-row class="novelname_detail_s">
                  <el-button type="warning" @click="sethitup_s(novel.novelid), history()"
                    >开始阅读</el-button
                  >
                </el-row>
              </el-col>
            </el-row>
          </el-col>
        </el-row>
      </div>
    </div>
    <div class="footer_detail_s">
      <br />
      <p>合作伙伴：暂无</p>
      <p>版权所有</p>
    </div>
  </div>
</template>
<script>
import axios from "axios";
export default {
  name: "novelDetail",
  data() {
    return {
      novels: [],
      userid:''
    };
  },
  created() {
    // 这里获取 从路由传值传过来的电影id，然后进行数据请求
     this.userid=localStorage.getItem('userid')
    let novelid = this.$route.query.novelid;
    
    this.novels = [];
    //通过axios向服务器发出post请求，获取所有记录。
    axios
      .post("api/novel/getbynovelid", {
        novelids: novelid,
      })
      .then((res) => {
        console.log(res);
        this.novels = res.data;
      });
  },
  methods: {
    sethitup_s(novelid_hit) {
      console.log(novelid_hit);
      axios
        .post("api/novel/updatehits", {
          novelids: novelid_hit,
        })
        .then((res) => {
          axios
            .post("api/novel/getbynovelid", {
              novelids: novelid_hit,
            })
            .then((res) => {
              console.log(res);
              this.novels = res.data;
            });
        });

        
    },
     history(){
        console.log(1111)
        var vm=this
        console.log(this.userid)
        axios.post(
          'api/novel/history',
          {
              novelid:vm.novels[0].novelid,
              userid:vm.userid,
              novelname:vm.novels[0].name,
              pic:vm.novels[0].pic
          
        }
        ).then((res)=>{
          console.log(res)
        })

    }
  },
};
</script> 
<style scoped>
.movieDetail-img {
  display: flex;
  justify-content: center;
  align-items: center;
}
.movieDetail-img img {
  margin-top: 20px;
  height: 260px;
  width: 200px;
  display: block;
}

.novelname_detail_s {
  margin-left: 70px;
}
.movie-info {
  height: 135px;
  font-size: 12.5px;
  display: block;
  list-style: none;
  line-height: 20px;
  margin: 30px;
}
.score > span {
  font-weight: bold;
  font-size: 14px;
  color: #faaf00;
}
.pageTitle {
  height: 51px;
  width: 100%;
  background-color: rgb(229, 72, 71);
  text-align: center;
  line-height: 51px;
  color: #fff;
  font-size: 1.1em;
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
.li_hit_detail_s{
  font-weight:bold;
  color: red;
}
.topNav li {
  margin-right: 80px;
  height: 100%;
  cursor: pointer;
  list-style: none;
}

.footer_detail_s {
  margin-top: 250px;
  clear: both;
  background-color: lavender;
  height: 100px;
}
.footer_detail_s p {
  text-align: center;
  font-size: 8px;
}
.img_noveldetail_s{
  width:300px;
  height: 400px;
}
</style>