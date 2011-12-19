program time

  implicit none
  integer, parameter :: sampling = 100
  integer :: extent
  integer :: i, j, k, n
  real(8), allocatable :: array(:, :, :)
  real(8) :: startTime, endTime
  real(8) :: latency

  read(*, *) extent
  allocate(array(extent, extent, extent))
  array = 0.0d0
  call cpu_time(startTime)
  do n = 1, sampling
     do i = 1, extent
       do j = 1, extent
          do k = 1, extent
             array(i, j, k) = 0.0d0
          end do
       end do
    end do
  end do
  call cpu_time(endTime)
  deallocate(array)
  latency = (endTime - startTime) / real(sampling)
  write(*, *) extent, ",", latency

end program time
