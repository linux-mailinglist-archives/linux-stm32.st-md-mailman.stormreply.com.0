Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6hasJHWXdmnmSgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 25 Jan 2026 23:21:41 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F169482AA0
	for <lists+linux-stm32@lfdr.de>; Sun, 25 Jan 2026 23:21:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8594C8F269;
	Sun, 25 Jan 2026 22:16:34 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E57D1C87ED5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 Jan 2026 22:16:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F3C726011E;
 Sun, 25 Jan 2026 22:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27ABFC19425;
 Sun, 25 Jan 2026 22:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769379392;
 bh=6tZOcoDzLjLZcLcPdF7/WrSy+zSdMZm9sx0zi040qLs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mhAo3cqiV3m5SxW526CCIL5J+nR3v9o0BKXcdtdln/txsFUNcEtkPC9z86vdxHAHs
 /j45rTwFWkBzTS6CTNz7S9PnQylV6tPQBA1wTY47zsmbFIHhyj+Ddm1/kq87McwBbH
 UIjNYuWt+q5z7OSRQXXgWmOv9pxjoHLfCLA4iswiDqAyUbnaVqgVxD0tAP0CZgDZzE
 nNlHu3drq4RpNMHdqAj3pNq2laOHJonC8+u5XfUA6LDEFW7bCAv680sTJXwKT7WZaC
 5rYjAl9yw68Vy4lh6j5Cr9n4TkHYx6CU7H3mrViRLVGz1wBR9o35l2gBHx7U3UrlbP
 l/fctiky0mCtQ==
From: Jakub Kicinski <kuba@kernel.org>
To: rmk+kernel@armlinux.org.uk
Date: Sun, 25 Jan 2026 14:16:31 -0800
Message-ID: <20260125221631.3396200-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vjEvF-00000005ghI-3CYC@rmk-PC.armlinux.org.uk>
References: <E1vjEvF-00000005ghI-3CYC@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: andrew@lunn.ch, heiko@sntech.de, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, Jakub Kicinski <kuba@kernel.org>,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next,
	18/21] net: stmmac: rk: rk3328: gmac2phy only supports RMII
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,linux.dev:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: F169482AA0
X-Rspamd-Action: no action

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: rk: rk3506, rk3528 and kk3588 have rmii_mode in clock register

This commit consolidates RMII mode configuration for rk3506, rk3528, and
rk3588 by adding a rmii_mode_mask field to rk_clock_fields, removing the
per-SoC set_to_rmii() functions, and adding common code in rk_gmac_powerup()
to write this field.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index ebbc09ea572a..759deb66ef2a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

[ ... ]

> @@ -1412,6 +1385,15 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
>  			return ret;
>  	}

The code above (not shown in the diff, but present in the function) is:

    ret = rk_get_phy_intf_sel(bsp_priv->phy_iface);
    ...
    if (bsp_priv->gmac_phy_intf_sel_mask ||
        bsp_priv->gmac_rmii_mode_mask) {
        ...
        ret = regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);
        if (ret < 0)
            return ret;
    }

At this point, if the block above executed, ret holds the return value from
regmap_write() (0 on success), not the interface selector.

> +	if (bsp_priv->clock.rmii_mode_mask) {
> +		val = rk_encode_wm16(ret == PHY_INTF_SEL_RMII,
> +				     bsp_priv->clock.rmii_mode_mask);

For rk3588, both gmac_phy_intf_sel_mask and clock.rmii_mode_mask are set in
rk3588_init(). When the preceding block executes, it overwrites ret with
the regmap_write() return value. Then here, ret == PHY_INTF_SEL_RMII
compares 0 == 4 which is always false, so the rmii_mode bit will never be
set for rk3588 in RMII mode.

Should ret be saved before the preceding block so its original value
(the interface selector) can be used here?

> +
> +		ret = rk_write_clock_grf_reg(bsp_priv, val);
> +		if (ret < 0)
> +			return ret;
> +	}

[ ... ]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
