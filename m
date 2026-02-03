Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAmfOVUXgmkDPQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 16:42:13 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AA0DB693
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 16:42:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A265C58D7A;
	Tue,  3 Feb 2026 15:42:13 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8ADC5C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 15:42:11 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-4359249bbacso630776f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Feb 2026 07:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770133331; x=1770738131;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8mRvLOCNLqjVmjiKjh0H9exGu/p/pcpVAXu1Cdl+14Q=;
 b=gVRQOYkhLrGnLWBTNLBLiLfgMKYmxbsZ0hADg1hB9k3khPupbpZgFfmFh3VtXoi4AO
 FWAxfDvENGhdSJjuaIu12a6A3gXfZa8Etul/9xDWvKH1+invvn+ifSgen9K2uuQF9g5C
 PpIIaXHaGpWRNGHVsQ/qIUmjB/8NcC0KmSP2miowy/nLsvVPd7sJZq9Rp8z6e5PpE3Nc
 k0ZRbXbe5io4tBZsaUqEZqm1VqeL0dVYIDxAJP3IORmElMUL2HJ8+G4KSbzHd0W7ji43
 QRvg4T0Pz5BMIknfQhPuWELqD0i+aPXRXcgEeIuIQWsJb3I+rwrG4hx/dqr2gje/V4tm
 OAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770133331; x=1770738131;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8mRvLOCNLqjVmjiKjh0H9exGu/p/pcpVAXu1Cdl+14Q=;
 b=gURCHk8iyi/ML+dbzGUUu+LtKDXs36lK+iaocjaGP4bgvBLQumDbDppdUNPlzviRtS
 n25I9d/N9n+LMDSfZDA9c8EPJIj3A0tsEnq6VxA2j9PzvV9tQ/GJcpXt40p5hxKK+yFa
 Jz1VxC6WTTBocgrKBf6v6Dw02QOf9lQ/lOQlbjfhUOWJO20z7lSiNw5c+JedT1lI6wIq
 zbXlpQTy+zZztzaS0GF22EEGC3pnBfFKEUYBCWf8dzcOTKbKr9I9WIYZfPvUqn8hCjiz
 /dkExzi1U3hGU8lynQM71Mcfpn0OF6Mv5jFkbsdirThyeao42tOnnZATFEcEDfFoKW8h
 deng==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/u19meWvGlJ/F/7yHvlBLMaGy+IzrirxIxVTDiJ5oSUBWjfLLu99LeRDwJiToOIVxxAljGeqRuNlcmg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzaIiiKU/I/Z7K6PBFh9OFmvQROdOMu+9O2ZJ0QRnFJA3pQPYwA
 9/uHObrkQqzza7B6rd90Koo3yh+WI1ItT+066dd6E+RgaKF5ZhFESYrT
X-Gm-Gg: AZuq6aI+sB5SED6kn3h3MlpcaVgoqsSEeT4E0zL3D4+oASPQHZTXQrwo0U1uh4i5NjD
 KsNfHjKFFWb4vx4I8YEn1vi4QUlf0NbVM5A+89zbA5k+QRtttuqSz7Sck9tkov9pAmaZ+VNKidh
 FEn6igFmPiRseZJ65fHXKugSyBAhg8PALEOoIQXbT9klljLwNuPj7KlVT+VFFw9xdXa59M8K7wa
 6N046wIUcqaStHwVNqlA8eHLmMZaEXmwI8jjjwFELhHQw2PinEKU3ON1nWk2o2smcENTTxjXIku
 5hWL9XBN0xKhJru4l0bYA97WHgo2tiTM/KgsB3VVf1dpMWlgQCWgyV0JquavRRqzdhqTnUrsxym
 V1ZSb3sxLgSOJBXFzEylMqwizSifPxbdjNVOBcczJu4Jsp8+/cAslWhxUKtrXiRC6htpdgVaAbJ
 HLW3lLuJnS6BaZ+x2QXbFwhQwv
X-Received: by 2002:a05:6000:2dc5:b0:435:bcbd:cb29 with SMTP id
 ffacd0b85a97d-436113099b6mr5919152f8f.2.1770133330387; 
 Tue, 03 Feb 2026 07:42:10 -0800 (PST)
