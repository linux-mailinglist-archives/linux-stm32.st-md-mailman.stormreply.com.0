Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D73F990F872
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 23:25:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 823BBC6A613;
	Wed, 19 Jun 2024 21:25:10 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D864FC5E2D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 21:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=ngxBG/bIsZr8BWoqUSJWfqlx+hcMMjTRBj5upmUnUxg=; b=vsVQp8ceCVF/O5bAaR/NpJT9E2
 X7vN8PsIt+9x/gfvT7v77+LZUHkE1C+lY3+LnXpiIF+SF8shQwu+JoZS/om34rUgdRcaxOKocIk7U
 pV3Wa6xzHL+WUaI+V3T0G1r5Tb5vV8aMdkri8eh8iA/KJ/HKFqckswbD3jV4Ok5Cp31E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sK2nQ-000VjL-9b; Wed, 19 Jun 2024 23:24:48 +0200
Date: Wed, 19 Jun 2024 23:24:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <b0b03680-9842-49ce-badd-5f9826fdc3fa@lunn.ch>
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
>  		break;

O.K. Given Russells reply, what happens if you skip this hunk, don't
add PHY_INTERFACE_MODE_OCSGMII but use PHY_INTERFACE_MODE_2500BASEX,
and change the MAC driver as needed. Given this here, it seems likely
somebody else is using MDIO_PHYXS_VEND_IF_STATUS_TYPE_OCSGMII as
PHY_INTERFACE_MODE_2500BASEX, so i expect it will work.

Adding PHY_INTERFACE_MODE_OCSGMII is a UAPI addition, since it becomes
possible to pass it in phy-mode in DT. That means, it is hard to
remove later, if Russell ever finds the time to finish his patches,
and PHY_INTERFACE_MODE_OCSGMII is not needed. So if we can avoid
adding it, we should.

       Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
