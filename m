Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 036E42B5C1A
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Nov 2020 10:47:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC9B9C3FADD;
	Tue, 17 Nov 2020 09:47:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A299C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Nov 2020 09:47:18 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AH9bTlx005869; Tue, 17 Nov 2020 10:47:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=kLGZQ9kpLWhNXSWjbr7GvxK3zYqJJaKPYV5Y/uduEoo=;
 b=vq3T8nafabzNUmOoQhlyd3dCg1VP/QoifrPH+LHv8R4km4n+2tI2Sl4A/fOhXxF69gDR
 apgDod/hozCuK/OE+PX/dWhUfDkJpXeUBNiXtWeITHW6S7QNygfBM64vfkD29kZCUQJQ
 SKcRtK4kcTB4TUXR9jXCOmeilgiT/Y68jB1WRr1clo/8xY57oCax3zvV7qDCGcQE0Lna
 wWv1GcanfD+fXaHE5RZT9T0mWVGMf7F7w+UI/Dg9DKCIWUeHAj6j8VhG3gxu8ajUuZ6V
 E3LIXOGtsJdlrRl2kv6wUpcsZktFJfEurU44lIoFVJhimUMjaVwlOiORdMjd2iz9y74V rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34t5k5095j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 10:47:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8A84610002A;
 Tue, 17 Nov 2020 10:47:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7AC19235AA8;
 Tue, 17 Nov 2020 10:47:09 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Nov
 2020 10:47:08 +0100
To: Amelie Delaunay <amelie.delaunay@st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20201110143641.13879-1-amelie.delaunay@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <3be2f6c9-609a-3ecc-ebae-31ae24859493@st.com>
Date: Tue, 17 Nov 2020 10:46:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201110143641.13879-1-amelie.delaunay@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-17_03:2020-11-13,
 2020-11-17 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/1] ARM: dts: stm32: fix mdma1 clients
 channel priority level on stm32mp151
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

Hi,

On 11/10/20 3:36 PM, Amelie Delaunay wrote:
> Update mdma1 clients channel priority level following stm32-mdma bindings.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>   arch/arm/boot/dts/stm32mp151.dtsi | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index 719a4276a348..b95c46c82223 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1294,7 +1294,7 @@
>   			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
>   			clocks = <&rcc HASH1>;
>   			resets = <&rcc HASH1_R>;
> -			dmas = <&mdma1 31 0x10 0x1000A02 0x0 0x0>;
> +			dmas = <&mdma1 31 0x2 0x1000A02 0x0 0x0>;
>   			dma-names = "in";
>   			dma-maxburst = <2>;
>   			status = "disabled";
> @@ -1358,8 +1358,8 @@
>   			reg = <0x58003000 0x1000>, <0x70000000 0x10000000>;
>   			reg-names = "qspi", "qspi_mm";
>   			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> -			dmas = <&mdma1 22 0x10 0x100002 0x0 0x0>,
> -			       <&mdma1 22 0x10 0x100008 0x0 0x0>;
> +			dmas = <&mdma1 22 0x2 0x100002 0x0 0x0>,
> +			       <&mdma1 22 0x2 0x100008 0x0 0x0>;
>   			dma-names = "tx", "rx";
>   			clocks = <&rcc QSPI_K>;
>   			resets = <&rcc QSPI_R>;
> 

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
