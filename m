Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AEC516B9D
	for <lists+linux-stm32@lfdr.de>; Mon,  2 May 2022 10:02:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C908C628AA;
	Mon,  2 May 2022 08:02:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 826A6C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 May 2022 08:02:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 241LoNtB030224;
 Mon, 2 May 2022 10:01:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=tj8rMg2anSNrkXmaoqsySNf92r1jyTKtJTMppRQhTPU=;
 b=WF0I5L2w7456WlL4ftWLf7Ckx4EjnJ2VqbJv35SoHQ4ztlxr0uu5OdKuX0KwkRZ9XnwO
 6vhubTjHQveRxmNogvQNdpvYGf8M8DMGr8BnUSfkTDp+QtOk4vMwQsAU8IFuNn04Vc0S
 n/LXvc+Gv2ZXGK8XYJtZBxmR2k9g69hYRBrVrUg+NTSDcJO69OkYr0ZxroEr2ja954oi
 R7tPKqG614Li60kDqBswSrlMJ8rHm9a2+0LzWDt6IygNq3SfI3xa5EZAR9TGSAPtp52D
 PTax4AOKatXXDkfW5qSswybnlVAoVHBGwM6HEXvDKIlVWJMl/NYjkevYyHdqk+GNWIW+ Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frt88fxsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 May 2022 10:01:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B641710002A;
 Mon,  2 May 2022 10:01:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ACB02212FBF;
 Mon,  2 May 2022 10:01:53 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.44) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 2 May
 2022 10:01:53 +0200
Message-ID: <0018dfe2-8279-fbdb-1c99-7c73570e2000@foss.st.com>
Date: Mon, 2 May 2022 10:01:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220425140436.332467-1-krzysztof.kozlowski@linaro.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220425140436.332467-1-krzysztof.kozlowski@linaro.org>
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-02_02,2022-04-28_01,2022-02-23_01
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: arm: stm32: narrow DH
 STM32MP1 SoM boards
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

Hi krzysztof

On 4/25/22 16:04, Krzysztof Kozlowski wrote:
> The bindings for DH STM32MP1 SoM boards allows invalid combinations,
> e.g. st,stm32mp153 SoC on a dh,stm32mp157c-dhcom-som SoM.
> 
> Split the enums to properly match valid setups.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../devicetree/bindings/arm/stm32/stm32.yaml  | 37 +++++++++++--------
>   1 file changed, 22 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> index fa0a1b84122e..2f83f2760e6a 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -14,21 +14,6 @@ properties:
>       const: "/"
>     compatible:
>       oneOf:
> -      - description: DH STM32MP1 SoM based Boards
> -        items:
> -          - enum:
> -              - arrow,stm32mp157a-avenger96 # Avenger96
> -              - dh,stm32mp153c-dhcom-drc02
> -              - dh,stm32mp157c-dhcom-pdk2
> -              - dh,stm32mp157c-dhcom-picoitx
> -          - enum:
> -     Applied on stm32-next.

Thanks.
Alex         - dh,stm32mp153c-dhcom-som
> -              - dh,stm32mp157a-dhcor-som
> -              - dh,stm32mp157c-dhcom-som
> -          - enum:
> -              - st,stm32mp153
> -              - st,stm32mp157
> -
>         - description: emtrion STM32MP1 Argon based Boards
>           items:
>             - const: emtrion,stm32mp157c-emsbc-argon
> @@ -65,6 +50,13 @@ properties:
>             - enum:
>                 - st,stm32mp135f-dk
>             - const: st,stm32mp135
> +
> +      - description: DH STM32MP153 SoM based Boards
> +        items:
> +          - const: dh,stm32mp153c-dhcom-drc02
> +          - const: dh,stm32mp153c-dhcom-som
> +          - const: st,stm32mp153
> +
>         - items:
>             - enum:
>                 - shiratech,stm32mp157a-iot-box # IoT Box
> @@ -79,6 +71,21 @@ properties:
>             - const: st,stm32mp157c-ed1
>             - const: st,stm32mp157
>   
> +      - description: DH STM32MP1 SoM based Boards
> +        items:
> +          - enum:
> +              - arrow,stm32mp157a-avenger96 # Avenger96
> +          - const: dh,stm32mp157a-dhcor-som
> +          - const: st,stm32mp157
> +
> +      - description: DH STM32MP1 SoM based Boards
> +        items:
> +          - enum:
> +              - dh,stm32mp157c-dhcom-pdk2
> +              - dh,stm32mp157c-dhcom-picoitx
> +          - const: dh,stm32mp157c-dhcom-som
> +          - const: st,stm32mp157
> +
>         - description: Engicam i.Core STM32MP1 SoM based Boards
>           items:
>             - enum:

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
