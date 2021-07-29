Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 620903DAD6A
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jul 2021 22:21:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09CB2C57B6F;
	Thu, 29 Jul 2021 20:21:08 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22250C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jul 2021 20:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=yH5uVOP6NDV3mxanWoiwRIAPujE42QlL9/YdYceDovY=; b=xmGtGuEAFWj5j0hXzagN7x9J1u
 XnFnrOvxIglDS75jzWXEtG7QXJarvjaRNOui7f0vy94kdztYi40aMzcfIWKVJq5/LWwFNBFhZBSP2
 IViqvzi+a3rwLZZBGWrkZW7yAVFQvSoz6h8GQqd6Q8fPOtXCb69FeonaqC5gsMdJr02I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1m9CWb-00FMil-C9; Thu, 29 Jul 2021 22:21:01 +0200
Date: Thu, 29 Jul 2021 22:21:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Anand Moon <linux.amoon@gmail.com>
Message-ID: <YQMNrVV1Dm+yxUiU@lunn.ch>
References: <20210729201100.3994-1-linux.amoon@gmail.com>
 <20210729201100.3994-4-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210729201100.3994-4-linux.amoon@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-kernel@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCHv1 3/3] net: stmmac: dwmac-meson8b: Add
 reset controller for ethernet phy
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

> @@ -465,6 +478,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>  		goto err_remove_config_dt;
>  	}
>  
> +	dwmac->eth_reset = devm_reset_control_get_exclusive(dwmac->dev, "ethreset");
> +	if (IS_ERR_OR_NULL(dwmac->eth_reset)) {
> +		dev_err(dwmac->dev, "Failed to get Ethernet reset\n");
> +		ret = PTR_ERR(dwmac->eth_reset);
> +		goto err_remove_config_dt;
> +	}
> +

Hi Anand

Since this is a new property, you need to handle it not being in the
DT blob. You probably need to use
devm_reset_control_get_optinal_exclusive()

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
