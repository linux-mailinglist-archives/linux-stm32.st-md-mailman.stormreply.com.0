Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABB4A038C7
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 08:29:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFBECC78018;
	Tue,  7 Jan 2025 07:29:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D850C78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 07:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736234965; x=1767770965;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uat2YMlEc7Xp6j7gAomimDsLGJKKKHa/p6RKV8tc0a8=;
 b=MTcPACjwkpJ7pFhzgADzyKv/3JgBrrQbDKBMjC6Ann7UDGFcQtV+Meml
 EBMg1CYjYgIXfPGBHiVUzWf/xcG2VplojnSWoxAbXYsMRfj3bLfxDMFL9
 pXxEDbF0Od7fgO44ajUURo96LjuNCnpAOraINmLj+rw1POb1MIDWdJO2G
 ffgzSgEW92KvrlnNG+8cx82eHzTTPy5VexrTcvCbLC81q7Bt/yNye+Wm+
 JpBbquXRJ7E51k3tKeiiH6H1zfK+M0AYl7iepR3ybtl7LOitnRhGNDV4l
 bEEmp/sVbVSuXa4B/H5eeiMsSvD8DCiU68xoq27LtnURctfF+Osb13UV2 Q==;
X-CSE-ConnectionGUID: ilGMXkQCRdCDzF2nuL18ig==
X-CSE-MsgGUID: fLAwxQksQC6WjsCwam11Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="40174516"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; d="scan'208";a="40174516"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 23:29:16 -0800
X-CSE-ConnectionGUID: 1FALSZDjTGunzAkFKziNaQ==
X-CSE-MsgGUID: v8zTB9WhTaWnmmAkffTGsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; d="scan'208";a="102573726"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 06 Jan 2025 23:29:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tV41W-000EMZ-31;
 Tue, 07 Jan 2025 07:29:10 +0000
Date: Tue, 7 Jan 2025 15:28:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <202501071547.L5CjLObQ-lkp@intel.com>
References: <E1tUmAz-007VXn-0o@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1tUmAz-007VXn-0o@rmk-PC.armlinux.org.uk>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 12/17] net: stmmac: move
 priv->eee_active into stmmac_eee_init()
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-move-tx_lpi_timer-tracking-to-phylib/20250107-002808
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1tUmAz-007VXn-0o%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next v2 12/17] net: stmmac: move priv->eee_active into stmmac_eee_init()
config: i386-buildonly-randconfig-005-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071547.L5CjLObQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501071547.L5CjLObQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071547.L5CjLObQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:468: warning: Function parameter or struct member 'active' not described in 'stmmac_eee_init'


vim +468 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

