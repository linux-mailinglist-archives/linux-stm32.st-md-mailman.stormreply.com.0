Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 441E16B7685
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 12:48:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8F3FC6904C;
	Mon, 13 Mar 2023 11:48:21 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E05DC65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 11:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678708100; x=1710244100;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ei62QVvNfkW9rvFQlyNhZEignTx5xrlrK3O+6oUDAK0=;
 b=RCPIGf9PcndC0bRDMz95nsVv0ChYKYGojl03LijfoS9D7PVf2HzsEBCG
 T7Dza4ldDqr2sgvPZ68ws8TvyoQA399JO5j1BcB11Ya1IanV/Mswdf8Mi
 7WBh5cKCzLoPnXN/vU+D3kjtmByL9sFEo+j3qh+XELWY4e8hB2JiICcij
 DI1c3BsQ3u2Jt5BYeaZjDti+GlTfmspovBxAAMP0EtRCwie5FXbVUi7Xv
 SSuk0Q42qLg5HON5hiHIIYQurPLEMhOIOrc3HGYwRJMYFieaWBX5p+sXx
 6veGme6U8nPlLsTvPGEF2dMc/F1FVOYpg40cDGp0AhNoAMJ+lNxDpkzyw A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="334601599"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="334601599"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 04:48:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="788899946"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="788899946"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 13 Mar 2023 04:48:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pbgey-0005di-2J;
 Mon, 13 Mar 2023 11:48:12 +0000
Date: Mon, 13 Mar 2023 19:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <202303131924.MkBmpkFK-lkp@intel.com>
References: <20230313080135.2952774-3-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230313080135.2952774-3-michael.wei.hong.sit@intel.com>
Cc: Looi Hong Aun <hong.aun.looi@intel.com>, llvm@lists.linux.dev,
 Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH net 2/2] net: stmmac: move fixed-link
	support fixup code
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

