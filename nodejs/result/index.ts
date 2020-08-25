const successType = Symbol("success");
const errorType = Symbol("error");

class SuccessResult<T> {
  public readonly type = successType;

  public constructor(public readonly success: T) {
    Object.seal(this);
  }

  public map<NewSuccessType>(
    mapper: (success: T) => NewSuccessType
  ): SuccessResult<NewSuccessType> {
    return new SuccessResult(mapper(this.success));
  }
}

class ErrorResult<T> {
  public readonly type = errorType;

  public constructor(public readonly error: T) {
    Object.seal(this);
  }

  public map<NewErrorType>(
    mapper: (error: T) => NewErrorType
  ): ErrorResult<NewErrorType> {
    return new ErrorResult(mapper(this.error));
  }
}

export type Result<SuccessType, ErrorType> =
  | SuccessResult<SuccessType>
  | ErrorResult<ErrorType>;

export const Result = {
  createSuccess: <T>(success: T): SuccessResult<T> => {
    return new SuccessResult(success);
  },
  createError: <T>(error: T): ErrorResult<T> => {
    return new ErrorResult(error);
  },
  isSuccess: <SuccessType, ErrorType>(
    result: Result<SuccessType, ErrorType>
  ): result is SuccessResult<SuccessType> => {
    return result.type === successType;
  },
  isError: <SuccessType, ErrorType>(
    result: Result<SuccessType, ErrorType>
  ): result is ErrorResult<ErrorType> => {
    return result.type === errorType;
  },
};
