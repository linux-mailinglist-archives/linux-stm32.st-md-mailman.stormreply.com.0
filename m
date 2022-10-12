Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D70285FCD51
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Oct 2022 23:32:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 972BCC640F3;
	Wed, 12 Oct 2022 21:32:24 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62182C03FD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 21:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=xnFGWD1uy6BcknnACQ8OXcBBRlzYf3rf9rvmVnUeUFM=; b=2LSexal8o2u2Nc9bp2xnlLXBaT
 YSUlFWHl477Yxux/Xd/cTZS703eWgP1POFJoW4ifGhNpudUfctHl6tMvdxo8mAc6chTaQ9EO3iwq4
 Lavx1DEAi8lwcevq2+KfvB1lkUUKQRoI1XkvKfbH+5jnoBJ/QfV+oxUdNFHjexyBHYnA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1oijKh-001pu6-Sz; Wed, 12 Oct 2022 23:32:07 +0200
Date: Wed, 12 Oct 2022 23:32:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Clark Wang <xiaoning.wang@nxp.com>
Message-ID: <Y0cyV84BbUd1X0Zk@lunn.ch>
References: <20221012105129.3706062-1-xiaoning.wang@nxp.com>
 <20221012105129.3706062-4-xiaoning.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221012105129.3706062-4-xiaoning.wang@nxp.com>
Cc: kernel@pengutronix.de, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, festevam@gmail.com, s.hauer@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 peppe.cavallaro@st.com, kuba@kernel.org, netdev@vger.kernel.org,
 pabeni@redhat.com, shawnguo@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/3] arm64: dts: imx93: add fec and eqos
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

> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clock-frequency = <5000000>;
> +
> +		ethphy1: ethernet-phy@1 {
> +			compatible = "ethernet-phy-ieee802.3-c22";

It is not wrong, but this is not needed, its the default.

   Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
