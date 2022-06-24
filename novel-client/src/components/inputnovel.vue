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
    <div class="input_div">
      <el-col
        :span="24"
        v-for="novel in novels.slice(currentPage * 12 - 12, currentPage * 12)"
        :key="novel.id"
      >
        <div
          class="min_div_novel"
          @click="
            $router.push({
              name: 'novelDetail',
              query: { novelid: novel.novelid },
            })
          "
        >
          <el-row class="margin_novel_row_s">
            <el-col :span="8">
              <img
                class="img_novel_s"
                :src="require('../assets/' + novel.pic)"
              />
            </el-col>
            <el-col :span="16">
              <p class="fs-5_inputnovel">{{ novel.name }}</p>
              <p class="text-secondary_inputnovel">{{ novel.author }}</p>
              <p class="text-secondary_inputnovel intro_inputnovel_s">
                {{ novel.introduction }}
              </p>
            </el-col>
          </el-row>
        </div>
        <hr>
      </el-col>
      <div class="block">
        <el-pagination
          @current-change="handleCurrentChange"
          layout="prev, pager, next"
          :total="novels.length"
        >
        </el-pagination>
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
  name: "inputnovel",
  data() {
    return {
      novels: "",
       rnapagesum: 4, //总页数
      currentPage: 1, //当前页
      rnaeachpage: 12, //每页显示30条数据
    };
  },
  created() {
    // 这里获取 从路由传值传过来的电影id，然后进行数据请求
    let novelname = this.$route.query.novelname;
    console.log(novelname);
    //通过axios向服务器发出post请求，获取所有记录。
    axios
      .post("api/novel/getinputnovels", {
        name: "%"+novelname+"%",
      })
      .then((res) => {
        this.novels = res.data;
        console.log(this.novels);
        console.log("ssssssss");
      });
  },
  methods: {
    handleCurrentChange: function (currentPage) {
      this.currentPage = currentPage;
      console.log(this.currentPage); //点击第几页
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

.block {
  margin-left: 40%;
  float: left;
}
.min_div_novel {
  min-width: 250px;
  cursor: pointer;
}
.novelname_detail_s {
  margin-left: 70px;
}
.input_div{
  margin-left: 20px;
  margin-right: 20px;
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
.li_hit_detail_s {
  font-weight: bold;
  color: red;
}
.fs-5_inputnovel {
  font-size: 1.25rem !important;
}
.text-secondary_inputnovel {
  line-height: 1em;
  font-size: 0.8em;
  border-bottom: 1em;
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
.img_noveldetail_s {
  width: 300px;
  height: 400px;
}
</style>