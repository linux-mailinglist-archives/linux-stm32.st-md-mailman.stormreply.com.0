Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E17190424B
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 19:19:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A057C712A3;
	Tue, 11 Jun 2024 17:19:38 +0000 (UTC)
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi
 [62.142.5.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02DEEC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 17:19:30 +0000 (UTC)
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
 by fgw22.mail.saunalahti.fi (Halon) with ESMTP
 id c1dcc4e0-2816-11ef-8e57-005056bdf889;
 Tue, 11 Jun 2024 20:19:28 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 11 Jun 2024 20:19:27 +0300
To: kernel test robot <lkp@intel.com>
Message-ID: <ZmiHH7hzV9eWZsCU@surfacebook.localdomain>
References: <E1sGgCN-00Fact-0x@rmk-PC.armlinux.org.uk>
 <202406112331.DvtIlhjT-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202406112331.DvtIlhjT-lkp@intel.com>
Cc: Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Serge Semin <fancer.lancer@gmail.com>, Eric Dumazet <edumazet@google.com>,
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

Tue, Jun 11, 2024 at 11:41:38PM +0800, kernel test robot kirjoitti:
> Hi Russell,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on net-next/main]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-add-select_pcs-platform-method/20240611-024301
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/E1sGgCN-00Fact-0x%40rmk-PC.armlinux.org.uk
> patch subject: [PATCH net-next 2/5] net: stmmac: dwmac-intel: provide a select_pcs() implementation
> config: x86_64-rhel-8.3-kunit (https://download.01.org/0day-ci/archive/20240611/202406112331.DvtIlhjT-lkp@intel.com/config)
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406112331.DvtIlhjT-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406112331.DvtIlhjT-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c: In function 'intel_mgbe_common_data':
> >> drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c:601:9: error: expected expression before '}' token
>      601 |         }
>          |         ^
> 

...

> 7310fe538ea5c9 Ong Boon Leong             2021-03-15  595  	/* Intel mgbe SGMII interface uses pcs-xcps */
> c82386310d9572 Ong Boon Leong             2022-06-15  596  	if (plat->phy_interface == PHY_INTERFACE_MODE_SGMII ||
> c82386310d9572 Ong Boon Leong             2022-06-15  597  	    plat->phy_interface == PHY_INTERFACE_MODE_1000BASEX) {
> 7310fe538ea5c9 Ong Boon Leong             2021-03-15  598  		plat->mdio_bus_data->has_xpcs = true;
> 83f55b01dd9030 Russell King (Oracle       2024-05-29  599) 		plat->mdio_bus_data->default_an_inband = true;
> 178a34a9b7ccb3 Russell King (Oracle       2024-06-10  600) 		plat->select_pcs = intel_mgbe_select_pcs,

Yeah, compiler wants semicolon here.

> 7310fe538ea5c9 Ong Boon Leong             2021-03-15 @601  	}

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
