<?php
/**
 * Wordpress api service
 */

namespace Eccube\Service;

use Eccube\Application;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Guzzle\Http\Client;
use Eccube\Common\Constant;

/**
 * 
 * @date 2017/05/26 version 1
 * @author Dung Le 
 */
class WpApiService
{
    /** @var \Eccube\Application */
    public $app;
    
    public $client;
    
    private $statusCode = [
        100 => 'Continue',
        101 => 'Switching Protocols',
        102 => 'Processing',            // RFC2518
        200 => 'OK',
        201 => 'Created',
        202 => 'Accepted',
        203 => 'Non-Authoritative Information',
        204 => 'No Content',
        205 => 'Reset Content',
        206 => 'Partial Content',
        207 => 'Multi-Status',          // RFC4918
        208 => 'Already Reported',      // RFC5842
        226 => 'IM Used',               // RFC3229
        300 => 'Multiple Choices',
        301 => 'Moved Permanently',
        302 => 'Found',
        303 => 'See Other',
        304 => 'Not Modified',
        305 => 'Use Proxy',
        306 => 'Reserved',
        307 => 'Temporary Redirect',
        308 => 'Permanent Redirect',    // RFC7238
        400 => 'Bad Request',
        401 => 'Unauthorized',
        402 => 'Payment Required',
        403 => 'Forbidden',
        404 => 'Not Found',
        405 => 'Method Not Allowed',
        406 => 'Not Acceptable',
        407 => 'Proxy Authentication Required',
        408 => 'Request Timeout',
        409 => 'Conflict',
        410 => 'Gone',
        411 => 'Length Required',
        412 => 'Precondition Failed',
        413 => 'Request Entity Too Large',
        414 => 'Request-URI Too Long',
        415 => 'Unsupported Media Type',
        416 => 'Requested Range Not Satisfiable',
        417 => 'Expectation Failed',
        418 => 'I\'m a teapot',                                               // RFC2324
        422 => 'Unprocessable Entity',                                        // RFC4918
        423 => 'Locked',                                                      // RFC4918
        424 => 'Failed Dependency',                                           // RFC4918
        425 => 'Reserved for WebDAV advanced collections expired proposal',   // RFC2817
        426 => 'Upgrade Required',                                            // RFC2817
        428 => 'Precondition Required',                                       // RFC6585
        429 => 'Too Many Requests',                                           // RFC6585
        431 => 'Request Header Fields Too Large',                             // RFC6585
        500 => 'Internal Server Error',
        501 => 'Not Implemented',
        502 => 'Bad Gateway',
        503 => 'Service Unavailable',
        504 => 'Gateway Timeout',
        505 => 'HTTP Version Not Supported',
        506 => 'Variant Also Negotiates (Experimental)',                      // RFC2295
        507 => 'Insufficient Storage',                                        // RFC4918
        508 => 'Loop Detected',                                               // RFC5842
        510 => 'Not Extended',                                                // RFC2774
        511 => 'Network Authentication Required',                             // RFC6585
    ];

    public function __construct(\Eccube\Application $app)
    {
        $this->app = $app;
        $this->client = $this->getClient();
    }

    public function getClient()
    {
        $url = Constant::WP_URI;
        $type = Constant::WP_TYPE;
        $base_url = rtrim($url, '/').'/'.rtrim(ltrim($type, '/'), '/').'/';
        $client = new Client(
            $base_url,
            array(
                'request.options' => array(
                    'headers' => array('Accept' => 'application/json'),
                ),
            )
        );

        return $client;
    }
    
    public function getPosts($filters = '')
    {
        $client = $this->client;
        $data = $this->request($client, $filters);

        return $data;
    }

    public function parsePosts($posts = [], $format = 'contents')
    {
        $data = $this->makeContents($posts);

        return $data;
    }

    private function makeContents($posts)
    {
        $contents = [];
        foreach ($posts as $item) {
            $create_date = new \DateTime($item['date']);
            $create_date = $create_date->format('Y/m/d');
            $update_date = new \DateTime($item['modified']);
            $update_date = $update_date->format('Y/m/d');
            array_push(
                $contents,
                [
                    'id'      => $item['id'],
                    'title'   => $item['title']['rendered'],
                    'content' => $item['content']['rendered'],
                    'link'    => $item['link'],
                    'update_date'    => $update_date,
                    'create_date'    => $create_date,
                ]
            );
        }

        return $contents;
    }

    public function makeContent($post)
    {
        $create_date = new \DateTime($post['date']);
        $create_date = $create_date->format('Y/m/d');
        $update_date = new \DateTime($post['modified']);
        $update_date = $update_date->format('Y/m/d');
        return [
            0 => [
                'id'      => $post['id'],
                'title'   => $post['title']['rendered'],
                'content' => $post['content']['rendered'],
                'link'    => $post['link'],
                'update_date'    => $update_date,
                'create_date'    => $create_date,
            ],
        ];
    }

    private function request(Client $client, $param)
    {
        $routes = 'wp/v2/posts/'.$param;
        try {
            $request  = $client->get($routes);
            $response = $request->send();
            $data     = [
                'code' => $response->getStatusCode(),
                'message' => $this->statusCode[$response->getStatusCode()],
                'body' => $response->json(),
            ];

            return $data;
        } catch (\Exception $e) {
            return [
                'code' => -1,
                'message' => 'Exception.',
            ];
        }
    }
}
