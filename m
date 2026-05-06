Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHmiM9mj+2mvegMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 22:26:01 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C574E026C
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 22:26:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C0DFC8F289;
	Wed,  6 May 2026 20:26:01 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05058C8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2026 20:25:59 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-8d68f702851so14993885a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 May 2026 13:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778099159; x=1778703959;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SdukG9VKDRkZW3L7pajWJZpmf+/8rRp6+77POw0TW7Q=;
 b=lbVdt4v7Wccw4Ah+nvQMCVJUJ1YyPEvdCouUl6yLDYi3EswMV2+f55sV328zRnJjvZ
 im9kMmVGu4Kl9sjZb6NpT4+YI4md6eicRM7cHBuTR6DqwSk4UzA3GVFVPVhKh9fscjmv
 UDvxrqmN3eUFESJpgEpQZafzbVu603ryt5WZ51S3taXOX2F7k979dvcMzC9qW/VlP7K2
 ISKX533dahXmNKDQqeVW0LwZ6yEMyDFP1vpGwEUmcGYkCbDtAei7rnGxHeUZ7NRel+BJ
 UM+nySSZyEmF2XcxtvLJkBRt8dNs+/7g3+URKFFD63NIFkWHx3XXlUGGBBmfdE081WQP
 j7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778099159; x=1778703959;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SdukG9VKDRkZW3L7pajWJZpmf+/8rRp6+77POw0TW7Q=;
 b=Jv56+Z+PN3BgmQhtqTqq1pZImue7B8QkQLHQ0k3s6OHHa3GW743AgXcLyUItiDWz9U
 sl8+JBpc2t3pWfGb2DOK1cwENMlWNBLlG+9XFFpsAqvMxyT8SgiikgtesTobo7pnB8Q1
 XdT6XvVFgglkuI1bf+tSr2Sc/2y7DFAwjkJxO2MXqwyOmxFoKV14mGwbSTdh1fCo5eIw
 eHB28FRwpmdliqG9U+PCzABIlxsmkWS56zSyx6zLkICHyD+hihztO164Lz+eGglur77s
 jlu25YqeZor2ihgJSOEj7vs1B0Lq8wIKooJXSSx6jPiSORiI7f6YXCjuu76rven6d5kY
 IpEQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+9apS7obWBuIgS5oE1fEdIepUouIJsj6MGn3wbWXfdlxc0xDXezbYxlYDVjLlDyw8mUJFhfqG2xxk0wA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyrZppLG9cHpG6phur962k7yDR6Du3xErhMDrUAjrS82d4OE6XL
 ZqiLhlr/b5HZhQJDmdId1rllbc853ZLUY5U87rKDkhuXKKEKZPQ16O3kFnkyB1R8Meg=
X-Gm-Gg: AeBDievKDLtIbI+I9XXA3jW3VTXw1U1G0mvKm2FVfAJnLygjB0pFFeaYk3zbkHKC+nv
 Xxsuno4v5cpad5zB7JGdgBsftOrdDgpS/2xfChsImzXUL/lobJGLMsRhwNC6GSMkPYm0l7cY1AM
 6tl/lVmuHSKD9CGETxG5s/2ktkYW/ulheAiJv5yTvnOkPwYBhdiqB83MFnwT3U3jFgDsCivdJuO
 CW8gxakgoRRLfrFvVxxGYSgp3XL8JCt1+elKeOmy0MgzA/ot5jqGfixp3934+1dkAnHOpH4VciS
 dlfjphDCg8Crns3OmqV/sMINKTTRFIACVhNp0t/nq229Eh0a+D7xvDGeIRFhFPdHvjTCLiZqxAj
 UGUfjPc+PNhqlu4qkTMHi5MH81GjQ7cfZ7wWXkObuFYQ4s6P16A3ukKPN6dDxkBIDL0VIOIcVTW
 mnYk4Q/WwH1Mnuf4WwkGBtGqOVBCWpyzY2U2sZAgy35kpP2DkY86l55HUcul71lQSSSj9gKthn/
 Q==
X-Received: by 2002:a05:620a:298c:b0:8f6:2efb:b10d with SMTP id
 af79cd13be357-904d5ffe436mr774330185a.35.1778099158536; 
 Wed, 06 May 2026 13:25:58 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8fc2c25324esm2003603885a.23.2026.05.06.13.25.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 13:25:57 -0700 (PDT)
