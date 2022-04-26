const userData = require("../model/Members")


module.exports = {
    getUser: (req, res) => {
        const {login, password} = req.params;
        console.log(login, password)

        userData.getUser(req.con, login, password, (err, rows) => {
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
    },

    getLikedUsers: (req, res) => {
        const {userId} = req.params;
        console.log(userId)

        userData.getUser(req.con, login, password, (err, rows) => {
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
    },
    getUsers: (req, res) => {
        userData.getUsers(req.con, (err, rows) => {
            if (err) {
                return res.status(400).json({
                    status: 'error',
            
                });
            }
            res.send(rows);

        })
    }
}
