# Arquitetura de Comunicacao Satelital (ASCII)

                +----------------------+
                |      Satelite        |
                |   GEO / MEO / LEO    |
                +----------+-----------+
                           |
                           | Downlink
                           |
                +----------v-----------+
                |      Antena          |
                +----------+-----------+
                           |
                           | Cabo Coaxial
                           |
                +----------v-----------+
                |      Modem SAT       |
                +----------+-----------+
                           |
                           | Ethernet
                           |
                +----------v-----------+
                |      Switch          |
                +----------+-----------+
                           |
                           | Rede Local
                           |
                +----------v-----------+
                |      NOC / SOC       |
                +----------------------+
