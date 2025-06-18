using Intro
using Test

@testset "Intro.jl" begin

    @testset "OneHotArray" begin
        @test length(OneHotArray(1, 2)) == 2
        @test length(OneHotArray((1, 1), (2, 3))) == 6
        @test OneHotArray((1, 1), (2, 3))[1,1]
        @test !OneHotArray((1, 1), (2, 3))[1,2]
        @test only(findall(OneHotArray((1, 1), (2, 3)))) == CartesianIndex(1,1)
        @test onehot('a', ['a', 'b', 'c']) == [true, false, false]
        @test onehot('b', 'a':'c') == [false, true, false]
        @test onehot('b', ('a', 'b', 'c')) == [false, true, false]
        @test unhot(onehot('b', ('a', 'b', 'c')), ('a', 'b', 'c')) == 'b'
    end

end
