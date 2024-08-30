Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 368899666F8
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Aug 2024 18:31:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA047C6C841;
	Fri, 30 Aug 2024 16:31:53 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F784C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 16:31:47 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UC9Gn2029818;
 Fri, 30 Aug 2024 18:31:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 c55TnbAQcwEgANv3HCyH02RkCKFOHECJ/MLSerth/Vc=; b=OtbZu1T3bv6bIYrM
 YH0HaKycTAdjRZ+QfOArDjgnyCuET++v1a/df1HPttksgFl5gMUJzEBvv1B19HIc
 R8MFNjPpQlLABnBPCxVlQrm15sTIVyN6xgfqnzRCzvtVurxyXFXbNO9ZUiqhF7dG
 EQIKa13ThNP7MoqCkEtC1Ufn6+1XJp+3VP5KbfmAo4SOo9eJrfNBJ18OQdZw3Zlz
 BJ/ISbOFvy8WjUdoGs6oBfLeXU1b6bM81ZOOJqQKDQW74qi+NXdEimRHtJZXuLRb
 JyIgC4b5gI96N/8kkKxw/8UxAGpBz01mqZX+lG27s/ov019+0ar2gnzIfIuDmzeS
 J3e0lw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41b14tbrbh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Aug 2024 18:31:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3CCC34002D;
 Fri, 30 Aug 2024 18:31:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8188F27F641;
 Fri, 30 Aug 2024 18:30:38 +0200 (CEST)
Received: from [10.252.12.18] (10.252.12.18) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 30 Aug
 2024 18:30:37 +0200
Message-ID: <44ad0f01-4701-45e9-a3cb-e89222f8c60e@foss.st.com>
Date: Fri, 30 Aug 2024 18:30:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Oleksij Rempel <o.rempel@pengutronix.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20240809091615.3535447-1-o.rempel@pengutronix.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240809091615.3535447-1-o.rempel@pengutronix.de>
X-Originating-IP: [10.252.12.18]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_10,2024-08-30_01,2024-05-17_01
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: arm: stm32: Add
 compatible strings for Protonic boards
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

Hi

On 8/9/24 11:16, Oleksij Rempel wrote:
> Add compatible strings for Protonic MECIO1r0 and MECT1S boards to the
> STM32MP151-based boards section and Protonic MECIO1r1 board to the
> STM32MP153-based boards section.
> 
> MECIO1 is an I/O and motor control board used in blood sample analysis
> machines. MECT1S is a 1000Base-T1 switch for internal machine networks
> of blood sample analysis machines.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> index 58099949e8f3a..703d4b574398d 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -54,6 +54,8 @@ properties:
>         - description: ST STM32MP151 based Boards
>           items:
>             - enum:
> +              - prt,mecio1r0 # Protonic MECIO1r0
> +              - prt,mect1s   # Protonic MECT1S
>                 - prt,prtt1a   # Protonic PRTT1A
>                 - prt,prtt1c   # Protonic PRTT1C
>                 - prt,prtt1s   # Protonic PRTT1S
> @@ -71,6 +73,12 @@ properties:
>             - const: dh,stm32mp151a-dhcor-som
>             - const: st,stm32mp151
>   
> +      - description: ST STM32MP153 based Boards
> +        items:
> +          - enum:
> +              - prt,mecio1r1   # Protonic MECIO1r1
> +          - const: st,stm32mp153
> +
>         - description: DH STM32MP153 DHCOM SoM based Boards
>           items:
>             - const: dh,stm32mp153c-dhcom-drc02

Applied on stm32-next.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