Received: from [192.168.0.7] ([86.124.200.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e4757sm54954039f8f.5.2026.02.03.07.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 07:42:10 -0800 (PST)
Message-ID: <ea2434e6-d1db-4ea2-90f4-0a77961b7918@gmail.com>
Date: Tue, 3 Feb 2026 17:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk>
 <f95f73b9-d024-4697-bca1-02fb8bc044af@gmail.com>
 <aYEj8VM5AfvcDHrl@shell.armlinux.org.uk>
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
In-Reply-To: <aYEj8VM5AfvcDHrl@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev,
 Eric Dumazet <edumazet@google.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Clark Wang <xiaoning.wang@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Wei Fang <wei.fang@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next] net: stmmac: provide flag to
	disable EEE
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ovidiupanaitoss@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:imx@lists.linux.dev,m:edumazet@google.com,m:laurent.pinchart@ideasonboard.com,m:stefan.klug@ideasonboard.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:ghidoliemanuele@gmail.com,m:kieran.bingham@ideasonboard.com,m:o.rempel@pengutronix.de,m:xiaoning.wang@nxp.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:s.hauer@pengutronix.de,m:dan.scally@ideasonboard.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:andrew+netdev@lunn.ch,m:kernel@pengutronix.de,m:wei.fang@nxp.com,m:shawnguo@kernel.org,m:davem@davemloft.net,m:hkallweit1@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ovidiupanaitoss@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lunn.ch,lists.linux.dev,google.com,ideasonboard.com,gmail.com,st-md-mailman.stormreply.com,kernel.org,pengutronix.de,nxp.com,redhat.com,lists.infradead.org,vger.kernel.org,davemloft.net];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 81AA0DB693
X-Rspamd-Action: no action


Hi Russell,

On 2/3/26 12:23 AM, Russell King (Oracle) wrote:
> On Mon, Feb 02, 2026 at 08:54:52PM +0200, Ovidiu Panait wrote:
>>
>> Hi Russell,
>>
>> On 11/24/25 1:27 PM, Russell King (Oracle) wrote:
>>> Some platforms have problems when EEE is enabled, and thus need a way
>>> to disable stmmac EEE support. Add a flag before the other LPI related
>>> flags which tells stmmac to avoid populating the phylink LPI
>>> capabilities, which causes phylink to call phy_disable_eee() for any
>>> PHY that is attached to the affected phylink instance.
>>>
>>> iMX8MP is an example - the lpi_intr_o signal is wired to an OR gate
>>> along with the main dwmac interrupts. Since lpi_intr_o is synchronous
>>> to the receive clock domain, and takes four clock cycles to clear, this
>>> leads to interrupt storms as the interrupt remains asserted for some
>>> time after the LPI control and status register is read.
>>>
>>> This problem becomes worse when the receive clock from the PHY stops
>>> when the receive path enters LPI state - which means that lpi_intr_o
>>> can not deassert until the clock restarts. Since the LPI state of the
>>> receive path depends on the link partner, this is out of our control.
>>> We could disable RX clock stop at the PHY, but that doesn't get around
>>> the slow-to-deassert lpi_intr_o mentioned in the above paragraph.
>>>
>>> Previously, iMX8MP worked around this by disabling gigabit EEE, but
>>> this is insufficient - the problem is also visible at 100M speeds,
>>> where the receive clock is slower.
>>>
>>> There is extensive discussion and investigation in the thread linked
>>> below, the result of which is summarised in this commit message.
>>>
>>
>> We are seeing the same lpi_intr_o interrupt storm on the Renesas RZ/V2H
>> EVK (dwmac-renesas-gbeth.c). On this platform, lpi_intr_o is routed as a
>> separate, dedicated interrupt line to the CPU rather than being OR'd
>> with the main DWMAC interrupt as on iMX8MP. This corresponds to the
>> "eth_lpi" interrupt in the stmmac bindings:
>> """
>> - description: The interrupt that occurs when Rx exits the LPI state
>> const: eth_lpi
>> """
>>
>> Looking through the other glue drivers/device-trees, it looks to me that
>> every platform that defines a separate "eth_lpi" irq might have the
>> interrupt storm problem.
> 
> That is highly likely.
> 
>> To fix this issue on these platforms, rather than disabling EEE
>> altogether, would it be possible to just not request the eth_lpi
>> interrupt and let EEE continue to work? Perhaps a new flag could let
>> each platform decide.
> 
> Yes, because lpi_intr_o serves no purpose from a software point of
> view - see the commit message below for the details. I do like
> removing code from stmmac :)
> 
>> If not, maybe this patch could be merged to add the flag that disables
>> EEE and I will just send a patch to disable EEE on our platforms as well.
> 
> We still need the flag to disable EEE for platforms where lpi_intr_o is
> logically OR'd with the other interrupts, so there's no way to ignore
> its persistent assertion.
> 
> 8<===
> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> Subject: [PATCH net-next] net: stmmac: remove support for lpi_intr_o
> 
> The dwmac databook for v3.74a states that lpi_intr_o is a sideband
> signal which should be used to ungate the application clock, and this
> signal is synchronous to the receive clock. The receive clock can run
> at 2.5, 25 or 125MHz depending on the media speed, and can stop under
> the control of the link partner. This means that the time it takes to
> clear is dependent on the negotiated media speed, and thus can be 8,
> 40, or 400ns after reading the LPI control and status register.
> 
> It has been observed with some aggressive link partners, this clock
> can stop while lpi_intr_o is still asserted, meaning that the signal
> remains asserted for an indefinite period that the local system has
> no direct control over.
> 
> The LPI interrupts will still be signalled through the main interrupt
> path in any case, and this path is not dependent on the receive clock.
> 
> This, since we do not gate the application clock, and the chances of
> adding clock gating in the future are slim due to the clocks being
> ill-defined, lpi_intr_o serves no useful purpose. Remove the code which
> requests the interrupt, and all associated code.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks for fixing this. I did some testing on the Renesas RZ/V2H board
with this patch and didn't see any issues:

