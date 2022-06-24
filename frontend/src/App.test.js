import { render, screen } from '@testing-library/react';
import App from './App';

test('renders the list container', () => {
  render(<App />);
  const linkElement = screen.getByText('Add task');
  expect(linkElement).toBeInTheDocument();
});
