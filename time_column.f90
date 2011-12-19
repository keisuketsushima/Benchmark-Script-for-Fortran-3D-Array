program time

  implicit none
  integer, parameter :: sampling = 100
  integer :: extent, is
  integer :: i, j, k, n
  integer, allocatable :: array(:, :, :)
  real(8) :: startTime, endTime
  real(8) :: latency

  read(*, *) extent
  allocate(array(extent, extent, extent), stat = is)
  if ( is /= 0) stop 'cannot allocate (extent is too large)'
  array = 0.0d0
  call cpu_time(startTime)
  do n = 1, sampling
     do k = 1, extent
       do j = 1, extent
          do i = 1, extent
             array(i, j, k) = 0
          end do
       end do
    end do
  end do
  call cpu_time(endTime)
  deallocate(array)
  latency = (endTime - startTime) / real(sampling)
  write(*, *) extent, ",", latency

end program time
