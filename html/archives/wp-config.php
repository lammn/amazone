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
/** The name of the database for WordPress */
define('DB_NAME', 'wp');

/** MySQL database username */
define('DB_USER', 'lammn90');

/** MySQL database password */
define('DB_PASSWORD', '');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '=WIAZ}:[}1{@,Q7p`gty|03Gf`W8aPPRr80C=A:!SPJ>C/wh(nb&Oh`]HW] }oHI');
define('SECURE_AUTH_KEY',  ',N=C`T!X?W${|/oc=:enxEdy@hjef&B_9CjavR[_(HcsZo-{sI9fst-o,8p-X|C)');
define('LOGGED_IN_KEY',    '?}0gtDR(!]b-Vp&>z 1DUMyNwVvLI-2&>JShVk-n>L#t)h7w,dlv*w>W$JeM!c*q');
define('NONCE_KEY',        'ZQ}ra6Fw4~fxP)8C2I3rO)i08UG_L Adcb0*1*8;n}WR~+`~; ji>aF2iQ]eY0.o');
define('AUTH_SALT',        'xBVLxK0}m242zT%WU@WO}6+Is,n<p_-qY1!m-1U_tXEt)~~A7}>vL326D`F}srbA');
define('SECURE_AUTH_SALT', 'Cw fKuV-GaagcG#U+?S%4:odI5b(a_PU+BqphQ1ToeM=#W.:Qp<6]hYqM=wugB59');
define('LOGGED_IN_SALT',   '|M1 M,>T&JAz1wZ1i+Up,G:Xw^fqWM[KcEY{T[2;G} ek__P/=IT~l6S&`Hyf{*R');
define('NONCE_SALT',       '&K~%wTw=[&D@ORpC|v>|(Keh|dT ;1y,/Rx(5>QmSd>d.#``#?J5rZ.]rT;NiQj=');

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
