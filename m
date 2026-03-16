Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SA6hHIYuuGm9aAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 17:23:34 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1464829D4DC
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 17:23:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C33E6C9008C;
	Mon, 16 Mar 2026 16:23:33 +0000 (UTC)
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2821DC1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 10:51:50 +0000 (UTC)
Received: from [10.10.11.34] (business-24-134-105-141.pool2.vodafone-ip.de
 [24.134.105.141])
 (Authenticated sender: g.gottleuber@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 0E8622FC0059;
 Mon, 16 Mar 2026 11:51:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1773658309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6P1WfCXmPPXsdssxLZw5rlIzwkS65jIG0ZCpM0UURKQ=;
 b=tJwDquSGG+qOrlQT3GyuxDJMLWvP2YmFUdgGNpOI+uYlngCSlVMSs2XB0zl1Wb5IHN2hls
 bv7hySJd9dqe+VWKD8qLjroUQXGrSu3WdMzeN2531nHYxxN3HQSufBdWZqUHBOOtBErN0t
 nnmGccl+zK47ZuLwMLLd0UJoTaCzHOc=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=g.gottleuber@tuxedocomputers.com
 smtp.mailfrom=g.gottleuber@tuxedocomputers.com
Message-ID: <10065160-928f-4196-aa72-58801837ab17@tuxedocomputers.com>
Date: Mon, 16 Mar 2026 11:51:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Georg Gottleuber <ggo@tuxedocomputers.com>
References: <E1vgY1k-00000003vOC-0Z1H@rmk-PC.armlinux.org.uk>
 <6f4929c3-d727-44a3-abc5-c33923dc69d7@tuxedocomputers.com>
 <abQ8tlRYrU5W4VaK@shell.armlinux.org.uk>
 <abRZzNmfK13nrxhR@shell.armlinux.org.uk>
Content-Language: en-US
From: Georg Gottleuber <g.gottleuber@tuxedocomputers.com>
Autocrypt: addr=g.gottleuber@tuxedocomputers.com; keydata=
 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
 bsxTTcOuRnk=
In-Reply-To: <abRZzNmfK13nrxhR@shell.armlinux.org.uk>
X-Mailman-Approved-At: Mon, 16 Mar 2026 16:23:30 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 Christoffer Sandberg <cs@tuxedocomputers.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: fix dwmac4 transmit
 performance regression
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
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[tuxedocomputers.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[tuxedocomputers.com:s=default];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:ggo@tuxedocomputers.com,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:cs@tuxedocomputers.com,m:wse@tuxedocomputers.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:hkallweit1@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[g.gottleuber@tuxedocomputers.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lunn.ch,vger.kernel.org,tuxedocomputers.com,st-md-mailman.stormreply.com,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.236];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[g.gottleuber@tuxedocomputers.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[tuxedocomputers.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxedocomputers.com:mid,st-md-mailman.stormreply.com:rdns,et.al:url]
X-Rspamd-Queue-Id: 1464829D4DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



Am 13.03.26 um 19:39 schrieb Russell King (Oracle):
> On Fri, Mar 13, 2026 at 04:35:02PM +0000, Russell King (Oracle) wrote:
>> On Fri, Mar 13, 2026 at 04:03:16PM +0100, Georg Gottleuber wrote:
>>> Am 16.01.26 um 01:49 schrieb Russell King (Oracle):
>>>> dwmac4's transmit performance dropped by a factor of four due to an
>>>> incorrect assumption about which definitions are for what. This
>>>> highlights the need for sane register macros.
>>>>
>>>> Commit 8409495bf6c9 ("net: stmmac: cores: remove many xxx_SHIFT
>>>> definitions") changed the way the txpbl value is merged into the
>>>> register:
>>>>
>>>>         value = readl(ioaddr + DMA_CHAN_TX_CONTROL(dwmac4_addrs, chan));
>>>> -       value = value | (txpbl << DMA_BUS_MODE_PBL_SHIFT);
>>>> +       value = value | FIELD_PREP(DMA_BUS_MODE_PBL, txpbl);
>>>>
>>>> With the following in the header file:
>>>>
>>>>  #define DMA_BUS_MODE_PBL               BIT(16)
>>>> -#define DMA_BUS_MODE_PBL_SHIFT         16
>>>>
>>>> The assumption here was that DMA_BUS_MODE_PBL was the mask for
>>>> DMA_BUS_MODE_PBL_SHIFT, but this turns out not to be the case.
>>>>
>>>> The field is actually six bits wide, buts 21:16, and is called
>>>> TXPBL.
>>>>
>>>> What's even more confusing is, there turns out to be a PBLX8
>>>> single bit in the DMA_CHAN_CONTROL register (0x1100 for channel 0),
>>>> and DMA_BUS_MODE_PBL seems to be used for that. However, this bit
>>>> et.al. was listed under a comment "/* DMA SYS Bus Mode bitmap */"
>>>> which is for register 0x1004.
>>>>
>>>> Fix this up by adding an appropriately named field definition under
>>>> the DMA_CHAN_TX_CONTROL() register address definition.
>>>>
>>>> Move the RPBL mask definition under DMA_CHAN_RX_CONTROL(), correctly
>>>> renaming it as well.
>>>>
>>>> Also move the PBL bit definition under DMA_CHAN_CONTROL(), correctly
>>>> renaming it.
>>>>
>>>> This removes confusion over the PBL fields.
>>>>
>>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>>
>>> Thank you for this patch, which significantly speeds up the transmit (by
>>> more than a factor of nine on our devices with Motorcomm yt6801).
>>>
>>> Unfortunately, this patch also causes DMA errors on two of our devices;
>>> logs from a iperf3 test are attached.
>>>
>>> Strangely enough, a third device with the same Motorcomm yt6801 does not
>>> appear to be affected by the DMA errors. However, further testing is needed.
>>>
>>> Do you have any ideas for further tests?
>>
>> I would suggest dumping the contents of these control registers prior
>> to commit 8409495bf6c9, and after this commit, comparing their values
>> to identify what has changed. I'm sorry, I don't have the bandwidth to
>> inspect the patches to see what may have been inadvertently changed.
> 
> Note that dwmac-motorcomm was merged between the broken commit
> 8409495bf6c9 and the fix 5ccde4c81e84. However, the broken commit was
> merged on 12 Jan, but there were postings of dwmac-motorcomm before
> this:
> 
> https://lore.kernel.org/netdev/20251014164746.50696-5-ziyao@disroot.org/
> 
> which uses the same parameters.
> 
> So, I wonder whether what you're running into is that with the
> breakage, the PCIe errors are masked. However, what I will note is that
> setting TxPBL to zero (as will happen with the breakage, since 32 & 1
> is 0) is documented as having undefined behaviour - so it's definitely
> wrong. Even if zero works there, you're operating the IP in undefined
> documented territory. If you really want to test that, with commit
> 5ccde4c81e84 applied, set txpbl to 64, as
> 
> 	FIELD_PREP(DMA_CHAN_TX_CTRL_TXPBL_MASK, 64)
> 
> will be zero because it overflows the 21:16 bitmask.
> 
> I suspect if you wind the kernel tree back to the before 8409495bf6c9,
> and then apply the motorcomm support patches, you may well see these
> PCIe errors - and that would rule out these changes. It would suggest
> that this is a pre-existing problem, or maybe a hardware issue.

Thank you very much for the explanation. You're right. I saw the DMA
errors in this case as well.

> Another idea would be to try reducing txpbl to see if there's a value
> where things stabilise.
> 

I'll give it a try.

Regards,
Georg

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
