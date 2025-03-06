Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AEBA544DA
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 09:29:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18E2CC71289;
	Thu,  6 Mar 2025 08:29:02 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93E78CFAC4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 08:29:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 284A044537;
 Thu,  6 Mar 2025 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741249739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mLaGdp8YbDuKJDS27qr7DpF30lE39Y2UTMae3idzC+k=;
 b=QgCkjePBKvLNC63g9kZ5aWfuy70/ftJqqY7atcr7qEA2lv4rKFNJbjUByT/KLZptwsScbU
 J5AyCoEa/nSAgpbu/XxmJUJHKkWE7Vw2rVX0mePVVfDOQAeuiYobvqs4VOTW7EZTymPpz/
 G5DuKRw0kKlJ+qPr0Z+Ak9DJnK10JT3czoUGqBPjaaXBMHsqMDlI45haZ9yFLdaMYGWhn/
 h8iLuwQgVulxGTUGO8GBJohSvnddf+Mns//HDwvFzh6XlvO8v8BUlamYtpAMt3MxYX03eR
 BG5NcsU0pjcG2pUVpfI5IuVW9JQlL0+mhJNT+5zBegg6g1JMw462WDdstbAXAA==
Date: Thu, 6 Mar 2025 09:28:57 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250306092857.5cafd6d4@fedora.home>
In-Reply-To: <E1tpt2t-005UNB-MC@rmk-PC.armlinux.org.uk>
References: <Z8iRM8Q9Sb-y3fR_@shell.armlinux.org.uk>
 <E1tpt2t-005UNB-MC@rmk-PC.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdejvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtoheprhhmkhdokhgvrhhnvghlsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepjhhonhgrthhhrghnhhesnhhvihguihgrrdgtohhmpdhrtghpthhtohepthhrvgguihhnghesnhhvihgui
 hgrrdgtohhmpdhrtghpthhtohepphhrrggshhgrkhgrrhdrtghsvghnghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvght
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Thierry Reding <treding@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: phylink: add functions
 to block/unblock rx clock stop
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

Hello Russell,

On Wed, 05 Mar 2025 18:00:39 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Some MACs require the PHY receive clock to be running to complete setup
> actions. This may fail if the PHY has negotiated EEE, the MAC supports
> receive clock stop, and the link has entered LPI state. Provide a pair
> of APIs that MAC drivers can use to temporarily block the PHY disabling
> the receive clock.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

I only have comments on the implementation, see below :)

> ---
>  drivers/net/phy/phylink.c | 50 +++++++++++++++++++++++++++++++++++++++
>  include/linux/phylink.h   |  3 +++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index a3b186ab3854..8f93b597d019 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -88,6 +88,7 @@ struct phylink {
>  	bool mac_enable_tx_lpi;
>  	bool mac_tx_clk_stop;
>  	u32 mac_tx_lpi_timer;
> +	u8 mac_rx_clk_stop_blocked;
>  
>  	struct sfp_bus *sfp_bus;
>  	bool sfp_may_have_phy;
> @@ -2592,6 +2593,55 @@ void phylink_stop(struct phylink *pl)
>  }
>  EXPORT_SYMBOL_GPL(phylink_stop);
>  
> +
> +void phylink_rx_clk_stop_block(struct phylink *pl)
> +{
> +	ASSERT_RTNL();
> +
> +	if (pl->mac_rx_clk_stop_blocked == U8_MAX) {
> +		phylink_warn(pl, "%s called too many times - ignoring\n",
> +			     __func__);
> +		dump_stack();
> +		return;
> +	}
> +
> +	/* Disable PHY receive clock stop if this is the first time this
> +	 * function has been called and clock-stop was previously enabled.
> +	 */
> +	if (pl->mac_rx_clk_stop_blocked++ == 0 &&
> +	    pl->mac_supports_eee_ops && pl->phydev)
> +	    pl->config->eee_rx_clk_stop_enable)

Looks like there's an extra closing ')' here

> +		phy_eee_rx_clock_stop(pl->phydev, false);
> +}

Do you need an EXPORT_SYMBOL_GPL here as this will be used by MAC
drivers?

> +
> +/**
> + * phylink_rx_clk_stop_unblock() - unblock PHY ability to stop receive clock
> + * @pl: a pointer to a &struct phylink returned from phylink_create()
> + *
> + * All calls to phylink_rx_clk_stop_block() must be balanced with a
> + * corresponding call to phylink_rx_clk_stop_unblock() to restore the PHYs
> + * clock stop ability.
> + */
> +void phylink_rx_clk_stop_unblock(struct phylink *pl)
> +{
> +	ASSERT_RTNL();
> +
> +	if (pl->mac_rx_clk_stop_blocked == 0) {
> +		phylink_warn(pl, "%s called too many times - ignoring\n",
> +			     __func__);
> +		dump_stack();
> +		return;
> +	}
> +
> +	/* Re-enable PHY receive clock stop if the number of unblocks matches
> +	 * the number of calls to the block function above.
> +	 */
> +	if (--pl->mac_rx_clk_stop_blocked == 0 &&
> +	    pl->mac_supports_eee_ops && pl->phydev &&
> +	    pl->config->eee_rx_clk_stop_enable)
> +		phy_eee_rx_clock_stop(pl->phydev, true);
> +}

Same for the EXPORT_SYMBOL_GPL

Thanks,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
