Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7FA95B686
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Aug 2024 15:25:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0AD6C71287;
	Thu, 22 Aug 2024 13:25:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF43DC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 13:25:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9629560FF3;
 Thu, 22 Aug 2024 13:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCDCC32782;
 Thu, 22 Aug 2024 13:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724333146;
 bh=G4MWnl1LTsJIZXk3+Kb2HykN4Id8Tei1TL23UkRqcMI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XXmJAaH0/b90nuscjjjO+6BYNF1wjBNpFCIHF/X0h/+kG3d/0gQ2f87QTr0pyiBw6
 KCaHDz3DdvzQKuRf7x/RlxmxU+aZTujW9THvY1MHY46Qv6UlJfAEYarr+yyq7YJvSH
 IaxiRgorIEr3ur7qVvTa4MwifgedC47oAJr1eVAR+qpcsLd4t1skoo73nOcEqf309+
 u7hRlzyuluanDngBe6Xengc/LzfXDlWkSZE+gIfn5rchfu/QEULlL2vVAKzeHlalBe
 uRmpYjaYV+H3Kx4Sp6UO0Tg4a06bOVRx6UAT+GQYiE/kO7RZS580My+pqFjLaFDCAj
 zYHmjEnEJTnUA==
Date: Thu, 22 Aug 2024 14:25:39 +0100
From: Simon Horman <horms@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20240822132539.GQ2164@kernel.org>
References: <20240822084733.1599295-1-frank.li@vivo.com>
 <20240822084733.1599295-3-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822084733.1599295-3-frank.li@vivo.com>
Cc: andrew@lunn.ch, marcin.s.wojtas@gmail.com, kees@kernel.org,
 linus.walleij@linaro.org, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, f.fainelli@gmail.com,
 linux@armlinux.org.uk, hkallweit1@gmail.com, joabreu@synopsys.com,
 u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com, kuba@kernel.org,
 pabeni@redhat.com, clement.leger@bootlin.com, ulli.kroll@googlemail.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 mcoquelin.stm32@gmail.com, justinstitt@google.com, olteanv@gmail.com,
 davem@davemloft.net, shannon.nelson@amd.com
Subject: Re: [Linux-stm32] [net-next 2/9] net: stmmac: platform: Convert to
 devm_clk_get_enabled() and devm_clk_get_optional_enabled()
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

On Thu, Aug 22, 2024 at 02:47:26AM -0600, Yangtao Li wrote:
> Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
> to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Hi Yangtao Li,

I feel that I am missing something obvious here,
but this patch fails to build when applied to net-next.

clang-18 for an x86_64 allmodconfig W=1 build says:

drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:625:10: error: incompatible pointer types returning 'struct clk *' from a function with result type 'struct plat_stmmacenet_data *' [-Werror,-Wincompatible-pointer-types]
  625 |                 return plat->pclk;
      |                        ^~~~~~~~~~
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:641:10: error: incompatible pointer types returning 'struct reset_control *' from a function with result type 'struct plat_stmmacenet_data *' [-Werror,-Wincompatible-pointer-types]
  641 |                 return plat->stmmac_rst;
      |                        ^~~~~~~~~~~~~~~~
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:646:10: error: incompatible pointer types returning 'struct reset_control *' from a function with result type 'struct plat_stmmacenet_data *' [-Werror,-Wincompatible-pointer-types]
  646 |                 return plat->stmmac_ahb_rst;
      |                        ^~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:437:8: warning: unused variable 'ret' [-Wunused-variable]
  437 |         void *ret;
      |               ^~~

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
