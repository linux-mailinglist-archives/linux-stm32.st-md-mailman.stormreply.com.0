Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7315ECC51
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 20:45:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DEF5C63328;
	Tue, 27 Sep 2022 18:45:05 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54468C63325
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 18:45:03 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1565084CD8;
 Tue, 27 Sep 2022 20:45:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664304302;
 bh=ka3NsRltkkHta8t7Kq5OpOzzXbX77BDgOPR64qFF8do=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V5RHxNpPERIxlsCaqL4z1/+94HXn7MzrEGNNKDqqlyPl8h0MJxZTmH4CHmZNJVQMP
 WripzQaHvwwdRH8fYkG8316AQHIFas6RuyAYx4Y88DPtRWuMDXrNztai/GPmn5HvQG
 IiOuRbizxHtf9dX32qzPzU8e0ovDot1wf0JDc8+EPv/CusloAqhTmTdOmOHtqVNL1X
 ytfnAKfvtjjDhpn6OQXkp5N4+4TQi6AaA3eib2ple4bLTJ1BKBnn6/lxwlWaspNmqs
 u7vk+/PQEnAH5/eao7s3mqeK2EvwiT61zeLj+mCPYcUXOgtwzv3VRfzvys3OeMnyxs
 8YzGWYYXtAyCg==
Message-ID: <162ea4dd-ded9-2905-0e4b-71809c95fd78@denx.de>
Date: Tue, 27 Sep 2022 20:45:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: Benjamin MUGNIER <benjamin.mugnier@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20220927005538.690997-1-marex@denx.de>
 <7420b97c-1421-03a5-dd47-044b5e1739f1@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <7420b97c-1421-03a5-dd47-044b5e1739f1@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: media: st,
 stmipid02: Convert the text bindings to YAML
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

On 9/27/22 13:06, Benjamin MUGNIER wrote:
> Hi Marek,

Hi,

> Thank you for your patch.

Thank you for the review.

[...]

>> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
>> @@ -0,0 +1,175 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/i2c/st,st-mipid02.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STMicroelectronics MIPID02 CSI-2 to PARALLEL bridge
>> +
>> +maintainers:
>> +  - Mickael Guene <mickael.guene@foss.st.com>
> 
> As Mickael is not the maintainer of the driver anymore, there should be both current maintainers instead, as listed in the MAINTAINER file:
>   - Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>   - Sylvain Petinot <sylvain.petinot@foss.st.com>
> Can you change it while at it ? Thank you.

Done and done, I also dropped myself from the list, which I hope is OK.

> By the way you will also need to update the MAINTAINERS file to change the st,st-mipid02.txt file to st,st-mipid02.yaml here:
>    F:      Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt

[...]

>> +      port@2:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: Output port
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              bus-width:
>> +                enum: [8, 10, 12, 14]
> 
> Shouldn't this be [6, 8, 10, 12] as in the original file ?

They are both wrong, per:

https://www.st.com/resource/en/datasheet/stmipid02.pdf
page 5
Table 1. Image format vs. number of bits on output interface
row 2
RAW7 RAW7 7 bits

So this should be
[6, 7, 8, 10, 12]

>> +                default: 8
> 
> As far as I understand there is no 'default' as this property is required anyway.

Dropped.

>> +              hsync-active: true
>> +              vsync-active: true
>> +
>> +            required:
>> +              - bus-width
>> +
>> +    required:
>> +      - port@0
> 
> Actually it could either be port0 or port1, but not both at the same time, see the 'description' part.
> I'm not sure how to describe it in device tree binding though.

I think the requirement here is to have at least one of port@0 or port@1 
described in DT. Both port@0 and port@1 can also be described, i.e. you 
can have FRONT and BACK sensor like on a contemporary smartphone, you 
just cannot start streaming from both sensors at the same time, which is 
a software policy and should be handled by the driver.

See:
https://www.st.com/resource/en/datasheet/stmipid02.pdf
page 3
2 Application diagrams
Figure 2. MIPI CSI-2 application diagram

Per suggestion from Rob, I think this should be

allOf:
   - require:
       - port@0
   - require:
       - port@1
require:
   - port@2

>> +      - port@2
>> +
>> +additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
> 
> I noticed this was missing in the original txt file. Thanks for taking care of it.

Sure. I'm glad to see dtbs_check passing on the stm32mp15xx boards, 
largely thanks to ST doing good job keeping the upstream support in good 
shape.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
