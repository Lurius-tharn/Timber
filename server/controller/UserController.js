const userData = require("../model/Members")


module.exports = {
    getUser: (req, res) => {
        const {login, password} = req.params;

        userData.login(req.con, login, password, (err, rows) => {
            if (err) {
                return res.status(400).json({
                    status: 'error',
            
                });
            }
            res.send(rows)
        })
    },

    getLikedUsers: (req, res) => {
        const {idUser} = req.params;
        console.log(idUser)

        userData.getLikedUsers(req.con, idUser, (err, rows) => {
            if (err) {
                return res.status(400).json({
                    status: 'error',
            
                });
            }
            res.send(rows)
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
    },
    getUserFromId: (req, res) => {
        userData.getUserFromId(req.con, (err, rows) => {
            if (err) {
                return res.status(400).json({
                    status: 'error',
            
                });
            }
            res.send(rows);

        })
    },
    newLikedProfile: (req, res) => {
        const {idUser, idLiked} = req.body;
        console.log(req.body);
        userData.newLikedProfile(req.con,idUser, idLiked, (err, rows) => {
            if (err) {
                return res.status(400).json({
                    status: 'error',
            
                });
            }
            res.json({
                "valid": true,
                "message": "Utilisateur Liké!",
            })

        })
    },
}
