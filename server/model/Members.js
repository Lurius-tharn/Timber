module.exports = {
    

    // connect the user
    login:(connection,login,password,callback)=>{
        stmt = 'SELECT id FROM membre WHERE login = ? AND password = ?'
        connection.query(stmt,[login, password],callback)
    },
    getLikedUsers:(connection,userId,callback)=>{
        stmt = 'SELECT * from liked  WHERE likedProfil = ?'
        connection.query(stmt,[userId],callback)
    },
    getUsers:(connection,callback)=>{
        stmt = 'SELECT * FROM membre'
        connection.query(stmt,callback)
    },
    getUserFromId:(connection,idUser ,callback)=>{
        stmt = 'SELECT * FROM membre where id = ?'
        connection.query(stmt,[idUser],callback)
    },
    newLikedProfile:(connection,userId,likedId,callback)=>{
        stmt = 'Insert into Liked values(?,?)'

        console.log(userId,likedId);
        connection.query(stmt,[userId, likedId],callback)
    },
}