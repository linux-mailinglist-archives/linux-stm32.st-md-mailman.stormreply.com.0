Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89864A0FE94
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 03:17:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 465EAC7802B;
	Tue, 14 Jan 2025 02:17:32 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B8ECC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 02:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=P1SIEN3E6aqrThhxwat3Nx/SdisRq4J3tMD+nuJgrUc=; b=ig1VG/JvMUnpVn3G1nBjH7GmvJ
 zoLv1nz0dIwYHbMWp7Z9UvXr/HpAd2Ze/y9+Di+8jRDXjo+sLl4ShiK2e81vMUX8yZE8X4V4rQ0NH
 C6ShuctKHa25uulz+afqGQTrob6TnSSLEQForwvpbl8KGrFEgSKsrhevMK0toA77jBts=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tXWUD-004Im6-Bo; Tue, 14 Jan 2025 03:16:57 +0100
Date: Tue, 14 Jan 2025 03:16:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <e7041d36-9bc7-482a-877d-6d8f549c0ada@lunn.ch>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
 <20250113055434.3377508-4-a0987203069@gmail.com>
 <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
Cc: linux-kernel@vger.kernel.org, edumazet@google.com, schung@nuvoton.com,
 yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, ychuang3@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Joey Lu <a0987203069@gmail.com>, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v7 3/3] net: stmmac:
 dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
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

> > +#define NVT_MISCR_RMII          BIT(0)
> > +
> > +/* 2000ps is mapped to 0x0 ~ 0xF */
> 
> Excuse my ignorance: What is ps?

picoseconds. An RGMII link needs a 2ns delay between the clock line
and the data lines. Some MACs allow you to tune the delay they can
insert, in this case in steps of 2ns / 16.

> > +#define NVT_PATH_DELAY_DEC      134
> > +#define NVT_TX_DELAY_MASK       GENMASK(19, 16)
> > +#define NVT_RX_DELAY_MASK       GENMASK(23, 20)
> > +
> > +struct nvt_priv_data {
> > +	struct platform_device *pdev;
> > +	struct regmap *regmap;
> > +};
> > +
> > +static struct nvt_priv_data *
> > +nvt_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct nvt_priv_data *bsp_priv;
> > +	phy_interface_t phy_mode;
> > +	u32 tx_delay, rx_delay;
> 
> Please append the unit to the variable name.

Which is trick, because they are in units of 2000/16 of a picosecond.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
