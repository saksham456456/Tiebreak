import { z } from 'zod';

/**
 * Tiebreak LLM Validation Rules:
 * 1. Zod Coercion: When defining Zod schemas to parse JSON responses from LLMs (Groq, OpenAI, etc.),
 *    you MUST use `z.coerce.number()` instead of `z.number()` because LLMs frequently stringify numbers.
 * 2. Zod Defaults: Always add `.default([])` to array fields and `.default('')` to string fields.
 *    LLMs frequently omit keys entirely instead of returning empty representations.
 */

export const llmString = (): z.ZodDefault<z.ZodString> => z.string().default('');

export const llmNumber = (): z.ZodNumber => z.coerce.number();

export const llmArray = <T extends z.ZodTypeAny>(itemSchema: T): z.ZodDefault<z.ZodArray<T>> =>
  z.array(itemSchema).default([]);

/**
 * Example Schema: LLM-generated Pairwise Matchup Analysis
 */
export const llmMatchupAnalysisSchema = z.object({
  summary: llmString(),
  confidenceScore: llmNumber(),
  tags: llmArray(z.string()),
  keyDifferentiators: llmArray(
    z.object({
      attribute: llmString(),
      scoreAdvantage: llmNumber(),
    })
  ),
});

export type LLMMatchupAnalysis = z.infer<typeof llmMatchupAnalysisSchema>;
