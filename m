Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDwqMzKdf2nquQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Feb 2026 19:36:34 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 754A2C6F30
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Feb 2026 19:36:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33C64C01E77;
	Sun,  1 Feb 2026 18:36:34 +0000 (UTC)
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D05CCFAC40
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Feb 2026 18:36:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5F55C109D9D; Sun,  1 Feb 2026 19:36:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
 s=dkim; t=1769970991;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=LARm2Y3oL9MqfVRvr87lH7jEV+ZHtuB87P+3QLUsfN8=;
 b=NBNAV/WqTMJCNSC3XKmzFMaQg50nfqsgqNjohQWgTwz2cl63bw7bslLiPdI7BHXhL/Czq7
 FOeJO9GgdbK7MVeCHC8R7tilL8fqzmPLqNh7TiJcxRp4BoaYI+6CqlY4d5fe55jho6HQEU
 9tmHj3kpUwsKNhQyYMYrmdRHKPQi8atOhn9uj6n20dGBsqoGFybPwDpSmRiN7iH3p3qKH2
 NDZhfrvRzkRz33AokZ7yITLhWf6B3ysRdf2lk+rQHg44Uyg84JbZH3lXJYWoPZTMlM6bV0
 SMEcPVnREi3xMMEgNGgiz/oGwm9csACAkFjfxPSV3MJXaH6JRgYbT0cVtc8tWw==
Message-ID: <35d31893-2a28-410f-a1c7-038b4167e265@nabladev.com>
Date: Sun, 1 Feb 2026 19:20:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20260114081809.12758-1-marex@nabladev.com>
 <aWfEXX1iMHy3V5sK@shell.armlinux.org.uk>
 <aWfOYf_YmJFUakvP@shell.armlinux.org.uk>
 <6c9cadc2-67b7-4bfe-9cf7-2b102a0a3c21@nabladev.com>
 <aXzT1UCpG4kN-dQv@shell.armlinux.org.uk>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <aXzT1UCpG4kN-dQv@shell.armlinux.org.uk>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[nabladev.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[nabladev.com:s=dkim];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[marex@nabladev.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:linux-kernel@vger.kernel.org,m:horms@kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:krzk@kernel.org,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kernel@dh-electronics.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,st-md-mailman.stormreply.com,davemloft.net,lunn.ch,google.com,dh-electronics.com,gmail.com,redhat.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marex@nabladev.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[nabladev.com:-];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,nabladev.com:mid]
X-Rspamd-Queue-Id: 754A2C6F30
X-Rspamd-Action: no action

On 1/30/26 4:52 PM, Russell King (Oracle) wrote:
> On Thu, Jan 15, 2026 at 12:27:05AM +0100, Marek Vasut wrote:
>> On 1/14/26 6:12 PM, Russell King (Oracle) wrote:
>>> I think I'm going to start over, trying to figure out what happened.
>>>
>>> c7308b2f3d0d net: stmmac: stm32: convert to suspend()/resume() methods
>>>
>>> Did the conversion, and it always called stm32_dwmac_clk_disable() and
>>> where it exists, dwmac->ops->suspend() on suspend, provided
>>> stmmac_suspend() returns zero (which it will do, even if the interface
>>> is down. On resume, it always calls dwmac->ops->resume() and
>>> stm32_dwmac_init() before calling stmmac_resume().
>>>
>>> The conversion added hooks into ny new ->suspend() and ->resume()
>>> methods to handle the stm32_dwmac_clk_disable(), dwmac->ops->suspend(),
>>> dwmac->ops->resume() and stm32_dwmac_init() steps.
>>>
>>> However, in 07bbbfe7addf I failed to realise that, in order to keep
>>> things compatible with how stuff works, we need to call
>>> priv->plat->suspend() even if the interface is down. This is where
>>> the bug is, not in your glue driver.
>>>
>>> Please try this:
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> index a8a78fe7d01f..2acbb0107cd3 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> @@ -8066,7 +8066,7 @@ int stmmac_suspend(struct device *dev)
>>>    	u32 chan;
>>>    	if (!ndev || !netif_running(ndev))
>>> -		return 0;
>>> +		goto suspend_bsp;
>>>    	mutex_lock(&priv->lock);
>>> @@ -8106,6 +8106,7 @@ int stmmac_suspend(struct device *dev)
>>>    	if (stmmac_fpe_supported(priv))
>>>    		ethtool_mmsv_stop(&priv->fpe_cfg.mmsv);
>>> +suspend_bsp:
>>>    	if (priv->plat->suspend)
>>>    		return priv->plat->suspend(dev, priv->plat->bsp_priv);
>> This works too, thank you.
>>
>> Will you send this fix ?
> 
> Sorry, I appear to have dropped this patch on the floor, and just
> tripped over it. I'm just build testing it and will send it later
> today.
> 
> This problem affects every user of the platform ->suspend/resume()
> stuff, so is not just a stm32 issue.
ACK, thank you.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
