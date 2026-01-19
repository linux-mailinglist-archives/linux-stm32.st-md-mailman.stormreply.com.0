Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC3FD3B724
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jan 2026 20:21:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C71EDC36B3C;
	Mon, 19 Jan 2026 19:21:37 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4393C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 19:21:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 851EA600CB;
 Mon, 19 Jan 2026 19:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6584DC116C6;
 Mon, 19 Jan 2026 19:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768850495;
 bh=bTvnpQwyMWeQprejsCLPF19PUoNVMU+Bj/o+xuFRyPw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RhYHaSve1QmWIrv5TyLGaTbwpfcsUaMF8FmzVrt0/wMD7H60mLj0P0CBONBIlAk6s
 2MgpJYvIMV7hr9yTFTfVZPsAthBZKM5rvBncUfeuowcaSgkSHprRyQjAIxq2cHizxO
 iOClmclqVBvGQ4Ccloghkcpp1igKQnhoCD14gXvLRsI9ktg+aa8Ae+uagcSBh5lXCj
 ga5CJxyB8jFbJrpTJ44TqoMj/+MFMo2cCAr94PZY4Aap4TArOrQOgR/5C4KKNVvwJ6
 8aiS8FbuE4ysLrue1Ekh2MSuivawyRRIG4ad5DRekXMoDopYCtF5Z+Ocg2SkgN8cr2
 mjoSI+jRrDnNw==
From: Jakub Kicinski <kuba@kernel.org>
To: rmk+kernel@armlinux.org.uk
Date: Mon, 19 Jan 2026 11:21:25 -0800
Message-ID: <20260119192125.1245102-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: neil.armstrong@linaro.org, mohd.anwar@oss.qualcomm.com, vkoul@kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, andrew@lunn.ch,
 mcoquelin.stm32@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next,
	05/14] net: stmmac: add stmmac core serdes support
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: add stmmac core serdes support

This commit adds SerDes PHY support to the stmmac core driver, moving it
from platform glue into the integrated PCS driver. The SerDes is managed
through phy_init/phy_exit for lifecycle and phy_power_on/phy_power_off
for the power state.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> index 2f826fe7229b..4d1902f3a58f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c

[ ... ]

> static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
> {
> 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> +	struct stmmac_priv *priv = spcs->priv;
> +	int ret;
>
> -	stmmac_mac_irq_modify(spcs->priv, 0, spcs->int_mask);
> +	ret = dwmac_serdes_power_on(priv);
> +	if (ret)
> +		return ret;
> +
> +	if (spcs->interface != PHY_INTERFACE_MODE_NA) {
> +		ret = dwmac_serdes_set_mode(priv, spcs->interface);
> +		if (ret)
> +			return ret;
                        ^^^^^^^^^^

If dwmac_serdes_set_mode() fails here, doesn't this leave the SerDes in
a powered-on state? dwmac_serdes_power_on() succeeded at this point but
there's no corresponding dwmac_serdes_power_off() call before returning
the error.

Looking at phylink_major_config(), it appears to discard the return
value from phylink_pcs_enable(), so the caller won't know to call
pcs_disable() to clean up the power state.

Should this be something like:

    if (spcs->interface != PHY_INTERFACE_MODE_NA) {
        ret = dwmac_serdes_set_mode(priv, spcs->interface);
        if (ret) {
            dwmac_serdes_power_off(priv);
            return ret;
        }
    }

> +	}
> +
> +	stmmac_mac_irq_modify(priv, 0, spcs->int_mask);
>
> 	return 0;
> }

[ ... ]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
