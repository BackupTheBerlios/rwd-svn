<?php
// 
// $Id$
// 

// Helper for UserController
class UCHelper extends Object {

    // verifica rolul utilizatorului
    public static function role_to_human($role) {
        return $role == User::ADMIN ? 'admin' : 'normal user';
    }
    
    public static function role_to_select($role) {
        $buff = '<select name="user[role]" id="user_role">';
        
        if ($role == User::ADMIN) {
            $buff .= '<option value="'.User::ADMIN.'" selected="selected">Admin</option>';
            $buff .= '<option value="'.User::NORMAL.'">Normal User</option>';
        } elseif ($role == User::NORMAL) {
            $buff .= '<option value="'.User::ADMIN.'">Admin</option>';
            $buff .= '<option value="'.User::NORMAL.'" selected="selected">Normal User</option>';
        }
        return $buff .= '</select>';
    }
    
    // de implementat.
    // trebe sa converteasca date intr-un format mai uman
    public static function last_login_to_human($date) {
        return $date;
    }
    
}
    
