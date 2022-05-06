
context('todo list', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')

  })

  it('successfully opens and the list is visible', () => {
    cy.contains("Add task")
  })
})
