Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7305072EC
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Apr 2022 18:25:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBD24C6049A;
	Tue, 19 Apr 2022 16:25:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85040C6047D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Apr 2022 16:25:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23JCZ9J4031629;
 Tue, 19 Apr 2022 18:25:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5P/osqGB+ESz7rugDa+K24RbbtCL7IUzm5ZH73U2En0=;
 b=oN52VIHzwaqM5it7I/vtINGZOH+WdXibeEf5smgxfk7c/y/d/qSlh7QmWghGq/xZunl0
 6AcGLqm11dQR/t4Mp+Kfu7wuFhxIZaH1aXFceKMFD0vBkSAdM/boV3IM0DXr5fVGKr4X
 jDjrlLcrRlNrcnDlYuCJ0oHFfBz3OEc/UpDNfP+9vi2HWFpMa2fwARulY4wdJRsxca6P
 a5iTdFTXgYsLrNbyusJ4bArv9WcAxFG6VSbhU4EcHXOhHtaOrF7vgTepAz+QlW4DLdA5
 TyZ20W8FnN0ZWhpjIMB1MItnu9RaSqPpyyuoQPyabGmowOYWzKR8I0OfcG6c8s1I+mHW 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fh09rgvf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 18:25:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C6CCB10002A;
 Tue, 19 Apr 2022 18:25:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C117C217B8F;
 Tue, 19 Apr 2022 18:25:20 +0200 (CEST)
Received: from [10.48.0.142] (10.75.127.44) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 19 Apr
 2022 18:25:20 +0200
Message-ID: <da6cc91c-718c-83cc-aa63-1e4e134fb069@foss.st.com>
Date: Tue, 19 Apr 2022 18:25:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20220414100700.1733914-1-s.trumtrar@pengutronix.de>
 <20220414100700.1733914-2-s.trumtrar@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220414100700.1733914-2-s.trumtrar@pengutronix.de>
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-19_05,2022-04-15_01,2022-02-23_01
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 2/3] ARM: dts: stm32: add stm32mp1 pwr
	voltage regulator
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

Hi Steffen

On 4/14/22 12:06, Steffen Trumtrar wrote:
> Add the devicetree binding for the STM32MP1 PWR voltage regulator.
> Currently there is only a devicetree binding for this peripheral in the
> mainline kernel and no driver.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>   arch/arm/boot/dts/stm32mp151.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index d8327298e2be..1816d9b02bb8 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1181,6 +1181,14 @@ pwr_mcu: pwr_mcu@50001014 {
>   			reg = <0x50001014 0x4>;
>   		};
>   
> +		pwr_irq: pwr@50001020 {

label not used

> +			compatible = "st,stm32mp1-pwr";
> +			reg = <0x50001020 0x100>;
> +			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +		};
> +

PWR irqchip has been pushed on kernel.org ?

regards
Alex

>   		exti: interrupt-controller@5000d000 {
>   			compatible = "st,stm32mp1-exti", "syscon";
>   			interrupt-controller;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
