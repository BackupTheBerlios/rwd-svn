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
    
    // de implementat.
    // trebe sa converteasca date intr-un format mai uman
    public static function last_login_to_human($date) {
        return $date;
    }
    
}
    
