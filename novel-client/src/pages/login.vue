<template>
<div class="main">
    <div class="login-box">
        <h3>欢迎登录</h3>
        <el-form ref="form" :model="form" :rules="rules" label-width="80px">
            <el-form-item label="用户名" prop="username">
                <el-input v-model="form.username" aria-placeholder="请输入用户名"></el-input>
            </el-form-item>
            <el-form-item label="密码"  prop="password">
                <el-input v-model="form.password" aria-placeholder="请输入密码" type="password"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="onSubmit('form')">登录</el-button>
                <el-button type="primary" @click="onRegister">注册</el-button>
            </el-form-item>
        </el-form>
    </div>
    </div>
</template>
<script>
import axios from 'axios';
export default {
    name:"login",
    data(){
            return{
                form:{
                username:'',  //form.name
                    password:''   //form.password
            },
            rules: {
                username: [
                    {required: true, message: '请输入用户名', trigger: 'blur'},
                    {min: 6, max: 16, message: '长度在 6 到 16 个字符', trigger: 'blur'}
                ],
                    password: [
                    {required: true, message: '请输入密码', trigger: 'blur'},
                        {min: 6, max: 16, message: '长度在 6 到 16 个字符', trigger: 'blur'}
                    ],
                }
            }
        },
        methods:{
            onSubmit(formName){
                this.$refs[formName].validate((valid) => {
                    var vm = this;//把当前vue对象赋给vm，this表示当前vue对象，直接写this.form.username是拿不到值的，因为在axois中写this表示的是axios对象
                    if (valid) {
                        //发送axios请求
                      axios.post(
                            "api/novel/login",
                            {
                                username:vm.form.username,
                                password:vm.form.password
                            }
                        ).then((res)=>{
                            console.log(res)
                            if(res.data[0]!=null){
                                vm.$message({
                                    message: '登录成功',
                                   type: 'success',
                                    duration:1000
                                 });
                                 localStorage.setItem('userid',res.data[0].id)
                                 localStorage.setItem('username',res.data[0].user)
                                 setTimeout(function () {
                                     vm.$router.push({
                                         name:'index',
                                         params:{userid:res.data[0].id,
                                         username:res.data[0].user}
                                     }) //1秒后跳转到home
                                  },1200)
                            }else{
                                 vm.$message.error('用户名或密码错误');
                            }
                        })
                        // this.$axios({
                        //     method:'post',
                        //     url:'http://localhost:8081/login',
                        //     data: {
                        //         username:vm.form.username,
                        //         password:vm.form.password
                        //     }
                        // }).then(function (resp) {
                        //     if (resp.data.code == 0){//resp.data表示返回的数据
                        //         vm.$message({
                        //             message: '登录成功',
                        //             type: 'success',
                        //             duration:1000
                        //         });
                        //         console.log(resp)
                        //         setTimeout(function () {
                        //             vm.$router.push("/home") //1秒后跳转到home
                        //         },1200)
                        //     }else {
                        //         vm.$message.error('用户名或密码错误');
                        //     }
                        // })
                    } else {
                        console.log('error submit!!');
                        return false;
                    }
                });
            },
            onRegister(){
                this.$router.push("/register")
            }

        }
    }

</script>
<style scoped>
/* .main{
    height: 100%;
    background-color: #3e8ade;
} */
 .login-box{
        width:500px;
        height: 300px;
        border:1px solid #DCDFE6;
        margin: 150px auto;
        padding: 20px 50px 20px 30px;
        border-radius: 20px;
        box-shadow: 0px 0px 20px #DCDFE6;
    }
</style>