d765955d2ae0b8 Giuseppe CAVALLARO       2012-06-27  458  
d765955d2ae0b8 Giuseppe CAVALLARO       2012-06-27  459  /**
732fdf0e5253e9 Giuseppe CAVALLARO       2014-11-18  460   * stmmac_eee_init - init EEE
32ceabcad3c8ab Giuseppe CAVALLARO       2013-04-08  461   * @priv: driver private structure
d765955d2ae0b8 Giuseppe CAVALLARO       2012-06-27  462   * Description:
732fdf0e5253e9 Giuseppe CAVALLARO       2014-11-18  463   *  if the GMAC supports the EEE (from the HW cap reg) and the phy device
732fdf0e5253e9 Giuseppe CAVALLARO       2014-11-18  464   *  can also manage EEE, this function enable the LPI state and start related
732fdf0e5253e9 Giuseppe CAVALLARO       2014-11-18  465   *  timer.
d765955d2ae0b8 Giuseppe CAVALLARO       2012-06-27  466   */
5ad24fd233fa83 Russell King (Oracle     2025-01-06  467) static void stmmac_eee_init(struct stmmac_priv *priv, bool active)
d765955d2ae0b8 Giuseppe CAVALLARO       2012-06-27 @468  {
5ad24fd233fa83 Russell King (Oracle     2025-01-06  469) 	priv->eee_active = active;
5ad24fd233fa83 Russell King (Oracle     2025-01-06  470) 
74371272f97fd1 Jose Abreu               2019-06-11  471  	/* Check if MAC core supports the EEE feature. */
418ee895284762 Russell King (Oracle     2025-01-06  472) 	if (!priv->dma_cap.eee) {
418ee895284762 Russell King (Oracle     2025-01-06  473) 		priv->eee_enabled = false;
418ee895284762 Russell King (Oracle     2025-01-06  474) 		return;
418ee895284762 Russell King (Oracle     2025-01-06  475) 	}
83bf79b6bb64e6 Giuseppe CAVALLARO       2014-03-10  476  
29555fa3de8656 Thierry Reding           2018-05-24  477  	mutex_lock(&priv->lock);
74371272f97fd1 Jose Abreu               2019-06-11  478  
74371272f97fd1 Jose Abreu               2019-06-11  479  	/* Check if it needs to be deactivated */
177d935a13703e Jon Hunter               2019-06-26  480  	if (!priv->eee_active) {
177d935a13703e Jon Hunter               2019-06-26  481  		if (priv->eee_enabled) {
38ddc59d65b6d9 LABBE Corentin           2016-11-16  482  			netdev_dbg(priv->dev, "disable EEE\n");
be1c7eae8c7dfc Vineetha G. Jaya Kumaran 2020-10-28  483  			stmmac_lpi_entry_timer_config(priv, 0);
83bf79b6bb64e6 Giuseppe CAVALLARO       2014-03-10  484  			del_timer_sync(&priv->eee_ctrl_timer);
26dbf37afd5d4b Russell King (Oracle     2025-01-06  485) 			stmmac_set_eee_timer(priv, priv->hw, 0,
26dbf37afd5d4b Russell King (Oracle     2025-01-06  486) 					     STMMAC_DEFAULT_TWT_LS);
d4aeaed80b0ebb Wong Vee Khee            2021-10-05  487  			if (priv->hw->xpcs)
d4aeaed80b0ebb Wong Vee Khee            2021-10-05  488  				xpcs_config_eee(priv->hw->xpcs,
d4aeaed80b0ebb Wong Vee Khee            2021-10-05  489  						priv->plat->mult_fact_100ns,
d4aeaed80b0ebb Wong Vee Khee            2021-10-05  490  						false);
177d935a13703e Jon Hunter               2019-06-26  491  		}
418ee895284762 Russell King (Oracle     2025-01-06  492) 		priv->eee_enabled = false;
0867bb9768deda Jon Hunter               2019-06-26  493  		mutex_unlock(&priv->lock);
418ee895284762 Russell King (Oracle     2025-01-06  494) 		return;
83bf79b6bb64e6 Giuseppe CAVALLARO       2014-03-10  495  	}
d765955d2ae0b8 Giuseppe CAVALLARO       2012-06-27  496  
74371272f97fd1 Jose Abreu               2019-06-11  497  	if (priv->eee_active && !priv->eee_enabled) {
74371272f97fd1 Jose Abreu               2019-06-11  498  		timer_setup(&priv->eee_ctrl_timer, stmmac_eee_ctrl_timer, 0);
74371272f97fd1 Jose Abreu               2019-06-11  499  		stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
26dbf37afd5d4b Russell King (Oracle     2025-01-06  500) 				     STMMAC_DEFAULT_TWT_LS);
656ed8b015f19b Wong Vee Khee            2021-09-30  501  		if (priv->hw->xpcs)
656ed8b015f19b Wong Vee Khee            2021-09-30  502  			xpcs_config_eee(priv->hw->xpcs,
656ed8b015f19b Wong Vee Khee            2021-09-30  503  					priv->plat->mult_fact_100ns,
656ed8b015f19b Wong Vee Khee            2021-09-30  504  					true);
71965352eedd0c Giuseppe CAVALLARO       2014-08-28  505  	}
d765955d2ae0b8 Giuseppe CAVALLARO       2012-06-27  506  
be1c7eae8c7dfc Vineetha G. Jaya Kumaran 2020-10-28  507  	if (priv->plat->has_gmac4 && priv->tx_lpi_timer <= STMMAC_ET_MAX) {
be1c7eae8c7dfc Vineetha G. Jaya Kumaran 2020-10-28  508  		del_timer_sync(&priv->eee_ctrl_timer);
be1c7eae8c7dfc Vineetha G. Jaya Kumaran 2020-10-28  509  		priv->tx_path_in_lpi_mode = false;
be1c7eae8c7dfc Vineetha G. Jaya Kumaran 2020-10-28  510  		stmmac_lpi_entry_timer_config(priv, 1);
be1c7eae8c7dfc Vineetha G. Jaya Kumaran 2020-10-28  511  	} else {
be1c7eae8c7dfc Vineetha G. Jaya Kumaran 2020-10-28  512  		stmmac_lpi_entry_timer_config(priv, 0);
be1c7eae8c7dfc Vineetha G. Jaya Kumaran 2020-10-28  513  		mod_timer(&priv->eee_ctrl_timer,
be1c7eae8c7dfc Vineetha G. Jaya Kumaran 2020-10-28  514  			  STMMAC_LPI_T(priv->tx_lpi_timer));
be1c7eae8c7dfc Vineetha G. Jaya Kumaran 2020-10-28  515  	}
388e201d41fa1e Vineetha G. Jaya Kumaran 2020-10-01  516  
418ee895284762 Russell King (Oracle     2025-01-06  517) 	priv->eee_enabled = true;
418ee895284762 Russell King (Oracle     2025-01-06  518) 
29555fa3de8656 Thierry Reding           2018-05-24  519  	mutex_unlock(&priv->lock);
38ddc59d65b6d9 LABBE Corentin           2016-11-16  520  	netdev_dbg(priv->dev, "Energy-Efficient Ethernet initialized\n");
d765955d2ae0b8 Giuseppe CAVALLARO       2012-06-27  521  }
d765955d2ae0b8 Giuseppe CAVALLARO       2012-06-27  522  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
