Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED9CA595D4
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Mar 2025 14:14:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FB91C78F97;
	Mon, 10 Mar 2025 13:14:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23165C78F96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 13:14:42 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ACqr1I032195;
 Mon, 10 Mar 2025 14:14:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 YEH/1gxIk510Nqct1xMg/A/MiupcMO3/eGizj/qCq8U=; b=2Hw0ok2xiRUCGTVk
 3ZLzBswqFGoVzIwoLTz4mfpwk/vpdLN7K7hD1r33l0Fu7Mr04uYvZ3HGyg5FiBM0
 xrwR8Tp4azVEURP8wcUx3OJ6SidBq7AogkO9S87iBWOAbEArTrh5OwOVPvl/c5uY
 iJUFgUzp0M7hP6CODjA6FQ8YRVZheRDeH4QCdzs27WnS6kegJxoxIwJ5oYTsJ13l
 shZ7Wur3nkVRlgG4YD5UVWyhx44H/cM/0lCGY1CfBhxYs9DJ8pjUMIbUfLnmiNB3
 8JAzYib25h6ddPT5Tm2wqNj5OytbPCgjV6JwbD64ypwBz2VGTAIkodYk8IT3H1T4
 gTp55g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 458f573me0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Mar 2025 14:14:28 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2F7394005E;
 Mon, 10 Mar 2025 14:13:04 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A9E8B4DD53D;
 Mon, 10 Mar 2025 14:12:22 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 14:12:22 +0100
Message-ID: <37d0b2f0-05c9-4e52-9fa9-d73ed0c56ec0@foss.st.com>
Date: Mon, 10 Mar 2025 14:12:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-kernel@vger.kernel.org>
References: <20250310122402.8795-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250310122402.8795-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_05,2025-03-07_03,2024-11-22_01
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] ARM: dts: stm32: use
 IRQ_TYPE_EDGE_FALLING on stm32mp157c-dk2
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

Hi Dario

On 3/10/25 13:23, Dario Binacchi wrote:
> Replace the number 2 with the appropriate numerical constant defined in
> dt-bindings/interrupt-controller/irq.h.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Antonio Borneo <antonio.borneo@foss.st.com>
> 
> ---
> 
> Changes in v2:
> - Drop inclusion of dt-bindings/interrupt-controller/irq.h header
> - Add Reviewed-by tag of Antonio Borneo
> 
>   arch/arm/boot/dts/st/stm32mp157c-dk2.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
> index 5f9c0160a9c4..324f7bb988d1 100644
> --- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
> +++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
> @@ -67,7 +67,7 @@ &i2c1 {
>   	touchscreen@38 {
>   		compatible = "focaltech,ft6236";
>   		reg = <0x38>;
> -		interrupts = <2 2>;
> +		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
>   		interrupt-parent = <&gpiof>;
>   		touchscreen-size-x = <480>;
>   		touchscreen-size-y = <800>;

Applied on stm32-next.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
