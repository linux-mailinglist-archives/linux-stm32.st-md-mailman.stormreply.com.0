Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3921A903EE8
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 16:33:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4319C712A3;
	Tue, 11 Jun 2024 14:33:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 643CFC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 14:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718116434; x=1749652434;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fRkXAGv1OWc7jUB5rnyl+rqBuJx/lAr1pj4eTVguxfE=;
 b=XFc7iSQt1f1YC4FDlS6fphMbEph7eUHxr9O5mjIIavSx5DDPp257K00c
 eWUkW24HEvfNPPklMIXxsv5vSLNrIkirYaqSkpUAxY9uFFif51IMtiz/p
 pgKf24BHcM79mkVvZv5BoTnU5o+20YODlOxrSpig0ulWP+K0YmFbXSEx5
 nyc1xtkIyzoftBTbHLRrzpMVUsJAogsm5YEvc9EYM5PlHrAxi7D68Z3rt
 NbKNUYNMcrTEmoFQK6cQ4P0gUxGxnITHF/QhEs9uU7aAP/OfTIlQ5prcd
 syApCjpS56wIM4Q0aZtOCHkAwaKBl7WVHyos5aK4At4knFmvxyts9B4eB w==;
X-CSE-ConnectionGUID: Tgl4qS7iRe2JwVgff5wLEA==
X-CSE-MsgGUID: w5DwI76BQbiSXorR4RHLDg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14956339"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="14956339"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 07:33:38 -0700
X-CSE-ConnectionGUID: UsKn0De5SQaNK0MMUDwhVQ==
X-CSE-MsgGUID: hfbLQQz9T2uSLGzlc+LUVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="40162293"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 11 Jun 2024 07:33:34 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sH2Z2-0000XO-0L;
 Tue, 11 Jun 2024 14:33:32 +0000
Date: Tue, 11 Jun 2024 22:32:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Serge Semin <fancer.lancer@gmail.com>
Message-ID: <202406112254.uL3WgEt1-lkp@intel.com>
References: <E1sGgCN-00Fact-0x@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1sGgCN-00Fact-0x@rmk-PC.armlinux.org.uk>
Cc: Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 llvm@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next 2/5] net: stmmac: dwmac-intel:
 provide a select_pcs() implementation
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Russell,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-add-select_pcs-platform-method/20240611-024301
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1sGgCN-00Fact-0x%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next 2/5] net: stmmac: dwmac-intel: provide a select_pcs() implementation
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240611/202406112254.uL3WgEt1-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406112254.uL3WgEt1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406112254.uL3WgEt1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c:600:43: error: expected ';' after expression
     600 |                 plat->select_pcs = intel_mgbe_select_pcs,
         |                                                         ^
         |                                                         ;
   1 error generated.


