Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ry0rB3xKTWoExwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 20:50:36 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A1B71EBE0
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 20:50:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=lunn.ch header.s=20171124 header.b=ms5VMpjP;
	dmarc=fail reason="SPF not aligned (strict)" header.from=lunn.ch (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F4FAC8F264;
	Tue,  7 Jul 2026 18:50:35 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 883E4C7129F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2026 18:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=NI+VUTouKYW89nB5Z+aD4pi6ZXy+jv5hw3Htg0xYNWI=; b=ms5VMpjP84ODY07OzejZ0XnMpX
 vXH83b9W0UFlLWSfBV3jFUnAbcxLrppZ9r5OR3w7XDOr85B5f0dC4sPAxeF8HOmKpcKnBTYU20rcs
 hEI0LXDlvCRmKfyCQdXaCj6D4lVxfItz2GuexpGblbQ7pIJPEQatSY6zi1+0whijn3Nc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1whAs8-00BDDv-0d; Tue, 07 Jul 2026 20:50:20 +0200
Date: Tue, 7 Jul 2026 20:50:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <a6515f8c-1358-4e2a-a485-2a25a7dc6313@lunn.ch>
References: <20260707162146.73823-1-stefan@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260707162146.73823-1-stefan@agner.ch>
Cc: regressions@lists.linux.dev, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: resume PHY before
 reopening the interface on MTU change
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[lunn.ch:s=20171124];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lunn.ch : SPF not aligned (strict),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stefan@agner.ch,m:regressions@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:rmk+kernel@armlinux.org.uk,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,st-md-mailman.stormreply.com,armlinux.org.uk,bootlin.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:mid,lunn.ch:from_mime,stormreply.com:url,stormreply.com:email,agner.ch:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97A1B71EBE0

On Tue, Jul 07, 2026 at 06:21:46PM +0200, Stefan Agner wrote:
> Since the referenced commit, changing the MTU on a running interface no
> longer disconnects and reconnects the PHY; __stmmac_release() merely
> stops phylink, which also suspends the PHY (BMCR power-down) when WoL
> is not enabled. __stmmac_open() then performs the DMA software reset in
> stmmac_hw_setup() before phylink_start() resumes the PHY again.
> 
> IEEE 802.3 22.2.4.1.5 allows a PHY to stop its receive clock while
> powered down, and stmmac requires a running receive clock for the DMA
> software reset to complete (the phylink config sets mac_requires_rxc).
> On such setups, e.g. the RK3566-based Home Assistant Green with an
> RTL8211F-VD PHY in RGMII mode, any runtime MTU change now times out and
> leaves the interface dead:
> 
>   rk_gmac-dwmac fe010000.ethernet end0: Failed to reset the dma
>   rk_gmac-dwmac fe010000.ethernet end0: stmmac_hw_setup: DMA engine initialization failed
>   rk_gmac-dwmac fe010000.ethernet end0: __stmmac_open: Hw setup failed
>   rk_gmac-dwmac fe010000.ethernet end0: failed reopening the interface after MTU change
> 
> In the field this is triggered by NetworkManager applying an MTU while
> activating the connection, breaking networking entirely.
> 
> Resume the PHY before reopening the interface, like stmmac_resume()
> does, to ensure the receive clock is running for the DMA software
> reset.
> 
> Fixes: db299a0c09e9 ("net: stmmac: move PHY handling out of __stmmac_open()/release()")
> Link: https://github.com/home-assistant/operating-system/issues/4858
> Assisted-by: Claude:claude-fable-5
> Tested-by: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
> Note: phylink_prepare_resume()'s kernel-doc says it is to be called
> prior to phylink_resume(); here it is paired with phylink_start()
> (called from __stmmac_open()) instead, which phylink_resume() itself
> uses to restart the machinery. If preferred, I can extend the
> kernel-doc or introduce a more generically named helper.
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5884,6 +5884,15 @@
>  
>  		__stmmac_release(dev);
>  
> +		/* phylink_stop() in __stmmac_release() suspends the PHY.
> +		 * IEEE 802.3 allows PHYs to stop their receive clock while
> +		 * powered down, but the DMA software reset performed by
> +		 * stmmac_hw_setup() requires a running receive clock.
> +		 * Resume the PHY, as on system resume, to ensure its clocks
> +		 * are running before reopening the interface.
> +		 */
> +		phylink_prepare_resume(priv->phylink);
> +
>  		ret = __stmmac_open(dev, dma_conf);
>  		if (ret) {
>  			free_dma_desc_resources(priv, dma_conf);

I'm not convinced.

__stmmac_open() and __stmmac_release() should be opposites of each
other. If __stmmac_release() stops the clock, __stmmac_open() should
start the clock.

	Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
