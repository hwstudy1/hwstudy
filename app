import { useState } from "react";

export default function HomeworkApp() {
  const [homeworks, setHomeworks] = useState([
    { id: 1, grade: "고1", subject: "수학", content: "p.45 1~10번", done: false },
    { id: 2, grade: "고2A", subject: "영어", content: "단어시험 20개", done: false },
  ]);
  const [newHw, setNewHw] = useState({ grade: "고1", subject: "", content: "" });

  const addHomework = () => {
    if (!newHw.subject || !newHw.content) return;
    const newItem = {
      ...newHw,
      id: Date.now(),
      done: false,
    };
    setHomeworks([newItem, ...homeworks]);
    setNewHw({ grade: "고1", subject: "", content: "" });
  };

  const toggleDone = (id) => {
    setHomeworks(
      homeworks.map((hw) => (hw.id === id ? { ...hw, done: !hw.done } : hw))
    );
  };

  return (
    <main className="p-4 max-w-xl mx-auto">
      <h1 className="text-2xl font-bold mb-4">숙제 공유</h1>
      <div className="mb-4 grid gap-2">
        <select
          className="border p-2 rounded"
          value={newHw.grade}
          onChange={(e) => setNewHw({ ...newHw, grade: e.target.value })}
        >
          {["고1", "고2A", "고2B", "고2C", "고3문과", "고3이과"].map((g) => (
            <option key={g}>{g}</option>
          ))}
        </select>
        <input
          className="border p-2 rounded"
          placeholder="과목"
          value={newHw.subject}
          onChange={(e) => setNewHw({ ...newHw, subject: e.target.value })}
        />
        <input
          className="border p-2 rounded"
          placeholder="숙제 내용"
          value={newHw.content}
          onChange={(e) => setNewHw({ ...newHw, content: e.target.value })}
        />
        <button onClick={addHomework} className="bg-blue-500 text-white p-2 rounded">
          추가하기
        </button>
      </div>
      <ul className="grid gap-2">
        {homeworks.map((hw) => (
          <li
            key={hw.id}
            className={`p-2 border rounded flex justify-between items-center ${
              hw.done ? "bg-green-100" : ""
            }`}
          >
            <div>
              <strong>[{hw.grade}] {hw.subject}</strong>: {hw.content}
            </div>
            <button
              onClick={() => toggleDone(hw.id)}
              className="text-sm text-blue-500"
            >
              {hw.done ? "완료 취소" : "완료"}
            </button>
          </li>
        ))}
      </ul>
    </main>
  );
}
