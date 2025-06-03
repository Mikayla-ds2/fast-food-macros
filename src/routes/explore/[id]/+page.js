import fastfoodData from '$lib/fastfood_with_ids.json';
import { cosineSimilarity } from '$lib/utils';

/** @type {import ('./$types').PageLoad} */
export function load({ params }) {
    const item = fastfoodData.find((i) => i.id === params.id);

    if (!item) {
        throw new Error('Item not found');
    }

    const targetVector = [
        item.protein_score,
        item.fiber_score,
        item.calories_score,
        item.fats_score,
        item.sodium_score,
        item.cholesterol_score,
        item.price_score,
        item.carbs_score
    ];

    const similarItems = fastfoodData
    .filter((i) => i.id !== item.id)
    .map((i) => ({
        ...i,
        similarity: cosineSimilarity(targetVector, [
            i.protein_score,
            i.fiber_score,
            i.calories_score,
            i.fats_score,
            i.sodium_score,
            i.cholesterol_score,
            i.price_score,
            i.carbs_score
        ])
    }))
    .sort((a,b) => b.similarity - a.similarity)
    .slice(0, 4); // Top 4 Matches
    return {
        item,
        similarItems
    };
}