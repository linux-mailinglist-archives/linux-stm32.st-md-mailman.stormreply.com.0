Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E738CFB54
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2024 10:26:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC437C6DD6E;
	Mon, 27 May 2024 08:26:08 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7408EC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2024 08:26:01 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44R8PL1l048596;
 Mon, 27 May 2024 03:25:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1716798321;
 bh=l8y8XUgX/zJirmS7nB2QP3/faPTAkS4T0rfRSJa68oY=;
 h=From:To:CC:Subject:In-Reply-To:References:Date;
 b=HY8r+DF9x9Tu61I/vYT0P0NVuBFfnCX8SJOA4ks68AEnZc6DLdPh8uXY1hvgajcC3
 U9cpAj9njT9lqm13GWpeRloxLwEhig0xlXEUKVfAKUlu0ZBYcAEHvTNKbhmG/gfgjH
 QdTsTgiTX6L/KkXEh2FhJpfAvdXv13qTiEALp++E=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44R8PLoi100743
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 May 2024 03:25:21 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 27
 May 2024 03:25:21 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 27 May 2024 03:25:21 -0500
Received: from localhost (kamlesh.dhcp.ti.com [172.24.227.123])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44R8PKoI017949;
 Mon, 27 May 2024 03:25:21 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
To: Conor Dooley <conor@kernel.org>
In-Reply-To: <20230811-imminent-fancied-89663c373ab5@spud>
References: <20230719-mcrc-upstream-v2-0-4152b987e4c2@ti.com>
 <20230719-mcrc-upstream-v2-3-4152b987e4c2@ti.com>
 <20230811-crestless-gratify-21c9bb422375@spud>
 <20230811-imminent-fancied-89663c373ab5@spud>
Date: Mon, 27 May 2024 13:55:19 +0530
Message-ID: <87plt7acgg.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Nishanth Menon <nm@ti.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [Linux-stm32] [EXTERNAL] Re: [PATCH v2 3/6] dt-bindings:
 crypto: Add Texas Instruments MCRC64
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

Conor Dooley <conor@kernel.org> writes:

> On Fri, Aug 11, 2023 at 04:34:33PM +0100, Conor Dooley wrote:
>> On Fri, Aug 11, 2023 at 12:58:50AM +0530, Kamlesh Gurudasani wrote:
>> > Add binding for Texas Instruments MCRC64
>> > 
>> > MCRC64 engine calculates 64-bit cyclic redundancy checks (CRC)
>> > according to the ISO 3309 standard.
>> > 
>> > The ISO 3309 64-bit CRC model parameters are as follows:
>> >     Generator Polynomial: x^64 + x^4 + x^3 + x + 1
>> >     Polynomial Value: 0x000000000000001B
>> >     Initial value: 0x0000000000000000
>> >     Reflected Input: False
>> >     Reflected Output: False
>> >     Xor Final: 0x0000000000000000
>> > 
>> > Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
>> > ---
>> >  Documentation/devicetree/bindings/crypto/ti,mcrc64.yaml | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>> >  MAINTAINERS                                             |  5 +++++
>> >  2 files changed, 52 insertions(+)
>> > 
>> > diff --git a/Documentation/devicetree/bindings/crypto/ti,mcrc64.yaml b/Documentation/devicetree/bindings/crypto/ti,mcrc64.yaml
>> > new file mode 100644
>> > index 000000000000..38bc7efebd68
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/crypto/ti,mcrc64.yaml
>> > @@ -0,0 +1,47 @@
>> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> > +%YAML 1.2
>> > +---
>> > +$id: http://devicetree.org/schemas/crypto/ti,mcrc64.yaml#
>> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> > +
>> > +title: Texas Instruments MCRC64
>> > +
>> > +description: The MCRC64 engine calculates 64-bit cyclic redundancy checks
>> 
>> A newline after "description" please.
>> 
>> > +  (CRC) according to the ISO 3309 standard.
>> > +
>> > +maintainers:
>> > +  - Kamlesh Gurudasani <kamlesh@ti.com>
>> > +
>> > +properties:
>> > +  compatible:
>> > +    const: ti,am62-mcrc64
>> 
>> Is the am62 an SoC or a family of SoCs? I googled a wee bit for am62 &
>> there seems to be an am625 and an am623?
>
> Or is it an am62p5, in which case the compatible should contain
> ti,am62p5 I suppose. Sorry for my confusion here, its not really clear
> me too since I've been seeing many different-but-similar product names
> the last few days.
>
> Thanks,
> Conor.
>
Hi Conor,

Thanks for the review.

am62 is family of SOCs.

All devices under this family, like am623/5/p5 and etc, have MCRC64.

I have kept the naming convention similar to SA2UL/SA3UL[0].

[0] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/crypto/ti,sa2ul.yaml#L18

Kamlesh

>> 
>> Otherwise, this looks good to me.
>> 
>> > +
>> > +  reg:
>> > +    maxItems: 1
>> > +
>> > +  clocks:
>> > +    maxItems: 1
>> > +
>> > +  power-domains:
>> > +    maxItems: 1
>> > +
>> > +required:
>> > +  - compatible
>> > +  - reg
>> > +  - clocks
>> > +  - power-domains
>> > +
>> > +additionalProperties: false
>> > +
>> > +examples:
>> > +  - |
>> > +    #include <dt-bindings/soc/ti,sci_pm_domain.h>
>> > +
>> > +    crc@30300000 {
>> > +      compatible = "ti,am62-mcrc64";
>> > +      reg = <0x30300000 0x1000>;
>> > +      clocks = <&k3_clks 116 0>;
>> > +      power-domains = <&k3_pds 116 TI_SCI_PD_EXCLUSIVE>;
>> > +    };
>> > +
>> > +...
>> > diff --git a/MAINTAINERS b/MAINTAINERS
>> > index 02a3192195af..66b51f43d196 100644
>> > --- a/MAINTAINERS
>> > +++ b/MAINTAINERS
>> > @@ -21481,6 +21481,11 @@ S:	Maintained
>> >  F:	Documentation/devicetree/bindings/iio/adc/ti,lmp92064.yaml
>> >  F:	drivers/iio/adc/ti-lmp92064.c
>> >  
>> > +TI MEMORY CYCLIC REDUNDANCY CHECK (MCRC64) DRIVER
>> > +M:	Kamlesh Gurudasani <kamlesh@ti.com>
>> > +S:	Maintained
>> > +F:	Documentation/devicetree/bindings/crypto/ti,mcrc64.yaml
>> > +
>> >  TI PCM3060 ASoC CODEC DRIVER
>> >  M:	Kirill Marinushkin <kmarinushkin@birdec.com>
>> >  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
>> > 
>> > -- 
>> > 2.34.1
>> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
