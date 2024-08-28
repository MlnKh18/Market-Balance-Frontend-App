// base_ul
// ignore_for_file: constant_identifier_names

const localhost = '192.168.188.18:3000';
const base_ul = 'http://$localhost/api/';

//Auth
const auth_ul = '${base_ul}auth/';
const auth_login = '${auth_ul}login';
const auth_register = '${auth_ul}register';

//Product
const product_get_all = '${base_ul}products';
const product_add = '${base_ul}product';
const product_update_by_id = '$product_add/';
const product_delete_by_id = '$product_add/';
const product_get_by_id = '$product_add/';

//Cart
const cart_get_all = '${base_ul}cart';
const cart_add = '${base_ul}cart';
const cart_update_by_id = '$cart_add/';
const cart_delete_by_id = '$cart_add/';

//Store
const store_get_all = '${base_ul}stores';
const store_create = '${base_ul}register-store';
const store_add_product = '${base_ul}product';
const store_update_product = '$store_add_product/';
const store_delete_product_by_id = '$store_add_product/delete/';
const store_get_all_product_toko = '${base_ul}store/products';
const store_get_by_id = '$base_ul/store/';
const store_update = '$base_ul/store/update';

//User
const user_get_all = '${base_ul}users?';
const user_get_by_token = '${base_ul}profile';
const user_update = '${base_ul}profile/update';

//Kategory
const kategory_get_all = '${base_ul}categorys';

//Alamat
const alamat_get_all = '${base_ul}alamat';
const alamat_add_by_user = '${base_ul}alamat';
