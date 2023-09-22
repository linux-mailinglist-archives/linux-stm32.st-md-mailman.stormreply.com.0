Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6637AAD81
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Sep 2023 11:14:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54850C6A5EF;
	Fri, 22 Sep 2023 09:14:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2733C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 09:14:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38M3QAYg003949; Fri, 22 Sep 2023 11:13:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=8tru55dK21kkrZooBZ20jTZ5oFa3mpckA4DEAk2YLTw=; b=YN
 Gcz8rEqiXT7ThAGppxSZ321Y8tLtvjLbVPPIdY8Ot9eDR0jpalZJB9EitfJLgom0
 O9ooHfOf6TJAZR+9m9SyV7QUTHo6lVZuXWiBQ5B28g8UxJjw8/lEKdlLUDRvIywD
 w6t9eSgQvrqj7XUKzm+xmijK9tGzNubL9e3H7BRzFGzwng2BQ5kTjDr3NhtdensG
 H2/dp1M2L6nvx9ZZX/3zF/0d4YeS30/qY/sX3EN6gquvXVARMHnMEEqZhTWzJr/9
 qHvmxEfQjRfcM181GTixXibqmP+zHID0XREB12k5OkCWFhnz3QwNs1AhQUNYdwGK
 M+ds3Ur5LEghOXZKiU5w==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t8tt7akx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 11:13:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D5289100051;
 Fri, 22 Sep 2023 11:13:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C8837215BEA;
 Fri, 22 Sep 2023 11:13:54 +0200 (CEST)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Sep
 2023 11:13:54 +0200
Message-ID: <cb996f8a-16ad-96ec-11ed-993f494ef6b9@foss.st.com>
Date: Fri, 22 Sep 2023 11:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-kernel@vger.kernel.org>
References: <20230904180341.923038-1-dario.binacchi@amarulasolutions.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230904180341.923038-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_07,2023-09-21_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: stm32f7-pinctrl: don't
 use multiple blank lines
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

On 9/4/23 20:03, Dario Binacchi wrote:
> The patch fixes the following warning:
> 
> arch/arm/dts/stm32f7-pinctrl.dtsi:380: check: Please don't use multiple blank lines
> 
> Fixes: ba287d1a0137 ("ARM: dts: stm32: add pin map for LTDC on stm32f7")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
>   arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
> index 65480a9f5cc4..842f2b17c4a8 100644
> --- a/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
> @@ -376,7 +376,6 @@ pins2 {
>   				};
>   			};
>   
> -
>   			ltdc_pins_a: ltdc-0 {
>   				pins {
>   					pinmux = <STM32_PINMUX('E', 4, AF14)>, /* LCD_B0 */


Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
