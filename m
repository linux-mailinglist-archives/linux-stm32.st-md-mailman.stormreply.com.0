Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3E5723BC6
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Jun 2023 10:29:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83C02C6905A;
	Tue,  6 Jun 2023 08:29:38 +0000 (UTC)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [195.130.132.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E6B4C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jun 2023 08:29:36 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:a3e8:6562:a823:d832])
 by baptiste.telenet-ops.be with bizsmtp
 id 5kVL2A0121Tjf1k01kVLNE; Tue, 06 Jun 2023 10:29:36 +0200
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1q6S48-004ISO-MB;
 Tue, 06 Jun 2023 10:29:20 +0200
Date: Tue, 6 Jun 2023 10:29:20 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20230606064914.134945-2-maxime.chevallier@bootlin.com>
Message-ID: <889297a0-88c3-90df-7752-efa00184859@linux-m68k.org>
References: <20230606064914.134945-1-maxime.chevallier@bootlin.com>
 <20230606064914.134945-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, alexis.lothore@bootlin.com,
 thomas.petazzoni@bootlin.com, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Simon Horman <simon.horman@corigine.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: Add PCS_LYNX as
 a dependency for the whole driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

 	Hi Maxime,

On Tue, 6 Jun 2023, Maxime Chevallier wrote:
> Although pcs_lynx is only used on dwmac_socfpga for now, the cleanup
> path is in the generic driver, and triggers build issues for other
> stmmac variants. Make sure we build pcs_lynx in all cases too, as for
> XPCS.

That seems suboptimal to me, as it needlesly increases kernel size for
people who do not use dwmac_socfpga.  Hence I made an alternative patch:
https://lore.kernel/org/7b36ac43778b41831debd5c30b5b37d268512195.1686039915.git.geert+renesas@glider.be

> Fixes: 5d1f3fe7d2d5 ("net: stmmac: dwmac-sogfpga: use the lynx pcs driver")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> drivers/net/ethernet/stmicro/stmmac/Kconfig | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index 5583f0b055ec..fa956f2081a5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -5,6 +5,7 @@ config STMMAC_ETH
> 	depends on PTP_1588_CLOCK_OPTIONAL
> 	select MII
> 	select PCS_XPCS
> +	select PCS_LYNX
> 	select PAGE_POOL
> 	select PHYLINK
> 	select CRC32
> @@ -160,7 +161,6 @@ config DWMAC_SOCFPGA
> 	select MFD_SYSCON
> 	select MDIO_REGMAP
> 	select REGMAP_MMIO
> -	select PCS_LYNX
> 	help
> 	  Support for ethernet controller on Altera SOCFPGA

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