vim +600 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c

   455	
   456	static int intel_mgbe_common_data(struct pci_dev *pdev,
   457					  struct plat_stmmacenet_data *plat)
   458	{
   459		struct fwnode_handle *fwnode;
   460		char clk_name[20];
   461		int ret;
   462		int i;
   463	
   464		plat->pdev = pdev;
   465		plat->phy_addr = -1;
   466		plat->clk_csr = 5;
   467		plat->has_gmac = 0;
   468		plat->has_gmac4 = 1;
   469		plat->force_sf_dma_mode = 0;
   470		plat->flags |= (STMMAC_FLAG_TSO_EN | STMMAC_FLAG_SPH_DISABLE);
   471	
   472		/* Multiplying factor to the clk_eee_i clock time
   473		 * period to make it closer to 100 ns. This value
   474		 * should be programmed such that the clk_eee_time_period *
   475		 * (MULT_FACT_100NS + 1) should be within 80 ns to 120 ns
   476		 * clk_eee frequency is 19.2Mhz
   477		 * clk_eee_time_period is 52ns
   478		 * 52ns * (1 + 1) = 104ns
   479		 * MULT_FACT_100NS = 1
   480		 */
   481		plat->mult_fact_100ns = 1;
   482	
   483		plat->rx_sched_algorithm = MTL_RX_ALGORITHM_SP;
   484	
   485		for (i = 0; i < plat->rx_queues_to_use; i++) {
   486			plat->rx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
   487			plat->rx_queues_cfg[i].chan = i;
   488	
   489			/* Disable Priority config by default */
   490			plat->rx_queues_cfg[i].use_prio = false;
   491	
   492			/* Disable RX queues routing by default */
   493			plat->rx_queues_cfg[i].pkt_route = 0x0;
   494		}
   495	
   496		for (i = 0; i < plat->tx_queues_to_use; i++) {
   497			plat->tx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
   498	
   499			/* Disable Priority config by default */
   500			plat->tx_queues_cfg[i].use_prio = false;
   501			/* Default TX Q0 to use TSO and rest TXQ for TBS */
   502			if (i > 0)
   503				plat->tx_queues_cfg[i].tbs_en = 1;
   504		}
   505	
   506		/* FIFO size is 4096 bytes for 1 tx/rx queue */
   507		plat->tx_fifo_size = plat->tx_queues_to_use * 4096;
   508		plat->rx_fifo_size = plat->rx_queues_to_use * 4096;
   509	
   510		plat->tx_sched_algorithm = MTL_TX_ALGORITHM_WRR;
   511		plat->tx_queues_cfg[0].weight = 0x09;
   512		plat->tx_queues_cfg[1].weight = 0x0A;
   513		plat->tx_queues_cfg[2].weight = 0x0B;
   514		plat->tx_queues_cfg[3].weight = 0x0C;
   515		plat->tx_queues_cfg[4].weight = 0x0D;
   516		plat->tx_queues_cfg[5].weight = 0x0E;
   517		plat->tx_queues_cfg[6].weight = 0x0F;
   518		plat->tx_queues_cfg[7].weight = 0x10;
   519	
   520		plat->dma_cfg->pbl = 32;
   521		plat->dma_cfg->pblx8 = true;
   522		plat->dma_cfg->fixed_burst = 0;
   523		plat->dma_cfg->mixed_burst = 0;
   524		plat->dma_cfg->aal = 0;
   525		plat->dma_cfg->dche = true;
   526	
   527		plat->axi = devm_kzalloc(&pdev->dev, sizeof(*plat->axi),
   528					 GFP_KERNEL);
   529		if (!plat->axi)
   530			return -ENOMEM;
   531	
   532		plat->axi->axi_lpi_en = 0;
   533		plat->axi->axi_xit_frm = 0;
   534		plat->axi->axi_wr_osr_lmt = 1;
   535		plat->axi->axi_rd_osr_lmt = 1;
   536		plat->axi->axi_blen[0] = 4;
   537		plat->axi->axi_blen[1] = 8;
   538		plat->axi->axi_blen[2] = 16;
   539	
   540		plat->ptp_max_adj = plat->clk_ptp_rate;
   541		plat->eee_usecs_rate = plat->clk_ptp_rate;
   542	
   543		/* Set system clock */
   544		sprintf(clk_name, "%s-%s", "stmmac", pci_name(pdev));
   545	
   546		plat->stmmac_clk = clk_register_fixed_rate(&pdev->dev,
   547							   clk_name, NULL, 0,
   548							   plat->clk_ptp_rate);
   549	
   550		if (IS_ERR(plat->stmmac_clk)) {
   551			dev_warn(&pdev->dev, "Fail to register stmmac-clk\n");
   552			plat->stmmac_clk = NULL;
   553		}
   554	
   555		ret = clk_prepare_enable(plat->stmmac_clk);
   556		if (ret) {
   557			clk_unregister_fixed_rate(plat->stmmac_clk);
   558			return ret;
   559		}
   560	
   561		plat->ptp_clk_freq_config = intel_mgbe_ptp_clk_freq_config;
   562	
   563		/* Set default value for multicast hash bins */
   564		plat->multicast_filter_bins = HASH_TABLE_SIZE;
   565	
   566		/* Set default value for unicast filter entries */
   567		plat->unicast_filter_entries = 1;
   568	
   569		/* Set the maxmtu to a default of JUMBO_LEN */
   570		plat->maxmtu = JUMBO_LEN;
   571	
   572		plat->flags |= STMMAC_FLAG_VLAN_FAIL_Q_EN;
   573	
   574		/* Use the last Rx queue */
   575		plat->vlan_fail_q = plat->rx_queues_to_use - 1;
   576	
   577		/* For fixed-link setup, we allow phy-mode setting */
   578		fwnode = dev_fwnode(&pdev->dev);
   579		if (fwnode) {
   580			int phy_mode;
   581	
   582			/* "phy-mode" setting is optional. If it is set,
   583			 *  we allow either sgmii or 1000base-x for now.
   584			 */
   585			phy_mode = fwnode_get_phy_mode(fwnode);
   586			if (phy_mode >= 0) {
   587				if (phy_mode == PHY_INTERFACE_MODE_SGMII ||
   588				    phy_mode == PHY_INTERFACE_MODE_1000BASEX)
   589					plat->phy_interface = phy_mode;
   590				else
   591					dev_warn(&pdev->dev, "Invalid phy-mode\n");
   592			}
   593		}
   594	
   595		/* Intel mgbe SGMII interface uses pcs-xcps */
   596		if (plat->phy_interface == PHY_INTERFACE_MODE_SGMII ||
   597		    plat->phy_interface == PHY_INTERFACE_MODE_1000BASEX) {
   598			plat->mdio_bus_data->has_xpcs = true;
   599			plat->mdio_bus_data->default_an_inband = true;
 > 600			plat->select_pcs = intel_mgbe_select_pcs,
   601		}
   602	
   603		/* Ensure mdio bus scan skips intel serdes and pcs-xpcs */
   604		plat->mdio_bus_data->phy_mask = 1 << INTEL_MGBE_ADHOC_ADDR;
   605		plat->mdio_bus_data->phy_mask |= 1 << INTEL_MGBE_XPCS_ADDR;
   606	
   607		plat->int_snapshot_num = AUX_SNAPSHOT1;
   608	
   609		plat->crosststamp = intel_crosststamp;
   610		plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
   611	
   612		/* Setup MSI vector offset specific to Intel mGbE controller */
   613		plat->msi_mac_vec = 29;
   614		plat->msi_lpi_vec = 28;
   615		plat->msi_sfty_ce_vec = 27;
   616		plat->msi_sfty_ue_vec = 26;
   617		plat->msi_rx_base_vec = 0;
   618		plat->msi_tx_base_vec = 1;
   619	
   620		return 0;
   621	}
   622	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
