Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E2B90F6E5
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 21:19:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F202FC6B460;
	Wed, 19 Jun 2024 19:19:57 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15E45C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 19:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=QUJeCb0b41VEsPZ72O8+y6kiVt6cHBByGNaQU/MidwY=; b=kYAgxoNp+AQnLvGvaT47LKpsQi
 GYKo+KIUWfn6I1/yZ+PC17HYxJEkkqLnopeBbS35ZG8a8BMvTuLPEB2mg44Up4fovNiP+niwqqejD
 sKErVWaCdkc6AE3VrC/h5GCDoh4Xkl0lkjzk3ZBrB7voYRFS4H6/z18qle6pLBLvaAVM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sK0qI-000VA3-WB; Wed, 19 Jun 2024 21:19:39 +0200
Date: Wed, 19 Jun 2024 21:19:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <a9465b9a-1bfd-4ec1-b641-21867584c9d9@lunn.ch>
References: <20240619184550.34524-1-brgl@bgdev.pl>
 <20240619184550.34524-5-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240619184550.34524-5-brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 4/8] net: phy: aquantia: add
	support for aqr115c
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

>  	case MDIO_PHYXS_VEND_IF_STATUS_TYPE_OCSGMII:
> -		phydev->interface = PHY_INTERFACE_MODE_2500BASEX;
> +		phydev->interface = PHY_INTERFACE_MODE_OCSGMII;

That looks interesting. I wounder what will break.

>  		break;
>  	default:
>  		phydev->interface = PHY_INTERFACE_MODE_NA;
> @@ -721,6 +721,18 @@ static int aqr113c_config_init(struct phy_device *phydev)
>  	return aqr107_fill_interface_modes(phydev);
>  }
>  
> +static int aqr115c_config_init(struct phy_device *phydev)
> +{
> +	/* Check that the PHY interface type is compatible */
> +	if (phydev->interface != PHY_INTERFACE_MODE_SGMII &&
> +	    phydev->interface != PHY_INTERFACE_MODE_OCSGMII)
> +		return -ENODEV;

Does it support 2500BaseX? 

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
