Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C49DD21C1E
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jan 2026 00:27:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10861C8F274;
	Wed, 14 Jan 2026 23:27:16 +0000 (UTC)
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D15A0C8F273
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 23:27:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2988210BED7; Thu, 15 Jan 2026 00:27:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
 s=dkim; t=1768433233;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=IiEt5tJdQlHAgpu2iagQYFNv192gre7oSLS/ZJhMtzE=;
 b=YUg1qGLJSITou0JJmJWYIydNnCKQ1FkTkndzOlAplCVJORItwbrLJGylBFPxYUvrzwguKA
 88r+FXMfkjMQZyWds34VpeotYk0TorwZZ/wOWAJvlrLntLf9r423sH6R5u3kF6bFI5fTi6
 t/zJ7TqUpNjZI1gU2qzNc9IYc5yH5daf2Ax6np8YLkc/xkoHgxu5zL2yZcJu7KCF3yXm+Y
 Eq2MbN0RVOHKU4JX9BUTSYsM0SsKibe71KoAogQVM2Wdsqwx/dgZlQrdPgU6lFB8a0Sx7J
 PndaRF57SYoIC4rvW18yVEfDNt82vOkMitOcqIGTq5HFtE9srI9um8AO6BMPfA==
Message-ID: <6c9cadc2-67b7-4bfe-9cf7-2b102a0a3c21@nabladev.com>
Date: Thu, 15 Jan 2026 00:27:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20260114081809.12758-1-marex@nabladev.com>
 <aWfEXX1iMHy3V5sK@shell.armlinux.org.uk>
 <aWfOYf_YmJFUakvP@shell.armlinux.org.uk>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <aWfOYf_YmJFUakvP@shell.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzk@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next,
 PATCH] net: stmmac: stm32: Do not suspend downed interface
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 1/14/26 6:12 PM, Russell King (Oracle) wrote:
> On Wed, Jan 14, 2026 at 04:29:17PM +0000, Russell King (Oracle) wrote:
>> On Wed, Jan 14, 2026 at 09:17:54AM +0100, Marek Vasut wrote:
>>> If an interface is down, the ETHnSTP clock are not running. Suspending
>>> such an interface will attempt to stop already stopped ETHnSTP clock,
>>> and produce a warning in the kernel log about this.
>>>
>>> STM32MP25xx that is booted from NFS root via its first ethernet MAC
>>> (also the consumer of ck_ker_eth1stp) and with its second ethernet
>>> MAC downed produces the following warnings during suspend resume
>>> cycle. This can be provoked even using pm_test:
>>>
>>> "
>>> $ echo devices > /sys/power/pm_test
>>> $ echo mem > /sys/power/state
>>> ...
>>> ck_ker_eth2stp already disabled
>>> ...
>>> ck_ker_eth2stp already unprepared
>>> ...
>>> "
>>>
>>> Fix this by not manipulating with the clock during suspend resume
>>> of interfaces which are downed.
>>
>> I don't think this is the correct fix. Looking back at my commits:
>> b51f34bc85e3 net: stmmac: platform: legacy hooks for suspend()/resume() methods
>> 07bbbfe7addf net: stmmac: add suspend()/resume() platform ops
>>
>> I think I changed the behaviour of the suspend/resume callbacks
>> unintentionally. Sorry, I don't have time to complete this email
>> (meeting.)
> 
> I think I'm going to start over, trying to figure out what happened.
> 
> c7308b2f3d0d net: stmmac: stm32: convert to suspend()/resume() methods
> 
> Did the conversion, and it always called stm32_dwmac_clk_disable() and
> where it exists, dwmac->ops->suspend() on suspend, provided
> stmmac_suspend() returns zero (which it will do, even if the interface
> is down. On resume, it always calls dwmac->ops->resume() and
> stm32_dwmac_init() before calling stmmac_resume().
> 
> The conversion added hooks into ny new ->suspend() and ->resume()
> methods to handle the stm32_dwmac_clk_disable(), dwmac->ops->suspend(),
> dwmac->ops->resume() and stm32_dwmac_init() steps.
> 
> However, in 07bbbfe7addf I failed to realise that, in order to keep
> things compatible with how stuff works, we need to call
> priv->plat->suspend() even if the interface is down. This is where
> the bug is, not in your glue driver.
> 
> Please try this:
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index a8a78fe7d01f..2acbb0107cd3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -8066,7 +8066,7 @@ int stmmac_suspend(struct device *dev)
>   	u32 chan;
>   
>   	if (!ndev || !netif_running(ndev))
> -		return 0;
> +		goto suspend_bsp;
>   
>   	mutex_lock(&priv->lock);
>   
> @@ -8106,6 +8106,7 @@ int stmmac_suspend(struct device *dev)
>   	if (stmmac_fpe_supported(priv))
>   		ethtool_mmsv_stop(&priv->fpe_cfg.mmsv);
>   
> +suspend_bsp:
>   	if (priv->plat->suspend)
>   		return priv->plat->suspend(dev, priv->plat->bsp_priv);
>   
This works too, thank you.

Will you send this fix ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
