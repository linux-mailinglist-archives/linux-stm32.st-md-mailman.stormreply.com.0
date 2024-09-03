Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F176969E69
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Sep 2024 14:54:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E715C71292;
	Tue,  3 Sep 2024 12:54:02 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42ABDC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Sep 2024 12:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Y/PFMegEDd62ur1zarCVrWPBLzIeJ3N20ZfW4Ez4TaM=; b=LCp1jyR+IICHAWThuJ0aN9V9P0
 ++GbqJunHyY4Bpw0sGSkcx92JlhyKeXjKtxZ8zdYlqu8j2GEWS1EHM9lpp2e+jQk5i8iyxMxMI2Cg
 m0wuS+PDEbExhY5LRl9kPBtUfYMV6UO9SzN7B+ZZ7o2HA9iKGiD6MttFcddJf6RrcxC0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1slT2B-006QUP-VC; Tue, 03 Sep 2024 14:53:23 +0200
Date: Tue, 3 Sep 2024 14:53:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <38a3c576-a342-4644-8509-53a6a7f45576@lunn.ch>
References: <20240830031325.2406672-1-ruanjinjie@huawei.com>
 <20240830031325.2406672-6-ruanjinjie@huawei.com>
 <27a0d076-ed61-486b-b961-8a0982e7b96d@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <27a0d076-ed61-486b-b961-8a0982e7b96d@gmail.com>
Cc: linus.walleij@linaro.org, justin.chen@broadcom.com, edumazet@google.com,
 krzk@kernel.org, linux-stm32@st-md-mailman.stormreply.com, samuel@sholland.org,
 Jinjie Ruan <ruanjinjie@huawei.com>, linux@armlinux.org.uk,
 jernej.skrabec@gmail.com, wens@csie.org, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 linux-sunxi@lists.linux.dev, sebastian.hesselbarth@gmail.com,
 woojung.huh@microchip.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, UNGLinuxDriver@microchip.com,
 mcoquelin.stm32@gmail.com, alsi@bang-olufsen.dk, olteanv@gmail.com,
 davem@davemloft.net, jic23@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v4 5/8] net: mdio: mux-mmioreg:
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

> > @@ -109,30 +109,25 @@ static int mdio_mux_mmioreg_probe(struct platform_device *pdev)
> >   		return -ENOMEM;
> >   	ret = of_address_to_resource(np, 0, &res);
> > -	if (ret) {
> > -		dev_err(&pdev->dev, "could not obtain memory map for node %pOF\n",
> > -			np);
> > -		return ret;
> > -	}
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "could not obtain memory map for node %pOF\n", np);
> 
> Besides that one, which I don't think is even a candidate for resource
> deferral in the first place given the OF platform implementation, it does
> not seem to help that much to switch to dev_err_probe() other than just
> combining the error message and return code in a single statement. So it's
> fewer lines of codes, but it is not exactly what dev_err_probe() was
> originally intended for IMHO.

Agreed. Rather than abuse dev_err_probe(), maybe a dev_err_error()
would be added with the same prototype, does the same formatting, and
skips all the PROBE_DEFFER logic. The problem would be, it would
encourage more of this churn.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
