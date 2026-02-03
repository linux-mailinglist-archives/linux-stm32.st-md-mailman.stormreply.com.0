Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEuTN0IigmmQPgMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 17:28:50 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 737F5DBF64
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 17:28:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AACFC58D7A;
	Tue,  3 Feb 2026 16:28:50 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC6C9C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 16:28:48 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-435a517be33so3507565f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Feb 2026 08:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770136128; x=1770740928;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K10+Z/PfLLLC2tLsBMJ7x0EDY9z49CyvtmsqUUYjuGg=;
 b=mz/GR9ZhKo8MAA9vQl7v27bCyVlJ9nMJjFvPdocf3R4ehPpt2m70DraI4AvgZXgolZ
 ropO91BH88tWyTM+EKttG+Yeixuk9Zr7Kllbe5/s3ubZEjlk1asgtZ3g8K2A8z9BXC/2
 ecIidBrg/OIqvrRLOb1MelO5yHC0KuTrd7rQxZCWrrG+CiS8AYTVbUtlvkSCN96QfSZI
 QIiT5td3UDUhXPwIUtgBhUjh6espQTVIX/p5FVml1JR+ujwYdEiPi8v1uXXm77xWyCk3
 gcVimc/+kINhloiT1/1/0eYAeharLXDwfotRxE2HZ4evb/NAkWvuPNDWcdGtHASX65+4
 v8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770136128; x=1770740928;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K10+Z/PfLLLC2tLsBMJ7x0EDY9z49CyvtmsqUUYjuGg=;
 b=CpDQH0zng8++ZLtyG/4wc4CNaqKUGGdwJ7Ef7NM2hPGFQNXo2ywBh1QrRyxE4Y7TKY
 HzC2Jc03Y64ZDJkIgwKg0iy1tWXPORJaE2gyfTkvQ0u9yXElzwurFf7Fl9XohGP+xGlM
 w7aWNcyIT4zXCNiyCnxhAuS3Kq77Ss14fuDwkhN3DUD2GMlru+caI+FNaZpq72NTNdLj
 YYNGQgRaMr4qAQZHnmWsVLoX3V4sqNWeRYw7AwblDCtenUa8A3EFW1+rpQMRd6hLp4Eq
 +Wst35Vgq3BlBhzjrZ/LzeJ6kCjArqiBJC6QVqlYR8mx1JUP1luNobHZ/PFPWTOHigds
 Rd8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfklSy9QbAWXVJxRtzlngxeRDQW09YawbKJvVjntE1xS1Gn+fKbpVs21qce7UFm+JrPXJTtX1heQFJvw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx7cRnRkErkOm9/hvCWHCH8e3XXbLPfJGwSCw7CWJCzQgIOragd
 xPpnB0oGZve5OAZNicL8I/0XdXZObycow7RGNRJXUhaR0J2JwsZLsQF9
X-Gm-Gg: AZuq6aLtKKLLJDEF4nmIVGplK5NbMthOCh1P9lu2HrOCthhcNTZpWNPAcXh2DqhJKaL
 Te72mDnfEMVaZz+ZbzqCefYm7pQWe+63tW1Pbhrx54SOwR49o1MsQnjVNNGZG7FdufZf79ctADn
 1DFblDWiLnf/Hv0WzVKBrpcl8oSC2llGuRlbqmuIeyYzWLBNj7PjrKUf8bd0qGnQ66/W2GgEkRl
 XBV/RPLeUmVzZdDPJ+e0agYDik6Gb7Oe+2nQha9Q5TCsS0rZEWrySRBbSaC1iXbfD9Hq0K0OjGr
 OXLSZAjD4yCNvS1fTPXWQhnM3MA3+HffOQZ/ItHpD4fmx7X8z1bcEy1RT+kkj49qjhcEex25oBq
 bQvzPyHNFb0G/EZtiShQHAWMj1PQVtKYnzZ2o+8qydAiywL7fqjoJad63IbnKkuvEppRAnJzN7a
 JmN8aW+YaqRO6F3+ZmCyD5/T3h
X-Received: by 2002:a5d:5e01:0:b0:435:b068:d3be with SMTP id
 ffacd0b85a97d-435f3aa90cemr24034054f8f.41.1770136128003; 
 Tue, 03 Feb 2026 08:28:48 -0800 (PST)
Received: from [192.168.0.7] ([86.124.200.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131cfd4sm50668256f8f.25.2026.02.03.08.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 08:28:47 -0800 (PST)
Message-ID: <434bff80-0b89-4fe5-beb2-4b70a4b600d8@gmail.com>
Date: Tue, 3 Feb 2026 18:28:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk>
 <f95f73b9-d024-4697-bca1-02fb8bc044af@gmail.com>
 <aYEj8VM5AfvcDHrl@shell.armlinux.org.uk>
 <ea2434e6-d1db-4ea2-90f4-0a77961b7918@gmail.com>
 <aYIXmsIG_ZJO-cg4@shell.armlinux.org.uk>
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
In-Reply-To: <aYIXmsIG_ZJO-cg4@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev,
 Eric Dumazet <edumazet@google.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Clark Wang <xiaoning.wang@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Wei Fang <wei.fang@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next] net: stmmac: provide flag to
	disable EEE
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:imx@lists.linux.dev,m:edumazet@google.com,m:laurent.pinchart@ideasonboard.com,m:stefan.klug@ideasonboard.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:ghidoliemanuele@gmail.com,m:kieran.bingham@ideasonboard.com,m:o.rempel@pengutronix.de,m:xiaoning.wang@nxp.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:s.hauer@pengutronix.de,m:dan.scally@ideasonboard.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:andrew+netdev@lunn.ch,m:kernel@pengutronix.de,m:wei.fang@nxp.com,m:shawnguo@kernel.org,m:davem@davemloft.net,m:hkallweit1@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ovidiupanaitoss@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ovidiupanaitoss@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lunn.ch,lists.linux.dev,google.com,ideasonboard.com,gmail.com,st-md-mailman.stormreply.com,kernel.org,pengutronix.de,nxp.com,redhat.com,lists.infradead.org,vger.kernel.org,davemloft.net];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 737F5DBF64
X-Rspamd-Action: no action



