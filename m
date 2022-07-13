Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 971C857364D
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Jul 2022 14:25:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48214C640FD;
	Wed, 13 Jul 2022 12:25:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A8E6C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jul 2022 12:25:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26D8uJAv023228;
 Wed, 13 Jul 2022 14:25:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=hY/DzheLCg0VbuBOH1SoR4Jn7G8LgrCI2a6S3S81Qto=;
 b=gGZulg3bmSVzyMBi2Psy94w+lwfECK73kPsXyKle4m0kmGpa0dJ4OZxP8hFAHKJeReIM
 /Gbs8FDoD+A3EABBqsSoStMGo5lP8q3yNBmJMTTcNVK9sEQqoYNzAPzAn0u54Xre79SK
 K6NpGbYnvs9fcp9mLK8MSgz2wUIvm6UrD2CpYEPbG056aG6F/rOExf37tmNxH806gixm
 Va+t/LRIxJwSTGKstDGPAndqcZi0OzZ6Us0j6k+1CY8rPi7uxfbS0AzPEpmkiiRqN0EP
 0noRPZ5RCjOSwUC6VyUCNJu13MiCtBdnKbamjsYNIY5CJ4ujiS7yPQFSp7Ko2vwXYzbV Ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h94gugy74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 14:25:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0FC6610002A;
 Wed, 13 Jul 2022 14:25:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 09B8221F14C;
 Wed, 13 Jul 2022 14:25:29 +0200 (CEST)
Received: from [10.48.1.102] (10.75.127.49) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 13 Jul
 2022 14:25:28 +0200
Message-ID: <077731cf-0525-56af-c615-27cbb5f6e089@foss.st.com>
Date: Wed, 13 Jul 2022 14:25:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Lee Jones <lee.jones@linaro.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20220706211934.567432-1-robh@kernel.org>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20220706211934.567432-1-robh@kernel.org>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_14,2022-07-13_02,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mfd: stm32-timers: Move
 fixed string node names under 'properties'
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

On 7/6/22 23:19, Rob Herring wrote:
> Fixed string node names should be under 'properties' rather than
> 'patternProperties'. Additionally, without beginning and end of line
> anchors, any prefix or suffix is allowed on the specified node name.
> 
> Move the stm32 timers 'counter' and 'timer' nodes to the 'properties'
> section.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Hi Rob,

You can add my:
Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks and Best Regards,
Fabrice

> ---
>  .../bindings/mfd/st,stm32-lptimer.yaml        | 28 +++++++++----------
>  .../bindings/mfd/st,stm32-timers.yaml         | 20 ++++++-------
>  2 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
> index ec7f0190f46e..a58f08aa430d 100644
> --- a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
> +++ b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
> @@ -58,43 +58,43 @@ properties:
>        - "#pwm-cells"
>        - compatible
>  
> -patternProperties:
> -  "^trigger@[0-9]+$":
> +  counter:
>      type: object
>  
>      properties:
>        compatible:
> -        const: st,stm32-lptimer-trigger
> -
> -      reg:
> -        description: Identify trigger hardware block.
> -        items:
> -          minimum: 0
> -          maximum: 2
> +        const: st,stm32-lptimer-counter
>  
>      required:
>        - compatible
> -      - reg
>  
> -  counter:
> +  timer:
>      type: object
>  
>      properties:
>        compatible:
> -        const: st,stm32-lptimer-counter
> +        const: st,stm32-lptimer-timer
>  
>      required:
>        - compatible
>  
> -  timer:
> +patternProperties:
> +  "^trigger@[0-9]+$":
>      type: object
>  
>      properties:
>        compatible:
> -        const: st,stm32-lptimer-timer
> +        const: st,stm32-lptimer-trigger
> +
> +      reg:
> +        description: Identify trigger hardware block.
> +        items:
> +          minimum: 0
> +          maximum: 2
>  
>      required:
>        - compatible
> +      - reg
>  
>  required:
>    - "#address-cells"
> diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
> index 10b330d42901..1bd663f886dc 100644
> --- a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
> +++ b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
> @@ -87,6 +87,16 @@ properties:
>        - "#pwm-cells"
>        - compatible
>  
> +  counter:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: st,stm32-timer-counter
> +
> +    required:
> +      - compatible
> +
>  patternProperties:
>    "^timer@[0-9]+$":
>      type: object
> @@ -107,16 +117,6 @@ patternProperties:
>        - compatible
>        - reg
>  
> -  counter:
> -    type: object
> -
> -    properties:
> -      compatible:
> -        const: st,stm32-timer-counter
> -
> -    required:
> -      - compatible
> -
>  required:
>    - compatible
>    - reg
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
