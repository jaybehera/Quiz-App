/*const questions = [
	{
		'qn': 'Number of primitive data type in java are?',
		'a': '6',
		'b': '7',
		'c': '8',
		'd': '9',
		'correct': 'c'

	},
	{
		'qn': 'What is the size of float in java?',
		'a': '64',
		'b': '8',
		'c': '128',
		'd': '32',
		'correct': 'd'

	},
	{
		'qn': 'What is the size of double in java',
		'a': '64',
		'b': '8',
		'c': '128',
		'd': '32',
		'correct': 'a'

	}
]*/



let index = 0;
const totalQn = questions.length
let rightAns = 0;

const qnBox = document.getElementById("qnBox")
const optionInputs = document.querySelectorAll('.options')

const ansMap = new Map();

const loadQuestion = () => {

	reset();
	const data = questions[index]
	qnBox.innerText = `${index + 1} ) ${data.qn}`;
	optionInputs[0].nextElementSibling.innerHTML = data.a;
	optionInputs[1].nextElementSibling.innerHTML = data.b;
	optionInputs[2].nextElementSibling.innerHTML = data.c;
	optionInputs[3].nextElementSibling.innerHTML = data.d;

	if (ansMap.has(index)) {
		optionInputs[index].checked = true;
	}

	if (index == 0) {
		document.getElementById('prev').style.visibility = 'hidden';
	} else {
		document.getElementById('prev').style.visibility = 'visible';
	}

	if (index == totalQn - 1) {
		document.getElementById('next').style.visibility = 'hidden';
	} else {
		document.getElementById('next').style.visibility = 'visible';
	}

}

function submitQuiz() {

	ansMap.forEach((value, key) => {
		if (value == questions[key].correct) {
			rightAns++;
		}
	});
	endQuiz()
}


function reset() {
	optionInputs.forEach(
		(input) => {
			input.checked = false;
		}
	)
}

function endQuiz() {
	document.getElementById("box").innerHTML = `<h5>Thank you for playing quiz</h5><br>You got ${rightAns} out of ${totalQn}`
}

function prevQn() {
	index--;
	loadQuestion();

}

function nextQn() {
	index++;
	loadQuestion();
}

function modifyAns(event) {
	ansMap.set(index, event.target.value);
}

//modify on ans change
for (const radio of optionInputs) {
	radio.addEventListener("change", modifyAns);
}

loadQuestion();