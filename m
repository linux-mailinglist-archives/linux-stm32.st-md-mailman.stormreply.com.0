Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A69456064A6
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Oct 2022 17:34:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54D94C64106;
	Thu, 20 Oct 2022 15:34:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B73F6C55596
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Oct 2022 15:34:28 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29KERMVB021524;
 Thu, 20 Oct 2022 17:34:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=IqHKS/vCDR7EQlr9WEEoFigCoOnxdq42cEM/JJjFv8E=;
 b=XgdhoTwM8cSZiLtXHGRVFaiqo8PgGfMqCNqy8CmE9MyBoGla2uvR3tLSNksAJRBeRHCh
 F2PchDrgZb2ljEVsGAwjvIuVtMPEpASsqgUAyT1fnXW74jkPymsQD5CRbonbGq+KBKpC
 NCMNa/82N4BLH56okQUANbjKSKx1GfLDvdTRJ40QH6hAUmYHCtym/ZWeW+oA2CRQS0F4
 //WoFvpR3lCzKadk7YbhpAD84ob+zP5mLd2WsDwM974DUBigr1bT0kLzfbi5XtaXqrLF
 bABnfhMof2Ql2BEgKChJhgJrGmkB3VYDL4dM4EBp2idqfqhzL5mHxZ7pgk88rIIC/5ou Wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k7j9nc1b9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Oct 2022 17:34:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6EF1F10002A;
 Thu, 20 Oct 2022 17:34:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A727237D8A;
 Thu, 20 Oct 2022 17:34:08 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 20 Oct
 2022 17:34:08 +0200
Message-ID: <54d0a3cb-3a48-1336-ddda-4fb0e1a20df6@foss.st.com>
Date: Thu, 20 Oct 2022 17:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Yann Gautier <yann.gautier@foss.st.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
References: <20220921160334.3227138-1-yann.gautier@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220921160334.3227138-1-yann.gautier@foss.st.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-20_07,2022-10-20_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: add sdmmc cd-gpios for
	STM32MP135F-DK
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

Hi Yann

On 9/21/22 18:03, Yann Gautier wrote:
> On STM32MP135F-DK, the SD card detect GPIO is GPIOH4.
> 
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> ---
>   arch/arm/boot/dts/stm32mp135f-dk.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp135f-dk.dts b/arch/arm/boot/dts/stm32mp135f-dk.dts
> index e6b8ffd332c7..52f86596ce12 100644
> --- a/arch/arm/boot/dts/stm32mp135f-dk.dts
> +++ b/arch/arm/boot/dts/stm32mp135f-dk.dts
> @@ -82,7 +82,7 @@ &sdmmc1 {
>   	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_clk_pins_a>;
>   	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_clk_pins_a>;
>   	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> -	broken-cd;
> +	cd-gpios = <&gpioh 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
>   	disable-wp;
>   	st,neg-edge;
>   	bus-width = <4>;

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
