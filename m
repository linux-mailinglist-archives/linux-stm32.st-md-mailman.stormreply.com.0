Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFF87340B
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jul 2019 18:38:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6332CFAC6D;
	Wed, 24 Jul 2019 16:38:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECD8EC28E31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jul 2019 16:38:31 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6OGZxKK003801; Wed, 24 Jul 2019 18:38:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=LIYF+WcEyHaSveQjneiWBz5V/SW/gazjJXI0PW9I0e8=;
 b=C2o/om1ItzSc3OdBwnt83hedbHngy+MPN/wTWy9hUMGQU+KNxgEHGTALLAHw+rV/VPpz
 BFdTu8JaBosBTkGFtxJixvbaSahxZEHmk0W+mGhYXlRZsfcljHKawomaQ0rhZ6UNVJDq
 kILBoPUa82+q8CTTOzCjTAIePw+qdzjyxkgJKVIqPOfa4rdwPkoLAz6qhWwHyunvh0W1
 TsP4xXwq6+qTbOfRK0M+MtUhWOisZOmOW5Cvg4sGAsFoG6jm+sZ+ITLFoQKRYQgprTNs
 PR0W9toqOQBoU/F5r3+YMZhPF+zmNwSeHnU0iwOOm+vDGwAyuwnfUc+H/Y1tOeSy/OLO 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tx603xbgc-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 24 Jul 2019 18:38:07 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EE96A38;
 Wed, 24 Jul 2019 16:38:06 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C259F5212;
 Wed, 24 Jul 2019 16:38:06 +0000 (GMT)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 24 Jul
 2019 18:38:06 +0200
To: Christophe Kerello <christophe.kerello@st.com>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <linux@armlinux.org.uk>, <olof@lixom.net>,
 <arnd@arndb.de>
References: <1561128590-14621-1-git-send-email-christophe.kerello@st.com>
 <1561128590-14621-2-git-send-email-christophe.kerello@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <4b6a8df1-593e-44b2-4bb3-2af9f732396c@st.com>
Date: Wed, 24 Jul 2019 18:38:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1561128590-14621-2-git-send-email-christophe.kerello@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-24_06:, , signatures=0
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/4] ARM: dts: stm32: add FMC2 NAND
 controller support on stm32mp157c
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

Hi Christophe

On 6/21/19 4:49 PM, Christophe Kerello wrote:
> This patch adds FMC2 NAND controller support used by stm32mp157c SOC.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> ---
>   arch/arm/boot/dts/stm32mp157c.dtsi | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
> index 0c4e6eb..f2bda28 100644
> --- a/arch/arm/boot/dts/stm32mp157c.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c.dtsi
> @@ -1239,6 +1239,25 @@
>   			dma-requests = <48>;
>   		};
>   
> +		fmc: nand-controller@58002000 {
> +			compatible = "st,stm32mp15-fmc2";
> +			reg = <0x58002000 0x1000>,
> +			      <0x80000000 0x1000>,
> +			      <0x88010000 0x1000>,
> +			      <0x88020000 0x1000>,
> +			      <0x81000000 0x1000>,
> +			      <0x89010000 0x1000>,
> +			      <0x89020000 0x1000>;
> +			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +			dmas = <&mdma1 20 0x10 0x12000A02 0x0 0x0>,
> +			       <&mdma1 20 0x10 0x12000A08 0x0 0x0>,
> +			       <&mdma1 21 0x10 0x12000A0A 0x0 0x0>;

Please, don't use capital letter here.

> +			dma-names = "tx", "rx", "ecc";
> +			clocks = <&rcc FMC_K>;
> +			resets = <&rcc FMC_R>;
> +			status = "disabled";
> +		};
> +
>   		qspi: spi@58003000 {
>   			compatible = "st,stm32f469-qspi";
>   			reg = <0x58003000 0x1000>, <0x70000000 0x10000000>;
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
