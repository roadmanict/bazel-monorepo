export class SuccessResult<T> {
    public constructor(public readonly success: T) {}
}

export class ErrorResult<T> {
    public constructor(public readonly error: T) {}
}

export type Result<SuccessType = void, ErrorType = void> = SuccessResult<SuccessType> | ErrorResult<ErrorType>;

export const createSuccessResult = <T>(success: T) => new SuccessResult(success);

export const createErrorResult = <T>(error: T) => new ErrorResult(error);