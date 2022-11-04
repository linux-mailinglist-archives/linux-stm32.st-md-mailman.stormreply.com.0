Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CDA619B84
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Nov 2022 16:25:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BDBFC65042;
	Fri,  4 Nov 2022 15:25:41 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07D97C6411F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Nov 2022 15:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=du3wTT7gZIcCx7MAzovG5KucdTPH1Tr3pydnZK/Rz0I=; b=46kNXdi9RR7s+GQLUwE/lyN5uE
 QNAC+e9tLj7U5tRxlATNLGezHv0SjgZPlhIU19uT5SK2VHL+JVpC1xJlQ2ZcvKpW1kTHaOjrzNp5j
 kNrSxT0EnKQEkUSbPLjBu0gTxdkdHzsa5J/eWp6yzsE9OHp4S0U58k0K/cRvHQp2mbeI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1oqyZD-001RGc-Rq; Fri, 04 Nov 2022 16:25:11 +0100
Date: Fri, 4 Nov 2022 16:25:11 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sriranjani P <sriranjani.p@samsung.com>
Message-ID: <Y2Uu16RSF9Py5AdC@lunn.ch>
References: <20221104120517.77980-1-sriranjani.p@samsung.com>
 <CGME20221104115854epcas5p4ca280f9c4cc4d1fa564d80016e9f0061@epcas5p4.samsung.com>
 <20221104120517.77980-3-sriranjani.p@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221104120517.77980-3-sriranjani.p@samsung.com>
Cc: linux-kernel@vger.kernel.org, Chandrasekar R <rcsekar@samsung.com>,
 netdev@vger.kernel.org, richardcochran@gmail.com,
 Suresh Siddha <ssiddha@tesla.com>, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] net: stmmac: dwc-qos: Add FSD EQoS
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

> +static int dwc_eqos_setup_rxclock(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +
> +	if (np && of_property_read_bool(np, "rx-clock-mux")) {
> +		unsigned int reg, val;
> +		struct regmap *syscon = syscon_regmap_lookup_by_phandle(np,
> +			"rx-clock-mux");
> +
> +		if (IS_ERR(syscon)) {
> +			dev_err(&pdev->dev, "couldn't get the rx-clock-mux syscon!\n");
> +			return PTR_ERR(syscon);
> +		}
> +
> +		if (of_property_read_u32_index(np, "rx-clock-mux", 1, &reg)) {
> +			dev_err(&pdev->dev, "couldn't get the rx-clock-mux reg. offset!\n");
> +			return -EINVAL;
> +		}
> +
> +		if (of_property_read_u32_index(np, "rx-clock-mux", 2, &val)) {
> +			dev_err(&pdev->dev, "couldn't get the rx-clock-mux reg. val!\n");
> +			return -EINVAL;
> +		}
> +
> +		regmap_write(syscon, reg, val);

This appears to be one of those binds which allows any magic value to
be placed into any register. That is not how DT should be used.

   Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
