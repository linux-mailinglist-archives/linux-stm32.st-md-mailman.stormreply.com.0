Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A269B5FCD40
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Oct 2022 23:29:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6914DC640F3;
	Wed, 12 Oct 2022 21:29:59 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 867E5C03FD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 21:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=rG4R+wqzRRZPy/iFUqxWu1RUJMeR5k+eB1P0dMbq/Qk=; b=v8VCLffVX+c4mNBh1I6bTUb7Mx
 1fMdXAVVMdJhgtvLe/qfMY6KuKjn9OizoGn1f1wpe8UBQl23v+Fx/Wq3M9QD9uhiOajryN7AzyV6n
 XbG9GWswWCZA5/aLGs9WgP0eToBuDOx3Oc+lVxGKyDxqqz5a3EEHXtEjD5/E36NKvHZk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1oijI8-001psu-Va; Wed, 12 Oct 2022 23:29:28 +0200
Date: Wed, 12 Oct 2022 23:29:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Clark Wang <xiaoning.wang@nxp.com>
Message-ID: <Y0cxuKz7rTpxHjMz@lunn.ch>
References: <20221012105129.3706062-1-xiaoning.wang@nxp.com>
 <20221012105129.3706062-2-xiaoning.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221012105129.3706062-2-xiaoning.wang@nxp.com>
Cc: kernel@pengutronix.de, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, festevam@gmail.com, s.hauer@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 peppe.cavallaro@st.com, kuba@kernel.org, netdev@vger.kernel.org,
 pabeni@redhat.com, shawnguo@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] net: stmmac: add imx93 platform
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

> +static int imx93_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
> +{
> +	struct imx_priv_data *dwmac = plat_dat->bsp_priv;
> +	int val;
> +
> +	switch (plat_dat->interface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		val = MX93_GPR_ENET_QOS_INTF_SEL_MII;
> +		break;
> +	case PHY_INTERFACE_MODE_RMII:
> +		val = MX93_GPR_ENET_QOS_INTF_SEL_RMII;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		val = MX93_GPR_ENET_QOS_INTF_SEL_RGMII;
> +		break;
> +	default:
> +		pr_debug("imx dwmac doesn't support %d interface\n",
> +			 plat_dat->interface);

netdev_debug(), or dev_debug(), so there is some clue which of the 42
dwmac instances has a bad value in DT.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
