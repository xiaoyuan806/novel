<template>
  <div class="ranking">
    <div class="bang">
      <el-row>
      
        <el-col
          :span="12"
          v-for="(novel, index) in bang.slice(0, 1)"
          :key="novel.id"
        >
        <h2>新品热榜前十</h2>
          <div
            class="novels_ranking_div_s"
            @click="
              $router.push({
                name: 'novelDetail',
                query: { novelid: novel.novelid },
              })
            "
          >
            <el-row class="margin_ranking_row_s">
              <el-col :span="2">
                <p class="p1_ranking">{{ index + 1 }}</p>
              </el-col>

              <el-col class="rank_info" :span="8">
                <p class="fs-5_ranking">{{ novel.name }}</p>
                <p class="text-secondary_ranking">{{ novel.author }}</p>
                <p class="text-secondary_ranking intro_ranking_s">
                  {{ novel.introduction }}
                </p>
              </el-col>
              <el-col :span="4">
                <img
                  class="img_ranking_s"
                  :src="require('../assets/' + novel.pic)"
                />
              </el-col>
              <div class="div_br_ranking"></div>
            </el-row>
          </div>
        </el-col>

        <el-col
          :span="12"
          v-for="(novel, index) in bangnew.slice(0, 1)"
          :key="novel.id"
        >
        <h2>总榜前十</h2>
          <div
            class="novels_ranking_div_s"
            @click="
              $router.push({
                name: 'novelDetail',
                query: { novelid: novel.novelid },
              })
            "
          >
            <el-row class="margin_ranking_row_s">
              <el-col :span="2">
                <p class="p1_ranking">{{ index + 1 }}</p>
              </el-col>

              <el-col class="rank_info" :span="8">
                <p class="fs-5_ranking">{{ novel.name }}</p>
                <p class="text-secondary_ranking">{{ novel.author }}</p>
                <p class="text-secondary_ranking intro_ranking_s">
                  {{ novel.introduction }}
                </p>
              </el-col>
              <el-col :span="4">
                <img
                  class="img_ranking_s"
                  :src="require('../assets/' + novel.pic)"
                />
              </el-col>
              <div class="div_br_ranking"></div>
            </el-row>
          </div>
        </el-col>
      </el-row>

      <el-row>
        <el-col :span="12">
          <div
            class="div2_ranking"
            v-for="(novel, index) in bang.slice(1, 10)"
            :key="novel.id"
          >
            <div
              class="novels_ranking_div_s"
              @click="
                $router.push({
                  name: 'novelDetail',
                  query: { novelid: novel.novelid },
                })
              "
            >
              <el-row class="margin_ranking_row_s">
                <el-col :span="2">
                  <p class="p2_ranking">{{ index + 2 }}</p>
                </el-col>

                <el-col :span="9">
                  <p class="fs-5_ranking2">{{ novel.name }}</p>
                </el-col>
                <el-col :span="3"> </el-col>
                <div class="div_br_ranking2"></div>
              </el-row>
            </div>
          </div>
        </el-col>

        <el-col :span="12">
          <div
            class="div2_ranking"
            v-for="(novel, index) in bangnew.slice(1, 10)"
            :key="novel.id"
          >
            <div
              class="novels_ranking_div_s"
              @click="
                $router.push({
                  name: 'novelDetail',
                  query: { novelid: novel.novelid },
                })
              "
            >
              <el-row class="margin_ranking_row_s">
                <el-col :span="2">
                  <p class="p2_ranking">{{ index + 2 }}</p>
                </el-col>

                <el-col :span="9">
                  <p class="fs-5_ranking2">{{ novel.name }}</p>
                </el-col>
                <el-col :span="3"> </el-col>
                <div class="div_br_ranking2"></div>
              </el-row>
            </div>
          </div>
        </el-col>
      </el-row>
    </div>
    <div class="footer_ranking_s">
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
  name: "ranking",
  data() {
    return {
      bang: "",
      bangnew:""
    };
  },
  created() {
    this.getbang();
    this.getbangnew();
  },
  methods: {
    getbang() {
      this.bang = [];
      //通过axios向服务器发出post请求，获取所有记录。
      axios.post("api/novel/getbangs").then((res) => {
        console.log(res);
        this.bang = res.data;
      });
    },
    getbangnew() {
      let nowDate = new Date();
      this.bangnew = [];
      //通过axios向服务器发出post请求，获取所有记录。
      axios.post("api/novel/getbangsnew",{date:nowDate.getFullYear()}).then((res) => {
        console.log(res);
        this.bangnew = res.data;
      });
    },
  },
};
</script>
<style scoped>
* {
  margin: 0;
  padding: 0;
}
.left_ranking {
  height: 800px;
  float: left;
}
.rank_info{
   margin-top: 30px;
}
.div_br_ranking {
  height: 120px;
  width: 350px;
  border-bottom: 1px gainsboro solid;
}
.div_br_ranking2 {
  height: 25px;
  width: 350px;
  border-bottom: 1px gainsboro solid;
}
.div2_ranking {
  margin-top: 5px;

  padding: 0;
}
.p1_ranking {
  color: red;
  font-weight: bold;
  margin-top: 40px;
  font-size: 25px;
}
.p2_ranking {
  color: #000;
  font-size: 16px;
}
.img_ranking_s {
  width: 60px;
  height: 80px;
  margin-top: 25px;
}
.novels_ranking_div_s{
  cursor: pointer;
}
.novels_ranking_div_s:hover {
  color: red;
  cursor: pointer;
}
.fs-5_ranking {
  font-size: 1.25rem !important;
}
.fs-5_ranking2 {
  font-size: 1rem !important;
}
.text-secondary_ranking {
  line-height: 1em;
  font-size: 0.8em;
  border-bottom: 1em;
}
.intro_ranking_s {
  width: 170px;
  overflow: hidden; /*溢出的部分隐藏*/
  white-space: nowrap; /*文本不换行*/
  text-overflow: ellipsis;
}
.bang{
   margin-left: 150px;
}
.footer_ranking_s {
  clear: both;
  margin-top: 100px;
  background-color: lavender;
  height: 100px;
}
.footer_ranking_s p {
  text-align: center;
  font-size: 8px;
}
</style>