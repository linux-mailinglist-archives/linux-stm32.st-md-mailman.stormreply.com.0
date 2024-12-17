Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4559F4ED2
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 16:07:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACAFCC78012;
	Tue, 17 Dec 2024 15:07:10 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70AA4C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 15:07:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D11BB60009;
 Tue, 17 Dec 2024 15:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734448023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+eGcF78PnRCgMjDMS2quanXGAcbh8iyhTUjv/20yif4=;
 b=SybrRRdAVa2Ax8rFkE/tHwWK1Xxc+xoZXDJA7QbI6ffdDgfUtjl25UhREeafQ9s/BKMHZz
 c3QZmEFctAvFxDW2M/pwe7zcZDpYTO40Lh1C1lYqgguAhVGeRNistALf/X4S0gEP7dxhKo
 ay1dKhF+eFe/RYKGUJhARD6pTleL7Vomqcc1gmFJfHacSSCKy51a+wkAfjLK0MUU1EInZq
 zQB7YRqm9ydvmwz4DhcKuyRcr+d6FR5j+q2RlRM4vpXXPTBUV6rzPsCV/4LHEz/W/tbO8F
 idPN2p90Sa5oXPUPb5VmvGCFK5VcNMr9zqwgX9Ov2P3I8hdnMaedbeU3j/wUBQ==
Date: Tue, 17 Dec 2024 16:07:00 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20241217160700.1b4256b4@fedora.home>
In-Reply-To: <20241217064907.0e509769@kernel.org>
References: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
 <20241213090526.71516-3-maxime.chevallier@bootlin.com>
 <Z1wnFXlgEU84VX8F@shell.armlinux.org.uk>
 <20241213182904.55eb2504@fedora.home>
 <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
 <20241216094224.199e8df7@fedora.home>
 <20241216173333.55e35f34@kernel.org>
 <20241217135932.60711288@fedora.home>
 <20241217064907.0e509769@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: dwmac-socfpga:
 Set interface modes from Lynx PCS as supported
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

On Tue, 17 Dec 2024 06:49:07 -0800
Jakub Kicinski <kuba@kernel.org> wrote:

> Let me triple check ;)
> 
> On Tue, 17 Dec 2024 13:59:32 +0100 Maxime Chevallier wrote:
> > - The priv->phylink_config.supported_interfaces is incomplete on
> > dwmac-socfpga. Russell's patch 5 intersects these modes with that the  
>                                    ^^^^^^^^^^
> > PCS supports :
> > 
> > +		phy_interface_or(priv->phylink_config.supported_interfaces,  
>                               ^^
> > +				 priv->phylink_config.supported_interfaces,
> > +				 pcs->supported_interfaces);
> > 
> > So without patch 2 in the series, we'll be missing
> > PHY_INTERFACE_MODE_1000BASEX in the end result :)  
> 
> "Or" is a sum/union, not intersection.
> 
> You set the bits in priv->phylink_config.supported_interfaces.
> Russell does:
> 
> 	priv->phylink_config.supported_interfaces |=
> 		pcs->supported_interfaces;
> 
> If I'm missing the point please repost once Russell's patches 
> are merged :)

Erf no I was missing the point, time to catch-up on some sleep I
guess... I read an 'and' and it was firmly stuck in my mind...

nevermind then, patch 2 isn't required anymore...

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
