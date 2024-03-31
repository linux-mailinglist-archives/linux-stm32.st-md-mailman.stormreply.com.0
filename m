Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54779892F00
	for <lists+linux-stm32@lfdr.de>; Sun, 31 Mar 2024 10:35:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 056A2C6C820;
	Sun, 31 Mar 2024 08:35:01 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8992C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 Mar 2024 08:34:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDE87FF802;
 Sun, 31 Mar 2024 08:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1711874099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bkZCTZa2SatyGqLS+NTU0GDbJQ+zI3N+D0QKibBZfFo=;
 b=QDlQrJbB2rfbs4C1sU9IDLdaWQ07Bwzdr9P4B5RCC+MWQIfcjVBaFGtDuBHlw0Dnmdc8iB
 qZFFdLSLc8dlSfJR9Xwkb5vLq4l37Lu4sDOycMhDCjE/ANGx8jXtnirdOd60VPGdJP1i9y
 KWZY7shJ0cUKpD1Hc1FpmWk5JMXFawMxeIhWPE/3wIVCQ8AVym5wGmRiVfMZwwwkwVU8z4
 ftsot8rUb4bMoRVoYTuGKJkASlmJCri07zpmxPFP3h1NpijrAM2k4q+HLh2aXeWYC4vsH5
 vGJf+6vwi54D5xqpg6hc2+CeFSc3dLitXSb/uQkZIlPKbpuoTsFCaV0Z93GWfg==
Date: Sun, 31 Mar 2024 10:35:32 +0200 (CEST)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cathy Cai <cathy.cai@unisoc.com>
In-Reply-To: <20240327110142.159851-1-cathy.cai@unisoc.com>
Message-ID: <d1da7fdb-10f6-7f69-4820-520469c0193c@bootlin.com>
References: <20240327110142.159851-1-cathy.cai@unisoc.com>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: joabreu@synopsys.com, cixi.geng1@unisoc.com, cathycai0714@gmail.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, zhiguo.niu@unisoc.com,
 xuewen.yan94@gmail.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 wade.shu@unisoc.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH] net: stmmac: Fix the problem about
	interrupt storm
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

Hello Cathy,

On Wed, 27 Mar 2024, Cathy Cai wrote:

> Tx queue time out then reset adapter. When reset the adapter, stmmac driver
> sets the state to STMMAC_DOWN and calls dev_close() function. If an interrupt
> is triggered at this instant after setting state to STMMAC_DOWN, before the
> dev_close() call.
> 
...
> -	set_bit(STMMAC_DOWN, &priv->state);
>  	dev_close(priv->dev);
> +	set_bit(STMMAC_DOWN, &priv->state);
>  	dev_open(priv->dev, NULL);
>  	clear_bit(STMMAC_DOWN, &priv->state);
>  	clear_bit(STMMAC_RESETING, &priv->state);

If this IRQ issue can happen whenever STMMAC_DOWN is set while the net device is 
open, then it could also happen between the dev_open() and 
clear_bit(STMMAC_DOWN) calls right? So you'd have to clear STMMAC_DOWN before 
calling dev_open() but then I don't see the usefulness of setting STMMAC_DOWN 
and clearing it immediately. Maybe closing and opening the net device should be 
enough?

Moreover, it seems strange to me that stmmac_interrupt() unconditionnally 
ignores interrupts when the driver is in STMMAC_DOWN state. This seems like 
dangerous behaviour, since it could cause IRQ storm issues whenever something 
in the driver sets this state. I'm not too familiar with the interrupt handling 
in this driver, but maybe stmmac_interrupt() could clear interrupts 
unconditionnally in the STMMAC_DOWN state?

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
