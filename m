Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7FMBHXWXdmniSgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 25 Jan 2026 23:21:41 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE31882A9C
	for <lists+linux-stm32@lfdr.de>; Sun, 25 Jan 2026 23:21:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9F2AC8F26F;
	Sun, 25 Jan 2026 22:16:32 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CAB4C8F269
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 Jan 2026 22:16:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2CC2443C6E;
 Sun, 25 Jan 2026 22:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC34C2BC86;
 Sun, 25 Jan 2026 22:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769379391;
 bh=f3JOuPvjWSkZ5OMkpcZPMBzYMykOzPVsEuZRDZjmfrI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nXjfi6DjXDT+vEwmrnTDrefeneyQCEW+WZwgmEKzn38xGlSOO+2cmjTFNuwg4R603
 12t5u2HmnuowyrtWuCvDdWJDMnDl49qtRdVLCjTOjOukCdCcjCrrKM68vD1RoFyzFI
 bOwW9u0mSjkmJq5j4A4PhChil8zodhleWEavBL0NERPAwqPS8n/yKfLAadL/lzzPRG
 7VQyrV0OniqAL9ep3Mm1KWlS2em+XkTeKGIh9gh20VZXfTPZKbI0QZ0QZqo0S8n+8M
 8R44ka8/76H+Q6kWJtih6ovCy4DUZDybt3XOjBoCN1e3oaMnn5McaCxkI+kA17o3w2
 ucZB241H8e4jQ==
From: Jakub Kicinski <kuba@kernel.org>
To: rmk+kernel@armlinux.org.uk
Date: Sun, 25 Jan 2026 14:16:29 -0800
Message-ID: <20260125221629.3396169-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vjEvA-00000005ghD-2i2t@rmk-PC.armlinux.org.uk>
References: <E1vjEvA-00000005ghD-2i2t@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: andrew@lunn.ch, heiko@sntech.de, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, Jakub Kicinski <kuba@kernel.org>,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next,
	17/21] net: stmmac: rk: replace empty set_to_rmii() with
	supports_rmii
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
X-Rspamd-Queue-Id: DE31882A9C
X-Rspamd-Action: no action

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: rk: rk3506, rk3528 and kk3588 have rmii_mode in clock register

This patch consolidates RMII mode configuration for rk3506, rk3528, and
rk3588 by moving the rmii_mode bit writes from per-SoC set_to_rmii()
functions into a centralized block in rk_gmac_powerup().

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index ebbc09ea572a..759deb66ef2a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

[ ... ]

> @@ -1412,6 +1385,15 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
> 			return ret;
> 	}

The context above this hunk is relevant. Earlier in rk_gmac_powerup():

    ret = rk_get_phy_intf_sel(bsp_priv->phy_iface);
    ...
    if (bsp_priv->gmac_phy_intf_sel_mask ||
        bsp_priv->gmac_rmii_mode_mask) {
        ...
        ret = regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);
        ...
    }

At this point, if the first if-block executed, ret has been overwritten by
regmap_write() and will be 0 on success.

> +	if (bsp_priv->clock.rmii_mode_mask) {
> +		val = rk_encode_wm16(ret == PHY_INTF_SEL_RMII,
> +				     bsp_priv->clock.rmii_mode_mask);

For RK3588, both gmac_phy_intf_sel_mask and clock.rmii_mode_mask are set.
The first if-block will execute and overwrite ret with the regmap_write()
return value (0 on success).

When this second if-block runs, ret will be 0 rather than the original
PHY_INTF_SEL_RMII value (which is 4). This means ret == PHY_INTF_SEL_RMII
will always evaluate to false for RK3588, causing the rmii_mode bit to be
cleared instead of set when RMII mode is configured.

Should ret be saved before the first if-block and restored here, or should
a separate variable hold the phy interface selection?

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
