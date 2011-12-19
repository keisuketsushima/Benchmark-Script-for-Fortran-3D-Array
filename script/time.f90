program time

  implicit none
  integer, parameter :: sampling = 100
  integer :: extent, is
  integer :: i, j, k, n
  integer, allocatable :: array1(:, :, :), array2(:, :, :)
  real(8) :: startTime1, endTime1, startTime2, endTime2
  real(8) :: latencyRow,latencyColumn

  read(*, *) extent

  allocate(array1(extent, extent, extent), stat = is)
  if ( is /= 0) stop 'cannot allocate (extent is too large)'
  call cpu_time(startTime1)
  !write(*, *) "s1", startTime1
  do n = 1, sampling
     do i = 1, extent
       do j = 1, extent
          do k = 1, extent
             array1(i, j, k) = 0
          end do
       end do
    end do
  end do
  call cpu_time(endTime1)
  !write(*, *) "e1", endTime1
  latencyRow = (endTime1 - startTime1) / real(sampling)
  !write(*, *) "R", latencyRow
  deallocate(array1)

  allocate(array2(extent, extent, extent), stat = is)
  if ( is /= 0) stop 'cannot allocate (extent is too large)'
  call cpu_time(startTime2)
  !write(*, *) "s2", startTime2
  do n = 1, sampling
     do k = 1, extent
       do j = 1, extent
          do i = 1, extent
             array2(i, j, k) = 0
          end do
       end do
    end do
  end do
  call cpu_time(endTime2)
  !write(*, *) "e2", endTime2
  latencyColumn = (endTime2 - startTime2) / real(sampling)
  !write(*, *) "C", latencyColumn
  deallocate(array2)

  write(*, *) extent, ",", latencyRow, ",", latencyColumn

end program time
