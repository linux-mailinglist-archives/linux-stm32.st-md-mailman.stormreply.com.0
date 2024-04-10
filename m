Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2C68A018C
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Apr 2024 22:56:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 459B5C6C820;
	Wed, 10 Apr 2024 20:56:34 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DABAC6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Apr 2024 20:56:33 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-516d0162fa1so8631657e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Apr 2024 13:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712782592; x=1713387392;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=velTxyDyUhfVt0WKozw2xszoAn3uVnpWZ/SVMLGjm+c=;
 b=NT/6DClpdmeUdjSKeQhOOUyX/09LHO9OFeXwDl6plZBkS3o7behuzI4GWN/ekXsg4b
 OxqMBqLg6EavRx4o192W02L4jT/0YqMh1fxRyr6u5SXhqu6vQ5UadXOb08tJSDhqroIU
 RG1j6xdsYWmeQmHhtwjs+3Wr/qRMnG8E+0zyIJizOussKcL8N2jov2YcSH5mUJAWM6/j
 OfV5XQ+NbtI0XYePFJFMCFt0mt/F6TX4BFuMLAv+0BAn3/r/5ucELGkY6SHsWvFsGd6b
 71oOHBT6bBz7iicVspTXkRInRVXzTpyWiqbQekkIH+fG6jlVpLoJaa6zJGWFrr001Ib8
 mcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712782592; x=1713387392;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=velTxyDyUhfVt0WKozw2xszoAn3uVnpWZ/SVMLGjm+c=;
 b=Of88d24miR3Q3Rd6Xyiw84cK0cjsohm7vWWYxnhORrovLxsDdZR+SUYTiF4P9/tNrp
 pDeD7TsW/bZe5GITZpzyFN4tOxEKupBClOjPkJfXRXHSadfQnp7VwEZ4YnzIF7lK/HEb
 Qk5W297hvEEmBQ2Vx+WGk9YTHm6Rid7Pa3EmlilIv0wzk74vYfirihUF+1JOB2qeADtk
 s9PDoyhxUXLe+7wROaHs9jmsf55WUa25lrasMclGTo+AL1z5jXuK9vNI3bnwChEh9+jG
 lVW95bW5xyHg7HE2lCHpvDhSlDJ/I0g7+F6tX6ripN1u6+B6g2U1woVHwcUaXQQw3Ygh
 SsoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGO72Ho54KcnSCjBUblxrcvpzttgL7vHGiePyYghnpQ6gIfLX387ZKmmxb1FJoRjkdoD073EpwCpKl0T8zK52EmSv7UwFyH8GJx2twrYv3NFgofYmjey5k
X-Gm-Message-State: AOJu0YwYcIvKIfk4k7L5y5NnfcWRhI0LMu2o+Dx7T10+Q7gXIA0XgHqA
 XY8D/TgXii7h0qK0+s00o8jKDsrQoHnHmn0bRcu3T8hnig5DjBTM
X-Google-Smtp-Source: AGHT+IHU+2lp+CqY9Y0dbETJpEetgTV/6YxYcG7h5rkJpRV4Z3ndf35dDAQDagEP9Qz4ZQNHrtFv9w==
X-Received: by 2002:a19:f50b:0:b0:513:aef9:7159 with SMTP id
 j11-20020a19f50b000000b00513aef97159mr2555020lfb.39.1712782592156; 
 Wed, 10 Apr 2024 13:56:32 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-64.cable.dynamic.surfer.at.
 [84.115.213.64]) by smtp.gmail.com with ESMTPSA id
 gv15-20020a170906f10f00b00a517995c070sm51166ejb.33.2024.04.10.13.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 13:56:31 -0700 (PDT)
Message-ID: <6d1f0fbf-ea53-47e2-92e5-131da010be0b@gmail.com>
Date: Wed, 10 Apr 2024 22:56:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20240410-rtc_dtschema-v2-0-d32a11ab0745@gmail.com>
 <20240410-rtc_dtschema-v2-2-d32a11ab0745@gmail.com>
 <202404102043571b7450b5@mail.local>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <202404102043571b7450b5@mail.local>
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/4] dt-bindings: rtc: lpc32xx-rtc:
	convert to dtschema
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

On 4/10/24 22:43, Alexandre Belloni wrote:
> On 10/04/2024 17:55:34+0200, Javier Carrasco wrote:
>> Convert existing binding to dtschema to support validation.
>>
>> Add the undocumented 'clocks' property.
>>
>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> ---
>>  .../devicetree/bindings/rtc/lpc32xx-rtc.txt        | 15 --------
>>  .../devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml   | 41 ++++++++++++++++++++++
>>  2 files changed, 41 insertions(+), 15 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt b/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt
>> deleted file mode 100644
>> index a87a1e9bc060..000000000000
>> --- a/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt
>> +++ /dev/null
>> @@ -1,15 +0,0 @@
>> -* NXP LPC32xx SoC Real Time Clock controller
>> -
>> -Required properties:
>> -- compatible: must be "nxp,lpc3220-rtc"
>> -- reg: physical base address of the controller and length of memory mapped
>> -  region.
>> -- interrupts: The RTC interrupt
>> -
>> -Example:
>> -
>> -	rtc@40024000 {
>> -		compatible = "nxp,lpc3220-rtc";
>> -		reg = <0x40024000 0x1000>;
>> -		interrupts = <52 0>;
>> -	};
>> diff --git a/Documentation/devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml
>> new file mode 100644
>> index 000000000000..62ddeef961e9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml
>> @@ -0,0 +1,41 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/rtc/nxp,lpc32xx-rtc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NXP LPC32xx SoC Real Time Clock
>> +
>> +maintainers:
>> +  - Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> +
>> +allOf:
>> +  - $ref: rtc.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: nxp,lpc3220-rtc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
> 
> As I explained the clock doesn't really exist, there is no control over
> it, it is a fixed 32768 Hz crystal, there is no point in describing it
> as this is already the input clock of the SoC.
> 
> 

In that case the first approach was right, and it should be moved to
trivial-rtc.
I made the mistake of mentioning the driver and what it does not
support, but strictly talking about the device description, the 'clocks'
property was pointless in the dts where it was added.

If we leave it undocumented, the error I discussed with Krzysztof will
have to stay unless the 'clocks' property gets removed from the dts.

Best regards,
Javier Carrasco


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
