<template>
<div class="main">
    <div class="login-box">
        <h3>欢迎注册</h3>
        <el-form ref="form" :model="form" :rules="rules" label-width="80px">
            <el-form-item label="用户名" prop="username">
                <el-input v-model="form.username" aria-placeholder="请输入用户名"></el-input>
            </el-form-item>
            <el-form-item label="密码"  prop="password">
                <el-input v-model="form.password" aria-placeholder="请输入密码" type="password"></el-input>
            </el-form-item>
             <el-form-item label="性别"  prop="gender">
                <el-input v-model="form.gender" aria-placeholder="请输入性别" ></el-input>
            </el-form-item>
            <el-form-item label="年龄"  prop="age">
                <el-input v-model="form.age" aria-placeholder="请输入年龄" ></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="onSubmit('form')">注册</el-button>
               
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
                    password:'' ,
                    gender:'',
                    age:''  //form.password
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
                            "api/novel/register",
                            {
                                username:vm.form.username,
                                password:vm.form.password,
                                gender:vm.form.gender,
                                age:vm.form.age
                            }
                        ).then((res)=>{
                            console.log(res)
                            if(res.data.affectedRows==1){
                                vm.$message({
                                    message: '注册成功',
                                   type: 'success',
                                    duration:1000
                                 });                                
                                 setTimeout(function () {
                                     vm.$router.push({
                                         name:'login'                                   
                                     }) 
                                  },1200)
                            }else{
                                 vm.$message.error('注册失败');
                            }
                        })
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
        height: 350px;
        border:1px solid #DCDFE6;
        margin: 150px auto;
        padding: 20px 50px 20px 30px;
        border-radius: 20px;
        box-shadow: 0px 0px 20px #DCDFE6;
    }
</style>