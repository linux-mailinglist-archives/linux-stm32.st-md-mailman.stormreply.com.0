Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMYTIYCT+GnTwgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:28 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8714BD077
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20163C57A51;
	Mon,  4 May 2026 12:39:28 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65755C8F276
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 May 2026 02:22:43 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-89fc4147f2eso39850056d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 02 May 2026 19:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777774962; x=1778379762;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ECqabU+TDy0NRCRIeEAH6lrHAxlzLyRi5L607lh5qbM=;
 b=gcocHhihavMtQIzR/ZFMinOrmzf3hWLwofXWboyqmbarlJFQxKSErCqjumXGc73q59
 AEPp1+ECh0kxavAzSq5SCkSX4tN6nciKc9PeR4nwUo82d4vhUF5PxmSB3tqsxMpEcOWZ
 75FkSqYEv1Z4903EW4/RE7Xj0SIZHnn+uNF9mTuI+rh1pPV2enl92UiJ3T/kNjSov7ZT
 5B7+8Y7wvoojUds0ubj4DJf3ASXoDelZyWu4/hwvOLXzC1D+WnZWSPbFEUCY7OLBuWCU
 p4hYa5Bi0ZVEsCg9PO+A7dXh+4/5o/8ifQD4Cto7Q25HTBE+gCMS5i8w6enl4FbFCLvK
 nZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777774962; x=1778379762;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ECqabU+TDy0NRCRIeEAH6lrHAxlzLyRi5L607lh5qbM=;
 b=MCAX7PS5Q/BLuE0yEKF37oB2oGA5vgOKFwU1lmjUJTwR0/Hv3DUIvNRhV/QWRwRVPB
 v87o+EmQbVntjAfpKskFmXdD7F+zcP8Il1CfctgEO3p/oMOgW0JbIK5ocDkRmmIbdk+r
 bTqRklnidUQsUwow2KDt6Uiyxz6IHs3x5xa4UU+0KPlpTsLeK4mwuNPlAc20Az85Nxi/
 8HQKAjrsDMbC8skJ7YuBRxu/DnUTOp8Q8iA0p3hXkCaCKzDhlc0wDoFESnAdRXLssonU
 Av2I3D63MZxHTIL5niHEMhM9ZDTenWP4fLAwefVvrhBOtAyNIBts1QBMURpQ6RNqNj51
 bKPQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/CH0qeZFdWyhq6XFRUkTuVvwZKwqJjcoix+GT4V1cpeUUj6pLAwq5UiYrTl0+a6doranTNeiBB1RYppg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy9IpPIOlv9YK0xYeNcPXSrNVFhH48VX6vqVDWDPcc+cPq3P44e
 Vs2OdEAqnVe4ZkjsEx2m6LtfBbFb475FQ7WB6Wqc2J+Gkq/bgVEw5lmfnvCwWHkEIcQ=
X-Gm-Gg: AeBDieuZrzLGVh8u7UXM+xYLc6Oy0MUxTwjMknjk1IDa7iXaQHs210aeeZff9cTty1G
 63gyIAbxz+XYFyrt0tMbSIPCHWmlT8WH/XmeZZ3PDAWMvTZ021BC9yTE0wuXk9i/aS+oOJD6yBo
 naNZe5HS+0/qXfpAFvVjxqWqsx72xu/1cC2E+1B1XOITLLM0fQRHagxVYnWIXHkiK7zoQ2kS0Wr
 +4oimY3HPjndcWaVPQCJOIKm1BWAJlSvN6w3xRcV3FpUf6BeJnPoK4c6QYNZQ8mdIn2jgCwv2H+
 To8PueIXdV0m6s4AeBafaljCUHc3sRh1pihgStD1XHCQ6UE/CC+ls/fFiRA7g6rN4MGfKSptBna
 6dESwiWL5IKwOF1TXhSGPsTKyujewgwoNK+YumdDjVCMJiQdgXpSQ1GD2/rUbZ6OTqSSDfyDASn
 40hFNfD9OWgha1Zlqu4I78QllWM5UmPEAU97c7GheQglMTGIzrPuRxJdF/gtnqDJJ+2cyGWjGkh
 A==