Tested-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Ovidiu

> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h  |  1 -
>  .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  4 ---
>  .../ethernet/stmicro/stmmac/dwmac-loongson.c  |  7 ----
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 --
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 36 -------------------
>  .../ethernet/stmicro/stmmac/stmmac_platform.c |  8 -----
>  include/linux/stmmac.h                        |  1 -
>  7 files changed, 59 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index 1c5a4af85b58..d26e8a063022 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -394,7 +394,6 @@ enum request_irq_err {
>  	REQ_IRQ_ERR_SFTY,
>  	REQ_IRQ_ERR_SFTY_UE,
>  	REQ_IRQ_ERR_SFTY_CE,
> -	REQ_IRQ_ERR_LPI,
>  	REQ_IRQ_ERR_WOL,
>  	REQ_IRQ_ERR_MAC,
>  	REQ_IRQ_ERR_NO,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> index aad1be1ec4c1..92d77b0c2f54 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> @@ -719,7 +719,6 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
>  
>  	/* Setup MSI vector offset specific to Intel mGbE controller */
>  	plat->msi_mac_vec = 29;
> -	plat->msi_lpi_vec = 28;
>  	plat->msi_sfty_ce_vec = 27;
>  	plat->msi_sfty_ue_vec = 26;
>  	plat->msi_rx_base_vec = 0;
> @@ -1177,8 +1176,6 @@ static int stmmac_config_multi_msi(struct pci_dev *pdev,
>  		res->irq = pci_irq_vector(pdev, plat->msi_mac_vec);
>  	if (plat->msi_wol_vec < STMMAC_MSI_VEC_MAX)
>  		res->wol_irq = pci_irq_vector(pdev, plat->msi_wol_vec);
> -	if (plat->msi_lpi_vec < STMMAC_MSI_VEC_MAX)
> -		res->lpi_irq = pci_irq_vector(pdev, plat->msi_lpi_vec);
>  	if (plat->msi_sfty_ce_vec < STMMAC_MSI_VEC_MAX)
>  		res->sfty_ce_irq = pci_irq_vector(pdev, plat->msi_sfty_ce_vec);
>  	if (plat->msi_sfty_ue_vec < STMMAC_MSI_VEC_MAX)
> @@ -1294,7 +1291,6 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
>  	 */
>  	plat->msi_mac_vec = STMMAC_MSI_VEC_MAX;
>  	plat->msi_wol_vec = STMMAC_MSI_VEC_MAX;
> -	plat->msi_lpi_vec = STMMAC_MSI_VEC_MAX;
>  	plat->msi_sfty_ce_vec = STMMAC_MSI_VEC_MAX;
>  	plat->msi_sfty_ue_vec = STMMAC_MSI_VEC_MAX;
>  	plat->msi_rx_base_vec = STMMAC_MSI_VEC_MAX;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> index ed0b534d8d7b..d66ae6ea4df5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> @@ -442,13 +442,6 @@ static int loongson_dwmac_dt_config(struct pci_dev *pdev,
>  		res->wol_irq = res->irq;
>  	}
>  
> -	res->lpi_irq = of_irq_get_byname(np, "eth_lpi");
> -	if (res->lpi_irq < 0) {
> -		dev_err(&pdev->dev, "IRQ eth_lpi not found\n");
> -		ret = -ENODEV;
> -		goto err_put_node;
> -	}
> -
>  	ret = device_get_phy_mode(&pdev->dev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "phy_mode not found\n");
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index 012b0a477255..aafd8c39be63 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -31,7 +31,6 @@ struct stmmac_resources {
>  	void __iomem *addr;
>  	u8 mac[ETH_ALEN];
>  	int wol_irq;
> -	int lpi_irq;
>  	int irq;
>  	int sfty_irq;
>  	int sfty_ce_irq;
> @@ -297,7 +296,6 @@ struct stmmac_priv {
>  	int wol_irq;
>  	u32 gmii_address_bus_config;
>  	struct timer_list eee_ctrl_timer;
> -	int lpi_irq;
>  	u32 tx_lpi_timer;
>  	bool tx_lpi_clk_stop;
>  	bool eee_enabled;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 7a451ae19f50..7925575fb348 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3734,10 +3734,6 @@ static void stmmac_free_irq(struct net_device *dev,
>  			free_irq(priv->sfty_ce_irq, dev);
>  		fallthrough;
>  	case REQ_IRQ_ERR_SFTY_CE:
> -		if (priv->lpi_irq > 0 && priv->lpi_irq != dev->irq)
> -			free_irq(priv->lpi_irq, dev);
> -		fallthrough;
> -	case REQ_IRQ_ERR_LPI:
>  		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
>  			free_irq(priv->wol_irq, dev);
>  		fallthrough;
> @@ -3795,24 +3791,6 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
>  		}
>  	}
>  
> -	/* Request the LPI IRQ in case of another line
> -	 * is used for LPI
> -	 */
> -	if (priv->lpi_irq > 0 && priv->lpi_irq != dev->irq) {
> -		int_name = priv->int_name_lpi;
> -		sprintf(int_name, "%s:%s", dev->name, "lpi");
> -		ret = request_irq(priv->lpi_irq,
> -				  stmmac_mac_interrupt,
> -				  0, int_name, dev);
> -		if (unlikely(ret < 0)) {
> -			netdev_err(priv->dev,
> -				   "%s: alloc lpi MSI %d (error: %d)\n",
> -				   __func__, priv->lpi_irq, ret);
> -			irq_err = REQ_IRQ_ERR_LPI;
> -			goto irq_error;
> -		}
> -	}
> -
>  	/* Request the common Safety Feature Correctible/Uncorrectible
>  	 * Error line in case of another line is used
>  	 */
> @@ -3952,19 +3930,6 @@ static int stmmac_request_irq_single(struct net_device *dev)
>  		}
>  	}
>  
> -	/* Request the IRQ lines */
> -	if (priv->lpi_irq > 0 && priv->lpi_irq != dev->irq) {
> -		ret = request_irq(priv->lpi_irq, stmmac_interrupt,
> -				  IRQF_SHARED, dev->name, dev);
> -		if (unlikely(ret < 0)) {
> -			netdev_err(priv->dev,
> -				   "%s: ERROR: allocating the LPI IRQ %d (%d)\n",
> -				   __func__, priv->lpi_irq, ret);
> -			irq_err = REQ_IRQ_ERR_LPI;
> -			goto irq_error;
> -		}
> -	}
> -
>  	/* Request the common Safety Feature Correctible/Uncorrectible
>  	 * Error line in case of another line is used
>  	 */
> @@ -7752,7 +7717,6 @@ static int __stmmac_dvr_probe(struct device *device,
>  
>  	priv->dev->irq = res->irq;
>  	priv->wol_irq = res->wol_irq;
> -	priv->lpi_irq = res->lpi_irq;
>  	priv->sfty_irq = res->sfty_irq;
>  	priv->sfty_ce_irq = res->sfty_ce_irq;
>  	priv->sfty_ue_irq = res->sfty_ue_irq;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 8979a50b5507..5c9fd91a1db9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -725,14 +725,6 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
>  		stmmac_res->wol_irq = stmmac_res->irq;
>  	}
>  
> -	stmmac_res->lpi_irq =
> -		platform_get_irq_byname_optional(pdev, "eth_lpi");
> -	if (stmmac_res->lpi_irq < 0) {
> -		if (stmmac_res->lpi_irq == -EPROBE_DEFER)
> -			return -EPROBE_DEFER;
> -		dev_info(&pdev->dev, "IRQ eth_lpi not found\n");
> -	}
> -
>  	stmmac_res->sfty_irq =
>  		platform_get_irq_byname_optional(pdev, "sfty");
>  	if (stmmac_res->sfty_irq < 0) {
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 5199451dd0bc..2620f0217f88 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -300,7 +300,6 @@ struct plat_stmmacenet_data {
>  	int int_snapshot_num;
>  	int msi_mac_vec;
>  	int msi_wol_vec;
> -	int msi_lpi_vec;
>  	int msi_sfty_ce_vec;
>  	int msi_sfty_ue_vec;
>  	int msi_rx_base_vec;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
