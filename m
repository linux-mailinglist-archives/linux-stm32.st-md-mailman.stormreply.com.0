Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F3419A7CC
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Apr 2020 10:51:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39923C36B0B;
	Wed,  1 Apr 2020 08:51:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8BE4C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 08:51:35 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0318n08e009311; Wed, 1 Apr 2020 10:51:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=1rCMuLCvnLZNatxXIIxnqYRt75OvA+RZrvrTvHgGw2M=;
 b=bjveDkYbrYq985QKvUcsGxSgwEB6kI3RynOjf+BgmY6JcHcmsjz1vvfpCAwKlgQumLXf
 qoqoEVl3a+LqMc+6rFqMsfMa02ESV6BADRflliof5gAtGEcm/Zwp02fmmrtBCgsYlOG3
 tVfXipak/whlCqaFFueVXQReQyElivj0SiOFJg2ldTNWzI2x+Baz4ZQWgL0sHSEvbcRg
 Dk637If6+MD7hjTEUoLGOIIEo76lRrq0XVvq7uKnpwNDehfIu0eX1TQsg+C9hMa958fU
 uw1JhYK7XY2wuiSCfllM1GP1yw7+FNqZxcHN+5sKRN4o5gp/y9wfQtOqxKXo3T8/L5Bf /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 302y53x4g9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 10:51:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7E12610002A;
 Wed,  1 Apr 2020 10:51:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3F92121CA7C;
 Wed,  1 Apr 2020 10:51:21 +0200 (CEST)
Received: from [10.211.14.17] (10.75.127.46) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Apr
 2020 10:51:19 +0200
To: Benjamin Gaignard <benjamin.gaignard@st.com>, <lee.jones@linaro.org>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
 <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
References: <20200401083909.18886-1-benjamin.gaignard@st.com>
 <20200401083909.18886-2-benjamin.gaignard@st.com>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <2e3814e2-f6fc-038f-4fb0-87432d99edfb@st.com>
Date: Wed, 1 Apr 2020 10:51:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200401083909.18886-2-benjamin.gaignard@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v6 1/6] dt-bindings: mfd: Document STM32
 low power timer bindings
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

On 4/1/20 10:39 AM, Benjamin Gaignard wrote:
> Add a subnode to STM low power timer bindings to support timer driver
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> version 6:
> - only use one interrupt
> 
> version 5:
> - the previous has been acked-by Rob but since I have docummented
>   interrupts and interrupt-names properties I haven't applied it here.
> 
> version 4:
> - change compatible and subnode names
> - document wakeup-source property
> 
>  .../devicetree/bindings/mfd/st,stm32-lptimer.yaml   | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Hi Benjamin,

Acked-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Thanks,
Fabrice

> diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
> index 1a4cc5f3fb33..2a99b2296d2b 100644
> --- a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
> +++ b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
> @@ -33,12 +33,17 @@ properties:
>      items:
>        - const: mux
>  
> +  interrupts:
> +    maxItems: 1
> +
>    "#address-cells":
>      const: 1
>  
>    "#size-cells":
>      const: 0
>  
> +  wakeup-source: true
> +
>    pwm:
>      type: object
>  
> @@ -81,6 +86,16 @@ patternProperties:
>      required:
>        - compatible
>  
> +  timer:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: st,stm32-lptimer-timer
> +
> +    required:
> +      - compatible
> +
>  required:
>    - "#address-cells"
>    - "#size-cells"
> @@ -94,11 +109,13 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/clock/stm32mp1-clks.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>      timer@40002400 {
>        compatible = "st,stm32-lptimer";
>        reg = <0x40002400 0x400>;
>        clocks = <&timer_clk>;
>        clock-names = "mux";
> +      interrupts-extended = <&exti 47 IRQ_TYPE_LEVEL_HIGH>;
>        #address-cells = <1>;
>        #size-cells = <0>;
>  
> @@ -115,6 +132,10 @@ examples:
>        counter {
>          compatible = "st,stm32-lptimer-counter";
>        };
> +
> +      timer {
> +        compatible = "st,stm32-lptimer-timer";
> +      };
>      };
>  
>  ...
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
