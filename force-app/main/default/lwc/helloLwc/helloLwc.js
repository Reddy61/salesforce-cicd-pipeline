import { LightningElement } from 'lwc';

export default class HelloLwc extends LightningElement {
    handleClick() {
        // PMD might catch this unused variable
        const greeting = 'Hello World';
        alert('You clicked the button!');
    }
}
