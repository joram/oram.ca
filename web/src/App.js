import './App.css';
import React from 'react'
import {Card, Container, Image} from 'semantic-ui-react'
import sonarr from './icons/sonarr.png'
import radarr from './icons/radarr.png'
import recipes from './icons/recipes.png'
import steps from './icons/steps.png'
import john from './icons/john.jpg'

function App() {
  return (
    <div className="App">
      <Container>
        <br/>
        <h1>Oram Subdomains</h1>

      <Card.Group itemsPerRow={4}>

        <Card as="a" href="https://sonarr.oram.ca">
          <Card.Header><h1>Sonarr</h1></Card.Header>
          <Image src={sonarr}/>
        </Card>

        <Card as="a" href="https://radarr.oram.ca">
          <Card.Header><h1>Radarr</h1></Card.Header>
          <Image src={radarr}/>
        </Card>

        <Card as="a" href="https://recipes.oram.ca">
          <Card.Header><h1>Recipes</h1></Card.Header>
          <Image src={recipes}/>
        </Card>

        <Card as="a" href="https://steps.oram.ca">
          <Card.Header><h1>Steps</h1></Card.Header>
          <Image src={steps}/>
        </Card>

        <Card as="a" href="https://john.oram.ca">
          <Card.Header><h1>John</h1></Card.Header>
          <Image src={john}/>
        </Card>

      </Card.Group>
      </Container>
    </div>
  );
}

export default App;
