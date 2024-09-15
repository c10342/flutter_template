
//是否为函数
bool isFunction(dynamic data){
  return data is Function;
}

//是否为字符
bool isString(dynamic data){
  return data is String;
}
// 判断是否为空，!=null && !=''
bool isDef(dynamic data){
  if(isString(data)){
    return data !='';
  }
  return data != null;
}