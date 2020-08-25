import { Result } from "roadmanict/nodejs/result";

describe("A Result", () => {
  describe("Successful", () => {
    const result = Result.createSuccess(true);

    it("Is success", () => {
      expect(Result.isSuccess(result)).toBeTrue();
    });

    it("Can map", () => {
      expect(
        result.map((content) => {
          return "" + content;
        }).success
      ).toEqual("true");
    });
  });

  describe("Failed", () => {
    const result = Result.createError(true);

    it("Is success", () => {
      expect(Result.isSuccess(result)).toBeFalse();
    });

    it("Can map", () => {
      expect(
        result.map((content) => {
          return "" + content;
        }).error
      ).toEqual("true");
    });
  });
});
