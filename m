Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F620687D4F
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Feb 2023 13:27:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4417DC65E42;
	Thu,  2 Feb 2023 12:27:43 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B589C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Feb 2023 12:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675340862; x=1706876862;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=w2lVTIW1/udEtdMV6XUbh7yDPvBpVMFqx5/NHCHIrmI=;
 b=dGJ6HoMan0t7XKRjclflGzD1v1Gc3L6GtqigXWDpuy92LtXMwjknVcWk
 upqW+aLcOTN1hWKeya00AchI5Hju1dDoTcij/mT+PoPL0iKUdVAD7NEZL
 Q8hX6wFxeGlOgjDKxgNZVFb7ncpUsMaFUPcZBiYQpI9HMBdvAPlsSKyoI
 V6duP7xabymBbpinARxP/aM8Yql2whsp4Bm4wfwdGlomiJyZUbjXtNJD1
 e3705uM7tuYeXulNGUPEc65S2gctc3/2Z8+sKIcKYBv0YKdjNT9Nu2Qey
 5/hxSk4i0JAgJGGMjtJUI54+ZqAAvV8EgZmDgmDk70zxW+SZa7ncXuOx4 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="328448109"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="328448109"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 04:27:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="733916022"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="733916022"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2023 04:27:35 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pNYgb-0006Us-1Y;
 Thu, 02 Feb 2023 12:27:29 +0000
Date: Thu, 2 Feb 2023 20:26:46 +0800
From: kernel test robot <lkp@intel.com>
To: Clark Wang <xiaoning.wang@nxp.com>, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, linux@armlinux.org.uk,
 andrew@lunn.ch, hkallweit1@gmail.com
Message-ID: <202302022040.NzeFwwSF-lkp@intel.com>
References: <20230201103837.3258752-1-xiaoning.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230201103837.3258752-1-xiaoning.wang@nxp.com>
Cc: netdev@vger.kernel.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-imx@nxp.com, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 1/2] net: phylink: add a function to
 resume phy alone to fix resume issue with WoL enabled
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

Hi Clark,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]
[also build test WARNING on net/master linus/master v6.2-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Clark-Wang/net-stmmac-resume-phy-separately-before-calling-stmmac_hw_setup/20230201-184223
patch link:    https://lore.kernel.org/r/20230201103837.3258752-1-xiaoning.wang%40nxp.com
patch subject: [PATCH V2 1/2] net: phylink: add a function to resume phy alone to fix resume issue with WoL enabled
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230202/202302022040.NzeFwwSF-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6df0562fc6133175ff3932188af0d9126858c42c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Clark-Wang/net-stmmac-resume-phy-separately-before-calling-stmmac_hw_setup/20230201-184223
        git checkout 6df0562fc6133175ff3932188af0d9126858c42c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/phy/ kernel/bpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/phy/phylink.c:1952:3: warning: add explicit braces to avoid dangling else [-Wdangling-else]
                   else
                   ^
   1 warning generated.


vim +1952 drivers/net/phy/phylink.c

  1887	
  1888	/**
  1889	 * phylink_start() - start a phylink instance
  1890	 * @pl: a pointer to a &struct phylink returned from phylink_create()
  1891	 *
  1892	 * Start the phylink instance specified by @pl, configuring the MAC for the
  1893	 * desired link mode(s) and negotiation style. This should be called from the
  1894	 * network device driver's &struct net_device_ops ndo_open() method.
  1895	 */
  1896	void phylink_start(struct phylink *pl)
  1897	{
  1898		bool poll = false;
  1899	
  1900		ASSERT_RTNL();
  1901	
  1902		phylink_info(pl, "configuring for %s/%s link mode\n",
  1903			     phylink_an_mode_str(pl->cur_link_an_mode),
  1904			     phy_modes(pl->link_config.interface));
  1905	
  1906		/* Always set the carrier off */
  1907		if (pl->netdev)
  1908			netif_carrier_off(pl->netdev);
  1909	
  1910		/* Apply the link configuration to the MAC when starting. This allows
  1911		 * a fixed-link to start with the correct parameters, and also
  1912		 * ensures that we set the appropriate advertisement for Serdes links.
  1913		 *
  1914		 * Restart autonegotiation if using 802.3z to ensure that the link
  1915		 * parameters are properly negotiated.  This is necessary for DSA
  1916		 * switches using 802.3z negotiation to ensure they see our modes.
  1917		 */
  1918		phylink_mac_initial_config(pl, true);
  1919	
  1920		phylink_enable_and_run_resolve(pl, PHYLINK_DISABLE_STOPPED);
  1921	
  1922		if (pl->cfg_link_an_mode == MLO_AN_FIXED && pl->link_gpio) {
  1923			int irq = gpiod_to_irq(pl->link_gpio);
  1924	
  1925			if (irq > 0) {
  1926				if (!request_irq(irq, phylink_link_handler,
  1927						 IRQF_TRIGGER_RISING |
  1928						 IRQF_TRIGGER_FALLING,
  1929						 "netdev link", pl))
  1930					pl->link_irq = irq;
  1931				else
  1932					irq = 0;
  1933			}
  1934			if (irq <= 0)
  1935				poll = true;
  1936		}
  1937	
  1938		switch (pl->cfg_link_an_mode) {
  1939		case MLO_AN_FIXED:
  1940			poll |= pl->config->poll_fixed_state;
  1941			break;
  1942		case MLO_AN_INBAND:
  1943			if (pl->pcs)
  1944				poll |= pl->pcs->poll;
  1945			break;
  1946		}
  1947		if (poll)
  1948			mod_timer(&pl->link_poll, jiffies + HZ);
  1949		if (pl->phydev)
  1950			if (!pl->mac_resume_phy_separately)
  1951				phy_start(pl->phydev);
> 1952			else
  1953				pl->mac_resume_phy_separately = false;
  1954		if (pl->sfp_bus)
  1955			sfp_upstream_start(pl->sfp_bus);
  1956	}
  1957	EXPORT_SYMBOL_GPL(phylink_start);
  1958	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
