Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4635D749E8
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jul 2019 11:33:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8C50C35E07;
	Thu, 25 Jul 2019 09:33:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5017C35E02
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jul 2019 09:33:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6P9VIwd019583; Thu, 25 Jul 2019 11:33:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=cE2k0AStBme6BOgnRQEzmPC8VrCBHPwS9TD5CuuagCc=;
 b=VuEvMY/3rmup6cGOlXKpU9tdYVPGEKx9IVi4R84jrF/9OOkE+d+Uvo85LN+PSXJsyv0U
 mrNic+KW2gM+I+dYKv+EcateT0IBuzT2Cj8/7IhRFFadC5wofNCtmU02dRt8dyQUzCWT
 h+ihe42NJR4I+ZKrcj7/CZcEee+RO0jzxm7qPZfH4L1/F7kgknaZ05uEYIxVdAlns0pX
 CSUcHmX3EQ+r25WK7mmoDFTAbRqqzl2pc81LCMOozmJYIvP2N9ozq2DFXpoBo3UYXqKK
 XmbtnK3l+LCGm1x/7Ci/WUf0iPGVdLTfNNV7KpUcxMobUahTMBEW/1nCutyMsDsFpT1Q ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tx60832he-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 25 Jul 2019 11:33:07 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2B70134;
 Thu, 25 Jul 2019 09:33:06 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DA22E2816;
 Thu, 25 Jul 2019 09:33:05 +0000 (GMT)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 25 Jul
 2019 11:33:05 +0200
To: Ludovic Barre <ludovic.Barre@st.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
References: <1561637345-31441-1-git-send-email-ludovic.Barre@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <fe11664c-4419-7ec3-c700-c5992dcb3efe@st.com>
Date: Thu, 25 Jul 2019 11:33:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1561637345-31441-1-git-send-email-ludovic.Barre@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-25_04:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: activate dma for qspi on
	stm32mp157
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

Hi Ludovic

On 6/27/19 2:09 PM, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> This patch activates dma for qspi on stm32mp157.
> 
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>   arch/arm/boot/dts/stm32mp157c.dtsi | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
> index 2afeee6..205ea1d 100644
> --- a/arch/arm/boot/dts/stm32mp157c.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c.dtsi
> @@ -1074,6 +1074,9 @@
>   			reg = <0x58003000 0x1000>, <0x70000000 0x10000000>;
>   			reg-names = "qspi", "qspi_mm";
>   			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +			dmas = <&mdma1 22 0x10 0x100002 0x0 0x0>,
> +			       <&mdma1 22 0x10 0x100008 0x0 0x0>;
> +			dma-names = "tx", "rx";
>   			clocks = <&rcc QSPI_K>;
>   			resets = <&rcc QSPI_R>;
>   			status = "disabled";
> 

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
