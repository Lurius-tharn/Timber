module.exports = {
    // connect the user
    getDepartement:(connection,numDepartement,callback)=>{
        stmt = 'SELECT *   FROM departement WHERE num = ? '
        connection.query(stmt,[numDepartement],callback)
    },
    
}