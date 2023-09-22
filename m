Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D64D7AAD5C
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Sep 2023 11:04:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE1EFC6A5EF;
	Fri, 22 Sep 2023 09:04:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19D06C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 09:04:57 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38M3PwDO014839; Fri, 22 Sep 2023 11:04:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=p/ppS1A47bgbinuMN7wBwplhXT0cIutRq8BH5r+Gkz0=; b=Hw
 zS/sl94VjbEwacCdv46JTIMckCgdiY9cYtBiwCbuGfAc0ifCOI3R8MiF0oaxeONb
 xfcW9k2Vm6jpbhhVHJpatDeTi1X++if+lxEVTBLP7ZhQBcuKZt8H6nrIcOl2ZDu0
 /Gbq5XNZcSj3H04aoyO5Z2ZHVYUcEI9cEh77C/oxPrMCVxppRct/vqSRv4erQHF7
 FZvwNW4tm+IA16zletZfLgvoiXXd+C8gliNDCD1XiKiL3hA81+4MkPTdsqiYSI9j
 upbUgzABzUUSXwxCb886EDntAETMp0voKTNUkiQhV0rcengNg13wTfsqDnypot7m
 f+1RcSjMWNIGQbNoUW5g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t8tt02jmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 11:04:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 99AE3100051;
 Fri, 22 Sep 2023 11:04:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92490215154;
 Fri, 22 Sep 2023 11:04:24 +0200 (CEST)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Sep
 2023 11:04:23 +0200
Message-ID: <e69618dd-e3b4-f987-15c7-1363881930b7@foss.st.com>
Date: Fri, 22 Sep 2023 11:04:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Thomas BOURGOIN <thomas.bourgoin@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20230816142617.2625802-1-thomas.bourgoin@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230816142617.2625802-1-thomas.bourgoin@foss.st.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_07,2023-09-21_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: add HASH on stm32mp131
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

On 8/16/23 16:26, Thomas BOURGOIN wrote:
> From: Lionel Debieve <lionel.debieve@foss.st.com>
> 
> Add the HASH support on stm32mp131.
> 
> Signed-off-by: Lionel Debieve <lionel.debieve@foss.st.com>
> Signed-off-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
> ---
>   arch/arm/boot/dts/st/stm32mp131.dtsi | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
> index 672f3b7735a2..4e4f64cfb75b 100644
> --- a/arch/arm/boot/dts/st/stm32mp131.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
> @@ -1210,6 +1210,17 @@ timer {
>   			};
>   		};
>   
> +		hash: hash@54003000 {
> +			compatible = "st,stm32mp13-hash";
> +			reg = <0x54003000 0x400>;
> +			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&rcc HASH1>;
> +			resets = <&rcc HASH1_R>;
> +			dmas = <&mdma 30 0x2 0x1000a02 0x0 0x0>;
> +			dma-names = "in";
> +			status = "disabled";
> +		};
> +
>   		mdma: dma-controller@58000000 {
>   			compatible = "st,stm32h7-mdma";
>   			reg = <0x58000000 0x1000>;

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
