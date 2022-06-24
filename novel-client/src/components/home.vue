<template>
  <div class="home">
    <div class="news_home_s">
      <p class="bold_news_s">公告</p>
      <div
        class="news_home_div_s"
        v-for="novelnews in news"
        :key="novelnews.id"
      >
        <p class="news_home_content_s">{{ novelnews.novelnew }}</p>
      </div>
    </div>
    <div class="block_home">
      <el-carousel trigger="click" height="300px">
        <el-carousel-item v-for="item in daynovels" :key="item.id">
          <div
            @click="
              $router.push({
                name: 'novelDetail',
                query: { novelid: item.novelid },
              })
            "
          >
            <img
              class="img_home_carousel_s"
              :src="require('../assets/' + item.pic)"
            />
          </div>
        </el-carousel-item>
      </el-carousel>
    </div>
    <div class="day_home_s">
      <br>
      <table>
        <th align="left">推荐</th>
        <tr v-for="item in daynovelsname" :key="item.id">
          <div
            class="home_day_div_s"
            @click="
              $router.push({
                name: 'novelDetail',
                query: { novelid: item.novelid },
              })
            "
          >
            <td>
              {{ item.name }}
            </td>
          </div>
        </tr>
      </table>
    </div>

    <div class="novels_home_s">
      <p class="bold_news_s">精品小说：</p>
      <div class="home_br"></div>
      <el-row :gutter="20">
        <el-col :span="6" v-for="novel in novels.slice(0, 16)" :key="novel.id">
          <div
            class="novels_home_div_s"
            @click="
              $router.push({
                name: 'novelDetail',
                query: { novelid: novel.novelid },
              })
            "
          >
            <el-row class="margin_home_row_s">
              <el-col :span="8">
                <img
                  class="img_home_s"
                  :src="require('../assets/' + novel.pic)"
                />
              </el-col>
              <el-col :span="16">
                <p class="fs-5_home">{{ novel.name }}</p>
                <p class="text-secondary_home">{{ novel.author }}</p>
                <p class="text-secondary_home intro_home_s">
                  {{ novel.introduction }}
                </p>
              </el-col>
            </el-row>
          </div>
        </el-col>
      </el-row>
    </div>
    <div class="footer_home_s">
      <br />
      <p>合作伙伴：暂无</p>
      <p>版权所有</p>
    </div>
  </div>
</template>   
<script>
// 导出组件
import axios from "axios";
export default {
  name: "home",
  data() {
    return {
      news: "",
      novels: "",
      daynovels: "",
      daynovelsname: "",
    };
  },
  created() {
    this.checknews();
    this.checknovels();
    this.getdaynovels();
    this.getdaynovelsname();
  },
  methods: {
    getdaynovels() {
      this.daynovels = [];
      //通过axios向服务器发出post请求，获取所有记录。
      axios.post("api/novel/getdaynovels").then((res) => {
        console.log(res);
        this.daynovels = res.data;
      });
    },
    getdaynovelsname() {
      this.daynovelsname = [];
      //通过axios向服务器发出post请求，获取所有记录。
      axios.post("api/novel/getdaynovelsname").then((res) => {
        console.log(res);
        this.daynovelsname = res.data;
      });
    },
    checknews() {
      this.news = [];
      //通过axios向服务器发出post请求，获取所有记录。
      axios.post("api/novel/getnews").then((res) => {
        console.log(res);
        this.news = res.data;
      });
    },
    checknovels() {
      this.novels = [];
      //通过axios向服务器发出post请求，获取所有记录。
      axios.post("api/novel/getnovels").then((res) => {
        console.log(res);
        this.novels = res.data;
      });
    },
  },
};
</script>
<style scoped>
.news_home_s {
  float: left;
  width: 150px;
  margin-right: 20px;

  margin-left: 20px;
}
.block_home {
  float: left;
  width: 750px;
}
.bold_news_s{
  font-weight: bold;
}
.el-col {
  border-radius: 4px;
}
.bg-purple-dark {
  background: #99a9bf;
}
.bg-purple {
  background: #d3dce6;
}
.bg-purple-light {
  background: #e5e9f2;
}
.grid-content {
  border-radius: 4px;
  min-height: 36px;
}
.row-bg {
  padding: 10px 0;
  background-color: #f9fafc;
}
.text-secondary_home {
  line-height: 1em;
  font-size: 0.8em;
  border-bottom: 1em;
}
.fs-5_home {
  font-size: 1.25rem !important;
}
.img_home_s {
  width: 80px;
  height: 120px;
}
.img_home_carousel_s {
  width: 750px;
  height: 300px;
}
.home_day_div_s {
  padding-top: 5px;
  border-bottom: 1px gainsboro solid;
  cursor: pointer;
}
.news_home_div_s {
  border-bottom: 1px gainsboro solid;
  cursor: pointer;
}
.news_home_content_s {
  width: 150px;
  overflow: hidden; /*溢出的部分隐藏*/
  white-space: nowrap; /*文本不换行*/
  text-overflow: ellipsis;
}
.home_day_div_s:hover {
  border-bottom: 1px gainsboro solid;
  color: red;
  cursor: pointer;
}
.novels_home_div_s {
  cursor: pointer;
}
.home_br{
  border-bottom: 1px gainsboro solid;
  width: 100%;
}
.novels_home_s {

  float: left;
  margin-top: 30px;
  margin-left: 20px;
}
.margin_home_row_s {
  margin-top: 25px;
  margin-bottom: 25px;
  border: 1px solid gainsboro;
}
.day_home_s {
  float: left;
  margin-left: 20px;
}

.footer_home_s {
  clear: both;
  background-color: lavender;
  height: 100px;
}
.intro_home_s {
  width: 170px;
  overflow: hidden; /*溢出的部分隐藏*/
  white-space: nowrap; /*文本不换行*/
  text-overflow: ellipsis;
}
.footer_home_s p {
  text-align: center;
  font-size: 8px;
}
</style>