Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C2E255A16
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 14:29:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73975C32EA6;
	Fri, 28 Aug 2020 12:29:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7442EC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 12:29:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07SCMBwd032562; Fri, 28 Aug 2020 14:28:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=l6jb6ZxyrTA3cjl82G4hrOkVdZFB7YDBAa9AKANbg1k=;
 b=FctGgfc7iaB1x1HX6UCuWvBIWFZ2xNZc3yCHJDCKOqIann6N7oqSmhVbYsjeKqAg8noj
 tIyC1oiPhSApFwa6hEYfCNcXRB7k5k3VcoPSWt6+kiKUp7Ug+f9GvoCdYYHnDS5DoN8I
 5QPZAj98Uo03DaIuPRmSJnpOQuYfmne3697BY05y5QzdzaPaII59+uDxHzl+mNLow40U
 5MUpv7w3cc3TXHyD5PYZKI2xjonQaFKihpSrlEKYg6dGfNwFCVuouxlXXHMWq5m89y6J
 tnVqVjO61LqW5SrnAwm4ne17IkG0fBfpFC7zruRfztnuerIA/5da0w1hCnU5r9FOwmtc sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 333b3huu6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Aug 2020 14:28:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 43A0310002A;
 Fri, 28 Aug 2020 14:28:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 363FF2BC7DD;
 Fri, 28 Aug 2020 14:28:58 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Aug
 2020 14:28:57 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20200822203320.61352-1-marex@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <2cd796c0-5930-1c5a-edff-0608a46714a7@st.com>
Date: Fri, 28 Aug 2020 14:28:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200822203320.61352-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-28_07:2020-08-28,
 2020-08-28 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Swap PHY reset GPIO and
	TSC2004 IRQ
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

Hi Marek

On 8/22/20 10:33 PM, Marek Vasut wrote:
> On the production revision of the SoM, 587-200, the PHY reset GPIO and
> touchscreen IRQs are swapped to prevent collision between EXTi IRQs,
> reflect that in DT.
> 
> Fixes: 34e0c7847dcf ("ARM: dts: stm32: Add DH Electronics DHCOM STM32MP1 SoM and PDK2 board")
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied on stm32-next. I updated a bit this patch as now the ethernet0 
node is located in stm32mp15xx-dhcom-som.dtsi.


Thanks.
Alex

> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi | 2 +-
>   arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
> index 075e2a95713f..e31841d71e8b 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
> @@ -150,7 +150,7 @@ &ethernet0 {
>   	max-speed = <100>;
>   	phy-handle = <&phy0>;
>   	st,eth-ref-clk-sel;
> -	phy-reset-gpios = <&gpioh 15 GPIO_ACTIVE_LOW>;
> +	phy-reset-gpios = <&gpioh 3 GPIO_ACTIVE_LOW>;
>   
>   	mdio0 {
>   		#address-cells = <1>;
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> index ba905196fb54..43f5e8498d7b 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> @@ -249,7 +249,7 @@ touchscreen@49 {
>   		compatible = "ti,tsc2004";
>   		reg = <0x49>;
>   		vio-supply = <&v3v3>;
> -		interrupts-extended = <&gpioh 3 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts-extended = <&gpioh 15 IRQ_TYPE_EDGE_FALLING>;
>   	};
>   
>   	eeprom@50 {
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
