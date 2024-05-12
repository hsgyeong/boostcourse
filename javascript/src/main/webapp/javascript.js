var a = [];
//배열 안에는 모든 타입이 다 들어갈 수 있다. 함수도 배열 안에 배열도, 배열 안에 객체도 들어갈 수 있다.
var a = [1,2,3,"hello",null,true,[[{1:0}]]];

console.log(a.length);    //7

//배열에 원소 추가는 index 번호와 함께 추가할 수 있다.
var b = [4];
b[1000] = 3;
console.log(b.length);   //1001
console.log(b[500]);  //undefined

//배열은 push 메서드를 통해서 뒤에 순차적으로 추가할 수 있다.
var c = [4];
c.push(5);
console.log(c.length);  //2


var origin = [1,2,3,4];
//var changed = origin.concat();   [1,2,3,4]
var result = origin.concat(2,3);
var result2 = [...origin,2,3];    //spread operator
//console.log(origin === changed);  //false
console.log(origin, result);
console.log(origin, result2);


//배열의 원소에 특정 값이 들어 있는지 확인할 수 있다.
[1,2,3,4].indexOf(3);  //2

//배열을 합칠 수 있다.
[1,2,3,4].concat(2,3);  //[1,2,3,4,2,3]


//forEach는 함수를 인자로 받고 있다.
["apple","tomato"].forEach(function(value){
	console.log(value);
});

var newArr = ["apple","tomato"].map(function(value,index){
	return index + "번째 과일은" + value + "입니다.";
});

console.log(newArr);

var changedArray = [...origin,2,3];

var fun = function(v,i,o){
	console.log(v);
};

changedArray.forEach(fun);

var mapped = changedArray.map(function(v){
	return v * 2;   //changedArray의 원소를 돌면서, 값을 변경시킨 후에 새로운 배열로 만들어서 반환한다.
});

console.log(mapped);
