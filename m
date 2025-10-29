Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E72BC1B8AD
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Oct 2025 16:06:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 476E1C5663B;
	Wed, 29 Oct 2025 15:06:54 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE947C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Oct 2025 15:06:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id EFE9CC0DA83;
 Wed, 29 Oct 2025 15:06:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 49CAA606E8;
 Wed, 29 Oct 2025 15:06:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 301DF117F8229; Wed, 29 Oct 2025 16:06:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761750411; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=/Nw6Y6Sr0yR7McdjN8jB2CldXstC1tCci1tzXd/HAvg=;
 b=D8FpEFXmjMF4R+aWYMbORindagatYBKwV/YIrHsuRMZ8cek3j1pjCNLb9U2Sf67BGYvyJ6
 /EoLZqLjt2+v74Au2HsINS06LScrLZlo/dV/MblC1t1KCPQt8l6qQrdPPm+Mm1pU4fmDgs
 P3ibVon21ooaDqIxYi/vNhy+KdtvBMlxUybFEa9l3dKYojcO8g2wfPthhgGN2+8VcOWjYl
 VM83huEwodh6AgYJDFP870reTD9JKQ6dncAtSv/87ZF6LkjLvz/yeGfXdy11i5A337JEFY
 OEHl2e3gDtAfG1RYv/LMdJPw+qgZurNkvESt5wOlCl9lybM0srT8577QXB+QhQ==
Message-ID: <d4b1c65d-17d2-4f41-b559-9cae55993f6e@bootlin.com>
Date: Wed, 29 Oct 2025 16:06:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
References: <20251029-agilex5_ext-v1-0-1931132d77d6@altera.com>
 <20251029-agilex5_ext-v1-4-1931132d77d6@altera.com>
 <07589613-8567-4e14-b17a-a8dd04f3098c@bootlin.com>
 <ed9e4ffb-3386-4a22-8d4c-38058885845a@altera.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <ed9e4ffb-3386-4a22-8d4c-38058885845a@altera.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next 4/4] net: stmmac: socfpga: Add
 hardware supported cross-timestamp
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

Hi Rohan,

On 29/10/2025 15:41, G Thomas, Rohan wrote:
> Hi Maxime,
> 
> On 10/29/2025 3:20 PM, Maxime Chevallier wrote:
>> Hi Rohan,
>>
>> On 29/10/2025 09:06, Rohan G Thomas via B4 Relay wrote:
>>> From: Rohan G Thomas <rohan.g.thomas@altera.com>
>>>
>>> Cross timestamping is supported on Agilex5 platform with Synchronized
>>> Multidrop Timestamp Gathering(SMTG) IP. The hardware cross-timestamp
>>> result is made available the applications through the ioctl call
>>> PTP_SYS_OFFSET_PRECISE, which inturn calls stmmac_getcrosststamp().
>>>
>>> Device time is stored in the MAC Auxiliary register. The 64-bit System
>>> time (ARM_ARCH_COUNTER) is stored in SMTG IP. SMTG IP is an MDIO device
>>> with 0xC - 0xF MDIO register space holds 64-bit system time.
>>>
>>> This commit is similar to following commit for Intel platforms:
>>> Commit 341f67e424e5 ("net: stmmac: Add hardware supported cross-timestamp")
>>>
>>> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>

[...]

>>> +	/* Time sync done Indication - Interrupt method */
>>> +	if (!wait_event_interruptible_timeout(priv->tstamp_busy_wait,
>>> +					      dwxgmac_cross_ts_isr(priv),
>>> +					      HZ / 100)) {
>>> +		priv->plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
>>> +		return -ETIMEDOUT;
>>
>> Don't you need to set priv->plat->flags |= STMMAC_FLAG_INT_SNAPSHOT_EN first?
>> Otherwise, timestamp_interrupt() in stmmac_hwtstamp() won't call wake_up()
>> on the wait_queue.
>>
> 
> Thanks for pointing this out. My intention was to use the polling
> method, but I accidentally left behind some code from experimenting with
> the interrupt method. While reverting those changes, I missed updating
> this part of the code. Will fix this in the next revision. Sorry for the
> error. Currently not seeing any timeout issues with polling method on
> XGMAC IP. Also some spurios interrupts causing stall when using
> the interrupt method in XGMAC.

So, if you use the polling method, this will likely bring this code
even closer to what's implemented in the intel dwmac wrapper. Is this
the same IP ?

To me it looks like the only difference will be a few
register offsets (XGMAC vs GMAC), some clock id and the mdio accesses,
maybe it could be worth considering re-using what's been done on the
Intel side and avoid duplication...

That could be all moved to stmmac_ptp for instance, using some flag
in the plat data to indicate if cross timestamping is supported, and
use the core type (xgmac, gmac, etc.) for the offsets ?

Of course with the risk of regressing dwmac-intel.c :(

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
