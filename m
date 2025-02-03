Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C66BEA25671
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2025 10:56:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E3AEC78F7C;
	Mon,  3 Feb 2025 09:56:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE82DCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2025 09:56:20 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5139enKG000937;
 Mon, 3 Feb 2025 10:56:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 BfpRa9pVKniPbUdq+WjnWX41QDXL4UVqbeBgQoM5bRI=; b=KseGKCZB7npfzHFn
 UGF92lIdj3uwG1DTD12il2yiI0DpqGyeQO/W6ToZ54BmU2Dl4e9hetyeW7JVipsB
 FN/QJfRO1XGq4Q3t62pRaAzrm6GaPvSLkUu7N2bhmBRuMPxuPfJTp36Z0KbZ3gXx
 ku7N5DQN1Ca+3kuEXwHytCiq/uY4AEWapfC/MhtgaKKrj+59wNFnj4x7Gha+eOoE
 JoUAMF3Oef9leyHynfkoHJOWRhdn2z5lLVMqwAYqwwp+oR3awOlGeN3nWNCtGR1q
 pvrkgBky0KTsiXZWKQrAR5Wv0fwbi/ReUDsucvrIMimahh1cNBQRiF6wUw9qlBma
 5/550w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44hder5cwj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2025 10:56:15 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C93CB40054;
 Mon,  3 Feb 2025 10:55:31 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 789752A5767;
 Mon,  3 Feb 2025 10:55:15 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Feb
 2025 10:55:15 +0100
Message-ID: <a4d7506a-c5ed-46d2-87c5-c210b03b4860@foss.st.com>
Date: Mon, 3 Feb 2025 10:55:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe Parant <c.parant@phytec.fr>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20250110150216.309760-1-c.parant@phytec.fr>
 <20250110150216.309760-7-c.parant@phytec.fr>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250110150216.309760-7-c.parant@phytec.fr>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_04,2025-01-31_02,2024-11-22_01
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: Re: [Linux-stm32] [PATCH 06/11] ARM: dts: stm32mp15: phycore: qspi:
 Fix memory map and pinctrl
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

On 1/10/25 16:02, Christophe Parant wrote:
> - Add missing chip select pin group in pinctrl.
> - Overwrite the memory map to the Flash device size (16MB) is necessary
> to avoid waste of virtual memory that will not be used.
> Without this modification, qspi probe fails because of ioremap error.
> 
> Signed-off-by: Christophe Parant <c.parant@phytec.fr>
> ---
>   arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
> index 660cdc260963..f8808eee6a22 100644
> --- a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
> @@ -290,8 +290,14 @@ &pwr_regulators {
>   
>   &qspi {
>   	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a>;
> -	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a>;
> +	pinctrl-0 = <&qspi_clk_pins_a
> +				 &qspi_bk1_pins_a
> +				 &qspi_cs1_pins_a>;
> +	pinctrl-1 = <&qspi_clk_sleep_pins_a
> +				 &qspi_bk1_sleep_pins_a
> +				 &qspi_cs1_sleep_pins_a>;

Fix indent for pinctrl-0 and pinctrl-1 please.

> +	reg = <0x58003000 0x1000>,
> +		  <0x70000000 0x1000000>;
>   	status = "okay";
>   
>   	flash0: flash@0 {
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
