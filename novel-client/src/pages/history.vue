<template>
    <div>

<el-row>
  <el-col :span="6" v-for="o in novel" :key="o" :offset="1 ">
    <el-card :body-style="{ padding: '0px' }">
      <img :src="require('../assets/' + o.pic)"/>
      <div style="padding: 14px;">
        <span>{{o.novelname}}</span>
        <div class="bottom clearfix">
          <time class="time">{{ currentDate }}</time>
        
        </div>
      </div>
    </el-card>
  </el-col>
</el-row>

    </div>
</template>
<script>
import axios from 'axios';
export default {
    name:"history",
    data(){
        return{
          userid:'',
          novel:''

        }
    },
   created() {
       this.userid=localStorage.getItem('userid')
       console.log(this.userid)
       this.gethistory()
   },
   methods:{
       gethistory(){
           let vm=this
           axios.post('/api/novel/gethistory',{
               userid:this.userid
           }).then((res)=>{
               console.log(res)
              this.novel=res.data

           })
       }
   }

}
</script>
<style scoped>
 .time {
    font-size: 13px;
    color: #999;
  }
  
  .bottom {
    margin-top: 13px;
    line-height: 12px;
  }

  .button {
    padding: 0;
    float: right;
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
      clear: both
  }
</style>