On 2/3/26 5:43 PM, Russell King (Oracle) wrote:
> On Tue, Feb 03, 2026 at 05:42:07PM +0200, Ovidiu Panait wrote:
>>
>> Hi Russell,
>>
>> On 2/3/26 12:23 AM, Russell King (Oracle) wrote:
>>> On Mon, Feb 02, 2026 at 08:54:52PM +0200, Ovidiu Panait wrote:
>>>>
>>>> Hi Russell,
>>>>
>>>> On 11/24/25 1:27 PM, Russell King (Oracle) wrote:
>>>>> Some platforms have problems when EEE is enabled, and thus need a way
>>>>> to disable stmmac EEE support. Add a flag before the other LPI related
>>>>> flags which tells stmmac to avoid populating the phylink LPI
>>>>> capabilities, which causes phylink to call phy_disable_eee() for any
>>>>> PHY that is attached to the affected phylink instance.
>>>>>
>>>>> iMX8MP is an example - the lpi_intr_o signal is wired to an OR gate
>>>>> along with the main dwmac interrupts. Since lpi_intr_o is synchronous
>>>>> to the receive clock domain, and takes four clock cycles to clear, this
>>>>> leads to interrupt storms as the interrupt remains asserted for some
>>>>> time after the LPI control and status register is read.
>>>>>
>>>>> This problem becomes worse when the receive clock from the PHY stops
>>>>> when the receive path enters LPI state - which means that lpi_intr_o
>>>>> can not deassert until the clock restarts. Since the LPI state of the
>>>>> receive path depends on the link partner, this is out of our control.
>>>>> We could disable RX clock stop at the PHY, but that doesn't get around
>>>>> the slow-to-deassert lpi_intr_o mentioned in the above paragraph.
>>>>>
>>>>> Previously, iMX8MP worked around this by disabling gigabit EEE, but
>>>>> this is insufficient - the problem is also visible at 100M speeds,
>>>>> where the receive clock is slower.
>>>>>
>>>>> There is extensive discussion and investigation in the thread linked
>>>>> below, the result of which is summarised in this commit message.
>>>>>
>>>>
>>>> We are seeing the same lpi_intr_o interrupt storm on the Renesas RZ/V2H
>>>> EVK (dwmac-renesas-gbeth.c). On this platform, lpi_intr_o is routed as a
>>>> separate, dedicated interrupt line to the CPU rather than being OR'd
>>>> with the main DWMAC interrupt as on iMX8MP. This corresponds to the
>>>> "eth_lpi" interrupt in the stmmac bindings:
>>>> """
>>>> - description: The interrupt that occurs when Rx exits the LPI state
>>>> const: eth_lpi
>>>> """
>>>>
>>>> Looking through the other glue drivers/device-trees, it looks to me that
>>>> every platform that defines a separate "eth_lpi" irq might have the
>>>> interrupt storm problem.
>>>
>>> That is highly likely.
>>>
>>>> To fix this issue on these platforms, rather than disabling EEE
>>>> altogether, would it be possible to just not request the eth_lpi
>>>> interrupt and let EEE continue to work? Perhaps a new flag could let
>>>> each platform decide.
>>>
>>> Yes, because lpi_intr_o serves no purpose from a software point of
>>> view - see the commit message below for the details. I do like
>>> removing code from stmmac :)
>>>
>>>> If not, maybe this patch could be merged to add the flag that disables
>>>> EEE and I will just send a patch to disable EEE on our platforms as well.
>>>
>>> We still need the flag to disable EEE for platforms where lpi_intr_o is
>>> logically OR'd with the other interrupts, so there's no way to ignore
>>> its persistent assertion.
>>>
>>> 8<===
>>> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
>>> Subject: [PATCH net-next] net: stmmac: remove support for lpi_intr_o
>>>
>>> The dwmac databook for v3.74a states that lpi_intr_o is a sideband
>>> signal which should be used to ungate the application clock, and this
>>> signal is synchronous to the receive clock. The receive clock can run
>>> at 2.5, 25 or 125MHz depending on the media speed, and can stop under
>>> the control of the link partner. This means that the time it takes to
>>> clear is dependent on the negotiated media speed, and thus can be 8,
>>> 40, or 400ns after reading the LPI control and status register.
>>>
>>> It has been observed with some aggressive link partners, this clock
>>> can stop while lpi_intr_o is still asserted, meaning that the signal
>>> remains asserted for an indefinite period that the local system has
>>> no direct control over.
>>>
>>> The LPI interrupts will still be signalled through the main interrupt
>>> path in any case, and this path is not dependent on the receive clock.
>>>
>>> This, since we do not gate the application clock, and the chances of
>>> adding clock gating in the future are slim due to the clocks being
>>> ill-defined, lpi_intr_o serves no useful purpose. Remove the code which
>>> requests the interrupt, and all associated code.
>>>
>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>
>> Thanks for fixing this. I did some testing on the Renesas RZ/V2H board
>> with this patch and didn't see any issues:
>>
>> Tested-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> 
> Would you say this is a regression or a new problem?

I don't think it is a regression per se. AFAICT this behavior was always
present as long as EEE is enabled, but I only noticed it after I changed
the network switch the board was connected to.

Thanks,
Ovidiu

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
