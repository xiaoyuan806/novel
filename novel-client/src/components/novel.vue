<template>
  <div class="novel">
    <div style="margin-top: 20px">
      作品分类：
      <el-radio-group v-model="radio1" @change="getValue_s()" size="small">
        <el-radio-button label="全部"></el-radio-button>
        <el-radio-button label="奇幻"></el-radio-button>
        <el-radio-button label="武侠"></el-radio-button>
        <el-radio-button label="都市"></el-radio-button>
        <el-radio-button label="科幻"></el-radio-button>
        <el-radio-button label="悬疑"></el-radio-button>
      </el-radio-group>
    </div>
    <div style="margin-top: 20px">
      更新时间：
      <el-radio-group v-model="radio2" @change="getValue_s()" size="small">
        <el-radio-button label="全部"></el-radio-button>
        <el-radio-button label="2021"></el-radio-button>
        <el-radio-button label="2020"></el-radio-button>
        <el-radio-button label="2019"></el-radio-button>
        <el-radio-button label="2018"></el-radio-button>
        <el-radio-button label="2017"></el-radio-button>
        <el-radio-button label="2016"></el-radio-button>
        <el-radio-button label="2015"></el-radio-button>
        <el-radio-button label="2014"></el-radio-button>
        <el-radio-button label="2013"></el-radio-button>
      </el-radio-group>
    </div>
    <div style="margin-top: 20px">
      写作进度：
      <el-radio-group v-model="radio3" @change="getValue_s()" size="small">
        <el-radio-button label="全部"></el-radio-button>
        <el-radio-button label="连载中"></el-radio-button>
        <el-radio-button label="已完结"></el-radio-button>
      </el-radio-group>
    </div>
    <div class="novels_novel_s">
      <el-row :gutter="20">
        <el-col :span="6" v-for="novel in novels.slice(currentPage*12-12, currentPage*12)"  :key="novel.id">
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
                <p class="fs-5">{{ novel.name }}</p>
                <p class="text-secondary_novel">{{ novel.author }}</p>
                <p class="text-secondary_novel intro_novel_s">
                  {{ novel.introduction }}
                </p>
              </el-col>
            </el-row>
          </div>
        </el-col>
        <el-col :span="6"
          ><div class="min_div_novel">
            <el-row class=""
              ><el-col :span="8"></el-col><el-col :span="16"></el-col
            ></el-row></div
        ></el-col>
        <el-col :span="6"
          ><div class="min_div_novel">
            <el-row class=""
              ><el-col :span="8"></el-col><el-col :span="16"></el-col
            ></el-row></div
        ></el-col>
        <el-col :span="6"
          ><div class="min_div_novel">
            <el-row class=""
              ><el-col :span="8"></el-col><el-col :span="16"></el-col
            ></el-row></div
        ></el-col>
      </el-row>
    </div>
    <div class="block">
      <el-pagination @current-change="handleCurrentChange" layout="prev, pager, next" :total="novels.length"> </el-pagination>
    </div>
    <div class="footer_novel_s">
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
  name: "novel",
  data() {
    return {
      radio1: "全部",
      radio2: "全部",
      radio3: "全部",
      novels: "",
      rnapagesum: 4, //总页数
      currentPage: 1, //当前页
      rnaeachpage: 12, //每页显示30条数据
    };
  },
  created() {
    this.checknovels();
  },
  methods: {
    handleCurrentChange: function (currentPage) {
      this.currentPage = currentPage;
      console.log(this.currentPage); //点击第几页
    },
    getValue_s() {
      console.log(this.radio1); // 打印被选中的label的值
      console.log(this.radio2);
      console.log(this.radio3);
      (this.novels = []),
        axios
          .post("api/novel/checknovel", {
            type: this.radio1,
            date: this.radio2,
            novstate: this.radio3,
          })
          .then((res) => {
            console.log(res);
            this.novels = res.data;
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
.novels_novel_s {
  float: left;
  margin-top: 30px;
  margin-left: 20px;
}
.text-secondary_novel {
  line-height: 1em;
  font-size: 0.8em;
  border-bottom: 1em;
}
.block {
  margin-left: 40%;
  float: left;
}
.el-row {
  display: flex;
  flex-wrap: wrap;
}
.fs-5_novel {
  font-size: 1.25rem !important;
}
.min_div_novel {
  min-width: 250px;
  cursor: pointer;
}
.img_novel_s {
  width: 80px;
  height: 100px;
}
.margin_novel_row_s {
  margin-top: 50px;
  border: 1px solid gainsboro;
}
.intro_novel_s {
  width: 170px;
  overflow: hidden; /*溢出的部分隐藏*/
  white-space: nowrap; /*文本不换行*/
  text-overflow: ellipsis;
}
.footer_novel_s {
  margin-top: 380px;
  clear: both;
  background-color: lavender;
  height: 100px;
}
.footer_novel_s p {
  text-align: center;
  font-size: 8px;
}
</style>