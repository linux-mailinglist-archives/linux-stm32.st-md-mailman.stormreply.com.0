Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FDED168FF
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 04:53:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85A5FC57B41;
	Tue, 13 Jan 2026 03:53:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 781F8C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 03:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768276420; x=1799812420;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/IRlg/HZqaWarHkvItRChuZKhbeASWJFIkTvLPcavzU=;
 b=RXhW6MyZDmAJd+sgR4VmeOztG+WhrJjTmGvTe6U32HQqTvqWfS/M/Nvk
 GyxryUSe2UpWKMlf7GFL+nJWtB401zz1CwPDwFZyVrLoMtU+bxx2D0szg
 42+KQpvKvkWS2bjUvfizUXQBNfaVapJ3Dyb9rwqYO1OeXm9BZHSwKb8AU
 4E3MCqrQmq/hkUqyY1xxC5+eJfJsUQVHDYYSonAE8ivfluz5+f61pVnEV
 o1pDFWEUsSKZMn76oCEhKNa0u/stzhT7uf5Xm/ZVS1yicgbdjzG7icsZd
 PsXzbhxLKlnpRj2VYhEJGU9Rq5B6hORQm9woP8EseZ/VnJ/6NJhGhxRyv w==;
X-CSE-ConnectionGUID: 3lzOyO46TOycwAHCTbAotA==
X-CSE-MsgGUID: HfAWbKH2R2OB8zmvmp+Vpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69613562"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69613562"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 19:53:37 -0800
X-CSE-ConnectionGUID: ZcgYCdDKQQa6FHqWUrNpng==
X-CSE-MsgGUID: mlgWcsnIQTGOQJ6oXCw5Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="227496203"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 12 Jan 2026 19:53:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vfVTH-00000000EBU-1ImV;
 Tue, 13 Jan 2026 03:53:31 +0000
Date: Tue, 13 Jan 2026 11:52:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <202601131106.zgy17BPH-lkp@intel.com>
References: <E1vfMO1-00000002kJF-33UK@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vfMO1-00000002kJF-33UK@rmk-PC.armlinux.org.uk>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: qcom-ethqos:
 convert to set_clk_tx_rate() method
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

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-qcom-ethqos-remove-mac_base/20260113-061245
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1vfMO1-00000002kJF-33UK%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next 2/2] net: stmmac: qcom-ethqos: convert to set_clk_tx_rate() method
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260113/202601131106.zgy17BPH-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131106.zgy17BPH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131106.zgy17BPH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c: In function 'ethqos_set_clk_tx_rate':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c:188:1: warning: control reaches end of non-void function [-Wreturn-type]
     188 | }
         | ^


vim +188 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c

a7c30e62d4b895 Vinod Koul            2019-01-21  175  
a69650e88a5551 Russell King (Oracle  2026-01-12  176) static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
a69650e88a5551 Russell King (Oracle  2026-01-12  177) 				  phy_interface_t interface, int speed)
a7c30e62d4b895 Vinod Koul            2019-01-21  178  {
a69650e88a5551 Russell King (Oracle  2026-01-12  179) 	struct qcom_ethqos *ethqos = bsp_priv;
98f9928843331f Russell King (Oracle  2025-02-21  180) 	long rate;
98f9928843331f Russell King (Oracle  2025-02-21  181) 
a69650e88a5551 Russell King (Oracle  2026-01-12  182) 	if (!phy_interface_mode_is_rgmii(interface))
a69650e88a5551 Russell King (Oracle  2026-01-12  183) 		return 0;
26311cd112d05a Sarosh Hasan          2024-02-26  184  
98f9928843331f Russell King (Oracle  2025-02-21  185) 	rate = rgmii_clock(speed);
98f9928843331f Russell King (Oracle  2025-02-21  186) 	if (rate > 0)
a69650e88a5551 Russell King (Oracle  2026-01-12  187) 		clk_set_rate(ethqos->link_clk, rate * 2);
a7c30e62d4b895 Vinod Koul            2019-01-21 @188  }
a7c30e62d4b895 Vinod Koul            2019-01-21  189  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
