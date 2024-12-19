Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 130739F77E0
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Dec 2024 10:00:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD46CC78027;
	Thu, 19 Dec 2024 09:00:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 898F3C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Dec 2024 09:00:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ1Rh8o017817;
 Thu, 19 Dec 2024 10:00:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 UkrwmwyQmzawkZWLeCbcqyudcq/7obCIQjFzSFN9/tU=; b=u8p4Xz2yp6n/8tHE
 /ixidmxQ3dasVRW/tWEiP3IqNVZxIYRY0pGCZOEp4Pq6FgYsfiotzHefBwI3n0wC
 tC1JHcII3o0MuROT3fgmvHGh/usRKjqSHGT0ioTdieS1LwFsSqQ1XkuUeeSTs+/g
 RAkyX9lCWMgbd7pdzJ//6utAPaamij3z7VZ1f8KN9sJZLCHkxAlwXJlEn6gsUhlr
 n25fOvtUnJyN2PmizKakl93KiHiyPJSsd3xpDBLGBeQ6x6mVw7fGRWbhKtyTyCJJ
 ExAppIk8T1p+oIULJAFebFC5m0uVbVH9hTQEhQnzhW5XpcTb4I71aM8bMzFhdIXW
 fxtF/A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43m9ug1d12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Dec 2024 10:00:16 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F147F40052;
 Thu, 19 Dec 2024 09:59:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6E18B258D62;
 Thu, 19 Dec 2024 09:57:48 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 19 Dec
 2024 09:57:47 +0100
Message-ID: <a765a687-3d53-4ce8-aab3-e8a1d4adccf6@foss.st.com>
Date: Thu, 19 Dec 2024 09:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20241213223658.99802-1-marex@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20241213223658.99802-1-marex@denx.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Swap USART3 and UART8
 alias on STM32MP15xx DHCOM SoM
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

hi Marek

On 12/13/24 23:36, Marek Vasut wrote:
> Swap USART3 and UART8 aliases on STM32MP15xx DHCOM SoM,
> make sure UART8 is listed first, USART3 second, because
> the UART8 is labeled as UART2 on the SoM pinout, while
> USART3 is labeled as UART3 on the SoM pinout.
> 
> Fixes: 34e0c7847dcf ("ARM: dts: stm32: Add DH Electronics DHCOM STM32MP1 SoM and PDK2 board")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> index 086d3a60ccce2..142d4a8731f8d 100644
> --- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> @@ -15,8 +15,8 @@ aliases {
>   		rtc0 = &hwrtc;
>   		rtc1 = &rtc;
>   		serial0 = &uart4;
> -		serial1 = &usart3;
> -		serial2 = &uart8;
> +		serial1 = &uart8;
> +		serial2 = &usart3;
>   	};
>   
>   	chosen {


Applied on stm32-next.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
