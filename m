Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WK0oGLGG+2kscQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 20:21:37 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F04AA4DF41A
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 20:21:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21EFBC8F289;
	Wed,  6 May 2026 18:21:36 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B40F0C8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2026 18:21:34 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-8f0a87e23daso669392185a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 May 2026 11:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778091693; x=1778696493;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5oBqOeQFggE8v+cavTTn16m1Xk99yYA0Xp28tAkW6v4=;
 b=rOVniZlcQ+GSUXNJwp31jVWIT65aWC2/rWswx8St/GbCLTLdhrDQLSUpVBAkFi6CI+
 MpSP9RF7U8UptApE/hpZr19uiV5DD6veeukW6ZMi4efxkPWsjyOhCHf7U9Ibotj/3dQs
 gFNysFJbzMyb0mIep031Dnod+EWyi7Sv7G4sX5U6o+kpoADE+om9MoNyr4aGDpbTsRoj
 yZ1itrWLgbiiHFOONQLtJSA9t+MQF6dXxicD0Nvik/iGunqtIfiux16DT8V5dN3iRfzO
 CMcirWAzWtTgMYpnJtRKtrthfN5kiysZdAiIAJZ0OFDA29FM9JzKsHMRTC0Yoo50//Xy
 iZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778091693; x=1778696493;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5oBqOeQFggE8v+cavTTn16m1Xk99yYA0Xp28tAkW6v4=;
 b=o61ViKvLn7fI/Lk8yDudVKzXfyObZOwKIIhnGiYwKLgbxYcOB+ENweLYheGdaL3BDk
 hsWOpY1qX5QFFYSjJM02CwiKcL4LUMvTUJF7V+z+8vkDOQ20LAyazAN1PPiEtoSc01VO
 RKkcQDSHc72Ev9G2R2tFRo8nP2f92ryijrqJ+QkK/gVyxq08N2fFdKS4UBfJPopHG610
 GYe3RSBeuXQooMKUuywckZdMQdW/M1vyOzhIE03ghfqENUq8nCDAijVbzW5ianKOXoon
 PVc0bhs9qPKlHchE1imTR2rmvbVZYEoz7Ls0FpEndiiwkSKzbXxi1MeTSafcTnvh9ZJr
 +8sg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+dOFxDmC76LJNgiRSfiwvkS/F3WMqz7Ma1SiaUu4HT4zY/4m7RbR7UPPOI4Heu9eO/9+BjvKVjXiPaEA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxGelS10PnTBIv5lhPPUeI4jjUQhwmDKZL80ZYWaYdCtu6aLWDE
 HoKPJmg4rhOHyr9hWBPYma+CKoalUemwYlrgn4y8Lqa+RxDc/JTzA6tQIRXM8omno+M=
X-Gm-Gg: AeBDieuzviszG/FxzhgcQVcFg6I26Yyum09nyUIxQCVUXYQMZd/LGfBvAx61Fj1aF17
 TWb7gWmwtmRRqbp4275fdOIsG+vY/Dba81qUrzHD4uXFKfgb8dOcr2hGf0dYwzkPDClKtr+1NMa
 GPupIWyLnhAxk0gFl8iWlKs+uns8XsChUe5VbKv8vsXOrNXfMVbBX+GHYmrBNwevJ3+aPf11Qps
 FIaNVYaFD9YMK8aummWcB/GF4oNV9YkABmo9TsHPBQtmmYKPiS8VpPMv6aavHcnA3pyIVe4jWSu
 Dk8ztS80xarL2hnprVLDChJFZmiUlVdN7ONB4XsMMe9ZOD54P7KnYoFt40Jc2H+LpdPTFnAVgii
 tzY8h5tKIGha1dP/jZm0E+OjUOuKkBEVRlKh5T/YWiWXhwhVfvjROU5j+QCwMiQc9/dYCdv0uzh
 mdQLHtlP1Gl509iQPkihqvQDEDEfBAHjB6TcWL2mbhGrTkh8I++6PkB15LvKyJcdptCpdgFm7+U
 Q==
X-Received: by 2002:a05:620a:29c1:b0:8ef:12de:1337 with SMTP id
 af79cd13be357-904d60f5233mr705172585a.38.1778091693050; 
 Wed, 06 May 2026 11:21:33 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8fc2cd057acsm1895096485a.47.2026.05.06.11.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 11:21:32 -0700 (PDT)
Message-ID: <0751a051-9894-45be-92d6-0d46f2c39293@riscstar.com>
Date: Wed, 6 May 2026 13:21:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
 <736fb3b7-c88a-4ec4-96ad-d1b79cc48d30@lunn.ch>
 <30cec7dd-ac3c-47ab-896a-c29992bd5ba5@riscstar.com>
 <3666e3e6-e6f3-4cbf-b9fe-caa394fbab7c@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <3666e3e6-e6f3-4cbf-b9fe-caa394fbab7c@lunn.ch>
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
X-Rspamd-Queue-Id: F04AA4DF41A
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
	NEURAL_HAM(-0.00)[-0.848];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,stormreply.com:url,stormreply.com:email]

