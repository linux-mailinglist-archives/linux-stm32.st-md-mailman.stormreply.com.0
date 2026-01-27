Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4L4tM6EJeGk2ngEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 01:41:05 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCADE8E846
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 01:41:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80E48C3F945;
	Tue, 27 Jan 2026 00:41:05 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5263BC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 00:41:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8F0FA60141;
 Tue, 27 Jan 2026 00:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD50EC16AAE;
 Tue, 27 Jan 2026 00:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769474463;
 bh=dtMq2dGqlL8iuDbPHgE+yg8+ta+2jgFx0lXwCi1sJLE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=amHPgMvjw6CwyQLu+V9jsG5c7pyu4QX0j8a+GP9muiPRJrHh9GC60/6nHhoxtscU8
 r+aZgdg2QHrCzivJsePMI03Nc05C4mCnROWb6TbdWxfnoNxfQgcdf6Dgz8lFNT4z0T
 ftQCrrq9z50slvQFvpk6eTz6FBeFGbOTJWANIAUBLYl/cixixaO+Ri/lXuxbNYJZMQ
 sI2iNg8uIHUInJ2vI3q2cm1c8/2HGbVrKt5tEcIPZHnwkUUVcygDqZfnWPWlAnN2/j
 juq/C8lXafcN4elHhrQ0DztJc07jEMHfqF2jJ/fh/ZvswAnG3yger7LwVRf6KzZvsW
 Zi01OPNwmXOrQ==
From: Jakub Kicinski <kuba@kernel.org>
To: rmk+kernel@armlinux.org.uk
Date: Mon, 26 Jan 2026 16:41:01 -0800
Message-ID: <20260127004101.3785871-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vkL3N-00000005uuA-2GnK@rmk-PC.armlinux.org.uk>
References: <E1vkL3N-00000005uuA-2GnK@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: andrew@lunn.ch, heiko@sntech.de, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
 edumazet@google.com, Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next, v2,
	21/22] net: stmmac: rk: use rk_encode_wm16() for clock selection
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
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:netdev@vger.kernel.org,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: BCADE8E846
X-Rspamd-Action: no action

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: rk: use rk_encode_wm16() for clock selection

This commit refactors the per-SoC set_clock_selection() method into
unified helper functions using rk_encode_wm16(), with mask-based
configuration stored in struct rk_clock_fields.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 26fc93854cb0..443d3bd62cae 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

[ ... ]

> @@ -1000,25 +991,23 @@ static const struct rk_gmac_ops rk3576_ops = {
>  #define RK3588_GMAC_CLK_RMII_MODE(id)		GRF_BIT(5 * (id))
>  #define RK3588_GMAC_CLK_RGMII_MODE(id)		GRF_CLR_BIT(5 * (id))
>
> -#define RK3588_GMAC_CLK_SELECT_CRU(id)		GRF_BIT(5 * (id) + 4)
> -#define RK3588_GMAC_CLK_SELECT_IO(id)		GRF_CLR_BIT(5 * (id) + 4)
> -
> -#define RK3588_GMAC_CLK_RMII_GATE(id)		GRF_BIT(5 * (id) + 1)
> -#define RK3588_GMAC_CLK_RMII_NOGATE(id)		GRF_CLR_BIT(5 * (id) + 1)
> -
>  static int rk3588_init(struct rk_priv_data *bsp_priv)
>  {
>  	switch (bsp_priv->id) {
>  	case 0:
>  		bsp_priv->gmac_phy_intf_sel_mask = GENMASK_U16(5, 3);
> +		bsp_priv->clock.io_clksel_cru_mask = BIT_U16(4);
>  		bsp_priv->clock.gmii_clk_sel_mask = GENMASK_U16(3, 2);
>  		bsp_priv->clock.rmii_clk_sel_mask = BIT_U16(2);
> +		bsp_priv->clock.rmii_gate_en_mask = BIT_U16(1);
>  		return 0;
>
>  	case 1:
>  		bsp_priv->gmac_phy_intf_sel_mask = GENMASK_U16(11, 9);
> +		bsp_priv->clock.io_clksel_cru_mask = BIT_U16(10);
                                                        ^^

Should this be BIT_U16(9) instead of BIT_U16(10)?

The removed macro RK3588_GMAC_CLK_SELECT_CRU(id) used the formula
GRF_BIT(5 * (id) + 4), which for id=1 gives 5*1+4 = bit 9.

The other masks for id=1 follow the 5*(id) pattern correctly:
  - rmii_gate_en_mask = BIT_U16(6)  matches 5*1+1 = 6
  - gmii_clk_sel_mask = GENMASK_U16(8, 7)  matches 5*1+{2,3}
  - rmii_clk_sel_mask = BIT_U16(7)

But io_clksel_cru_mask = BIT_U16(10) does not match 5*1+4 = 9.

>  		bsp_priv->clock.gmii_clk_sel_mask = GENMASK_U16(8, 7);
>  		bsp_priv->clock.rmii_clk_sel_mask = BIT_U16(7);
> +		bsp_priv->clock.rmii_gate_en_mask = BIT_U16(6);
>  		return 0;

[ ... ]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
