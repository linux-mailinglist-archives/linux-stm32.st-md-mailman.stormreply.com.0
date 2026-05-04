Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDK5DnKg+GkgxQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 15:34:42 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C2F4BDEED
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 15:34:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 071A8C1A97C;
	Mon,  4 May 2026 13:34:41 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAB9AC055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 May 2026 13:34:39 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-50e614fdb42so36133951cf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 May 2026 06:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777901678; x=1778506478;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1O51d4ds85yTh8lyD3JZ4q7u8vPdQtNHSLTt8d3PVfM=;
 b=SHdEpf8U7kfxV/3uhKKeoAJyFzWqQuRbsuNr2C8tBXv+WUI2NQL+OUoF81QLuJ02jC
 IrMsNgJCzAR0qJZ6kiIljhhkXQTOuvR3LL0dD15ZtkI4FfSv6eYyA+ieH7SHpKeen4j4
 4PeUdemH6b6PZXuV4wNU4qzZZEEKSZkT9gwGppCvV762kMetAUs8PRFXWNg6AjlMWTIF
 OLIXHUVhoOKR917eFHXoj81Udqn90+1hulYUNltbUqw8btTTTscKJW0trxcqELwQg/g3
 yCYqeU5VeMDJrhuTZqSMycAssCZOLlZ5j+vy/T2/6QwSbd2LMn0Oy5884w1Ii7jJMesi
 HA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777901678; x=1778506478;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1O51d4ds85yTh8lyD3JZ4q7u8vPdQtNHSLTt8d3PVfM=;
 b=rrYVhhJrxsRPvSwtGb8m/Pc1mtNA++C/3nUg38nm1dNZLporjye/MCBnTjgMY8guTa
 iYMEFX68SKoPw57ie9gtD3uaPaSl9LWHxSHLAtVPQCQr7GX35CKFeVRtzteWJYw6KNkl
 eldXFYyE0DKAcZftu3MkManV3uuN1+g+Bt7ei4iMwx7509JcoPshi0b4cnV5xfx3bB2Q
 TIcs0M0mUvRjQlMk6EsRb0pTm+AyTgdJKljefc8hkisGnbtRF4TU64MLQSSdaa8slXLJ
 mdSk0Ar+VnFhT8K0DDmobeXEe6txfN7ES3zS3Bzl0ddPotcs+CgZEHr4kTYnGypVNzVY
 FZ8A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8UOiSyugdIW9wGPS89EF62CvHhmCL76kzMO7j0R9WM+m+zEIykR3q1hF4rD42nyTtRaRotrNwOnLzldg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YztAdyd1Cw1d6jJHLDcrP8o7xogE/OgHj++3mpROK2wwCP4S+KN
 kYGGolmTrc7WDnCEhOeOUaIO23/QEjNDL9NtcpzOZ5zsb1z4Q5AKAW1Rd3C5xACLWcE=
X-Gm-Gg: AeBDietL7Qr1MhwYi5QJbndbI9nayW2bdvdjkYQQv2YdB/LtZiGIzgZxwkhcYWELup5
 D7C5mv9L4Uvc8rDwbHIAjq8z8W3IFchL2EhTpTYarP9qOO4kV+p0j5S6euiHAGjDzflLdH2N0yX
 J9TxMt2bDz223pxt4QT7ZPfhd7s1Cfk6yKhMEOcoV9j+W9IpjInW5y0rweMIaiBUmuW/NEuvY+7
 aVXke1SDkkh/y1FIlBCC7OeakW1FvxSgO54mKgW0ruVzuch5S/T59+bZocxrGSslCQRXrB8Mz4p
 w1mpjzIAbxndZnL8BfaHL3gdGhFsdoK/d+7WOCyoOwhUkSkYROvtzLCxZOFyVhMYxfyN15JqWjc
 u7jFKsRFtAmZ0dKuLnH/ug9xyFKlbWkAaXsI7sywh6EKzdNjBLQ+kKUpL/pvNHebSSytA4goufU
 a2ZnYfgLpRDt6nu1U7sQOgo9ve6k6myhu9T72vQ8tTN4tRNmRfMxteW6VphqiY2xIvWvgkSN+N/
 A==
X-Received: by 2002:a05:622a:48a:b0:50d:9e8d:9837 with SMTP id
 d75a77b69052e-5104bde3d42mr142601201cf.11.1777901678300; 
 Mon, 04 May 2026 06:34:38 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8fc2c91c807sm1137764785a.32.2026.05.04.06.34.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 06:34:37 -0700 (PDT)
