Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86ED37704F4
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Aug 2023 17:39:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D63EC6B466;
	Fri,  4 Aug 2023 15:39:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D465C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Aug 2023 15:39:08 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 374BxUoI018633; Fri, 4 Aug 2023 17:38:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=LLBCnSV8BzGWY5vQNHbsNY1jOKdrs1OIhsy3Hge6zEY=; b=aS
 p3aE3RlrHBJyBwtqSLG+3U7WwzVqI6bqn5rUcgEtcuA8iFt7ZRc9/ge/n54+jZZj
 EwI7dhJIZ5hhs3EovJGJ+o0UTLy9SDWZy7JhgqfhIi01sfKWPnica8X1jdCnegd/
 blU8B22buJrX/HrPvHRElK+gbekG35gyDcBTV4MJohkHIy2R1ZUuLW4ZYP08J3nX
 cbAnY7gSmE+OjhHpUwNlreeOmQ7nolr1ijCXYqlnIj0aVNPtpiAFP7DQE4IUXoOf
 tiMXAH2ukeOTkQmTQZ2qn3+GK5T5hFaf11f72BWAWNyg2h5rj1HrqnPUqooqUMon
 F1SJlfd0KPH05cGxw52Q==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s8wukad76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Aug 2023 17:38:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5193410004F;
 Fri,  4 Aug 2023 17:38:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4947621ED3D;
 Fri,  4 Aug 2023 17:38:56 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 4 Aug
 2023 17:38:55 +0200
Message-ID: <7e5ebb75-3e4c-8fc9-afef-06a436786d57@foss.st.com>
Date: Fri, 4 Aug 2023 17:38:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20230730174954.5293-1-krzysztof.kozlowski@linaro.org>
 <20230730174954.5293-4-krzysztof.kozlowski@linaro.org>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230730174954.5293-4-krzysztof.kozlowski@linaro.org>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-04_15,2023-08-03_01,2023-05-22_02
Subject: Re: [Linux-stm32] [PATCH v2 4/4] ARM: dts: st: stih407: drop
	max-duty-cycle
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



On 7/30/23 19:49, Krzysztof Kozlowski wrote:
> "max-duty-cycle" property was removed in the commit f747a1fe7848
> ("regulator: pwm-regulator: Remove obsoleted property"):
> 
>   stih418-b2199.dtb: pwm-regulator: Unevaluated properties are not allowed ('max-duty-cycle' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Correct subject prefix: AMR->ARM
> ---
>  arch/arm/boot/dts/st/stih407-family.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/st/stih407-family.dtsi b/arch/arm/boot/dts/st/stih407-family.dtsi
> index 3f58383a7b59..29302e74aa1d 100644
> --- a/arch/arm/boot/dts/st/stih407-family.dtsi
> +++ b/arch/arm/boot/dts/st/stih407-family.dtsi
> @@ -111,7 +111,6 @@ pwm_regulator: pwm-regulator {
>  		regulator-min-microvolt = <784000>;
>  		regulator-max-microvolt = <1299000>;
>  		regulator-always-on;
> -		max-duty-cycle = <255>;
>  		status = "okay";
>  	};
>  
Acked-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks 
Patrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
