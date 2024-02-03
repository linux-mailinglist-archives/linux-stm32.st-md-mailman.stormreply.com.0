Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 447F6848564
	for <lists+linux-stm32@lfdr.de>; Sat,  3 Feb 2024 13:00:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6097C6C820;
	Sat,  3 Feb 2024 12:00:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A3B6C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 Feb 2024 12:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706961601; x=1738497601;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OaM3NQPREDdpKg0JK+QSLTqUnxO///RJV6jgIGAqKH8=;
 b=HL5fchyX6SouCfOz1q2d7KHeFB1wGeZi4B07J8BPMQehJy8iYADvgmHR
 lAspxQNvfIMDJX8qIXmrCNuoETaPx6IS3OEQgBvWeP/pxMMklvy1yFjMb
 jKPV2/SHdUFgHY58313y++Rp4aQFELVuKy/XET3t2LOp3Q8V/acX0X0ry
 TQFr9QUfr9I/meVLH+G5G+oJ001SX3NACf1T7VgmLofqKifcPmDwRxrgP
 m+Hj102nmEXHOuIYYpSnBAsBaZgS1j1snn+6vUN/9NdxEKSR/jTHYjmdq
 8bFyvz2mDqApO61+Yi0TJPsFRuTnXOIztgQJkxm1G0UhvgDZcUqYj8CN1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="17835207"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; d="scan'208";a="17835207"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2024 03:59:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="4911402"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
 by orviesa005.jf.intel.com with ESMTP; 03 Feb 2024 03:59:55 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rWEga-000506-0C;
 Sat, 03 Feb 2024 11:59:52 +0000
Date: Sat, 3 Feb 2024 19:59:18 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Message-ID: <202402031948.IySiUm4u-lkp@intel.com>
References: <20240201-stmmac-axi-config-v1-2-822e97b2d26e@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240201-stmmac-axi-config-v1-2-822e97b2d26e@nvidia.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-tegra@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: Allow drivers
 to provide a default AXI configuration
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

Hi Thierry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 51b70ff55ed88edd19b080a524063446bcc34b62]

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Reding/net-stmmac-Pass-resources-to-DT-parsing-code/20240202-025357
base:   51b70ff55ed88edd19b080a524063446bcc34b62
patch link:    https://lore.kernel.org/r/20240201-stmmac-axi-config-v1-2-822e97b2d26e%40nvidia.com
patch subject: [PATCH net-next 2/3] net: stmmac: Allow drivers to provide a default AXI configuration
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240203/202402031948.IySiUm4u-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402031948.IySiUm4u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402031948.IySiUm4u-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:96: warning: Function parameter or struct member 'res' not described in 'stmmac_axi_setup'


vim +96 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c

