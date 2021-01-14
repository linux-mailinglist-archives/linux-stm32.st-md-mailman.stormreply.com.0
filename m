Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F17A32F6582
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 17:14:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B22E1C3FAD6;
	Thu, 14 Jan 2021 16:14:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8FFAC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 16:14:04 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10EGC4mh010750; Thu, 14 Jan 2021 17:14:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=bUj3j0P4tdLJq6O63GWdPitSIAhpFtQKkRyzj1rNHh0=;
 b=0hVw46m8JquehrqGorquecV6MUKsvPqd+3IUIujveEE6lpTapaBq5H8TvpLqv32/rDrT
 xiEKHKQJKMur2ci2sTBZBeQimDUdAJL0s+Kf8dL9rs6vzwbc6/T+ejJHaH/XYub1bpOM
 B0Vv/cKaFpfCx/yDBmxTnMQDj4GWzNeKmstjW5IHVt/zBVw0zXnKHACLx3urs1MxOvTK
 RuAIHydfKzfe2FyU+TYB5ntwK7Ul+0syzTfI2ZPb+C9hnR+9MFwo17CJt+ihRtUTHYz+
 vW0EkG9MqHvi00OALT+a02CCcwjtqQsZCZoPXRs3M5q+V/YYnw9ytjQmyV/hgXOqZy7O wQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35y5gxe0eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 17:14:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0945C10002A;
 Thu, 14 Jan 2021 17:13:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D7F232B4D0A;
 Thu, 14 Jan 2021 17:13:59 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan
 2021 17:13:59 +0100
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20201224062726.92797-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <7ed303e1-09c0-0a4b-c452-6a435d0c2811@foss.st.com>
Date: Thu, 14 Jan 2021 17:13:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201224062726.92797-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_06:2021-01-14,
 2021-01-14 signatures=0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Linux-stm32] [PATCH V2] ARM: dts: stm32: Disable KS8851 and
 FMC on PicoITX board
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



On 12/24/20 7:27 AM, Marek Vasut wrote:
> The PicoITX has only one ethernet routed out, so the KS8851 is not used
> at all. Disable the KS8851 and the entire FMC controller.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
> V2: Drop the "ebi" node, which is no longer present
> ---

Applied on stm32-next.

Thanks.
Alex


>   arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi
> index b99f2b891629..25528a1c096f 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi
> @@ -36,6 +36,10 @@ &dac {
>   	status = "disabled";
>   };
>   
> +&fmc {
> +	status = "disabled";
> +};
> +
>   &gpioa {
>   	/*
>   	 * NOTE: The USB Port on the PicoITX needs a PWR_EN signal to enable
> @@ -94,6 +98,10 @@ &i2c5 {	/* On board-to-board connector */
>   	/delete-property/dma-names;
>   };
>   
> +&ksz8851 {
> +	status = "disabled";
> +};
> +
>   &usart3 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&usart3_pins_a>;
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
