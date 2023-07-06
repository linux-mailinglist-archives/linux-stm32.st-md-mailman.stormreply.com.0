Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECA674984F
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jul 2023 11:25:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27E77C6B45C;
	Thu,  6 Jul 2023 09:25:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D9B2C6B458
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jul 2023 09:25:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3668EjRL026984; Thu, 6 Jul 2023 11:25:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=7t4eCU5gGbd6E2c3Byzad523u0UnY/0NWeRLFMO8wqQ=;
 b=oOHQUk7YHvsQeSB7NLsvfkez0kTZlUCcLBgh3hS4SMD5Wr3XtDTxiKvSKowNqENq4C8s
 /288tIqKzXTGt4S2InHB2hb0Amk1CNtGQGYBfWaqN77e7cTrA1nCFp/hXvhbko3GdqKF
 L/MzEPCBqP4GZU1Fn/yzQ5JE4cj8OgCenJ0wWY5nRviDPqiXVJho5qJfaAY9qEtW3ldq
 WNfUylY6/Hwr6gUEHKjKBvvikQWSeI38uHh3/etreV3Px9tW0l50odh6QdLz+VrpwnEn
 3Em2pZ9kmrlRUa/Y7HiINICLumd7trhKCCWuff7jg/l/hOAVnY6ZeQv4znQLx1ghbUAx 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rnsxd0je3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jul 2023 11:25:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB767100052;
 Thu,  6 Jul 2023 11:25:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C615521685E;
 Thu,  6 Jul 2023 11:25:21 +0200 (CEST)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 6 Jul
 2023 11:25:19 +0200
Message-ID: <61d93738-4ffd-411d-d32c-912c14eea56d@foss.st.com>
Date: Thu, 6 Jul 2023 11:25:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
 <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>, <vkoul@kernel.org>, <jic23@kernel.org>,
 <olivier.moysan@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
 <mchehab@kernel.org>, <fabrice.gasnier@foss.st.com>,
 <andi.shyti@kernel.org>, <ulf.hansson@linaro.org>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <hugues.fruchet@foss.st.com>, <lee@kernel.org>, <will@kernel.org>,
 <catalin.marinas@arm.com>, <arnd@kernel.org>, <richardcochran@gmail.com>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-8-gatien.chevallier@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230705172759.1610753-8-gatien.chevallier@foss.st.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_06,2023-07-06_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-serial@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 07/10] arm64: dts: st: add RIFSC as a
 domain controller for STM32MP25x boards
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

Hi Gatien

On 7/5/23 19:27, Gatien Chevallier wrote:
> RIFSC is a firewall controller. Change its compatible so that is matches
> the documentation and reference RIFSC as a feature-domain-controller.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index 5268a4321841..62101084cab8 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -106,17 +106,20 @@ soc@0 {
>   		ranges = <0x0 0x0 0x0 0x80000000>;
>   
>   		rifsc: rifsc-bus@42080000 {
> -			compatible = "simple-bus";
> +			compatible = "st,stm32mp25-rifsc";

You could keep "simple-bus" compatible (in second position). In case of 
the RIFSC is not probed, the platform will be able to boot. If you agree 
you can use the same for ETZPC.

Cheers
Alex

>   			reg = <0x42080000 0x1000>;
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			ranges;
> +			feature-domain-controller;
> +			#feature-domain-cells = <1>;
>   
>   			usart2: serial@400e0000 {
>   				compatible = "st,stm32h7-uart";
>   				reg = <0x400e0000 0x400>;
>   				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
>   				clocks = <&ck_flexgen_08>;
> +				feature-domains = <&rifsc 32>;
>   				status = "disabled";
>   			};
>   		};

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
