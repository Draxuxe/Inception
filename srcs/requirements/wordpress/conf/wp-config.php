<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */
 
// ** MySQL settings - You can get this info from your web host ** //
define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'lfilloux' );
define( 'DB_PASSWORD', 'pass' );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
 
/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
	define('AUTH_KEY',         'kJk;z#$G(h+b}X<-X15!*sky)+pSa1WU/sYH+JE,,h](];x?>oVkWFuSC&b Vpk{');
	define('SECURE_AUTH_KEY',  '2pWDz3apV|A4nf~63-MX 5~DQdl8p=Sk+p;[dmFsZw2L^a?}:$&R>-/Yl>TXVKMO');
	define('LOGGED_IN_KEY',    ' 5_Q5i)[ SK_0#C.0ePWT7KDs8=Z{J+>,ZKNRT[r>fk|G+[tlB;HA]u$D%7jC>s.');
	define('NONCE_KEY',        '#!Ep0w?(fPqkP-n(%d.H=p.FA-63DtA!$IDH~=_%6pP<721T|E#%r743obKF{MG~');
	define('AUTH_SALT',        'c+B94fnre>/{_vxr9oDGIcwE(@csL]B<G<Q>E.dl8[C48Rx8wkWL|x.Tmw})^#O-');
	define('SECURE_AUTH_SALT', 'DNZ)c|4d{R/^~R(UjxkUCT{|GMxFdWsH6j,%Qn`!Iu;hX%Q&@,dV$;+p%2+M4mS-');
	define('LOGGED_IN_SALT',   '`@Tu(Xs[$_JfLDiU:)&/b; H_[xB,$MPudc0G14I@k9Di5Od!++j IVY0r2+J{`Q');
	define('NONCE_SALT',       '#|+n&uDE?=y_l2 _g=Gjo|2VM4-`=pwtK4}75i#B TG^Ynk=D|CcSid?lN|_X;9O');
 
/**#@-*/
 
/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';
 
/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);
 
/* That's all, stop editing! Happy blogging. */
 
/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');
 
/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');