X-Received: by 2002:a05:6214:5191:b0:89c:6a86:e632 with SMTP id
 6a1803df08f44-8b6665f1c01mr90287116d6.18.1777774961977; 
 Sat, 02 May 2026 19:22:41 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b53c0e7d3esm83413106d6.28.2026.05.02.19.22.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 May 2026 19:22:41 -0700 (PDT)
Message-ID: <5d18fabb-aac8-4a3a-ae2d-85eaf18cd4ee@riscstar.com>
Date: Sat, 2 May 2026 21:22:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-9-elder@riscstar.com>
 <1f34cbce-e2dd-4e80-b136-55d0efa50002@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <1f34cbce-e2dd-4e80-b136-55d0efa50002@lunn.ch>
X-Mailman-Approved-At: Mon, 04 May 2026 12:39:23 +0000
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, chenchuangyu@xiaomi.com,
 edumazet@google.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
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
Subject: Re: [Linux-stm32] [PATCH net-next 08/12] dt-bindings: net: toshiba,
 tc965x-dwmac: add TC956x Ethernet bridge
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
X-Rspamd-Queue-Id: 6E8714BD077
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [8.19 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[34];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a098720306
 9@gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[49];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.618];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,riscstar.com,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	R_SPF_ALLOW(0.00)[+ip4:52.209.6.89:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,1c:email,0.0.0.0:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Spam: Yes

On 5/1/26 12:38 PM, Andrew Lunn wrote:
> Your ASCII art of the chip might be useful here as documentation.
> 
>> +  # We can't allOf reference Ethernet-controller.yaml because we end up with
>> +  # contradictory $nodename rules (`ethernet@` versus `pci@`). Happily only a
>> +  # small number of the properties are useful on TC956x so we can just reference
>> +  # what we need.
> 
> Why not add an subnodes for the ethernet interfaces?

I'm going to wait to respond to this until I've had a chance
to discuss it with Daniel.  (It might be Tuesday.)

> 
>> +examples:
>> +  - |
>> +    pcie {
>> +      #address-cells = <3>;
>> +      #size-cells = <2>;
>> +
>> +      tc956x_emac0: pci@0,0 {
>> +        compatible = "pci1179,0220";
>> +        reg = <0x50000 0x0 0x0 0x0 0x0>;
>> +        #address-cells = <3>;
>> +        #size-cells = <2>;
>> +        device_type = "pci";
>> +        ranges;
>> +
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
> 
> I've not got to the GPIO driver patch yet...
> 
> Is the GPIO part of the ethernet device, or part of the chip? The
> hierarchy here should match the hierarchy of the hardware.

The GPIO is part of the TC9564 chip, and is a separate IP
within it.  Within this chip there is one GPIO controller
(as well as a UART and so on), independent of the eMACs.

>> +        phy-mode = "10gbase-r";
>> +        phy-handle = <&tc956x_emac0_phy>;
>> +
>> +        mdio {
>> +          compatible = "snps,dwmac-mdio";
>> +          #address-cells = <1>;
>> +          #size-cells = <0>;
>> +
>> +          tc956x_emac0_phy: ethernet-phy@1c {
>> +            compatible = "ethernet-phy-id311c.1c12";
>> +            reg = <0x1c>;
>> +          };
>> +        };
>> +      };
>> +      pci@0,1 {
>> +        compatible = "pci1179,0220";
>> +        reg = <0x50100 0x0 0x0 0x0 0x0>;
>> +        #address-cells = <3>;
>> +        #size-cells = <2>;
>> +        device_type = "pci";
>> +        ranges;
>> +
> 
> You second ethernet does not have a gpio controller?

Basically, no.  We made the decision to create a "chip"
abstraction that is responsible for managing these other
shared IP blocks (of which only the GPIO controller has
a separate driver).

Both of the PCIe endpoints are able to manipulate the
registers for the GPIO, but we made it the responsibility
of function 0--not function 1--to handle that.

It's possible that some platforms won't use the built-in
GPIO controller to manage PHY resets.  So we used this
property to signal that it was required.

So *if* the gpio-controller (and #gpio-cells) property is
present, then function 0 creates an auxiliary device for
the GPIO controller.  Otherwise something else supplies the
GPIO lines managing PHY resets.

					-Alex

> 
> 	Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
