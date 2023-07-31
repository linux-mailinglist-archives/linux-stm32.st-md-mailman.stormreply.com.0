Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1967690E1
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 10:55:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AEDFC6B443;
	Mon, 31 Jul 2023 08:55:20 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EADFBC6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jul 2023 08:55:18 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1qQOfr-0004jn-6K; Mon, 31 Jul 2023 10:54:43 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1qQOfn-0004Bl-Pb; Mon, 31 Jul 2023 10:54:39 +0200
Date: Mon, 31 Jul 2023 10:54:39 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: kernel test robot <lkp@intel.com>
Message-ID: <20230731085439.yj3iakjparweziis@pengutronix.de>
References: <20230720072304.3358701-2-m.felsch@pengutronix.de>
 <202307220459.2gaQtSqH-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202307220459.2gaQtSqH-lkp@intel.com>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, joabreu@synopsys.com, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, peppe.cavallaro@st.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/2] net: stmmac: add support
	for phy-supply
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

On 23-07-22, kernel test robot wrote:
> Hi Marco,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on net-next/main]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Felsch/net-stmmac-add-support-for-phy-supply/20230720-152642
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20230720072304.3358701-2-m.felsch%40pengutronix.de
> patch subject: [PATCH net-next v3 2/2] net: stmmac: add support for phy-supply
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230722/202307220459.2gaQtSqH-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220459.2gaQtSqH-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307220459.2gaQtSqH-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c: In function 'stmmac_suspend':
> >> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:7706:32: error: 'struct plat_stmmacenet_data' has no member named 'use_phy_wol'
>     7706 |                 if (!priv->plat->use_phy_wol)
>          |                                ^~
>    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c: In function 'stmmac_resume':
>    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:7790:32: error: 'struct plat_stmmacenet_data' has no member named 'use_phy_wol'
>     7790 |                 if (!priv->plat->use_phy_wol)
>          |                                ^~

The fixed v4 can be found here:

https://lore.kernel.org/all/20230721110345.3925719-1-m.felsch@pengutronix.de/

Regards,
  Marco
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
