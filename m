Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 335684980BF
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jan 2022 14:15:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9C4EC5F1D5;
	Mon, 24 Jan 2022 13:15:38 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B0EDC5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jan 2022 13:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=PeFIruRVAx/9fcHZk7SrtQ7xKuJ0YbP5VfyDFWFEJSw=; b=xNaC/FgUnUbJApVTzE3QBM8Djn
 w16MkgJn3jTsl3IlNpc0Uu7r56sCQIwzpR7BGd/HuczSidjDiif1i+IUYc0NELP8xMK65vYvZCmXe
 53bERZ7s8V4cinKzRid22A2gaCq4jElkED97VaRNfxWKGsQVeSDwhtrRus9S32iYtoU0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nBzBr-002TB3-P7; Mon, 24 Jan 2022 14:15:23 +0100
Date: Mon, 24 Jan 2022 14:15:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
Message-ID: <Ye6maxMtt68JlZ9l@lunn.ch>
References: <20220124095951.23845-1-mohammad.athari.ismail@intel.com>
 <20220124095951.23845-3-mohammad.athari.ismail@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220124095951.23845-3-mohammad.athari.ismail@intel.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Weifeng <weifeng.voon@intel.com>, Wong Vee Khee <vee.khee.wong@intel.com>,
 netdev@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 2/2] net: stmmac: skip only
 stmmac_ptp_register when resume from suspend
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

> @@ -3308,13 +3309,11 @@ static int stmmac_hw_setup(struct net_device *dev, bool init_ptp)
>  
>  	stmmac_mmc_setup(priv);
>  
> -	if (init_ptp) {
> -		ret = stmmac_init_ptp(priv);
> -		if (ret == -EOPNOTSUPP)
> -			netdev_warn(priv->dev, "PTP not supported by HW\n");
> -		else if (ret)
> -			netdev_warn(priv->dev, "PTP init failed\n");
> -	}
> +	ret = stmmac_init_ptp(priv, ptp_register);
> +	if (ret == -EOPNOTSUPP)
> +		netdev_warn(priv->dev, "PTP not supported by HW\n");
> +	else if (ret)
> +		netdev_warn(priv->dev, "PTP init failed\n");

The init_ptp parameter now seems unused? If so, please remove it.

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
