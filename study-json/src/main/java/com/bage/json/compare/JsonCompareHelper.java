package com.bage.json.compare;

import com.bage.json.JsonUtils;
import org.javers.core.Javers;
import org.javers.core.JaversBuilder;
import org.javers.core.diff.Change;
import org.javers.core.diff.Diff;
import org.javers.core.diff.changetype.ValueChange;
import org.javers.core.metamodel.object.ValueObjectId;

import java.util.List;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

/**
 * https://javers.org/documentation/diff-examples/
 */
public class JsonCompareHelper {

    ConfigProp configProp = new ConfigProp();

    public static void main(String[] args) {
        String str1 = getStr1();
        String str2 = getStr2();
        CompareDiffItem compareDiffItem = new JsonCompareHelper().diffDetail(str1, str2);
        System.out.println(compareDiffItem);
    }


    /**
     * 如果存在差异， 返回 list 为空，， 否则 返回 差异的字段路径     *     * @param str1     * @param str2     * @return
     */
    public CompareDiffItem diffDetail(String str1, String str2) {
        try {
            // given
            Javers javers = JaversBuilder.javers().build();
            // when
            Diff diff = javers.compare(JsonUtils.parse(str1), JsonUtils.parse(str2));
            // then
            List<String> pathList = diff.getChanges().stream()
                    .map(change -> mapping(change))
                    .map(change -> replaceSomeField(change))
                    .filter(change -> filterByConfig(change))
                    .collect(Collectors.toList());

            CompareDiffItem item = new CompareDiffItem();
            item.setSummary(subIfNecessary(replaceSomeField(diff.prettyPrint())));
            item.setPaths(pathList);

            return item;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new CompareDiffItem();
    }

    private String subIfNecessary(String str) {
        if (str == null) {
            return "";
        }
        Integer maxLength = configProp.getMaxLength();
        if (maxLength == null) {
            maxLength = 1800;
        }

        if (str.length() >= maxLength) {
            return str.substring(0, maxLength) + "...";
        }
        return str;
    }

    private boolean filterByConfig(String path) {
        String[] ignoreFields = configProp.getIgnoreFields();
        if (ignoreFields == null) {
            return true;
        }
        for (String str : ignoreFields) {
            if (Pattern.compile(str).matcher(path).matches()) {
                System.out.println("skip by config, config = {}, path = {}"+ str+ path);
                return false;

            }
        }
        return true;
    }

    private String mapping(Change change) {
        if (change.getAffectedGlobalId() instanceof ValueObjectId) {
            String fragment = ((ValueObjectId) (change.getAffectedGlobalId())).getFragment();
            return fragment;
        }
        if (change instanceof ValueChange) {
            String propertyName = ((ValueChange) change).getPropertyName();
            return propertyName;
        }
        return "unknown-unsupported";
    }

    private String replaceSomeField(String originPath) {
        // _children/RequestOrder/_children/BackExt => RequestOrder/BackExt
        // 2. ValueChange{globalId:'com.fasterxml.jackson.databind.node.ObjectNode/#_children/RequestOrder/_children/BackExt', property:'_value', oldVal:'{"grabDefaultPackagePrice":40,"rnVersion":2.025042401E7,"mainRnVersion":2.025042401E7,"zlRnVersion":2.024090401E7,"preSaleListV2":[{"preSaleDateTime":"20250421153000","departDate":"20250505"},{"preSaleDateTime":"20250420153000","departDate":"20250504"}],"redeemAlertContent":"","originalTicketInfoV2":{"departStation":"牡丹江","arriveStation":"北京"},"grabProcessType":1,"ticketReimbursePassengerImgKeyList":[]}', newVal:'{"grabDefaultPacddkagePrice":40,"rnVersion":2.025042401E7,"mainRnVersion":2.025042401E7,"zlRnVersion":2.024090401E7,"preSaleListV2":[{"preSaleDateTime":"20250421153000","departDate":"20250505"},{"preSaleDateTime":"20250420153000","departDate":"20250504"}],"redeemAlertContent":"","originalTicketInfoV2":{"departStation":"牡丹江","arriveStation":"北京"},"grabProcessType":1,"ticketReimbursePassengerImgKeyList":[]}'}
        return "/" + originPath.replace("_children/", "")
                .replace("com.fasterxml.jackson.databind.node.ObjectNode/#", "");
    }


    private static String getStr2() {
        String str2 ="{\n" +
                "            \"id\": 1,\n" +
                "            \"name\": \"John Doe2\",\n" +
                "            \"age\": 30,\n" +
                "            \"address\": {\n" +
                "                \"street\": \"123 Main St\",\n" +
                "                \"city\": \"New York2\",\n" +
                "                \"state\": \"NY\"\n" +
                "            },\n" +
                "            \"children\": {\n" +
                "                \"value\": {\n" +
                "                    \"grabDefaultPackagePrice\": 40,\n" +
                "                    \"rnVersion\": 2.025042401E733,\n" +
                "                    \"mainRnVersion\": 2.025042401E7,\n" +
                "                    \"zlRnVersion\": 2.024090401E7,\n" +
                "                    \"preSaleListV2\": [\n" +
                "                        {\n" +
                "                            \"preSaleDateTime\": \"20250421153000\",\n" +
                "                            \"departDate\": \"20250506\"\n" +
                "                        },\n" +
                "                        {\n" +
                "                            \"preSaleDateTime\": \"20250420153000\",\n" +
                "                            \"departDate\": \"20250507\"\n" +
                "                        }\n" +
                "                    ]\n" +
                "                }\n" +
                "            }\n" +
                "        }";
        return str2;
    }

    private static String getStr1() {
        String str1 ="{\n" +
                "            \"id\": 1,\n" +
                "            \"name\": \"John Doe\",\n" +
                "            \"age\": 30,\n" +
                "            \"address\": {\n" +
                "                \"street\": \"123 Main St\",\n" +
                "                \"city\": \"New York\",\n" +
                "                \"state\": \"NY\"\n" +
                "            },\n" +
                "            \"children\": {\n" +
                "                \"value\": {\n" +
                "                    \"grabDefaultPackagePrice\": 40,\n" +
                "                    \"rnVersion\": 2.025042401E7,\n" +
                "                    \"mainRnVersion\": 2.025042401E7,\n" +
                "                    \"zlRnVersion\": 2.024090401E7,\n" +
                "                    \"preSaleListV2\": [\n" +
                "                        {\n" +
                "                            \"preSaleDateTime\": \"20250421153000\",\n" +
                "                            \"departDate\": \"20250505\"\n" +
                "                        },\n" +
                "                        {\n" +
                "                            \"preSaleDateTime\": \"20250420153000\",\n" +
                "                            \"departDate\": \"20250504\"\n" +
                "                        }\n" +
                "                    ]\n" +
                "                }\n" +
                "            }\n" +
                "        }";
        return str1;
    }
}
