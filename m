Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BBB7C66AE
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Oct 2023 09:54:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 966E0C6B44B;
	Thu, 12 Oct 2023 07:54:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA0C0C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Oct 2023 07:54:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39C7VCCd016347; Thu, 12 Oct 2023 09:54:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=iE8X+9XFj8ZYJlss7mivX3vLbG+BQZYVJPofdFi6K34=; b=lt
 HpikgsqsH7F422xIipYUFJuFCrPu73LTTYdETTkILZiTlL4RGBEktjHyL+sFm4Ou
 UYmxaOXl6aw5q92sGvosYAwqCY7bo1viQoHT2+SvYImvVPDQh6oQTbE+X/yVBDs6
 tdVPDBrzqy+aA9yRYddI6WuPcCCmRwJaUyui5GAl7QZHr6vrRwWWn/Vjm4ceIe3/
 0DHekb8m3XJOlEBez6myKIk02zmKNDsCczM0KLxlIhqBcT9N45grJnJb7X5k1lfT
 VPW1Y9jU3K2sEExhMYD3Qlte2ibIBYbCBL6axUk1kcBiChPTpNr7qS0WKuFRYD2J
 e+YPsUCsryAxda5TmK2w==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tkhf7txhq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Oct 2023 09:54:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BA887100056;
 Thu, 12 Oct 2023 09:54:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AAD13215BD5;
 Thu, 12 Oct 2023 09:54:05 +0200 (CEST)
Received: from [10.201.20.120] (10.201.20.120) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 12 Oct
 2023 09:54:04 +0200
Message-ID: <97f843cb-f6fb-b282-676b-d2ecea0c3db4@foss.st.com>
Date: Thu, 12 Oct 2023 09:54:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
References: <20231010091643.3666290-1-hugues.fruchet@foss.st.com>
 <20231010091643.3666290-2-hugues.fruchet@foss.st.com>
 <20231011-jogger-designing-0eb6e2daacba@spud>
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <20231011-jogger-designing-0eb6e2daacba@spud>
X-Originating-IP: [10.201.20.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_03,2023-10-11_01,2023-05-22_02
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-rockchip@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Marco Felsch <m.felsch@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v2 1/5] dt-bindings: media: Document
 STM32MP25 VDEC & VENC video codecs
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

Hi Conor,

Will do all in v3, thanks !

On 10/11/23 17:55, Conor Dooley wrote:
> Hey,
> 
> On Tue, Oct 10, 2023 at 11:16:39AM +0200, Hugues Fruchet wrote:
>> Add STM32MP25 VDEC video decoder & VENC video encoder bindings.
>>
>> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
>> ---
>>   .../media/st,stm32mp25-video-codec.yaml       | 58 +++++++++++++++++++
>>   1 file changed, 58 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml b/Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml
>> new file mode 100644
>> index 000000000000..479566171568
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml
>> @@ -0,0 +1,58 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/st,stm32mp25-video-codec.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STMicroelectronics STM32MP25 VDEC video decoder & VENC video encoder
>> +
>> +maintainers:
>> +  - Hugues Fruchet <hugues.fruchet@foss.st.com>
>> +
>> +description:
>> +  The STMicroelectronics STM32MP25 SOCs embeds a VDEC video hardware
>> +  decoder peripheral based on Verisilicon VC8000NanoD IP (former Hantro G1)
>> +  and a VENC video hardware encoder peripheral based on Verisilicon
>> +  VC8000NanoE IP (former Hantro H1).
>> +
>> +properties:
>> +  compatible:
>> +    items:
> 
> This "items:" is not needed, the enum on its own is enough.
> 
>> +      - enum:
>> +          - st,stm32mp25-vdec
>> +          - st,stm32mp25-venc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    vdec: video-codec@580d0000 {
> 
> The node labels for both nodes here are not used & should be dropped.
> 
> Otherwise, this seems fine to me.
> 
> Cheers,
> Conor.
> 
>> +        compatible = "st,stm32mp25-vdec";
>> +        reg = <0x580d0000 0x3c8>;
>> +        interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks = <&ck_icn_p_vdec>;
>> +    };
>> +  - |
>> +    venc: video-codec@580e0000 {
>> +        compatible = "st,stm32mp25-venc";
>> +        reg = <0x580e0000 0x800>;
>> +        interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks = <&ck_icn_p_venc>;
>> +    };
>> -- 
>> 2.25.1
>>

BR,
Hugues.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
