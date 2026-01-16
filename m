Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0184AD2A71C
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jan 2026 03:58:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C21B1C8F290;
	Fri, 16 Jan 2026 02:58:57 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 032F6C8F290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jan 2026 02:58:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C331C43300;
 Fri, 16 Jan 2026 02:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4182C116D0;
 Fri, 16 Jan 2026 02:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768532334;
 bh=J/VRZLz5Y13tzcUGlFZbC7tPCdmM0aLjt2QZN4qLbrg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FdOT9TPHU+LhbSrLGTtlmmXFRb1e6bgdCDXom0+7F83Nhzdx6GFQHbHoylT0WRGhY
 3vMt2nNaJi45xR+kJ2+XJtImNvh78p9oakYeN86wlMKpA7MvPvL4uo+5mrEJhJ6Lul
 /OUfOOLRHeEZZgXKS1wojHxAezR6vin9l7vDm6r693cNm9+oUpKs2qUO5/8pjyJkyK
 rTHvDrxtGqo9p/M3HlKefCnRkiqpfb8QFjA08pSNQ+aDQKMTmKqjdYN731LjtAe09N
 f8rpw+Bqo1v9arayO+ZjUyuMTbvS3iKqICfyMJXr6Jz6m4NZmOrUnfR8ffVqWuQ6oY
 zkDxxmGBLUocQ==
From: Jakub Kicinski <kuba@kernel.org>
To: rmk+kernel@armlinux.org.uk
Date: Thu, 15 Jan 2026 18:58:52 -0800
Message-ID: <20260116025852.354716-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vg4wc-00000003SGl-1dZi@rmk-PC.armlinux.org.uk>
References: <E1vg4wc-00000003SGl-1dZi@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: konrad.dybcio@oss.qualcomm.com, andrew@lunn.ch, mohd.anwar@oss.qualcomm.com,
 edumazet@google.com, neil.armstrong@linaro.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 vkoul@kernel.org, mcoquelin.stm32@gmail.com, linux-arm-msm@vger.kernel.org,
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

This commit adds support for reading link status, speed, and duplex for
SGMII links from the RGSMII status register.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> index 73fc56ce5e55..12fc5038d913 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c

[ ... ]

> @@ -97,7 +107,7 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
>  					   struct phylink_link_state *state)
>  {
>  	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> -	u32 status, lpa;
> +	u32 status, lpa, rgsmii;
>
>  	status = readl(spcs->base + GMAC_AN_STATUS);
>
> @@ -111,7 +121,35 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
>
>  		phylink_mii_c22_pcs_decode_state(state, neg_mode, status, lpa);
>  	} else {
> -		state->link = false;
> +		rgsmii = field_get(spcs->rgsmii_status_mask,
> +				   readl(spcs->rgsmii));
> +		state->link = !!(status & GMAC_RGSMIII_LNKSTS);
                            ^^^^^^

Should this be checking rgsmii instead of status here? The status
variable contains the GMAC_AN_STATUS register which is equivalent to
MII_BMSR according to the comment at line 7. In BMSR, the link status
bit is BMSR_LSTATUS (bit 2), not bit 3.

GMAC_RGSMIII_LNKSTS is defined as BIT(3), which is the correct bit
position for the RGSMII status register (matching GMAC_RGSMIIIS_LNKSTS
in dwmac1000.h), but it appears to be applied to the wrong register
variable.

The code later uses rgsmii correctly for speed and duplex extraction.
Was the intent to use rgsmii for the link status check as well?

> +
> +		if (state->link && neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) {

[ ... ]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
