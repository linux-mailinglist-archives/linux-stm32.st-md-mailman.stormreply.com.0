Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EE611CE3A
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Dec 2019 14:25:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FEF7C36B0B;
	Thu, 12 Dec 2019 13:25:40 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90011C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2019 13:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bxnXIodnVA+EXBQ9CzKw2+L2s06f/eW1ZteOUMDWsiU=; b=L5e/4sTMJEgfoy08MJh5WXYJ6i
 vtxgJMqAJUi8fKfN/Q5KP8FQnuW4FE9UBwBZ/KRoW0xWFvLE685wFxZz9EFJekPOrDAqg783JqQJ3
 XPskH3kEU7fR0/Ph78F3bj9HvZWOr4H99XHMwhfMNb8afPT2T5Xye6Z5mz+fbKas7xlU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.92.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ifOT2-0002nd-BQ; Thu, 12 Dec 2019 14:25:20 +0100
Date: Thu, 12 Dec 2019 14:25:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Biao Huang <biao.huang@mediatek.com>
Message-ID: <20191212132520.GB9959@lunn.ch>
References: <20191212024145.21752-1-biao.huang@mediatek.com>
 <20191212024145.21752-2-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212024145.21752-2-biao.huang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, Jose Abreu <joabreu@synopsys.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 yt.shen@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] net-next: stmmac: mediatek: add more
	suuport for RMII
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

On Thu, Dec 12, 2019 at 10:41:44AM +0800, Biao Huang wrote:
> MT2712 SoC can provide the rmii reference clock, and the clock
> will output from TXC pin only, which means ref_clk pin of external
> PHY should connect to TXC pin in this case.
> Add corresponding clock and timing settings.

Hi Biao

Subject line has a typo.

> @@ -278,6 +296,7 @@ static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)
>  	mac_delay->tx_inv = of_property_read_bool(plat->np, "mediatek,txc-inverse");
>  	mac_delay->rx_inv = of_property_read_bool(plat->np, "mediatek,rxc-inverse");
>  	plat->rmii_rxc = of_property_read_bool(plat->np, "mediatek,rmii-rxc");
> +	plat->rmii_clk_from_mac = of_property_read_bool(plat->np, "mediatek,rmii-clk-from-mac");
>  
>  	return 0;
>  }
> @@ -287,6 +306,16 @@ static int mediatek_dwmac_clk_init(struct mediatek_dwmac_plat_data *plat)
>  	const struct mediatek_dwmac_variant *variant = plat->variant;
>  	int i, num = variant->num_clks;
>  
> +	plat->mac_rmii_clk = NULL;
> +	if (plat->phy_mode == PHY_INTERFACE_MODE_RMII &&
> +	    plat->rmii_clk_from_mac) {
> +		plat->mac_rmii_clk = devm_clk_get(plat->dev, "rmii_internal");
> +		if (IS_ERR(plat->mac_rmii_clk)) {
> +			dev_err(plat->dev, "Failed to get reference clk from MAC\n");
> +			return PTR_ERR(plat->mac_rmii_clk);
> +		}
> +	}

Please don't use a binary property. This is a clock, so describe it in
DT as a clock. Add it to the existing list of clocks.

   Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
