Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5276F32B96B
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 18:23:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F31B2C57B64;
	Wed,  3 Mar 2021 17:23:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7C38C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 17:23:49 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 123HI5r2010143; Wed, 3 Mar 2021 18:23:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=VZlYydjoa19ZfjiGy/7lae6d4RmJH4yQmK8Bw6psmbI=;
 b=Wg3ENRICMBCFHPNUtQPnFZC83FWwJbdPyPaY5UsoYMtvOIvB23fu7ukniD+S77ZcpysY
 8tDhE1lAqGIq+/Djb1ml0SkXuXtaeYRLyGGAkErLEcxnmfeUEshPbey1k3/DXzQiOAhL
 6VMJZrytZ85knSx6Gr6BgtBz6kT4NSGAuYPPLFuurg5Vpe2CbEVGokG53gMlplcj+Jwk
 JWA6akb4QX3MdTencFg/WWxjXSw5q5dpDF3NVAVHfLsvghFPl0VUkN7iYxQwdD+Jxsex
 mlqW6RwVUroKM3S4+pv3thNPyUeXMR0UlPQI+BlioeMq2T6FjbQQhyQS1J/M7v6odhsx FQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36yf9qaac5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 18:23:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 43B82100034;
 Wed,  3 Mar 2021 18:23:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2412520CE3A;
 Wed,  3 Mar 2021 18:23:27 +0100 (CET)
Received: from [10.211.2.167] (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 3 Mar
 2021 18:23:25 +0100
To: Martin Devera <devik@eaxlabs.cz>, <linux-kernel@vger.kernel.org>
References: <aeefa74e-fa19-6c31-5240-0f14fca89298@foss.st.com>
 <20210302190303.28630-1-devik@eaxlabs.cz>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <86ae0975-0f6b-f121-09c4-d909f081a635@foss.st.com>
Date: Wed, 3 Mar 2021 18:23:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210302190303.28630-1-devik@eaxlabs.cz>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-03_05:2021-03-03,
 2021-03-03 signatures=0
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Le Ray <erwan.leray@st.com>
Subject: Re: [Linux-stm32] [PATCH v4 1/2] dt-bindings: serial: Add
	rx-tx-swap to stm32-usart
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

On 3/2/21 8:03 PM, Martin Devera wrote:
> Add new rx-tx-swap property to allow for RX & TX pin swapping.
> 
> Signed-off-by: Martin Devera <devik@eaxlabs.cz>
> ---
>  .../devicetree/bindings/serial/st,stm32-uart.yaml  | 32 +++++++++++++++-------
>  1 file changed, 22 insertions(+), 10 deletions(-)
> 

Hi Martin,

I'm only wondering on moving the allOf and the st,hw-flow-ctrl prop. But
others may comment on this.

Feel free to add my:
Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks!
Fabrice

> diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> index 8631678283f9..6eab2debebb5 100644
> --- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> @@ -9,9 +9,6 @@ maintainers:
>  
>  title: STMicroelectronics STM32 USART bindings
>  
> -allOf:
> -  - $ref: rs485.yaml
> -
>  properties:
>    compatible:
>      enum:
> @@ -40,6 +37,10 @@ properties:
>  
>    uart-has-rtscts: true
>  
> +  rx-tx-swap:
> +    type: boolean
> +    maxItems: 1
> +
>    dmas:
>      minItems: 1
>      maxItems: 2
> @@ -66,13 +67,24 @@ properties:
>    linux,rs485-enabled-at-boot-time: true
>    rs485-rx-during-tx: true
>  
> -if:
> -  required:
> -    - st,hw-flow-ctrl
> -then:
> -  properties:
> -    cts-gpios: false
> -    rts-gpios: false
> +allOf:
> +  - $ref: rs485.yaml
> +  - if:
> +      required:
> +        - st,hw-flow-ctrl
> +    then:
> +      properties:
> +        cts-gpios: false
> +        rts-gpios: false
> +  - if:
> +      required:
> +        - rx-tx-swap
> +    then:
> +      properties:
> +        compatible:
> +          enum:
> +            - st,stm32f7-uart
> +            - st,stm32h7-uart
>  
>  required:
>    - compatible
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
