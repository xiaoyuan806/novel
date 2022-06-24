var sqlMap = {	    
    novels:{
        getnovels:'select * from novelview', 
        getnews:'select * from novelnews where id<7',  
        getdaynovels: 'select * from novelview where id<6', 
        getdaynovelsname:'select * from novelview where id<11', 
        checknovels2:'select * from novelview where date=?',
        checknovels3: 'select * from novelview where date=? and novstate=?', 
        checknovels4: 'select * from novelview where novstate=?', 
        checknovels5: 'select * from novelview where type=?', 
        checknovels6: 'select * from novelview where type=? and date=?', 
        checknovels7: 'select * from novelview where type=? and novstate=?', 
        checknovels8: 'select * from novelview where type=? and novstate=? and date=?', 
        getbynovelid: 'select * from novelview where novelid=?', 
        updatehits: 'update novel set hit=hit+1 where novelid=? ', 
        getbangs: 'select * from novelview ORDER BY hit desc;', 
        getbangsnew: 'select * from novelview where date=? ORDER BY hit desc;', 
        getinputnovels:'select * from novelview where name like ?',
        login:'select user,id from user where user=? and password=?',
        history:'insert into history(novelid,userid,novelname,pic) values(?,?,?,?) ',
        gethistory:'select * from history where userid=?',
        register:'insert into user(user,password,gender,age) values(?,?,?,?) '
    }
}
module.exports = sqlMap;