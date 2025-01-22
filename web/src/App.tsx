import { useState } from 'react';
import { Button } from '@/components/ui/button';
function App() {
  const [count, setCount] = useState(0);

  return (
    <div className="h-screen w-screen flex items-center justify-center">
      <div className="flex flex-col gap-2">
        <h1>Vite + React</h1>
        <div className="card">
          <button onClick={() => setCount((count) => count + 1)}>
            count is {count}
          </button>
          <p>
            Edit <code>src/App.tsx</code> and save to test HMR
          </p>
        </div>
        <Button>Click on the Vite and React logos to learn more</Button>
      </div>
    </div>
  );
}

export default App;