Message-ID: <164fb5ca-9c42-46ad-a13c-3757ff5d2fdd@riscstar.com>
Date: Mon, 4 May 2026 08:34:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-9-elder@riscstar.com>
 <20260504-fascinating-teal-tarsier-b116c8@quoll>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260504-fascinating-teal-tarsier-b116c8@quoll>
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
X-Rspamd-Queue-Id: C1C2F4BDEED
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.19 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a09872030
 69@gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.782];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,riscstar.com,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	R_SPF_ALLOW(0.00)[+ip4:52.209.6.89];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,devicetree.org:url,0.0.0.0:email,riscstar.com:mid,riscstar.com:email]
X-Spam: Yes

On 5/4/26 6:00 AM, Krzysztof Kozlowski wrote:
> On Fri, May 01, 2026 at 10:54:16AM -0500, Alex Elder wrote:
>> From: Daniel Thompson <daniel@riscstar.com>
>>
>> Add devicetree bindings for the Toshiba TC956x family of Ethernet-AVB/TSN
>> bridges.
>>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../bindings/net/toshiba,tc956x-dwmac.yaml    | 111 ++++++++++++++++++
>>   1 file changed, 111 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
>> new file mode 100644
>> index 0000000000000..d95d22a3761da
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
>> @@ -0,0 +1,111 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/toshiba,tc956x-dwmac.yaml#
> 
> Filename and here: toshiba,tc9564-dwmac
> (s/x/4/)
> 
> 
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Toshiba TC956x Ethernet-AVB/TSN Controller
>> +
>> +maintainers:
>> +  - Alex Elder <elder@riscstar.com>
>> +  - Daniel Thompson <daniel@riscstar.com>
>> +
>> +description: |
>> +  This node provides properties for configuring the Ethernet PCI functions
>> +  that are attached to the internal downstream port of the TC956x's PCIe
>> +  switch.
> 
> Describe rather the hardware directly, not the DTS or the binding
> itself.
> 
> Just say what is the hardware, what is consists of, what is less
> obvious or usual (if there is such).

I understand what you're saying.  We will reword this to focus
on the hardware in version 2.

> 
>> +
>> +  TC956x are a family of Ethernet-AVB/TSN bridge chips that combine a PCIe
>> +  switch together with a number of Ethernet controllers. These bindings
>> +  cover only the Ethernet functions of these devices.
> 
> What about the rest of the hardware - a PCIe switch? Shouldn't it be
> described?

It maybe should, just to provide a more complete picture.  It's
a little strange, because the PCIe switch support (or at least
its power controller) was already upstreamed:

  
https://lore.kernel.org/all/20251101-tc9563-v9-0-de3429f7787a@oss.qualcomm.com/

That introduced DeviceTree bindings for a PCI device, which is
itself sort of spanning two worlds of discoverability.

That code focused on the *switch*.  This series is focused on
the *Ethernet interfaces*.  But the "chip" has several other
components, some of which (GPIO anyway, for now) also need to
be modeled.

I want to talk more with Daniel about this but either way we
will revisit this and will attempt to describe the hardware in
a more complete way when we send out v2.

>> +
>> +allOf:
>> +  - $ref: /schemas/pci/pci-bus-common.yaml#
>> +  - $ref: /schemas/pci/pci-device.yaml#
>> +
>> +unevaluatedProperties: false
> 
> Place both (allOf+unevaluatedProperties) after "required:".

OK.

> 
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - pci1179,0220 # Toshiba TC9564 (a.k.a. Qualcomm QPS615)
>> +
>> +  "#gpio-cells":
>> +    const: 2
>> +
>> +  gpio-controller: true
>> +
>> +  # We can't allOf reference Ethernet-controller.yaml because we end up with
> 
> s/Ethernet-controller.yaml/ethernet-controller.yaml/

OK.

> 
>> +  # contradictory $nodename rules (`ethernet@` versus `pci@`). Happily only a
> 
> But which schema requires pci@ for devices? If I am not mistaken, only
> dtschema/schemas/pci/pci-bus-common.yaml requires it, and it does not
> apply to actual PCI device.

We'll revisit this and will simplify/clarify if possible in v2.

>> +  # small number of the properties are useful on TC956x so we can just reference
>> +  # what we need.
>> +  phy-connection-type:
>> +    $ref: ethernet-controller.yaml#/properties/phy-connection-type
>> +
>> +  phy-handle:
>> +    $ref: ethernet-controller.yaml#/properties/phy-handle
>> +
>> +  phy-mode:
>> +    $ref: ethernet-controller.yaml#/properties/phy-mode
>> +
>> +  mdio:
>> +    $ref: snps,dwmac.yaml#/properties/mdio
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
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
>> +
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
> 
> Keep only one example, unless you have different properties (not their
> values, but their presence),

OK.  Thanks a lot for your review Krzysztof.

					-Alex
> 
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
