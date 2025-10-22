Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD919BFC60A
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Oct 2025 16:06:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C13CC58D4D;
	Wed, 22 Oct 2025 14:06:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5549C57B7B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 14:06:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id ED47E4E4127B;
 Wed, 22 Oct 2025 14:06:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C0FC1606DC;
 Wed, 22 Oct 2025 14:06:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 87CC2102F2432; 
 Wed, 22 Oct 2025 16:06:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761141966; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Ga2wjic9T8VzJuXCWKH+Uj/T9PGjvabNwcCK7WxQpK0=;
 b=uhgD8tnXycbKWWz5/zQAf9epeYRRcbjwqUoYWkhSy+Q7x5JzjSwiDg4V1UBIqksCE44Q/A
 hweWz1G8s6OwRRYaQFO25S/OcoQjoL7mdqn7RQXBY2tlc1fC+ONVDuEdwwe7bsO2F3h9lo
 H5PzwXHW8NeYz3TVLMrpmGK855qDx7pf5wCqJ/Bftal8BNMjLD8iOzOrh+jQQBtxF27td3
 ASxenBJlVqMtIyleCBai2rQPTb16hBit41QDcxU8ja5nWvQvHUCry9UGBrhKabn3Ixy5ln
 w5EzkMIAHgrO86PS2sp3SbM10IjWv8rlZmnir+b08i3EbNptabQ62SVpIm71MQ==
Message-ID: <6bff48d0-dd19-48d4-91e6-0d991365b8f9@bootlin.com>
Date: Wed, 22 Oct 2025 16:06:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCT-0000000B2Ob-1yo3@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1v9jCT-0000000B2Ob-1yo3@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 3/6] net: phylink: add phylink
 managed MAC Wake-on-Lan support
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



