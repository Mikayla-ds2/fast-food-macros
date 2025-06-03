import fastfoodData from '$lib/fastfood_with_ids.json';

/** @type {import ('./$types').PageLoad} */
export function load({ params }) {
    const item = fastfoodData.find((i) => i.id === params.id);

    if (!item) {
        throw new Error('Item not found');
    }
    return {
        item
    };
}