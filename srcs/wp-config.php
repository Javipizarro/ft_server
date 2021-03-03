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
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress_db' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin123456' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
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
define('AUTH_KEY',         'IDJj/jf=qi+i|IDK]{ !1vUVCy&llD<IGb|fO2:#_;R=Et~hJGXW>)= ^rr+3M7D');
define('SECURE_AUTH_KEY',  'a-Pv}g_.H*&8?%U:TCJ~#C#)@ncn<{v4Tn<GG!S04vGNB?|^tbWXIxySE%N(sn^g');
define('LOGGED_IN_KEY',    'I2+V_cO1[(~B{fV9usP=mqR!0+nC$r!nKZ#U5lT~V)7jFB4+Q9vJ_4PkF%X6A2ra');
define('NONCE_KEY',        '~m6C2bA-795jz^d&OsO,u4exj$+MpPD0MgUVsXd2JUFl6[41(z;t)|j&iz{#9y0s');
define('AUTH_SALT',        'T6K};0V$FlQ6 U.X#!jWkNkPN6{8r;SgCga$)U4|1ruc/fKz|*i[y{0k[U`]i@`.');
define('SECURE_AUTH_SALT', '3qC|nf.P-Rv}2$XSp> S#QT5z *T[6C:HEUG5PatAU!2DI%1.Fn)XAeD*eq|PAX)');
define('LOGGED_IN_SALT',   '=X{1~,&rCWceDR1Dkx^gS;2{WI2thN3QRb>]?C|Ap3-T!c4vdAJYaG@d(2W+1+UX');
define('NONCE_SALT',       's?^-}^>N8.@j+7b-@2 tSXi^ Lpx?yg6epUYe`b-Bl]<f^$x{q.CvrfF1k&{j.un');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
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
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
