context("test-eco-us.R")
data("partitions1")
data("partitions2")

vm = vmeasure_calc(partitions1, partitions2)
mc = mapcurves_calc(partitions1, partitions2)

test_that("sabre works on raster", {
  expect_equal(c(vm[[3]], vm[[4]], vm[[5]]), c(0.36, 0.32, 0.42), tolerance = 0.01)
  expect_equal(zonal(vm[[1]]$rih, vm[[1]]$map1)[, 2], c(0.86, 0.48, 0.48, 0.48), tolerance = 0.01)
  expect_equal(zonal(vm[[2]]$rih, vm[[2]]$map2)[, 2], c(0.39, 0.59, 0.86), tolerance = 0.01)
})

test_that("mapcurves works on raster", {
  expect_equal(mc$gof, 0.61, tolerance = 0.01)
})

