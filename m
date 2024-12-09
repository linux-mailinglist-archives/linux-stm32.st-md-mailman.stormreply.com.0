Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B139E9D39
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2024 18:43:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39309C78021;
	Mon,  9 Dec 2024 17:43:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 237EDC78014
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2024 17:42:59 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9DaPDf014876;
 Mon, 9 Dec 2024 18:42:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Y2BGA9jU8VfghUQrUN6Yf64Ypr7lE8Oudb0vhFn8vD4=; b=pLL2eUEcNSIPxR+Y
 DYvWd4VIezOUREwXUmEvNLjuClUvdPgemUUajj84xw7U3VuY3+K3fiXGojGRZrDB
 +cCihAc4j19/fVMYmxGkDoPbqh+8fTY0ZvyOivmQd6PaJfF/RJrN8ZE6I8NOlHDQ
 L6cAx941WpCGlg5pPgEBONjjJSIV5lwUyHo8chwyNtu0tdpo4YMaJqof9lpfcSaj
 1D20lDpg4388e2Ur0aMtUns9w1BVmu9n6277V2IFD8h+WFmghkkNQUMp0dx1rUaD
 2maF9H/CKcMSuHV/2i2g5KKxqnn0SCbSBVupzm1yz80MtKHlIkJU1I9jn5PUnQoE
 unLFeg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ccnm1922-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2024 18:42:44 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 874D740044;
 Mon,  9 Dec 2024 18:41:39 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 348E72898EE;
 Mon,  9 Dec 2024 18:41:03 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 9 Dec
 2024 18:41:02 +0100
Message-ID: <7b0b43c8-0396-4a61-b8fc-6bb277f3a63b@foss.st.com>
Date: Mon, 9 Dec 2024 18:41:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20241105224728.147384-1-marex@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20241105224728.147384-1-marex@denx.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Increase CPU core
 voltage on STM32MP13xx DHCOR SoM
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

Hi Marek

On 11/5/24 23:46, Marek Vasut wrote:
> The STM32MP13xx DHCOR DHSBC is populated with STM32MP13xx part capable
> of 1 GHz operation, increase the CPU core voltage to 1.35 V to make
> sure the SoC is stable even if the blobs unconditionally force the CPU
> to 1 GHz operation.
> 
> It is not possible to make use of CPUfreq on the STM32MP13xx because
> the SCMI protocol 0x13 is not implemented by upstream OpTee-OS which
> is the SCMI provider.
> 
> Fixes: 6331bddce649 ("ARM: dts: stm32: Add support for STM32MP13xx DHCOR SoM and DHSBC board")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
> index 07133bd82efa6..8630de147a52b 100644
> --- a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
> @@ -85,8 +85,8 @@ regulators {
>   
>   			vddcpu: buck1 { /* VDD_CPU_1V2 */
>   				regulator-name = "vddcpu";
> -				regulator-min-microvolt = <1250000>;
> -				regulator-max-microvolt = <1250000>;
> +				regulator-min-microvolt = <1350000>;
> +				regulator-max-microvolt = <1350000>;
>   				regulator-always-on;
>   				regulator-initial-mode = <0>;
>   				regulator-over-current-protection;


Applied on stm32-next.

Thanks!!
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
