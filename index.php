<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>

    <?php
         $dsn = "mysql:dbname=Editora;host=localhost";
         $username = "root";
         $password = "";
          
         try {
             $pdo = new PDO($dsn, $username, $password);
           $pdo->exec("SET CHARACTER SET utf8");
      
         } catch (PDOException $e) {
             echo "Error: ".$e;
         }


         $sql = "select * from livrarias;";
         $stmt = $pdo->query($sql);
         $res = $stmt->fetchall(PDO::FETCH_ASSOC); 
         echo "<pre>";
         print_r($res);
         echo "<pre>";
         ?>

         <table>
            <tr>
                <th>#</th>
                <th>Nome</th>
                <th>Endereço</th>
                <th>Telefone</th>
            </tr>

                <?php
                
                    if (count($res) > 0) {
                        for ($i=0; $i < count($res); $i++) { 

                            echo "<tr>";

                                foreach ($res[$i] as $key => $value) {
                                    echo "<td>".$value."</td>";                                }

                            echo "</tr>";
                            
                        }
                    }
                
                ?>

            </tr>



         </table>
        
       







    
</body>
</html>