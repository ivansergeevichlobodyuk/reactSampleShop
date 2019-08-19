<?php

namespace Eshop\SampleBundle\DQL;

use Doctrine\ORM\Query\Lexer;
use Doctrine\ORM\Query\AST\Functions\FunctionNode;


/**
 * "REPLACE" "(" StringPrimary "," StringSecondary "," StringThird ")"
 */
class ReplaceFunction extends FunctionNode{

    /**
     * String search
     *
     * @var $string
     */
    public $stringFirst;

    /**
     * String find
     *
     * @var string
     */
    public $stringSecond;

    /**
     * String replace
     *
     * @var string
     */
    public $stringThird;

    /**
     * @param \Doctrine\ORM\Query\SqlWalker $sqlWalker
     * @return string
     */
    public function getSql(\Doctrine\ORM\Query\SqlWalker $sqlWalker) {
        return  'replace('.$this->stringFirst->dispatch($sqlWalker) .','
            . $this->stringSecond->dispatch($sqlWalker) . ','
            .$this->stringThird->dispatch($sqlWalker) . ')';
    }

    /**
     * Parse in query
     *
     * @param \Doctrine\ORM\Query\Parser $parser
     * @throws \Doctrine\ORM\Query\QueryException
     */
    public function parse(\Doctrine\ORM\Query\Parser $parser) {
        $parser->match(Lexer::T_IDENTIFIER);
        $parser->match(Lexer::T_OPEN_PARENTHESIS);
        $this->stringFirst = $parser->StringPrimary();
        $parser->match(Lexer::T_COMMA);
        $this->stringSecond = $parser->StringPrimary();
        $parser->match(Lexer::T_COMMA);
        $this->stringThird = $parser->StringPrimary();
        $parser->match(Lexer::T_CLOSE_PARENTHESIS);
    }

}