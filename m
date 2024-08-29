Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 871E59644BF
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Aug 2024 14:39:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 391CFC6DD6E;
	Thu, 29 Aug 2024 12:39:39 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CECFC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 12:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=+QyTeQW/As9IjRzVOrP1/IZ7Jkku9UOdmdk9zFQWvDM=; b=20KMQELyV/A1PdZDXK1xNzAzDD
 yEKZShA/slL4ITbRl/MDrnlwoljjq5bv44f4wQcfBH67lWv9obxeK0rVT25FuDKpmpCx3AkVT4zEx
 2vzJT+sjP4HMw7ZOKajAJMEajW9AheAL2BzfXrKFZzoMj5Xfdeck5vT6dBHd4FKPkxKo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sjeQU-00621R-6Z; Thu, 29 Aug 2024 14:38:58 +0200
Date: Thu, 29 Aug 2024 14:38:58 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Message-ID: <df7418a8-1626-4207-b23e-7f0dc3d83164@lunn.ch>
References: <20240828032343.1218749-1-ruanjinjie@huawei.com>
 <20240828032343.1218749-9-ruanjinjie@huawei.com>
 <20240828134814.0000569d@Huawei.com>
 <c696926d-748f-1969-f684-727d495c4a12@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c696926d-748f-1969-f684-727d495c4a12@huawei.com>
Cc: linus.walleij@linaro.org, justin.chen@broadcom.com, edumazet@google.com,
 krzk@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, samuel@sholland.org, linux@armlinux.org.uk,
 jernej.skrabec@gmail.com, wens@csie.org, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 ansuelsmth@gmail.com, sebastian.hesselbarth@gmail.com,
 woojung.huh@microchip.com, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com,
 mcoquelin.stm32@gmail.com, alsi@bang-olufsen.dk, olteanv@gmail.com,
 linux-sunxi@lists.linux.dev, davem@davemloft.net, jic23@kernel.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 08/13] net: mdio: mux-mmioreg:
 Simplified with dev_err_probe()
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

> >> +		if ((u32)reg & ~s->mask)
> >> +			return dev_err_probe(&pdev->dev, -ENODEV,
> >> +					     "mdio-mux child node %pOF has a 'reg' value with unmasked bits\n",
> > I'd align these super long ones as. 
> > 			     "mdio-mux child node %pOF has a 'reg' value with unmasked bits\n",
> > It is ugly but then so are > 100 char lines.
> 
> It seems that this kind string > 100 char is fine for patch check script.

Strings like this can ignore the 80 char limit because developers are
going to grep for it when it shows up in their kernel log. If it gets
broken in odd places, grep will not find it.

I would also say the indentation is correct as is, level with &pdev.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
