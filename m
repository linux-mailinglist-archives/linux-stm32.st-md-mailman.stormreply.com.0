Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F24D3B727
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jan 2026 20:22:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7CCAC36B3C;
	Mon, 19 Jan 2026 19:22:55 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEFA5C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 19:22:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E3B856014A;
 Mon, 19 Jan 2026 19:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5C3C116C6;
 Mon, 19 Jan 2026 19:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768850573;
 bh=2LdEtzd4yY/cOLWnRNwnA2H0y8xNK5Tws6k5kwhhDHw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I7N09X08cA5BT8y2j+GVNAp0K6LCAHFqyyYBiJdDWO/rzKGZlm1JfL6QYjE+TK9m0
 y60IDssQIheI3yyf+58W8t8wtwGr8N1xJmWq9HjoijJpJmm6uk2Fo+nAjYfgsJTeyI
 G1C7UTub7M3prpafX8BysuxFLyfE4tOpWGbyQiWRP47OWEsBKmnFCPPfIYPRmcuOUK
 XcL5zXHSAPMCVdW+WSmTP1kQAzCe1dyjqJlnp+Z0EH1bOxmCRj+H4nJn6Pk9MK4DPS
 S7ZaOxegEty1GYlo6RSKlcrJtOaOdMxE9u6tBPDI55j8JkUuldjCyaMmbSK6K/RqEq
 NEJb1Ik5WTe5Q==
From: Jakub Kicinski <kuba@kernel.org>
To: rmk+kernel@armlinux.org.uk
Date: Mon, 19 Jan 2026 11:21:35 -0800
Message-ID: <20260119192135.1245138-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vhoSr-00000005H2N-2H2L@rmk-PC.armlinux.org.uk>
References: <E1vhoSr-00000005H2N-2H2L@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: neil.armstrong@linaro.org, mohd.anwar@oss.qualcomm.com, vkoul@kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, andrew@lunn.ch,
 mcoquelin.stm32@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next,
	12/14] net: stmmac: add support for reading inband SGMII status
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
net: stmmac: add support for reading inband SGMII status

This patch adds support for reading link status, speed, and duplex for
SGMII links from the RGSMII status register. New fields are added to
stmmac_pcs_info and stmmac_pcs structures for the register offset and mask.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> index 73fc56ce5e55..9dd7e78cfbc4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c

[ ... ]

> @@ -111,7 +121,37 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
>
>  		phylink_mii_c22_pcs_decode_state(state, neg_mode, status, lpa);
>  	} else {
> -		state->link = false;
> +		rgsmii = field_get(spcs->rgsmii_status_mask,
> +				   readl(spcs->rgsmii));
                                   ^^^^

When dwmac1000_pcs_init() or dwmac4_pcs_init() is used, the pcs_info
structures do not initialize the new rgsmii_offset and rgsmii_status_mask
fields. For example, dwmac4_pcs_info in dwmac4_core.c only sets:

    static const struct stmmac_pcs_info dwmac4_pcs_info = {
        .pcs_offset = GMAC_PCS_BASE,
        .int_mask = GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE,
    };

This leaves rgsmii_status_mask implicitly zero. Calling field_get() with a
mask of zero violates its API contract (mask must be non-zero) and results
in undefined behavior from __ffs(0).

Should the existing dwmac1000_pcs_info and dwmac4_pcs_info structures be
updated to provide proper values for the new fields? Or should there be a
guard check before calling field_get() when rgsmii_status_mask is zero?

> +
> +		state->link = status & BMSR_LSTATUS &&
> +			      rgsmii & GMAC_RGSMIII_LNKSTS;

[ ... ]

> @@ -205,6 +245,8 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv,
>
>  	spcs->priv = priv;
>  	spcs->base = priv->ioaddr + pcs_info->pcs_offset;
> +	spcs->rgsmii = priv->ioaddr + pcs_info->rgsmii_offset;
> +	spcs->rgsmii_status_mask = pcs_info->rgsmii_status_mask;

The values are copied from pcs_info here, but dwmac1000_pcs_info and
dwmac4_pcs_info do not initialize these fields.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> index a7c71f40f952..f9e7a7ed840b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> @@ -29,12 +29,16 @@ struct stmmac_priv;
>
>  struct stmmac_pcs_info {
>  	unsigned int pcs_offset;
> +	unsigned int rgsmii_offset;
> +	u32 rgsmii_status_mask;
>  	u32 int_mask;
>  };

These new fields need to be initialized by all users of stmmac_pcs_info.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
