# dependencynetwork

This code is for reproducing the results in the arxiv paper "Behavior-based dependency networks between places shape urban economic resilience" by Takahiro Yabe, Bernardo Garcia Bulle Bueno, Morgan Frank, Alex Pentland, Esteban Moro. 

The following Jupyter notebooks are accompanied by synthetic test data (testdata.xz and testdata_nodes.csv) to test the methods used in the study. 
- c1-networkload.ipynb: inspects the network data using a synthetic test data and 1) prepares input data for the network visualization code (networkviz.R), and 2) computes network metrics. Typically runs within 3 minutes on a standard desktop computer. 
- networkviz.R: visualizes the dependency network, aggregated by subcategories (replicates the network shown in Figure 1b in the manuscript). Typically runs within 3 minutes on a standard desktop computer. 
- c2-nullnetwork.ipynb: runs the algorithm to simulate the gravity-model based null model proposed in the paper, used in Figure 2. Typically runs within 20 minutes on a standard desktop computer. Outputs a dataframe that contains the originally connected nodes ('poi_a','poi_b') and the node connected in the null network ('poi_a_sampled').
- c3-leontiefsimulation.ipynb: runs the Leontief simulations employed in the paper to simulate hypothetical shocks. Given inputs (shocks to specified place categories), the code outputs simulated and cascading shocks to all other nodes in the network. Typically runs within 10 minutes on a standard desktop computer.

# Software dependencies
- Python 3.8 
- Numpy version 1.21.2
- Pandas version 1.3.2
- Matplotlib version 3.4.3
- Scipy version 1.9.3
- Cupy version 11.4.0
