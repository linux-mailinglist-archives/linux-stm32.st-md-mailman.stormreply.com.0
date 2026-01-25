Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZHWrInWXdmnkSgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 25 Jan 2026 23:21:41 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6BD82A9F
	for <lists+linux-stm32@lfdr.de>; Sun, 25 Jan 2026 23:21:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCE51C87EDD;
	Sun, 25 Jan 2026 22:16:31 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4F5FC87EDD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 Jan 2026 22:16:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B1A9F600C3;
 Sun, 25 Jan 2026 22:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E478AC16AAE;
 Sun, 25 Jan 2026 22:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769379389;
 bh=d0e6wGR5CvLacjw6Dk5QUSRgUBj7IzlbzM3eQMWWIE4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dJ2VaWe9Y681uA5O6VXiK85/AuwwpVof+DzkmFwm5UjvHuE6pywUzUvbVAVvOXG9l
 hfwQi9rV09LguQ+rVHfvrDcDP6YSxfApFjuMrydLFiQonchAFn2tRes4gM0d6+UyZU
 dW0vnCZjSE5R1FACd/AZN94Rzc8fBePyCwj8e02cLWvaF5lhQpnRzsL5mTsd3yyZay
 Ht5v6d9voDwxlVedzgNIlVB0UA/Bqe+yW6MJdfp1dsH05KSmnmJgcxTE3FKNu+K3Do
 yLa4swLHRjCesVqles3HfHIx6KR6dMZFmPjLGp9PnykUiMtH8pbTWHFeRUv5uwCy8X
 oyLyoEBWa5sQA==
From: Jakub Kicinski <kuba@kernel.org>
To: rmk+kernel@armlinux.org.uk
Date: Sun, 25 Jan 2026 14:16:27 -0800
Message-ID: <20260125221627.3396138-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vjEuL-00000005ggE-1z5W@rmk-PC.armlinux.org.uk>
References: <E1vjEuL-00000005ggE-1z5W@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: andrew@lunn.ch, heiko@sntech.de, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, Jakub Kicinski <kuba@kernel.org>,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next,
	07/21] net: stmmac: rk: convert to mask-based interface mode
	configuration
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,linux.dev:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: EC6BD82A9F
X-Rspamd-Action: no action

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: rk: convert to mask-based interface mode configuration

This patch consolidates PHY interface mode configuration into a common
infrastructure. It introduces mask fields for phy_intf_sel and rmii_mode,
and moves the register writes from SoC-specific set_to_rgmii/set_to_rmii
functions into the common rk_gmac_powerup() function.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 4117f6863ff0..48fc5b58092f 100644

[ ... ]

> @@ -1198,9 +1225,6 @@ static const struct rk_gmac_ops rk3576_ops = {
>  #define RK3588_GRF_GMAC_CON0			0X0008
>  #define RK3588_GRF_CLK_CON1			0X0070

The comment above these defines says "/* php_grf */" indicating that
RK3588_GRF_GMAC_CON0 is in the php_grf register space.

[ ... ]

> +static int rk3588_init(struct rk_priv_data *bsp_priv)
> +{
> +	switch (bsp_priv->id) {
> +	case 0:
> +		bsp_priv->gmac_phy_intf_sel_mask = GENMASK_U16(5, 3);
> +		return 0;
> +
> +	case 1:
> +		bsp_priv->gmac_phy_intf_sel_mask = GENMASK_U16(11, 9);
> +		return 0;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}

[ ... ]

> @@ -1296,10 +1330,14 @@ static void rk3588_set_clock_selection(struct rk_priv_data *bsp_priv, bool input
>  }
>
>  static const struct rk_gmac_ops rk3588_ops = {
> +	.init = rk3588_init,
>  	.set_to_rgmii = rk3588_set_to_rgmii,
>  	.set_to_rmii = rk3588_set_to_rmii,
>  	.set_speed = rk3588_set_gmac_speed,
>  	.set_clock_selection = rk3588_set_clock_selection,
> +
> +	.gmac_grf_reg = RK3588_GRF_GMAC_CON0,

rk3588_ops sets gmac_grf_reg to RK3588_GRF_GMAC_CON0, and rk3588_init()
sets gmac_phy_intf_sel_mask. This enables the new common code path in
rk_gmac_powerup().

[ ... ]

> @@ -1664,6 +1707,24 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
>  	if (ret)
>  		return ret;
>
> +	ret = rk_get_phy_intf_sel(bsp_priv->phy_iface);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (bsp_priv->gmac_phy_intf_sel_mask ||
> +	    bsp_priv->gmac_rmii_mode_mask) {
> +		/* If defined, encode the phy_intf_sel value */
> +		val = rk_encode_wm16(ret, bsp_priv->gmac_phy_intf_sel_mask);
> +
> +		/* If defined, encode the RMII mode mask setting. */
> +		val |= rk_encode_wm16(ret == PHY_INTF_SEL_RMII,
> +				      bsp_priv->gmac_rmii_mode_mask);
> +
> +		ret = regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);
                                          ^^^^

For rk3588, does this write to the wrong regmap? The old code in
rk3588_set_to_rgmii() and rk3588_set_to_rmii() wrote the PHY_INTF_SEL
register to bsp_priv->php_grf:

    regmap_write(bsp_priv->php_grf, RK3588_GRF_GMAC_CON0,
                 RK3588_GMAC_PHY_INTF_SEL(id, PHY_INTF_SEL_RGMII));

But the new common code writes to bsp_priv->grf instead. The comment in
the source indicates RK3588_GRF_GMAC_CON0 is in the php_grf register
space. Should this be using php_grf for rk3588?

> +		if (ret < 0)
> +			return ret;
> +	}
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
