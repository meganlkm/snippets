<?php

if (!isset($argv[1])) {
    die('Usage: ' . $argv[0] . ' start_decimal end_decimal' . PHP_EOL);
}

if (!is_numeric($argv[1])) {
    die('Usage: ' . $argv[0] . ' start_decimal end_decimal' . PHP_EOL);
}

if (!is_numeric($argv[2])) {
    die('Usage: ' . $argv[0] . ' start_decimal end_decimal' . PHP_EOL);
}

// number to convert
$startDecimal = (int) $argv[1];
$endDecimal = (int) $argv[2];

if (!is_numeric($startDecimal) || !is_numeric($endDecimal)) {
    die('Usage: ' . $argv[0] . ' start_decimal end_decimal' . PHP_EOL);
}

echo "converting {$startDecimal} - {$endDecimal} to binary...\n";

for ($startDecimal; $startDecimal <= $endDecimal; $startDecimal++) {
    echo convertToBinary($startDecimal);
    echo PHP_EOL;
}

function getMaxBinaryPlaceValue($decimal) {
    $max = 0;
    $maxDecimal = 0;
    $killAt = 500;

    for ($max; $maxDecimal <= $decimal; $max++) {
        if ($max == $killAt) {
            die("killing endless loop...\n");
        }

        $maxDecimal = pow(2, $max);

        if ($maxDecimal > $decimal) {
            $max--;
            $maxDecimal = pow(2, $max);
            break;
        }
    }

    return $max;
}

function convertToBinary($decimal) {
    echo "$decimal   ";
    $placeValue = getMaxBinaryPlaceValue($decimal);
    for ($binStr = '0'; strlen($binStr) < 32; $binStr .= '0');
    $remainder = $decimal;

    for ($placeValue; $placeValue >= 0; $placeValue--) {
        $binDecimal = pow(2, $placeValue);

        if (($remainder - $binDecimal) >= 0) {
            $remainder = $remainder - $binDecimal;
            $binStr = substr_replace($binStr, '1', -($placeValue + 1), 1);
            // echo $binStr . PHP_EOL;
        }
    }
    return $binStr;
}

