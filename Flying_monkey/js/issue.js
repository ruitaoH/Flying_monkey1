function checkIssue() {

    var image = issue.image;
    if (checkIsEmpty(image, '请添加图片文件!')) {
        return false;
    }

    var name = issue.name;
    if (checkIsEmpty(name, '请输入物品名称!')) {
        return false;
    }

    var type = issue.type;
    if (checkIsEmpty(type, '请输入物品类别!')) {
        return false;
    }

    var value = issue.value;
    if (checkIsEmpty(value, '请输入物品价值!')) {
        return false;
    } else if (!/[0-9]+/.test(value.value)) {//改动过
        warn('请输入有效的物品价格!');
        return false;
    }

    var buy_place = issue.buy_place;
    if (checkIsEmpty(buy_place, '请输入物品购买地点!')) {
        return false;
    }

    var tip = issue.tip;
    if (checkIsEmpty(tip, '请输入物品使用心得!')) {
        return false;
    }

    var price = issue.price;
    if (checkIsEmpty(price, '请输入物品试用费用!')) {
        return false;
    } else if (!/[0-9]+/.test(price.value)) {
        warn('请输入有效的价格!');
        return false;
    }

    var content = issue.content;
    if (checkIsEmpty(content, '请输入物品使用内容!')) {
        return false;
    }

    var try_place = issue.try_place;
    if (checkIsEmpty(try_place, '请输入物品使用地点!')) {
        return false;
    }

    issue.submit();
}