On 17/10/2025 14:04, Russell King (Oracle) wrote:
> Add core phylink managed Wake-on-Lan support, which is enabled when the
> MAC driver fills in the new .mac_wol_set() method that this commit
> creates.
> 
> When this feature is disabled, phylink acts as it has in the past,
> merely passing the ethtool WoL calls to phylib whenever a PHY exists.
> No other new functionality provided by this commit is enabled.
> 
> When this feature is enabled, a more inteligent approach is used.
> Phylink will first pass WoL options to the PHY, read them back, and
> attempt to set any options that were not set at the PHY at the MAC.
> 
> Since we have PHY drivers that report they support WoL, and accept WoL
> configuration even though they aren't wired up to be capable of waking
> the system, we need a way to differentiate between PHYs that think
> they support WoL and those which actually do. As PHY drivers do not
> make use of the driver model's wake-up infrastructure, but could, we
> use this to determine whether PHY drivers can participate. This gives
> a path forward where, as MAC drivers are converted to this, it
> encourages PHY drivers to also be converted.
> 
> Phylink will also ignore the mac_wol argument to phylink_suspend() as
> it now knows the WoL state at the MAC.
> 
> MAC drivers are expected to record/configure the Wake-on-Lan state in
> their .mac_set_wol() method, and deal appropriately with it in their
> suspend/resume methods. The driver model provides assistance to set the
> IRQ wake support which may assist driver authors in achieving the
> necessary configuration.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/phy/phylink.c | 80 +++++++++++++++++++++++++++++++++++++--
>  include/linux/phylink.h   | 26 +++++++++++++
>  2 files changed, 102 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 9d7799ea1c17..939438a6d6f5 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -93,6 +93,9 @@ struct phylink {
>  	u8 sfp_port;
>  
>  	struct eee_config eee_cfg;
> +
> +	u32 wolopts_mac;
> +	u8 wol_sopass[SOPASS_MAX];
>  };
>  
>  #define phylink_printk(level, pl, fmt, ...) \
> @@ -2562,6 +2565,17 @@ void phylink_rx_clk_stop_unblock(struct phylink *pl)
>  }
>  EXPORT_SYMBOL_GPL(phylink_rx_clk_stop_unblock);
>  
> +static bool phylink_mac_supports_wol(struct phylink *pl)
> +{
> +	return !!pl->mac_ops->mac_wol_set;
> +}
> +
> +static bool phylink_phy_supports_wol(struct phylink *pl,
> +				     struct phy_device *phydev)
> +{
> +	return phydev && (pl->config->wol_phy_legacy || phy_can_wakeup(phydev));
> +}
> +
>  /**
>   * phylink_suspend() - handle a network device suspend event
>   * @pl: a pointer to a &struct phylink returned from phylink_create()
> @@ -2575,11 +2589,17 @@ EXPORT_SYMBOL_GPL(phylink_rx_clk_stop_unblock);
>   *   can also bring down the link between the MAC and PHY.
>   * - If Wake-on-Lan is active, but being handled by the MAC, the MAC
>   *   still needs to receive packets, so we can not bring the link down.
> + *
> + * Note: when phylink managed Wake-on-Lan is in use, @mac_wol is ignored.
> + * (struct phylink_mac_ops.mac_set_wol populated.)
>   */
>  void phylink_suspend(struct phylink *pl, bool mac_wol)
>  {
>  	ASSERT_RTNL();
>  
> +	if (phylink_mac_supports_wol(pl))
> +		mac_wol = !!pl->wolopts_mac;
> +
>  	if (mac_wol && (!pl->netdev || pl->netdev->ethtool->wol_enabled)) {
>  		/* Wake-on-Lan enabled, MAC handling */
>  		mutex_lock(&pl->state_mutex);
> @@ -2689,8 +2709,24 @@ void phylink_ethtool_get_wol(struct phylink *pl, struct ethtool_wolinfo *wol)
>  	wol->supported = 0;
>  	wol->wolopts = 0;
>  
> -	if (pl->phydev)
> -		phy_ethtool_get_wol(pl->phydev, wol);
> +	if (phylink_mac_supports_wol(pl)) {
> +		if (phylink_phy_supports_wol(pl, pl->phydev))
> +			phy_ethtool_get_wol(pl->phydev, wol);
> +
> +		/* Where the MAC augments the WoL support, merge its support and
> +		 * current configuration.
> +		 */
> +		if (~wol->wolopts & pl->wolopts_mac & WAKE_MAGICSECURE)
> +			memcpy(wol->sopass, pl->wol_sopass,
> +			       sizeof(wol->sopass));
> +
> +		wol->supported |= pl->config->wol_mac_support;
> +		wol->wolopts |= pl->wolopts_mac;
> +	} else {
> +		/* Legacy */
> +		if (pl->phydev)
> +			phy_ethtool_get_wol(pl->phydev, wol);
> +	}
>  }
>  EXPORT_SYMBOL_GPL(phylink_ethtool_get_wol);
>  
> @@ -2707,12 +2743,48 @@ EXPORT_SYMBOL_GPL(phylink_ethtool_get_wol);
>   */
>  int phylink_ethtool_set_wol(struct phylink *pl, struct ethtool_wolinfo *wol)
>  {
> +	struct ethtool_wolinfo w;
>  	int ret = -EOPNOTSUPP;
> +	bool changed;
> +	u32 wolopts;
>  
>  	ASSERT_RTNL();
>  
> -	if (pl->phydev)
> -		ret = phy_ethtool_set_wol(pl->phydev, wol);
> +	if (phylink_mac_supports_wol(pl)) {
> +		wolopts = wol->wolopts;
> +
> +		if (phylink_phy_supports_wol(pl, pl->phydev)) {
> +			ret = phy_ethtool_set_wol(pl->phydev, wol);
> +			if (ret != 0 && ret != -EOPNOTSUPP)
> +				return ret;
> +
> +			phy_ethtool_get_wol(pl->phydev, &w);
> +
> +			/* Any Wake-on-Lan modes which the PHY is handling
> +			 * should not be passed on to the MAC.
> +			 */
> +			wolopts &= ~w.wolopts;

When PHY drivers gets converted to the new model, we'll have to look at
how the .get_wol() behave WRT how they fill-in their wolopts.

The Broadcom driver for example may not set w.wolopts to 0 :

  https://elixir.bootlin.com/linux/v6.17.4/source/drivers/net/phy/broadcom.c#L1121

You'd probably end-up with garbage here then. But not blocking for your series.

> +		}
> +
> +		wolopts &= pl->config->wol_mac_support;
> +		changed = pl->wolopts_mac != wolopts;
> +		if (wolopts & WAKE_MAGICSECURE)
> +			changed |= !!memcmp(wol->sopass, pl->wol_sopass,
> +					    sizeof(wol->sopass));
> +		memcpy(pl->wol_sopass, wol->sopass, sizeof(pl->wol_sopass));
> +
> +		if (changed) {
> +			ret = pl->mac_ops->mac_wol_set(pl->config, wolopts,
> +						       wol->sopass);
> +			if (!ret)
> +				pl->wolopts_mac = wolopts;
> +		} else {
> +			ret = 0;
> +		}
> +	} else {
> +		if (pl->phydev)
> +			ret = phy_ethtool_set_wol(pl->phydev, wol);
> +	}
>  
>  	return ret;
>  }
> diff --git a/include/linux/phylink.h b/include/linux/phylink.h
> index 9af0411761d7..59cb58b29d1d 100644
> --- a/include/linux/phylink.h
> +++ b/include/linux/phylink.h
> @@ -156,6 +156,8 @@ enum phylink_op_type {
>   * @lpi_capabilities: MAC speeds which can support LPI signalling
>   * @lpi_timer_default: Default EEE LPI timer setting.
>   * @eee_enabled_default: If set, EEE will be enabled by phylink at creation time
> + * @wol_phy_legacy: Use Wake-on-Lan with PHY even if phy_can_wakeup() is false
> + * @wol_mac_support: Bitmask of MAC supported %WAKE_* options
>   */
>  struct phylink_config {
>  	struct device *dev;
> @@ -173,6 +175,10 @@ struct phylink_config {
>  	unsigned long lpi_capabilities;
>  	u32 lpi_timer_default;
>  	bool eee_enabled_default;
> +
> +	/* Wake-on-Lan support */
> +	bool wol_phy_legacy;
> +	u32 wol_mac_support;
>  };
>  
>  void phylink_limit_mac_speed(struct phylink_config *config, u32 max_speed);
> @@ -188,6 +194,7 @@ void phylink_limit_mac_speed(struct phylink_config *config, u32 max_speed);
>   * @mac_link_up: allow the link to come up.
>   * @mac_disable_tx_lpi: disable LPI.
>   * @mac_enable_tx_lpi: enable and configure LPI.
> + * @mac_wol_set: configure Wake-on-Lan settings at the MAC.
>   *
>   * The individual methods are described more fully below.
>   */
> @@ -211,6 +218,9 @@ struct phylink_mac_ops {
>  	void (*mac_disable_tx_lpi)(struct phylink_config *config);
>  	int (*mac_enable_tx_lpi)(struct phylink_config *config, u32 timer,
>  				 bool tx_clk_stop);
> +
> +	int (*mac_wol_set)(struct phylink_config *config, u32 wolopts,
> +			   const u8 *sopass);
>  };
>  
>  #if 0 /* For kernel-doc purposes only. */
> @@ -440,6 +450,22 @@ void mac_disable_tx_lpi(struct phylink_config *config);
>   */
>  int mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
>  		      bool tx_clk_stop);
> +
> +/**
> + * mac_wol_set() - configure the Wake-on-Lan parameters
> + * @config: a pointer to a &struct phylink_config.
> + * @wolopts: Bitmask of %WAKE_* flags for enabled Wake-On-Lan modes.
> + * @sopass: SecureOn(tm) password; meaningful only for %WAKE_MAGICSECURE
> + *
> + * Enable the specified Wake-on-Lan options at the MAC. Options that the
> + * PHY can handle will have been removed from @wolopts.
> + *
> + * The presence of this method enables phylink-managed WoL support.
> + *
> + * Returns: 0 on success.
> + */
> +int (*mac_wol_set)(struct phylink_config *config, u32 wolopts,
> +		   const u8 *sopass);
>  #endif
>  
>  struct phylink_pcs_ops;

As far as my current WoL knowedge goes, this looks good to me.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
