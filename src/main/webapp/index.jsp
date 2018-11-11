<%@page import="com.dahua.Perf4jDemo"%>
<html>
<head>
    <script src="js/echarts.js"></script>
    <script src="js/jquery-3.2.1.min.js"></script>
</head>
<body>
<h2>Sperf4jDemo!</h2>

<%
    Perf4jDemo.method1();
%>

<script type="text/javascript">
    /**
     url可以以GET方式添加参数：
     kpis=avg,count  表示只显示avg和count的图表，支持的kpi为：avg、max、min、count
     **/
    var url = "/perf4j";
    var divContent = '<div id="contentId" style="width:650px; height: 400px; float:left"></div>';
    var charts = [];
    $.ajax({
        url: url,
        type: 'GET',
        dataType: 'JSONP',
        async: false,
        jsonp: 'callback',
        success: function (data) {
            data.forEach( function(element, index) {
                $(document.body).append(divContent.replace("contentId","contentId"+index));
                var myChart = echarts.init($("#contentId"+index)[0]);
                charts.push(myChart);
                myChart.setOption(element);
            });
        }
    });

    function loop(){
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'JSONP',
            jsonp: 'callback',
            success: function (data) {
                data.forEach( function(element, index) {
                    charts[index].setOption(element);
                });
            }
        });
    }
    setInterval("loop()", 5000);
</script>
</body>
</html>

