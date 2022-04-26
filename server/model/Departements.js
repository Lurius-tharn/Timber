module.exports = {
    

    // connect the user
    getDepartement:(connection,numDepartement,callback)=>{
        stmt = 'SELECT * FROM dept WHERE num = ? '
        connection.query(stmt,[numDepartement],callback)
    },
    
}