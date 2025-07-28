Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F349B14105
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jul 2025 19:12:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E83E3C36B2E;
	Mon, 28 Jul 2025 17:12:16 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FCA9C36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jul 2025 17:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=oeyvvuTCaBRy7drnXePaUBtIXrGKicLr161z5oeQWTA=; b=Vf1libXAmZ3fGrZF9TaeB87gB2
 MJ2BnUHvG4/m97ycRsaJ57W7ul5gbL+O9Fxep5UQTv8DTohMHFI2z5tCNqmPKCr4gZbjd8A86d927
 oGo5S/UHAaItwJOjxYQv0n9P/81zK8GZIp7Jdkbuz4P6Q4u5cGTBpeg9d8jZv2lJorRU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ugROS-0037Ks-E7; Mon, 28 Jul 2025 19:12:08 +0200
Date: Mon, 28 Jul 2025 19:12:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <c8fe4307-f036-40bd-8d77-b80f19ca8fc2@lunn.ch>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
 <E1ugQ2y-006KDL-K7@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1ugQ2y-006KDL-K7@rmk-PC.armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 5/7] net: stmmac: use core
	wake IRQ support
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

> -	if (wol->wolopts) {
> -		device_set_wakeup_enable(priv->device, 1);
> -		/* Avoid unbalanced enable_irq_wake calls */
> -		if (priv->wol_irq_disabled)
> -			enable_irq_wake(priv->wol_irq);
> -		priv->wol_irq_disabled = false;
> -	} else {
> -		device_set_wakeup_enable(priv->device, 0);
> -		/* Avoid unbalanced disable_irq_wake calls */
> -		if (!priv->wol_irq_disabled)
> -			disable_irq_wake(priv->wol_irq);
> -		priv->wol_irq_disabled = true;
> -	}
> +	device_set_wakeup_enable(priv->device, !!wol->wolopts);

It might be worth mentioning in the commit message that
device_set_wakeup_enable() does not care about unbalanced calls to
enable/disable. This obviously caused issues in the past with
enable_irq_wake()/disable_irq_wake().

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
