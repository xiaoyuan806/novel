const express = require('express');
const router = express.Router();
const sql_Novel = require('../sqlMap_Novel');
const DBHelper_Novel = require('../utils/DBHelper_Novel');
// 查询所有图书
router.post('/getnovels', (req, res) => {
    let sqlStr = sql_Novel.novels.getnovels;
    let conn = new DBHelper_Novel().getConn();
    conn.query(sqlStr, (err, result) => {
        if (err) {
            res.json(err);
        } else {
            res.json(result)
        }
    });
    conn.end();
});
router.post('/getnews', (req, res) => {
    let sqlStr = sql_Novel.novels.getnews;
    let conn = new DBHelper_Novel().getConn();
    conn.query(sqlStr, (err, result) => {
        if (err) {
            res.json(err);
        } else {
            res.json(result)
        }
    });
    conn.end();
});

router.post('/updatehits', (req, res) => {
    let sqlStr = sql_Novel.novels.updatehits;
    let conn = new DBHelper_Novel().getConn();
    let params = req.body;
    conn.query(sqlStr,  [params.novelids],(err, result) => {
        if (err) {
            res.json(err);
        } else {
            res.json(result)
        }
    });
    conn.end();
});

router.post('/getinputnovels', (req, res) => {
    let sqlStr = sql_Novel.novels.getinputnovels;
    let conn = new DBHelper_Novel().getConn();
    let params = req.body;
    conn.query(sqlStr ,[params.name],(err, result) => {
        if (err) {
            res.json(err);
        } else {
            res.json(result)
        }
    });
    conn.end();
});
router.post('/getbangsnew', (req, res) => {
    let sqlStr = sql_Novel.novels.getbangsnew;
    let conn = new DBHelper_Novel().getConn();
    let params = req.body;
    conn.query(sqlStr ,[params.date],(err, result) => {
        if (err) {
            res.json(err);
        } else {
            res.json(result)
        }
    });
    conn.end();
});
router.post('/getbangs', (req, res) => {
    let sqlStr = sql_Novel.novels.getbangs;
    let conn = new DBHelper_Novel().getConn();

    conn.query(sqlStr ,(err, result) => {
        if (err) {
            res.json(err);
        } else {
            res.json(result)
        }
    });
    conn.end();
});
router.post('/getdaynovels', (req, res) => {
    let sqlStr = sql_Novel.novels.getdaynovels;
    let conn = new DBHelper_Novel().getConn();
    conn.query(sqlStr, (err, result) => {
        if (err) {
            res.json(err);
        } else {
            res.json(result)
        }
    });
    conn.end();
});
router.post('/getdaynovelsname', (req, res) => {
    let sqlStr = sql_Novel.novels.getdaynovelsname;
    let conn = new DBHelper_Novel().getConn();
    conn.query(sqlStr, (err, result) => {
        if (err) {
            res.json(err);
        } else {
            res.json(result)
        }
    });
    conn.end();
});

router.post('/getbynovelid', (req, res) => {
    let conn = new DBHelper_Novel().getConn();
    let params = req.body;
    console.log(params);
    let sqlStr = sql_Novel.novels.getbynovelid;
        conn.query(sqlStr, [params.novelids], (err, result) => {
            if (err) {
                res.json(sqlStr + " " + err);
            } else {
                res.json(result)
            }
        });
    conn.end();
});
router.post('/checknovel', (req, res) => {

    let conn = new DBHelper_Novel().getConn();
    let params = req.body;
    console.log(params);
    if (params.type == "全部" && params.date == "全部" && params.novstate == "全部") {//111
        let sqlStr = sql_Novel.novels.getnovels;
        conn.query(sqlStr, [params.date], (err, result) => {
            if (err) {
                res.json(sqlStr + " " + err);
            } else {
                res.json(result)
            }
        });
    } else if (params.type == "全部" && params.date != "全部" && params.novstate == "全部") {//121
        let sqlStr = sql_Novel.novels.checknovels2;
        conn.query(sqlStr, [params.date], (err, result) => {
            if (err) {
                res.json(sqlStr + " " + err);
            } else {
                res.json(result)
            }
        });
    } else if (params.type == "全部" && params.date != "全部" && params.novstate != "全部") {//122
        let sqlStr = sql_Novel.novels.checknovels3;
        conn.query(sqlStr, [params.date, params.novstate], (err, result) => {
            if (err) {
                res.json(sqlStr + " " + err);
            } else {
                res.json(result)
            }
        });
    } else if (params.type == "全部" && params.date == "全部" && params.novstate != "全部") {//112
        let sqlStr = sql_Novel.novels.checknovels4;
        conn.query(sqlStr, [params.novstate], (err, result) => {
            if (err) {
                res.json(sqlStr + " " + err);
            } else {
                res.json(result)
            }
        });
    } else if (params.type != "全部" && params.date == "全部" && params.novstate == "全部") {//211
        let sqlStr = sql_Novel.novels.checknovels5;
        conn.query(sqlStr, [params.type], (err, result) => {
            if (err) {
                res.json(sqlStr + " " + err);
            } else {
                res.json(result)
            }
        });
    } else if (params.type != "全部" && params.date != "全部" && params.novstate == "全部") {//221
        let sqlStr = sql_Novel.novels.checknovels6;
        conn.query(sqlStr, [params.type, params.date], (err, result) => {
            if (err) {
                res.json(sqlStr + " " + err);
            } else {
                res.json(result)
            }
        });
    } else if (params.type != "全部" && params.date == "全部" && params.novstate != "全部") {//212
        let sqlStr = sql_Novel.novels.checknovels7;
        conn.query(sqlStr, [params.type, params.novstate], (err, result) => {
            if (err) {
                res.json(sqlStr + " " + err);
            } else {
                res.json(result)
            }
        });
    } else {//222
        let sqlStr = sql_Novel.novels.checknovels8;
        conn.query(sqlStr, [params.type,params.novstate, params.date], (err, result) => {
            if (err) {
                res.json(sqlStr + " " + err);
            } else {
                res.json(result)
            }
        });
    }
    conn.end();
});
router.post('/login',(req,res)=>{
    let conn = new DBHelper_Novel().getConn();
    let params = req.body;
    let sqlStr=sql_Novel.novels.login;
    console.log(params)
    conn.query(sqlStr,[params.username,params.password],(err,result)=>{
        if (err) {
            res.json(sqlStr + " " + err);
        } else {
            res.json(result)
        }
    })
})
router.post('/gethistory',(req,res)=>{
    let conn = new DBHelper_Novel().getConn();
    let params = req.body;
    let sqlStr=sql_Novel.novels.gethistory;
    conn.query(sqlStr,[params.userid],(err,result)=>{
        if (err) {
            res.json(sqlStr + " " + err);
        } else {
            res.json(result)
        }
    })
})
router.post('/history',(req,res)=>{
    let conn = new DBHelper_Novel().getConn();
    let params = req.body;
    let sqlStr=sql_Novel.novels.history;
    console.log(params)
    conn.query(sqlStr,[params.novelid,params.userid,params.novelname,params.pic],(err,result)=>{
        if (err) {
            res.json(sqlStr + " " + err);
        } else {
            res.json(result)
        }
    })
})
router.post('/register',(req,res)=>{
    let conn = new DBHelper_Novel().getConn();
    let params = req.body;
    let sqlStr=sql_Novel.novels.register;
    console.log(params)
    conn.query(sqlStr,[params.username,params.password,params.gender,params.age],(err,result)=>{
        if (err) {
            res.json(sqlStr + " " + err);
        } else {
            res.json(result)
        } 
    })
})
module.exports = router;