Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1143E7B246B
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Sep 2023 19:53:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7EA4C6B476;
	Thu, 28 Sep 2023 17:53:22 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99C84C6B474
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Sep 2023 17:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=+2NeppKoPOd4YQz6nJcEifAHl4BALODLgDqAjaWDWoI=; b=hrdrym07dNmzgGqtwMAO60ISgD
 BlYZHtJj4WC2/8gMiEeDgWqc2qtFqVwDKDBO59FFnyAql0YQCGHRMEyJjJflbIpTwvjXwNS4TITuM
 N3IrZ7HVlXMZwqLIWthKUGWgamXkjw9uV9uImyFa54FeOcueBja9Wr5QSo2a9SXxdflk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qlvCG-007leL-E5; Thu, 28 Sep 2023 19:53:08 +0200
Date: Thu, 28 Sep 2023 19:53:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Message-ID: <12332a87-e8c3-4cf3-849a-080e4e3f4521@lunn.ch>
References: <20230928122427.313271-1-christophe.roullier@foss.st.com>
 <20230928122427.313271-9-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230928122427.313271-9-christophe.roullier@foss.st.com>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 08/12] net: ethernet: stmmac: stm32:
 support the phy-supply regulator binding
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

> +static int phy_power_on(struct stm32_dwmac *bsp_priv, bool enable)

I find this function name confusing, since 50% of the time it does not
actually power the PHY on. You never call it with anything other than
a static true/false value. So it might was well be two functions,
phy_power_on() and phy_power_off().

> +{
> +	int ret;
> +	struct device *dev = bsp_priv->dev;
> +
> +	if (!bsp_priv->regulator)
> +		return 0;
> +
> +	if (enable) {
> +		ret = regulator_enable(bsp_priv->regulator);
> +		if (ret)
> +			dev_err(dev, "fail to enable phy-supply\n");

Not all PHYs are usable in 0 picoseconds. You probably want a delay
here. Otherwise the first few accesses to it might not work.

      Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
