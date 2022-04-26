const departementData = require("../model/Departements")


module.exports = {
    getUser: (req, res) => {
        const {numDepartement} = req.params;
        console.log(numDepartement)

        departementData.getDepartement(req.con, numDepartement, (err, rows) => {
            if (err) {
                return res.status(400).json({
                    status: 'error',
            
                });
            }
            res.json({
                "valid": true,
                "message": "Utilisateur trouvé!",
            })
        })
    }
}
