
context("test caseconverter")

test_that("upper case works", {
  expect_equal(upper_case("car"), "CAR")
  expect_equal(upper_case("TREE"), "TREE")
  expect_equal(upper_case("123class456"), "123CLASS456")
  expect_equal(upper_case("key_lock"), "KEY_LOCK")
})

test_that("lower case works", {
  expect_equal(lower_case("dog"), "dog")
  expect_equal(lower_case("LIME"), "lime")
  expect_equal(lower_case("METHOD11"), "method11")
  expect_equal(lower_case("NEW_LINES"), "new_lines")
})

test_that("snake case works", {
  expect_equal(snake_case("This is required."), "this_is_required")
  expect_equal(snake_case("getFinalData"), "get_final_data")
  expect_equal(snake_case("RunFastCode"), "run_fast_code")
  expect_equal(snake_case("draw.circle.angle"), "draw_circle_angle")
  expect_equal(snake_case("already_snake_case"), "already_snake_case")
})

test_that("camel case works", {
  expect_equal(camel_case("An important method."), "anImportantMethod")
  expect_equal(camel_case("get_final_data"), "getFinalData")
  expect_equal(camel_case("DrawStringEmpty"), "drawStringEmpty")
  expect_equal(camel_case("draw.circle.angle"), "drawCircleAngle")
  expect_equal(camel_case("alreadyCamelCase"), "alreadyCamelCase")
})
