Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8708FBFF7E3
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Oct 2025 09:20:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29069C5E2DF;
	Thu, 23 Oct 2025 07:20:09 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BEC1C5A4C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 07:20:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9BFE54E412A0;
 Thu, 23 Oct 2025 07:20:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 670866062C;
 Thu, 23 Oct 2025 07:20:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 53C8E102F2429; 
 Thu, 23 Oct 2025 09:19:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761204006; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=4roag8RkeTHO2FDEZ6Nr16KR62pxOLQkv39DNg6fV3I=;
 b=mdorGzg2LzGiR0C8GxZXl2UlSgbq9yAfDNeqY/Y4sEAXMkzTrTy0W8Kr2uoVdDfDD9xPFL
 oyXAtASGmQPpdlMBu3alqEE6W5MXKBS/g53aq/vzqyqQvd/Wau6H/EgoW/4QF2brlnxcz8
 J/je+VRBLPtGgC6HQsM65ElhOZHRrSrjAA/h3b3DeNYm8qz5z70Rx0ReayxNC8Vkgl0uvm
 UbxjwwfGeTa8XFj6JAADH+ZmpNnZuFUskfiiUqFVl0kxYv2Pg0kjhzMkwGxqq61zdoJ07W
 QFmJ9IrAIQ6mL5GnMbOolzzriyutWAccNDuyts4XEg1eS9RybRT0SlLBF3y9Kw==
Message-ID: <2fb53c04-17a1-439c-b8dd-ec52aa23808c@bootlin.com>
Date: Thu, 23 Oct 2025 09:19:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCO-0000000B2O4-1L3V@rmk-PC.armlinux.org.uk>
 <ad16837d-6a30-4b3d-ab9a-99e31523867f@bootlin.com>
 <aPkgeuOAX98aT-T7@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aPkgeuOAX98aT-T7@shell.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 2/6] net: phy: add
	phy_may_wakeup()
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



On 22/10/2025 20:20, Russell King (Oracle) wrote:
> On Wed, Oct 22, 2025 at 03:43:20PM +0200, Maxime Chevallier wrote:
>> Hi Russell,
>>
>> That's not exactly what's happening, this suggest this is merely a
>> wrapper around device_may_wakeup().
>>
>> I don't think it's worth blocking the series though, but if you need to
>> respin maybe this could be reworded.
>>
>> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> I've updated the description as I think patch 4 needs a repost:
> 
> +/**
> + * phy_may_wakeup() - indicate whether PHY has wakeup enabled
> + * @phydev: The phy_device struct
> + *
> + * Returns: true/false depending on the PHY driver's device_set_wakeup_enabled()
> + * setting if using the driver model, otherwise the legacy determination.
> + */
> +bool phy_may_wakeup(struct phy_device *phydev);
> +
> 
> Do you want me to still add your r-b?

Yes with this change, that's good for me you can add the tag :)

Thanks Russell,

Maxime

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
