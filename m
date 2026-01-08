Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EE1D02FAB
	for <lists+linux-stm32@lfdr.de>; Thu, 08 Jan 2026 14:23:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CED9DC8F282;
	Thu,  8 Jan 2026 13:23:08 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A99A9C5A4EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jan 2026 13:23:07 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1vdpyU-0005cJ-PR; Thu, 08 Jan 2026 14:22:50 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1vdpyS-009gXW-2F;
 Thu, 08 Jan 2026 14:22:48 +0100
Received: from pza by lupine with local (Exim 4.98.2)
 (envelope-from <p.zabel@pengutronix.de>) id 1vdpyS-000000007uP-1b8C;
 Thu, 08 Jan 2026 14:22:48 +0100
Message-ID: <1fe08251f091bd695f630b7b46ae8c8d85d664a3.camel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Dinh Nguyen <dinguyen@kernel.org>, Maxime Chevallier	
 <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue	 <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mamta Shukla	 <mamta.shukla@leica-geosystems.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Thu, 08 Jan 2026 14:22:48 +0100
In-Reply-To: <20260108-remove_ocp-v3-1-ea0190244b4c@kernel.org>
References: <20260108-remove_ocp-v3-0-ea0190244b4c@kernel.org>
 <20260108-remove_ocp-v3-1-ea0190244b4c@kernel.org>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, bsp-development.geo@leica-geosystems.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/3] net: stmmac: socfpga: add call to
 assert/deassert ahb reset line
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

On Do, 2026-01-08 at 07:08 -0600, Dinh Nguyen wrote:
> The "stmmaceth-ocp" reset line of stmmac controller on the SoCFPGA
> platform is essentially the "ahb" reset on the standard stmmac
> controller. But since stmmaceth-ocp has already been introduced into
> the wild, we cannot just remove support for it. But what we can do is
> to support both "stmmaceth-ocp" and "ahb" reset names. Going forward we
> will be using "ahb", but in order to not break ABI, we will be call reset
> assert/de-assert both ahb and stmmaceth-ocp.
> 
> The ethernet hardware on SoCFPGA requires either the stmmaceth-ocp or
> ahb reset to be asserted every time before changing the phy mode, then
> de-asserted when the phy mode has been set.
> 
> With this change, we should be able to revert patch:
> commit 62a40a0d5634 ("arm: dts: socfpga: use reset-name "stmmaceth-ocp"
> instead of "ahb"")
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> index a2b52d2c4eb6f..79df55515c718 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> @@ -407,6 +407,7 @@ static int socfpga_gen5_set_phy_mode(struct socfpga_dwmac *dwmac)
>  
>  	/* Assert reset to the enet controller before changing the phy mode */
>  	reset_control_assert(dwmac->stmmac_ocp_rst);
> +	reset_control_assert(dwmac->plat_dat->stmmac_ahb_rst);

Since these two are just different names for the same reset,
I think it would be cleaner to rename dwmac->stmmac_ocp_rst to
dwmac->stmmac_ahb_rst and assign this either to
dwmac->plat_dat->stmmac_ahb_rst or to the stmmac-ocp reset during
probe.

Also, a comment explaining that the dem_reset_control_get_optional(dev,
"stmmaceth-ocp") is for backwards compatibility with legacy device
trees could be helpful to future readers.


regards
Philipp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
