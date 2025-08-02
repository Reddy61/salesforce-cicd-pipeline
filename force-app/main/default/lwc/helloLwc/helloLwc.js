import { LightningElement } from 'lwc';

export default class HelloLwc extends LightningElement {
    handleClick() {
        const greeting = 'Hello World';
        alert('You clicked the button!');
    }
}