On 5/2/26 10:05 PM, Andrew Lunn wrote:
> On Sat, May 02, 2026 at 08:45:48PM -0500, Alex Elder wrote:
>> On 5/1/26 1:36 PM, Andrew Lunn wrote:
>>>> + * There is a TC956X PCI power controller driver that accesses the
>>>> + * direction and output value registers for GPIOs 2 and 3.  These
>>>> + * GPIOs control the reset signal for the two downstream PCIe ports.
>>>> + * Their values will never change during operation of this driver, and
>>>> + * this driver reserves these two GPIOS.
>>>
>>> Why doesn't this power controller driver actually use this driver to
>>> control the GPIOs? Chicken/egg?
>>
>> I am not the one with authority on this, but yes, that's my
>> understanding.  *Something* about this chip requires that the
>> PCIe ports need to have some configuration done on them *before*
>> PCIe is powered up.  So that driver uses the I2C interface to
>> apply these settings.  Meanwhile this driver uses the PCIe-mapped
>> memory to manage the GPIO registers.
> 
> The diagram you have is:
> 
> 
>                ----------------------------------
>                |              Host              |
>                ------+...+----------+........+---
>                      |i2c|          |  PCIe  |
>      ----------------+...+----------+........+------
>      | TC956x        |I2C|          |upstream|     |
>      |               -----        --+--------+---  |
>      |  -----  ------  -------    | PCIe switch |  |
>      |  |SPI|  |GPIO|  |reset|    |             |  |
>      |  -----  ------  |clock|    | DS3 DS2 DS1 |  |
>      |                 -------    ---++--++--++--  |
>      |  -----  ------     downstream//    \\  \\   |  downstream
>      |  |MCU|  |SRAM|    /==========/      \\  \===== PCIe port 1
>      |  -----  ------   //PCIe port 3       \\     |
>      |                  ||                   \======= downstream
>      |  ----+-----------++-----------+----         |  PCIe port 2
>      |  | M | internal PCIe endpoint | M |         |
>      |  | S |------------------------| S |  ------ |
>      |  | I |   PCIe   |  |   PCIe   | I |  |UART| |
>      |  | G |function 0|  |function 1| G |  ------ |
>      |  | E |----++----|  |----++----| E |         |
>      |  | N |  eMAC 0  |  |  eMAC 1  | N |         |
>      --------+.......+------+.....+-----------------
>              |USXGMII|      |SGMII|
>            --+.......+--  --+.....+--
>            |  ARQ113C  |  | QEP8121 |
>            |    PHY    |  |   PHY   |
>            -------------  -----------
> 
> The two Ethernet controllers are hanging off port 3 of the
> switch. However, the GPIO block is just floating in space. What
> address space is it in?

Well, that isn't easily representable.

In fact, the GPIO (and UART and eMACs, etc.) is accessible
multiple ways.   They are in a single "SFR" range of memory
within the TC956x, which is partitioned into sub-ranges for
the separate IP blocks.

E.g:
0x40000000	Bootup config registers (size 0x1000)
0x40006000	UART registers (size 0x1000)
0x40020000	PCIe registerfs (size 0x00010000)
0x40040000	EMAC0 (size 0x8000)
and others.

The MCU has access to this SFR space.  The host CPU can
access it via the I2C interface (as the PCIe power control
driver does).  The PCIe power control driver actually
touches the GPIO registers to be able to assert reset
on the two downstream PCIe ports.

In addition, BAR4 for both PCIe functions has access to the
same SFR space.  So in fact, both of these functions are
capable of controlling GPIOs.  We are having just one of
them (function 0) be responsible for that.

> I'm wondering if the GPIO controller should be a device/driver of its
> own? It probes first. The PCI power controller driver then probes, and
> has phandles to the GPIO controller so it can activate ports 1 and
> 2. Parallel to that the Ethernet driver(s) can probe, also using
> phandles to the GPIO they need.
> 
> Looking at this diagram, putting the GPIO controller within one of the
> port 3 functions is wrong. But maybe the diagram is not accurate.

When the PCIe power controller was implemented, the GPIO
functionality was not separated out.  That driver simply
touches two registers to manage asserting reset on the two
downstream PCIe ports.  (It changes these only during the
appropriate times during power-up and power-down of the ports.)

It's possible *that* work could have implemented a separate
GPIO driver.  We did not pursue modifying the power control
driver to work that way.

Instead, we modeled it starting with the STMMAC driver (which
is how the Toshiba vendor driver works).  But we separated
the GPIO functionality into a separate (auxiliary) device,
which has its own driver.

Because the internal endpoint won't operate until the PCIe
power controller has enabled power, this GPIO driver and
the PCIe power control driver won't interfere with each
other's access to the shared registers.

In short, because this "SFR" space is available in various
ways, there are several ways the GPIO (and other) IP can
be managed and represented.

					-Alex

> 
>       Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
