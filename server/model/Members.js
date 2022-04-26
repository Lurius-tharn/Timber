module.exports = {
    

    // connect the user
    getUser:(connection,login,password,callback)=>{
        stmt = 'SELECT * FROM membre WHERE login = ? AND password = ?'
        connection.query(stmt,[login, password],callback)
    },
    getLikedUsers:(connection,login,password,callback)=>{
        stmt = 'SELECT * FROM membre WHERE login = ? AND password = ?'
        connection.query(stmt,[login, password],callback)
    },
    getUsers:(connection,callback)=>{
        stmt = 'SELECT * FROM membre'
        connection.query(stmt,callback)
    },
}