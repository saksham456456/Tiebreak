import { describe, it, expect } from 'vitest';
import { llmString, llmNumber, llmArray, llmMatchupAnalysisSchema } from '@/lib/validations/llm';

describe('LLM Validation Rules Compliance', () => {
  it('coerces stringified numbers using z.coerce.number()', () => {
    const schema = llmNumber();
    expect(schema.parse(42)).toBe(42);
    expect(schema.parse('42')).toBe(42);
    expect(schema.parse('1520.5')).toBe(1520.5);
    expect(schema.parse('0')).toBe(0);
    expect(schema.parse(0)).toBe(0);
  });

  it('provides default values for missing strings and arrays', () => {
    const stringSchema = llmString();
    expect(stringSchema.parse(undefined)).toBe('');

    const arraySchema = llmArray(llmString());
    expect(arraySchema.parse(undefined)).toEqual([]);
  });

  it('correctly parses partial LLM response without omitting required keys', () => {
    const parsed = llmMatchupAnalysisSchema.parse({
      confidenceScore: '95', // stringified number from LLM
    });

    expect(parsed.confidenceScore).toBe(95);
    expect(parsed.summary).toBe('');
    expect(parsed.tags).toEqual([]);
    expect(parsed.keyDifferentiators).toEqual([]);
  });

  it('correctly parses full LLM response with nested coerced items', () => {
    const input = {
      summary: 'Djokovic holds an edge in hard court endurance.',
      confidenceScore: '88.5',
      tags: ['tennis', 'goat-debate', 'grand-slam'],
      keyDifferentiators: [
        {
          attribute: 'Return of Serve',
          scoreAdvantage: '9.8',
        },
      ],
    };

    const parsed = llmMatchupAnalysisSchema.parse(input);
    expect(parsed.summary).toBe('Djokovic holds an edge in hard court endurance.');
    expect(parsed.confidenceScore).toBe(88.5);
    expect(parsed.tags).toHaveLength(3);
    expect(parsed.keyDifferentiators[0].attribute).toBe('Return of Serve');
    expect(parsed.keyDifferentiators[0].scoreAdvantage).toBe(9.8);
  });
});
