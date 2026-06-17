<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'Inception' );

/** Database username */
define( 'DB_USER', 'user' );

/** Database password */
define( 'DB_PASSWORD', '1234' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'dq~c/iE6++!KkXgPIa|w@5jmrd cfU{wkz(0h>4O~>&J>E}?2sb@,:OFFk>P,3%(');
define('SECURE_AUTH_KEY',  'r*s{9;qmAaDR7)qGeX-a-V/y{|I;y$majReXyycG){1OYHa}Y@SW`8- [ZiKLUM`');
define('LOGGED_IN_KEY',    'bI`hR<C&^<M }+c_eLi-|odoO4e[>P^qfMGrVJA44;D-b!f5%WC$-Bz2YJ0Bf<Lz');
define('NONCE_KEY',        'nT#&vFQA7!BH-5!;/SS4nie0Crnn^2+)|D8x]/93DPd#S.WjaslVDa}^@_A6wmBq');
define('AUTH_SALT',        'KutJA3-m6h~Z$VX {c/IJz9*X+|mp;$h|{9r 61..,-44b$g4_%}be+W=^` `Tm:');
define('SECURE_AUTH_SALT', '3DWa_CNdE +!$2<USm;J,.SHgahz`Kv8JbC)brpk-JE@$e2FPW{Xk`=/W?`}2e.G');
define('LOGGED_IN_SALT',   'G8y!V;{|4V}+,-nX:hMhC,`Y%E)4UWG!S/+8@nM1y$T}3LJjL38O=1>1.r<k3Cah');
define('NONCE_SALT',       'bU~G:E7.IW,)L!XVpR+o{2|0,Vw?H,d77m+z<QrNTj11r#.%jqHS|$r~foK<*w5T');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 *
 * At the installation time, database tables are created with the specified prefix.
 * Changing this value after WordPress is installed will make your site think
 * it has not been installed.
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/#table-prefix
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', true );

/* Add any custom values between this line and the "stop editing" line. */

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';