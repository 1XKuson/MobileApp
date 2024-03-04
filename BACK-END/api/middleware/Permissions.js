const Permissions =(permissions) =>{
    return (req,res,next)=>{
        const userRole = req.userData.Role
        if(permissions.includes(userRole)){
            next();
        }
        else {
            return res.status(401).json({
                message : "You do not have permission"
            });
        }
    };
}


module.exports = Permissions;