Message-ID: <79684efa-4ba9-4144-a99b-dab935007a2f@riscstar.com>
Date: Wed, 6 May 2026 15:25:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
 <736fb3b7-c88a-4ec4-96ad-d1b79cc48d30@lunn.ch>
 <30cec7dd-ac3c-47ab-896a-c29992bd5ba5@riscstar.com>
 <3666e3e6-e6f3-4cbf-b9fe-caa394fbab7c@lunn.ch>
 <0751a051-9894-45be-92d6-0d46f2c39293@riscstar.com>
 <7d7b6b89-3ef4-4891-a794-c8b11f39db34@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <7d7b6b89-3ef4-4891-a794-c8b11f39db34@lunn.ch>
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 daniel@riscstar.com, chenchuangyu@xiaomi.com, edumazet@google.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
 daniel@iogearbox.net, chenhuacai@kernel.org, john.fastabend@gmail.com,
 maxime.chevallier@bootlin.com, siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 kuba@kernel.org, pabeni@redhat.com, konradybcio@kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, hawk@kernel.org,
 arnd@arndb.de, brgl@kernel.org, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, rohan.g.thomas@altera.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, livelycarpet87@gmail.com,
 linux-gpio@vger.kernel.org, rmk+kernel@armlinux.org.uk, wens@kernel.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 gregkh@linuxfoundation.org, linusw@kernel.org, a0987203069@gmail.com,
 davem@davemloft.net, andrew+netdev@lunn.ch, boon.khai.ng@altera.com,
 mcoquelin.stm32@gmail.com, inochiama@gmail.com, krzk+dt@kernel.org,
 julianbraha@gmail.com, matthew.gerlach@altera.com, andersson@kernel.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 09/12] gpio: tc956x: add
	TC956x/QPS615 support
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
X-Rspamd-Queue-Id: 61C574E026C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a098720306
 9@gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,riscstar.com,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	NEURAL_HAM(-0.00)[-0.841];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid]

On 5/6/26 2:43 PM, Andrew Lunn wrote:
>>>                 ----------------------------------
>>>                 |              Host              |
>>>                 ------+...+----------+........+---
>>>                       |i2c|          |  PCIe  |
>>>       ----------------+...+----------+........+------
>>>       | TC956x        |I2C|          |upstream|     |
>>>       |               -----        --+--------+---  |
>>>       |  -----  ------  -------    | PCIe switch |  |
>>>       |  |SPI|  |GPIO|  |reset|    |             |  |
>>>       |  -----  ------  |clock|    | DS3 DS2 DS1 |  |
>>>       |                 -------    ---++--++--++--  |
>>>       |  -----  ------     downstream//    \\  \\   |  downstream
>>>       |  |MCU|  |SRAM|    /==========/      \\  \===== PCIe port 1
>>>       |  -----  ------   //PCIe port 3       \\     |
>>>       |                  ||                   \======= downstream
>>>       |  ----+-----------++-----------+----         |  PCIe port 2
>>>       |  | M | internal PCIe endpoint | M |         |
>>>       |  | S |------------------------| S |  ------ |
>>>       |  | I |   PCIe   |  |   PCIe   | I |  |UART| |
>>>       |  | G |function 0|  |function 1| G |  ------ |
>>>       |  | E |----++----|  |----++----| E |         |
>>>       |  | N |  eMAC 0  |  |  eMAC 1  | N |         |
>>>       --------+.......+------+.....+-----------------
>>>               |USXGMII|      |SGMII|
>>>             --+.......+--  --+.....+--
>>>             |  ARQ113C  |  | QEP8121 |
>>>             |    PHY    |  |   PHY   |
>>>             -------------  -----------
>>>
> 
> 
>> Because the internal endpoint won't operate until the PCIe
>> power controller has enabled power, this GPIO driver and
>> the PCIe power control driver won't interfere with each
>> other's access to the shared registers.
> 
> What i find interesting is that there are two GPIOs, and two external
> downstream PCIe ports. A naive way of looking at this is that each
> external PCIe port has one GPIO. And the internal PCIe port does not
> have one. Hence the internal port might well work without any
> additional setup?  That was my thinking.

I see what you're saying.  I don't actually know what effect those
two reset signals have on the internal PCIe endpoint or its port.

Here is what the power control driver does:
- asserts those two reset signals (via direct register writes)
     - for every port on the switch:
         - disables the port (which programs a sequence of values to
           specific addresses)
         - sets several PCIe configuration options
             - l0s_entry_delay
             - l1_entry_delay
             - TX amplitude
             - NFTS
             - disable DFE
- Finally deasserts those two reset signals again.

And "every port on the switch" is:
- USP (upstream port)
- DSP 1, 2, 3 (downstream ports, including the embedded one)
- Ethernet (which tells me maybe we need to update that driver
   to support two eMACs?)

The whole point of this power control driver is that it doesn't
actually power up the PCIe switch at all until *after* this
configuration step is complete.  So I believe the internal
endpoint and its two functions aren't powered until after the
power control driver finishes probing.

The GPIO controller is obviously alive when the power control
driver runs though.

> But you are saying it is not as simple as this, and two GPIOs affect
> three ports? Do you have any idea what they actually do?

To be honest, for the most part we haven't looked closely at
the PCIe power control driver--though it's relatively simple
and I understand how the code works...

So I don't know the answer, but I expect with some work I
might be able to find out.


To be clear, the reason you're asking is that you're suggesting
we might want to model the GPIO controller differently, correct?

I.e., model it as *not* associated with the embedded PCIe
functions.  Then we need to think about what its parent device
would be (the power control device, which I think somehow
duplicates the switch device?).

					-Alex

>        Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
