Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0897B51AF08
	for <lists+linux-stm32@lfdr.de>; Wed,  4 May 2022 22:27:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7249C6047D;
	Wed,  4 May 2022 20:27:51 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B92DC5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 May 2022 20:27:49 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3E3B01BF205;
 Wed,  4 May 2022 20:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651696069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+hUwQLI04KRlF0eu0GKC8X4hwLKHloFuBKJTjH0IlCc=;
 b=fqvBj59ZoYRwrHWryJr471246MpSLAYY4m41aJ6HilGtIRQMWbqhO4hmBKkhHwBBvF2lTV
 Jt91bcWKFse6faQY3nlsQQ7xmv8CUWvhkFoTd8objUhzv8KlNljP5hTbi+zRk72j+9PpgP
 nuH9ZziWeuOSsCz1jvLoNyE+PToIiocvRcWuPPaG7lWSU5cF1eOM5fg6UwaB1baMV3GMdC
 no8PHNvic3bFE6ynZBW0/aY5s7wYX4HLY62AOd0mRURakV8OSg9WopjsPzmj2MTSIYIg87
 9iOIuqog9D3C3zbA1szY1klVwOD62J7lbtrBCwOCHeEeGeYshsiRJVOMco7BxQ==
Date: Wed, 4 May 2022 22:27:47 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Valentin Caron <valentin.caron@foss.st.com>
Message-ID: <YnLhw+Y7m8G2xJpK@mail.local>
References: <20220504130233.330983-1-valentin.caron@foss.st.com>
 <20220504130617.331290-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220504130617.331290-1-valentin.caron@foss.st.com>
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/6] dt-bindings: rtc: stm32: add alarm A
 out property to select output
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

Hello,

On 04/05/2022 15:06:13+0200, Valentin Caron wrote:
> STM32 RTC can pulse some SOC pins when an alarm of RTC expires.
> 
> This patch adds property to activate alarm A output. The pulse can
> output on three pins RTC_OUT1, RTC_OUT2, RTC_OUT2_RMP
> (PC13, PB2, PI8 on stm32mp15) (PC13, PB2, PI1 on stm32mp13).
> 
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
> ---
>  .../devicetree/bindings/rtc/st,stm32-rtc.yaml | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> index 56d46ea35c5d..71e02604e8de 100644
> --- a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> @@ -59,6 +59,13 @@ properties:
>        Refer to <include/dt-bindings/rtc/rtc-stm32.h> for the supported values.
>        Pinctrl state named "default" may be defined to reserve pin for RTC output.
>  
> +  st,alarm:
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    description: |
> +      To select and enable RTC Alarm A output.
> +      Refer to <include/dt-bindings/rtc/rtc-stm32.h> for the supported values.
> +      Pinctrl state named "default" may be defined to reserve pin for RTC output.
> +
>  allOf:
>    - if:
>        properties:
> @@ -75,6 +82,9 @@ allOf:
>          st,lsco:
>            maxItems: 0
>  
> +        st,alarm:
> +          maxItems: 0
> +
>          clock-names: false
>  
>        required:
> @@ -95,6 +105,9 @@ allOf:
>          st,lsco:
>            maxItems: 0
>  
> +        st,alarm:
> +          maxItems: 0
> +
>        required:
>          - clock-names
>          - st,syscfg
> @@ -117,6 +130,9 @@ allOf:
>          st,lsco:
>            maxItems: 1
>  
> +        st,alarm:
> +          maxItems: 1
> +
>        required:
>          - clock-names
>  
> @@ -153,8 +169,9 @@ examples:
>        clocks = <&rcc RTCAPB>, <&rcc RTC>;
>        clock-names = "pclk", "rtc_ck";
>        interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> +      st,alarm = <RTC_OUT1>;
>        st,lsco = <RTC_OUT2_RMP>;

Shouldn't that be exactly the opposite? You have two pins that can
output different functions. The property should be the pin and the value
the function. I'd go even further and I would say this is actually
pinmuxing.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
