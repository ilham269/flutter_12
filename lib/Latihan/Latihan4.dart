import 'package:flutter/material.dart';

class Latihan4 extends StatelessWidget {
  const Latihan4({super.key});

  @override
  Widget build(BuildContext context) {
    // Warna utama aplikasi
    const Color primaryColor = Color(0xFF4A4D55);
    const Color backgroundColor = Color(0xFFF5F6F8);
    const Color accentColor = Color(0xFF3B82F6);

    return Scaffold(
      backgroundColor: backgroundColor,

      // =========================
      // NAVBAR / APP BAR
      // =========================
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        elevation: 0,
        titleSpacing: 16,

        title: Row(
          children: [
            // Foto profile
            const CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAJQAlAMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAFAAIDBAYHAQj/xAA+EAACAQMCBAQDBQcCBQUAAAABAgMABBEFIQYSMUETUWFxIoGhBxQykbEVI0JSYsHwM9EkQ1SS8XKCorLh/8QAGQEAAwEBAQAAAAAAAAAAAAAAAAIDBAEF/8QAHhEAAwEBAQADAQEAAAAAAAAAAAECEQMhEjFBURP/2gAMAwEAAhEDEQA/AOiCnio1p4pjo53WKJ5X/Cilj7CueaDbXWs6rc6gzRc0zG5UOOY8hBCgdjjpg+VavjCfweGr7DFTInhKQM/Ex5R9TRPg7TEs9NtGaNUdYguSc9e2fzrjOowWtadKswuIswDkCvCfhJYdc4/Tes+tr4c/MwD43B/q6fp5+ddR4m0+OZnnVQCTgg9h0/sKxN3YKsp5UGB8Pr0zUOmo088YKs4I4iSwBlY5ZsYx6f2+VElhQ4IIYexyK9SwLDCc59cd6JWOlTSY9OhPWo/Fsv8AJJeAueFXzzKeVhjl7fl8hVW4gA3VQM7bdK0WoaZLFGCeYjz60IlgZRhyRJnlIwMGlpMeWgM8IKEMMqdiOxqtJaxspULyjrtRiS2ZJAhO57VDJalVODv7VxahnjM7cWwUhgQfTHeoJEDbAbt1yaL3EJzhqHug5iMZqypmepQFvYOXJzhfIiuxfYxqv33hRrFiTJp8zR5JzlG+JfyyR8q5dfxDlc7cpHnitb9h0nJrWr2+SOa3jYL2yGO/1q8PTJ0nGdfNI16aYaqIKvKVKgCstPFRg08GgAPxezDRcKyrm4hGWyf4x0HntWpt25bNQTyMMfF5jv8ASs5xEviacq+EZAbiL4dtvjG+9GY7iFrGVYpA5UFX5T0PTFKzqWkGpTB7UttzNv08zWUmI5+UcoJ2AH6Vf1PUDyFfh2B74x1rJX+oN42VkBUEYqPSsNHKdNbptrFJgnl9Se9H4IkiQAAAdq5/YatJBj94oBPcHoaOx8RQFMSkscbFSdz67Ui6SPXOtDOoOvh8oI696zF2iZZ2AODkH+WprvU3kAIZQg/h6ke9CpbojIYYzvU+nRMpHNo8m8Ppy5PUnzqtO4C7dKiuJuUA823qelVriYlOYnt0pU9KZhBdcrA7b0IcDmYL86vSykggdRiqThsEnyqiJso6g2VwO9aX7FmxxVfKFJDWfXPTDD/espdnYD862H2KrjiDU26YtUxv5savzMvU7A1NNek+VNPSrETwmlXhpUAVQaeDUYpwrgFbWED6e+R+Fkb2ww3puhQAz3Z35QpztiqXFOpjT4LBHjDx3l4tuxJxyZViD+air9jdJbx3sch+It/DjYUrHRmdY8V7hh2B6f57UDudPlkzjn29at61r0cF+wRfEA69NvSmpxBbkKSqof5ScVmr01RqKH3S5iHK2f8A3GnJzqTkbjqO31onNq9lMgAbmcj0FDJbhHBKjGP4u4rNaSNMPR7XMhUqFAOds1FHd85KStzMm2R51AZt+vNTFMWSUHxd9sZpNKYXd5DkA+1evZySbspUCmJeRW65kILZG52wKZdcQ26JyoygdgKrC0lbS+yKWxIJbp6VUntyqnHXuKil19XBSNeZ2Hn0p8V6klqPH2Yjr65quUiXylmdvyQ7L2rQ/ZlxDbaBxD4V5EWjvxHB4oP+keY8pPmuTv5UC1OQS3Dcqj4duYdDQq5545UeL/l8rkd8A5q8mXp6fUrbHFMNNt5fHtYZs/6kav8AmM17ViIqVNNKgCotPFRA09TQAK4oaxjt7GTUYhMq3sfgxk4BkOwJ9FBJ98Vmte1CW3v7vwm5Q5OMeWdqOcbIsmlxryF5w/PCo6sykHA9SAaEatp73HNIxBJwBnv0296z9G9Zp5JYmYZDPNdGVhITnfA6e9XG0cXFq08E8Sg9fEkB/LJqe6tdRmkGnWtovgRp4jF9kLlsF2A3flGML7miOp/ZXf3trBNBrxmyuX5kymP6cEUsy37o92p8wyGJraXm6N5jofyq/b3RYYd8n3o/f/ZrDpWlRS2+pyfe1A8QMfhfffA9vWgltpN2qJO8YEZOOcHIz3qfWPB+N6SKzH4hTXuvCJDDBrXaDoK3Vm8koGE60A1bTFLckb4GT3zmoqf6aHX8Mxe3Uk7coJwTjam2umPcuee6igB685yfyAzRYaQyWU92/MtvFgfD+J2PRV9T/wDvatfw/wDZ9pmraB4+ptKJZ1JjjhlKiAZ22zufMnOa1RKMnWmjIfsq0tMxJdRlhjJMDHPzoXeKsf8AoSBkDbFa3lv9luiaTBLPqV3PIcHw3DcnJ7cu5NYGfTZYr+WFJDIFP4id8dubzOMV1yp/RZptZhUUEsR2qpcnF3EA2ARg+u9Hp7I2tsWf8R60HCKziUpzeCM+mT0/Suy9OUsZ9D8LXIvOGtMnXfmt1+gx/aiJNBuC7Saw4S0y2uciYQBmB6gsS396MmtCMz+zylSpUBhRFSA1CDTwaAItQsodQiiSfYRyBwfIg1UmYI3hScnM6A5buT/4okDWX4quPu91Dy9QmPqcH61Pp4tLc/XgtR05Lkc8TEOoATB/CfShH3nXrMlYdSaMnpmBXz/8f1q1aag0RJV9j1HrUd7eTPkxRE57DzrC7/huUfjKTXWoTzIdX1C4uI1bPKQqD5BQNqI6nqBeHC4yxHKMY5RgD+1C00+5dmur4FIkHMqk9TVeGQ3EvKMs7thQK78m/sbFumv0OY/sTUJjIAAnQY22rI30jeLzI2WQAkelaLTrN7OLVLSUnJhDYB7jvWR1C5+73pP8wwa6vpIX9bC2k3yxNHkkeEWYAdiQB+mR8zU1xf6u7E2uqy+H/KUVsfTIrPQ3GJMr1JohBaXMI+8QSnl/iUgnf0wDXXv4Cz9JJrXWrpi1zfySn36VLFpUNpbnnHNJgkufOp4b66IJli5Mfxvnb2qDUdTR0WOEjCr5fioOMzuvT/uyCN8CpOBOHbrX9VUlCulwSK9zKRs2DkIPU/QUK1SXxH657EZrqX2QDHCMrdmvZCvtyqP7GtHNGTrXptm37Y9PKm0q8Jq5DBV5SzSoAHing1CDTwaAJVNZPjOP/iUzsGXIP0/2rVA0D4xhL6fFcqM+C+G9m2/XFJ0WyPDyjGIzI5U9QcZo3YKGKlwMjpQ3whLjmyCOu/WrdmzRxhckjcYHX0rA5xnoqtRY1uXFuU6FgdhVLhOze51iIY/DucdhnvTrjnmYIjZwcY/vVvT9T0/h8cviu13P8T4GyDoFB9vqa7PtHK8jDSeGj32qTHJBjKKcd65lxJEVushdzttW6h1aMW87rKo8QZwSBvWU1SaCS5iSZiBk5YdAKp42iaeJgTTQZSTvscGtfYuiqhLDmA6ntWcsBEbuZImDRSAOCBgZojC6xnlMi5zsC1D3Tqawuao6yKeRsgbdOtZi4Xwyzcxye1HrgqV3/DjYZFAbtZJWJ5G67bV1T6K68A12uSznr512r7OLU2fBOmKww0qNMc/1sW/QiuNXUDyulvgp4jhOYjGMnH967vb6lpMFvFbw6lZFYkVBidewx51phGS3rCFeHpVdL60cZS6t2Hmsqn+9em8tv+oh/wC8U5MmpVB97tv+oi/7xSoO6UgaeDUIqQUASA15cwJd20tvJ+GRCpFJMkgDfPTFOupIdPhM+p3EFlCP4rmVYx9d6GGmCtlMUskE4CupKHPXb/DXqnH4d/erV3qOkanqs0mjX8d0MK0pQEBW6dxvkCpJojuwGxGfY1k6SbOdjrK28acAA9epNRX+iWr6xM18kfgiAsElcqpJXb4h0Oe/atPoMEEVsJZCwYdB2+dVtZurVL5nePmjEfKDgHsex2O/Y0RKn0OlOvAbcWuhyI3/ABMELmTmAiuUROXkJCgkleuAWBIHXYUHfSOG7q9ZJ9cjkhdJE8Txo/3ZOcYT8RIwPi/Cc7UbspNEcB5dPLqj5OWOCNtiOb326fpWevrvSVu4Wj0z92nwzRplfE2PcHzx2FVX9IOW/AJYKI9QmRFCxRZjUqwbOD1yNj7jY+Qpt+rhy6t06bUfgn0NtrbSZg65GZpWII7dGG/TPzx2qy83Dr3CrNp8kUWc5MjMeh2wGGR0/L5VzVoJeGLjvboOEklYqOmO1WudjykkkHua0UTcPooJ0diNzzGQt2x3b23+gztC11w4r4Ok3GAx6XB3XfAxn/09+3rTeCvUZe9YQXEc7ZwjZGPPtT4eJcvvb49C1WuIZ9OvZEFjbG2VM8+XJ5tl9T35umNiPKgX3OJH58k7+e1OiTNrpXFFvHGRPDMuSPw4I9a0sRW5t47iIuqSDK8ykHHtWY4d4bluminvYGSJcFYyDlvf0rbXdozW/Lhl5enKDsBTHCl4YGxY17UixtjoTjzpUAEgadzYqENXjSAA56YoHAX2qcTajwrY6fZ6SvgT38Xiy3nLllH8i+R361xC7vJ7yZp7uaSedurysWP5mvp3jfg4ca8HWlsWEGo28ay27sNublwVb0P02r5qvdKvdM1KXTr60khu4mKvG4xj19j2PelFL3B96dP1eKWRsQynw5c+R6H5HFdihkV7c82Dtv8AKuV6RpKRL490eZuoXG1dI0QO6RRv/wA6H8mA/wBqm2mzRKcr0M3c33WKOJG3EY3rO3moSF9nO+PStBLbxPLE11KY+SMbAZzg7/Ss9q91o0ZIiafmO+y7fnUrhludr9KkOpTxcwaUjmOMVUS/dMksxYnbNWUfR7rlSG6aN1bPK64JFUZ7/T45uVY5iR0ONjU1DLu1hc/aJYYYg43wfOg+oOWJYe4qYzwNC/hMC7Hbm/ShVzdKy8vMM+eetU+BGrRbmvMWSDbmNBZrgJG0mBnoPevJpiybdtqdpOjXWvXixRfBbg/FJjqfQd6tMmaq0EQW9xfXC29pC88rnZEGT/nrXWeAvs7js5o7/VlSa8G8cWMpEfP1Nabg3hG10yBEtYMMd3kb4nY+uBW7tbSOBQSmMdyKqpwkyO1t1tYgcEu3QZ61Yu0ItSrNksMVJI8MAkubmSOKGNebnkYKqL3JJ6Vwn7UeP34jnOkaI5/Zi7Syr1uDn/6/rXTh1C40y6tXEaXhmBHNmeMMwyTtleUYHtmlXDdO4w4h0u1W0ttUnMSfhD4fHpk74pV3wDqEt3FDgO/xvsiAFmc+QA3J9qO6Pw/d3zia+SaygRlZUblLy756dh599+3WicuucJcPluW70+GXusGGkPvy5P51keJvtahWARcOW7vcFwfEuk5U5R1AGc5P0+lKB1IDIyaA8VcJaRxTbhNRhImQfurmPaSP2Pl6HarXC+vWnEejw6haHl5hiWInLQv3Vvai2KVgcA4o4E13h4NNGjajYKf9W3T4lHmydfyzQ/QNdaHULSQMHjEgWQZ7HbI9q+kD0rI8U/Z9o3EPPN4Zs747i6twAxP9S9G/X260nxwr/pqxnP8AiqaKa+ty4QukZCjOwcHesZcaMb8yPa6m0Mud45BhfYGjvHmgaxw6YpL1llhlODPECFZ8bn+kkDpWPmvJVcGNGDdfQ1wfU0R3em63pbcsvOUP4W6hh5g1TtbHVL+cRW6Ssx3IGfzJ7Ubg4puYojHNalkO5VsMM9z/AJ5U2/4subpeWOARJt8CIFXbpnFA2Tn2L9im05GmvSSAecDp8v8APKvGFuIzkKu2wPU+tDJL2eVgz/FnqoXGKjlaaVl5gwXoqjctR6xNS+i1bWzXs4GMRjdjjGPL5mugHUdH4G06NtRXxtQkQPHYRMA2/Quf4R8vketAdO5OFNFGt6gqvcsSLG3PRpCMc59FH+b1griae+u5bu9maa4mYs8jHJY1VIi2aXXvtD4k1uTEd42n2o/BBZkoFHv1NV+H+Ldc0TUkvodQuLkjZ4biZmSQdwd/rQeOIuATsKm8NAMYrpwO8XcY6xxVLjULgrbrjks4iRGvq38x96D2/O86oNgBk1EPh6V4rOsnMpx6dq6Bfm5VI5xg4zSquZ+bd9j5DJpUAE7ZVjIVAAMdqtywRspYg5ApUqACvButXujazb3FlJgzSpBMjZKSoSPxDzHY9vma+jozlFPmKVKuMB1eUqVKBQ1rTLTWNOmsNQhEtvMArDoRvsQexHUHtXzLIv3TVrywUmSK3neJTJjJAJAzjApUqWvory+x124TAWKMZ/poeQGmAKj8q9pVMs0Jz4SMyqpIO2RRvgOwg1C5jluVLMZigHZQPL1pUqeROhneMdSudT4ivPvTApbzPBDGuyxohIAA+VDbdFYczDPpSpVUzlmMbHNNJpUqAGk16KVKugI0qVKgD//Z',
              ),
            ),

            const SizedBox(width: 12),

            // Nama dan kelas
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Muhamad Ilham',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'XI RPL 1',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            // Notifikasi
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),

      // =========================
      // CONTENT
      // =========================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul
            // =========================
            // CARD LATIHAN
            // =========================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Label
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: accentColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Latihan',
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    'Latihan 4',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF202124),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Kerjakan latihan dengan teliti dan '
                    'pastikan semua jawaban sudah benar.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Button
                  SizedBox(
                    width: 90,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Mulai',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}