3b57de958e2aa3 Vince Bridgers     2014-07-31   86  
afea03656add70 Giuseppe Cavallaro 2016-02-29   87  /**
afea03656add70 Giuseppe Cavallaro 2016-02-29   88   * stmmac_axi_setup - parse DT parameters for programming the AXI register
afea03656add70 Giuseppe Cavallaro 2016-02-29   89   * @pdev: platform device
afea03656add70 Giuseppe Cavallaro 2016-02-29   90   * Description:
afea03656add70 Giuseppe Cavallaro 2016-02-29   91   * if required, from device-tree the AXI internal register can be tuned
afea03656add70 Giuseppe Cavallaro 2016-02-29   92   * by using platform parameters.
afea03656add70 Giuseppe Cavallaro 2016-02-29   93   */
af49f82367c1e3 Thierry Reding     2024-02-01   94  static struct stmmac_axi *stmmac_axi_setup(struct platform_device *pdev,
af49f82367c1e3 Thierry Reding     2024-02-01   95  					   struct stmmac_resources *res)
afea03656add70 Giuseppe Cavallaro 2016-02-29  @96  {
afea03656add70 Giuseppe Cavallaro 2016-02-29   97  	struct device_node *np;
afea03656add70 Giuseppe Cavallaro 2016-02-29   98  	struct stmmac_axi *axi;
afea03656add70 Giuseppe Cavallaro 2016-02-29   99  
afea03656add70 Giuseppe Cavallaro 2016-02-29  100  	np = of_parse_phandle(pdev->dev.of_node, "snps,axi-config", 0);
af49f82367c1e3 Thierry Reding     2024-02-01  101  	if (!np && !res->axi)
afea03656add70 Giuseppe Cavallaro 2016-02-29  102  		return NULL;
afea03656add70 Giuseppe Cavallaro 2016-02-29  103  
64f48e593a54a8 Joao Pinto         2017-03-07  104  	axi = devm_kzalloc(&pdev->dev, sizeof(*axi), GFP_KERNEL);
4613b279bee795 Peter Chen         2016-08-01  105  	if (!axi) {
af49f82367c1e3 Thierry Reding     2024-02-01  106  		if (np)
4613b279bee795 Peter Chen         2016-08-01  107  			of_node_put(np);
af49f82367c1e3 Thierry Reding     2024-02-01  108  
afea03656add70 Giuseppe Cavallaro 2016-02-29  109  		return ERR_PTR(-ENOMEM);
4613b279bee795 Peter Chen         2016-08-01  110  	}
afea03656add70 Giuseppe Cavallaro 2016-02-29  111  
af49f82367c1e3 Thierry Reding     2024-02-01  112  	if (res->axi)
af49f82367c1e3 Thierry Reding     2024-02-01  113  		*axi = *res->axi;
af49f82367c1e3 Thierry Reding     2024-02-01  114  
af49f82367c1e3 Thierry Reding     2024-02-01  115  	if (np) {
afea03656add70 Giuseppe Cavallaro 2016-02-29  116  		axi->axi_lpi_en = of_property_read_bool(np, "snps,lpi_en");
afea03656add70 Giuseppe Cavallaro 2016-02-29  117  		axi->axi_xit_frm = of_property_read_bool(np, "snps,xit_frm");
61d4f140943c47 Jisheng Zhang      2022-12-03  118  		axi->axi_kbbe = of_property_read_bool(np, "snps,kbbe");
61d4f140943c47 Jisheng Zhang      2022-12-03  119  		axi->axi_fb = of_property_read_bool(np, "snps,fb");
61d4f140943c47 Jisheng Zhang      2022-12-03  120  		axi->axi_mb = of_property_read_bool(np, "snps,mb");
61d4f140943c47 Jisheng Zhang      2022-12-03  121  		axi->axi_rb =  of_property_read_bool(np, "snps,rb");
afea03656add70 Giuseppe Cavallaro 2016-02-29  122  
af49f82367c1e3 Thierry Reding     2024-02-01  123  		if (of_property_read_u32(np, "snps,wr_osr_lmt", &axi->axi_wr_osr_lmt)) {
af49f82367c1e3 Thierry Reding     2024-02-01  124  			if (!res->axi)
6b3374cb1c0bd4 Niklas Cassel      2016-12-05  125  				axi->axi_wr_osr_lmt = 1;
af49f82367c1e3 Thierry Reding     2024-02-01  126  		}
af49f82367c1e3 Thierry Reding     2024-02-01  127  
af49f82367c1e3 Thierry Reding     2024-02-01  128  		if (of_property_read_u32(np, "snps,rd_osr_lmt", &axi->axi_rd_osr_lmt)) {
af49f82367c1e3 Thierry Reding     2024-02-01  129  			if (!res->axi)
6b3374cb1c0bd4 Niklas Cassel      2016-12-05  130  				axi->axi_rd_osr_lmt = 1;
af49f82367c1e3 Thierry Reding     2024-02-01  131  		}
af49f82367c1e3 Thierry Reding     2024-02-01  132  
afea03656add70 Giuseppe Cavallaro 2016-02-29  133  		of_property_read_u32_array(np, "snps,blen", axi->axi_blen, AXI_BLEN);
af49f82367c1e3 Thierry Reding     2024-02-01  134  
4613b279bee795 Peter Chen         2016-08-01  135  		of_node_put(np);
af49f82367c1e3 Thierry Reding     2024-02-01  136  	}
afea03656add70 Giuseppe Cavallaro 2016-02-29  137  
afea03656add70 Giuseppe Cavallaro 2016-02-29  138  	return axi;
afea03656add70 Giuseppe Cavallaro 2016-02-29  139  }
afea03656add70 Giuseppe Cavallaro 2016-02-29  140  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