Hi Michael,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Sit-Wei-Hong/net-stmmac-fix-PHY-handle-parsing/20230313-160802
patch link:    https://lore.kernel.org/r/20230313080135.2952774-3-michael.wei.hong.sit%40intel.com
patch subject: [PATCH net 2/2] net: stmmac: move fixed-link support fixup code
config: x86_64-randconfig-a013-20230313 (https://download.01.org/0day-ci/archive/20230313/202303131924.MkBmpkFK-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e1abd092fb1e75931e37147152b274e0d3e6e655
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Michael-Sit-Wei-Hong/net-stmmac-fix-PHY-handle-parsing/20230313-160802
        git checkout e1abd092fb1e75931e37147152b274e0d3e6e655
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/ethernet/stmicro/stmmac/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303131924.MkBmpkFK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:7311:7: warning: variable 'fwnode' is uninitialized when used here [-Wuninitialized]
           if (!fwnode)
                ^~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:7067:30: note: initialize the variable 'fwnode' to silence this warning
           struct fwnode_handle *fwnode;
                                       ^
                                        = NULL
   1 warning generated.


vim +/fwnode +7311 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

  7051	
  7052	/**
  7053	 * stmmac_dvr_probe
  7054	 * @device: device pointer
  7055	 * @plat_dat: platform data pointer
  7056	 * @res: stmmac resource pointer
  7057	 * Description: this is the main probe function used to
  7058	 * call the alloc_etherdev, allocate the priv structure.
  7059	 * Return:
  7060	 * returns 0 on success, otherwise errno.
  7061	 */
  7062	int stmmac_dvr_probe(struct device *device,
  7063			     struct plat_stmmacenet_data *plat_dat,
  7064			     struct stmmac_resources *res)
  7065	{
  7066		struct net_device *ndev = NULL;
  7067		struct fwnode_handle *fwnode;
  7068		struct stmmac_priv *priv;
  7069		u32 rxq;
  7070		int i, ret = 0;
  7071	
  7072		ndev = devm_alloc_etherdev_mqs(device, sizeof(struct stmmac_priv),
  7073					       MTL_MAX_TX_QUEUES, MTL_MAX_RX_QUEUES);
  7074		if (!ndev)
  7075			return -ENOMEM;
  7076	
  7077		SET_NETDEV_DEV(ndev, device);
  7078	
  7079		priv = netdev_priv(ndev);
  7080		priv->device = device;
  7081		priv->dev = ndev;
  7082	
  7083		stmmac_set_ethtool_ops(ndev);
  7084		priv->pause = pause;
  7085		priv->plat = plat_dat;
  7086		priv->ioaddr = res->addr;
  7087		priv->dev->base_addr = (unsigned long)res->addr;
  7088		priv->plat->dma_cfg->multi_msi_en = priv->plat->multi_msi_en;
  7089	
  7090		priv->dev->irq = res->irq;
  7091		priv->wol_irq = res->wol_irq;
  7092		priv->lpi_irq = res->lpi_irq;
  7093		priv->sfty_ce_irq = res->sfty_ce_irq;
  7094		priv->sfty_ue_irq = res->sfty_ue_irq;
  7095		for (i = 0; i < MTL_MAX_RX_QUEUES; i++)
  7096			priv->rx_irq[i] = res->rx_irq[i];
  7097		for (i = 0; i < MTL_MAX_TX_QUEUES; i++)
  7098			priv->tx_irq[i] = res->tx_irq[i];
  7099	
  7100		if (!is_zero_ether_addr(res->mac))
  7101			eth_hw_addr_set(priv->dev, res->mac);
  7102	
  7103		dev_set_drvdata(device, priv->dev);
  7104	
  7105		/* Verify driver arguments */
  7106		stmmac_verify_args();
  7107	
  7108		priv->af_xdp_zc_qps = bitmap_zalloc(MTL_MAX_TX_QUEUES, GFP_KERNEL);
  7109		if (!priv->af_xdp_zc_qps)
  7110			return -ENOMEM;
  7111	
  7112		/* Allocate workqueue */
  7113		priv->wq = create_singlethread_workqueue("stmmac_wq");
  7114		if (!priv->wq) {
  7115			dev_err(priv->device, "failed to create workqueue\n");
  7116			ret = -ENOMEM;
  7117			goto error_wq_init;
  7118		}
  7119	
  7120		INIT_WORK(&priv->service_task, stmmac_service_task);
  7121	
  7122		/* Initialize Link Partner FPE workqueue */
  7123		INIT_WORK(&priv->fpe_task, stmmac_fpe_lp_task);
  7124	
  7125		/* Override with kernel parameters if supplied XXX CRS XXX
  7126		 * this needs to have multiple instances
  7127		 */
  7128		if ((phyaddr >= 0) && (phyaddr <= 31))
  7129			priv->plat->phy_addr = phyaddr;
  7130	
  7131		if (priv->plat->stmmac_rst) {
  7132			ret = reset_control_assert(priv->plat->stmmac_rst);
  7133			reset_control_deassert(priv->plat->stmmac_rst);
  7134			/* Some reset controllers have only reset callback instead of
  7135			 * assert + deassert callbacks pair.
  7136			 */
  7137			if (ret == -ENOTSUPP)
  7138				reset_control_reset(priv->plat->stmmac_rst);
  7139		}
  7140	
  7141		ret = reset_control_deassert(priv->plat->stmmac_ahb_rst);
  7142		if (ret == -ENOTSUPP)
  7143			dev_err(priv->device, "unable to bring out of ahb reset: %pe\n",
  7144				ERR_PTR(ret));
  7145	
  7146		/* Init MAC and get the capabilities */
  7147		ret = stmmac_hw_init(priv);
  7148		if (ret)
  7149			goto error_hw_init;
  7150	
  7151		/* Only DWMAC core version 5.20 onwards supports HW descriptor prefetch.
  7152		 */
  7153		if (priv->synopsys_id < DWMAC_CORE_5_20)
  7154			priv->plat->dma_cfg->dche = false;
  7155	
  7156		stmmac_check_ether_addr(priv);
  7157	
  7158		ndev->netdev_ops = &stmmac_netdev_ops;
  7159	
  7160		ndev->hw_features = NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM |
  7161				    NETIF_F_RXCSUM;
  7162		ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
  7163				     NETDEV_XDP_ACT_XSK_ZEROCOPY |
  7164				     NETDEV_XDP_ACT_NDO_XMIT;
  7165	
  7166		ret = stmmac_tc_init(priv, priv);
  7167		if (!ret) {
  7168			ndev->hw_features |= NETIF_F_HW_TC;
  7169		}
  7170	
  7171		if ((priv->plat->tso_en) && (priv->dma_cap.tsoen)) {
  7172			ndev->hw_features |= NETIF_F_TSO | NETIF_F_TSO6;
  7173			if (priv->plat->has_gmac4)
  7174				ndev->hw_features |= NETIF_F_GSO_UDP_L4;
  7175			priv->tso = true;
  7176			dev_info(priv->device, "TSO feature enabled\n");
  7177		}
  7178	
  7179		if (priv->dma_cap.sphen && !priv->plat->sph_disable) {
  7180			ndev->hw_features |= NETIF_F_GRO;
  7181			priv->sph_cap = true;
  7182			priv->sph = priv->sph_cap;
  7183			dev_info(priv->device, "SPH feature enabled\n");
  7184		}
  7185	
  7186		/* The current IP register MAC_HW_Feature1[ADDR64] only define
  7187		 * 32/40/64 bit width, but some SOC support others like i.MX8MP
  7188		 * support 34 bits but it map to 40 bits width in MAC_HW_Feature1[ADDR64].
  7189		 * So overwrite dma_cap.addr64 according to HW real design.
  7190		 */
  7191		if (priv->plat->addr64)
  7192			priv->dma_cap.addr64 = priv->plat->addr64;
  7193	
  7194		if (priv->dma_cap.addr64) {
  7195			ret = dma_set_mask_and_coherent(device,
  7196					DMA_BIT_MASK(priv->dma_cap.addr64));
  7197			if (!ret) {
  7198				dev_info(priv->device, "Using %d bits DMA width\n",
  7199					 priv->dma_cap.addr64);
  7200	
  7201				/*
  7202				 * If more than 32 bits can be addressed, make sure to
  7203				 * enable enhanced addressing mode.
  7204				 */
  7205				if (IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT))
  7206					priv->plat->dma_cfg->eame = true;
  7207			} else {
  7208				ret = dma_set_mask_and_coherent(device, DMA_BIT_MASK(32));
  7209				if (ret) {
  7210					dev_err(priv->device, "Failed to set DMA Mask\n");
  7211					goto error_hw_init;
  7212				}
  7213	
  7214				priv->dma_cap.addr64 = 32;
  7215			}
  7216		}
  7217	
  7218		ndev->features |= ndev->hw_features | NETIF_F_HIGHDMA;
  7219		ndev->watchdog_timeo = msecs_to_jiffies(watchdog);
  7220	#ifdef STMMAC_VLAN_TAG_USED
  7221		/* Both mac100 and gmac support receive VLAN tag detection */
  7222		ndev->features |= NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_STAG_RX;
  7223		if (priv->dma_cap.vlhash) {
  7224			ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
  7225			ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
  7226		}
  7227		if (priv->dma_cap.vlins) {
  7228			ndev->features |= NETIF_F_HW_VLAN_CTAG_TX;
  7229			if (priv->dma_cap.dvlan)
  7230				ndev->features |= NETIF_F_HW_VLAN_STAG_TX;
  7231		}
  7232	#endif
  7233		priv->msg_enable = netif_msg_init(debug, default_msg_level);
  7234	
  7235		/* Initialize RSS */
  7236		rxq = priv->plat->rx_queues_to_use;
  7237		netdev_rss_key_fill(priv->rss.key, sizeof(priv->rss.key));
  7238		for (i = 0; i < ARRAY_SIZE(priv->rss.table); i++)
  7239			priv->rss.table[i] = ethtool_rxfh_indir_default(i, rxq);
  7240	
  7241		if (priv->dma_cap.rssen && priv->plat->rss_en)
  7242			ndev->features |= NETIF_F_RXHASH;
  7243	
  7244		/* MTU range: 46 - hw-specific max */
  7245		ndev->min_mtu = ETH_ZLEN - ETH_HLEN;
  7246		if (priv->plat->has_xgmac)
  7247			ndev->max_mtu = XGMAC_JUMBO_LEN;
  7248		else if ((priv->plat->enh_desc) || (priv->synopsys_id >= DWMAC_CORE_4_00))
  7249			ndev->max_mtu = JUMBO_LEN;
  7250		else
  7251			ndev->max_mtu = SKB_MAX_HEAD(NET_SKB_PAD + NET_IP_ALIGN);
  7252		/* Will not overwrite ndev->max_mtu if plat->maxmtu > ndev->max_mtu
  7253		 * as well as plat->maxmtu < ndev->min_mtu which is a invalid range.
  7254		 */
  7255		if ((priv->plat->maxmtu < ndev->max_mtu) &&
  7256		    (priv->plat->maxmtu >= ndev->min_mtu))
  7257			ndev->max_mtu = priv->plat->maxmtu;
  7258		else if (priv->plat->maxmtu < ndev->min_mtu)
  7259			dev_warn(priv->device,
  7260				 "%s: warning: maxmtu having invalid value (%d)\n",
  7261				 __func__, priv->plat->maxmtu);
  7262	
  7263		if (flow_ctrl)
  7264			priv->flow_ctrl = FLOW_AUTO;	/* RX/TX pause on */
  7265	
  7266		/* Setup channels NAPI */
  7267		stmmac_napi_add(ndev);
  7268	
  7269		mutex_init(&priv->lock);
  7270	
  7271		/* If a specific clk_csr value is passed from the platform
  7272		 * this means that the CSR Clock Range selection cannot be
  7273		 * changed at run-time and it is fixed. Viceversa the driver'll try to
  7274		 * set the MDC clock dynamically according to the csr actual
  7275		 * clock input.
  7276		 */
  7277		if (priv->plat->clk_csr >= 0)
  7278			priv->clk_csr = priv->plat->clk_csr;
  7279		else
  7280			stmmac_clk_csr_set(priv);
  7281	
  7282		stmmac_check_pcs_mode(priv);
  7283	
  7284		pm_runtime_get_noresume(device);
  7285		pm_runtime_set_active(device);
  7286		if (!pm_runtime_enabled(device))
  7287			pm_runtime_enable(device);
  7288	
  7289		if (priv->hw->pcs != STMMAC_PCS_TBI &&
  7290		    priv->hw->pcs != STMMAC_PCS_RTBI) {
  7291			/* MDIO bus Registration */
  7292			ret = stmmac_mdio_register(ndev);
  7293			if (ret < 0) {
  7294				dev_err_probe(priv->device, ret,
  7295					      "%s: MDIO bus (id: %d) registration failed\n",
  7296					      __func__, priv->plat->bus_id);
  7297				goto error_mdio_register;
  7298			}
  7299		}
  7300	
  7301		if (priv->plat->speed_mode_2500)
  7302			priv->plat->speed_mode_2500(ndev, priv->plat->bsp_priv);
  7303	
  7304		if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
  7305			ret = stmmac_xpcs_setup(priv->mii);
  7306			if (ret)
  7307				goto error_xpcs_setup;
  7308		}
  7309	
  7310		/* For fixed-link setup, we clear xpcs_an_inband */
> 7311		if (!fwnode)
  7312			fwnode = dev_fwnode(priv->device);
  7313	
  7314		if (fwnode) {
  7315			struct fwnode_handle *fixed_node;
  7316	
  7317			fixed_node = fwnode_get_named_child_node(fwnode, "fixed-link");
  7318			if (fixed_node)
  7319				priv->plat->mdio_bus_data->xpcs_an_inband = false;
  7320	
  7321			fwnode_handle_put(fixed_node);
  7322		}
  7323	
  7324		ret = stmmac_phy_setup(priv);
  7325		if (ret) {
  7326			netdev_err(ndev, "failed to setup phy (%d)\n", ret);
  7327			goto error_phy_setup;
  7328		}
  7329	
  7330		ret = register_netdev(ndev);
  7331		if (ret) {
  7332			dev_err(priv->device, "%s: ERROR %i registering the device\n",
  7333				__func__, ret);
  7334			goto error_netdev_register;
  7335		}
  7336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
