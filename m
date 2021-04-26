Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8368036B1C9
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Apr 2021 12:44:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 411AFC57B51;
	Mon, 26 Apr 2021 10:44:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D4C2CFAC55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Apr 2021 10:44:34 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QAftq6004032; Mon, 26 Apr 2021 12:44:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ZLdR6V+nGOyKcwMp0e+5LN3hyD1wKCdQx98TUxklqiw=;
 b=KVMcl4Dp2wEuEqkaC8tGk2eBZUM30sLD3Uru5jTRrZ0Gi7cxLRCMgwKwEOEFl+xuht0Y
 jZudrP3H8H3AjgqwOeFTORtg+jHHLfFSjAfn/+SyCLPUFjYx87+UgqL+zbOO3CG4MEyU
 IRpDR1Dy1PzBKU/xgzRoC6E0DKFbXzhYWa6cY9ia7lrYoTmMmtfszaN2Z1irll9svrxE
 KVcBwnFx7+3zfmgmws9gutNNfSORfgCxuScMHSbLcLnvE+bzyqJjR6Rzj+PSH8GwgfM2
 B3bO5FAe+j1qzieRv00icHN9Ztdyh6x1GwrYAeq7W38Nzt7yAeKMZ5kSBfEARIjiy2Z/ KQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 385aeec51e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 12:44:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BCB0910002A;
 Mon, 26 Apr 2021 12:44:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A70D3243D2F;
 Mon, 26 Apr 2021 12:44:23 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 26 Apr
 2021 12:44:23 +0200
To: <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <alexandre.torgue@foss.st.com>
References: <20210426103956.29007-1-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <c6a63d27-e0d9-ec7e-0f40-907084dde28f@foss.st.com>
Date: Mon, 26 Apr 2021 12:44:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210426103956.29007-1-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-26_03:2021-04-26,
 2021-04-26 signatures=0
Cc: devicetree@vger.kernel.org, Christophe
 Kerello <christophe.kerello@st.com>, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [1/1] ARM: dts: stm32: Configure qspi's mdma
 transfer to block for stm32mp151
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

Don't take care of this patch, i will resend it with the correct header.

Patrice

On 4/26/21 12:39 PM, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Configure qspi's mdma from buffer transfer (max 128 bytes) to
> block transfer (max 64K bytes).
> 
> mtd_speedtest shows that write throughtput increases :
>   - from 734 to 782 KiB/s (~6.5%) with s25fl512s SPI-NOR.
>   - from 4848 to 5319 KiB/s (~9.72%) with Micron SPI-NAND.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  arch/arm/boot/dts/stm32mp151.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index 4b8031782555..cb326c1e12bc 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1358,8 +1358,8 @@
>  			reg = <0x58003000 0x1000>, <0x70000000 0x10000000>;
>  			reg-names = "qspi", "qspi_mm";
>  			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> -			dmas = <&mdma1 22 0x2 0x100002 0x0 0x0>,
> -			       <&mdma1 22 0x2 0x100008 0x0 0x0>;
> +			dmas = <&mdma1 22 0x2 0x10100002 0x0 0x0>,
> +			       <&mdma1 22 0x2 0x10100008 0x0 0x0>;
>  			dma-names = "tx", "rx";
>  			clocks = <&rcc QSPI_K>;
>  			resets = <&rcc QSPI_R>;
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
