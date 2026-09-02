# Arquitetura de ComunicAction Satelital (ASCII)

                +----------------------+
                |      Satellite        |
                |   GEO / MEO / LEO    |
                +----------+-----------+
                           |
                           | Downlink
                           |
                +----------v-----------+
                |      Antenna          |
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


