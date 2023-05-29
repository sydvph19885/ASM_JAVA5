<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta
            name="viewport"
            content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
    />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link
            rel="stylesheet"
            href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css"
    />
    <style>
        .range-value {
            display: flex;
            justify-content: space-between;
        }

        #minValue,
        #maxValue {
            margin-top: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Range Slider</h1>
    <div id="price-slider"></div>
    <div class="range-value">
        <span id="minValue" value="500000"></span>
        <span id="maxValue" value="9000000"></span>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script>
    $(document).ready(function () {
        var minValue = $("#minValue");
        var maxValue = $("#maxValue");
        var defaultMinValue = parseInt(minValue.attr("value"));
        var defaultMaxValue = parseInt(maxValue.attr("value"));

        $("#price-slider").slider({
            range: true,
            min: defaultMinValue,
            max: defaultMaxValue,
            values: [defaultMinValue, defaultMaxValue],
            step: 100000,
            slide: function (event, ui) {
                minValue.text(ui.values[0]);
                maxValue.text(ui.values[1]);
            },
        });

        minValue.text($("#price-slider").slider("values", 0));
        maxValue.text($("#price-slider").slider("values", 1));
    });
</script>
</body>
</html>
