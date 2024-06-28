Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5518F91C717
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2024 22:12:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F4001C71282;
	Fri, 28 Jun 2024 20:12:29 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97EA5CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 20:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=8dDLlhV3WAfC2faU1YAAVK/Qyn/a7E+Xsj6NmTYqY6w=; b=NqeVhFAJXwxyKuHxd2HxVoKJP0
 7au9ZWJ6FrxM/nsqeodnE4py9hZ7NmCXc3ttmqWN1EK337AV1jhY1nI24+1gvSoeE2IcWAm8Vo7d0
 jcBhoQHsIW8sRqgRE1fjqQERNq4rXNZ6giT80diXg2Lr6hPrbTccNEMB9RBk2IsOGCog=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sNHwy-001JqU-EI; Fri, 28 Jun 2024 22:12:04 +0200
Date: Fri, 28 Jun 2024 22:12:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Message-ID: <483b77c7-e90f-42e1-a8b8-372845d8de62@lunn.ch>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-2-eaa7cf9060f0@quicinc.com>
 <da62cf15-0329-40e5-83f3-16c4b60f7b46@kernel.org>
 <0666cba0-a5bb-44bf-845a-6a1c689cb485@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0666cba0-a5bb-44bf-845a-6a1c689cb485@quicinc.com>
Cc: Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 kernel@quicinc.com, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 2/3] net: stmmac: Add interconnect
	support
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

> >> @@ -642,6 +642,18 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
> >>  		dev_dbg(&pdev->dev, "PTP rate %d\n", plat->clk_ptp_rate);
> >>  	}
> >>  
> >> +	plat->axi_icc_path = devm_of_icc_get(&pdev->dev, "axi");
> >> +	if (IS_ERR(plat->axi_icc_path)) {
> >> +		ret = (void *)plat->axi_icc_path;
> >> +		goto error_hw_init;
> > 
> > This sounds like an ABI break. Considering the interconnects are not
> > required by the binding, are you sure this behaves correctly without
> > interconnects in DTS?
> >
> > Best regards,
> > Krzysztof
> > 
> Yes, i did check without the interconnect entries in the dtsi and
> things are working fine, devm_of_icc_get is properly clearing out
> all the references in the case when "interconnects" are not present
> in the dtsi.

So the relevant code is:

https://elixir.bootlin.com/linux/latest/source/drivers/interconnect/core.c#L566

	/*
	 * When the consumer DT node do not have "interconnects" property
	 * return a NULL path to skip setting constraints.
	 */
	if (!of_property_present(np, "interconnects"))
		return NULL;

The naming of of_icc_get() and devm_of_icc_get() is not
great. Typically this behaviour of not giving an error if it is
missing would mean the functions would be of_icc_get_optional() and
devm_of_icc_get_optional(), e.g. we have clk_get_optional(),
gpiod_get_optional(), regulator_get_optional(), etc.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
