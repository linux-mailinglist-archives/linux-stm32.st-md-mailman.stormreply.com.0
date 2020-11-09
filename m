Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EEB2AB90B
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Nov 2020 14:04:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56FE3C3FAE2;
	Mon,  9 Nov 2020 13:04:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7005C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Nov 2020 13:04:04 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A9CuYAK013014; Mon, 9 Nov 2020 14:03:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=uliSc5A3vlTADmZoc0p1nem0ouQD8B+Qw8ci3FCn8LQ=;
 b=tGp5ZOanOxiLzuVyk7nDek1MQggdIbdX7UkqOuTw0PbtyzoDKseOWxKNnUefKwhh8RhH
 7Bf0caCo+WuBl6GvDu/+d+Ns3mwXe8aWUDYdGUYeyASS65Imc0NkYG9L3L1LkjWSoWqw
 BR7daSh77WmjQ1ai/FS6RKXsV4Xa4x4ZOT7cT+4xfaTHhX1Lm6/27GGqAloTLL/kGCQw
 HtT2PXS0sLxiTnhbAOpu58iipVdqNZA3o+WhZBAvzHNp5wK9TX0MvLUSWuhRi1TQt8DJ
 O6NyMrajlvIscWyHkW0b4bC+Bn4eQjuK3UN7NaVzhZvgiQ2DXhybBDFczttN1ErbKaSn 2w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34nj80j267-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Nov 2020 14:03:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3536210002A;
 Mon,  9 Nov 2020 14:03:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1C88D2AD9FE;
 Mon,  9 Nov 2020 14:03:58 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Nov
 2020 14:03:57 +0100
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20201008193538.129401-1-marex@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <8775d419-0ca7-3098-41ed-ece54ee4ef4c@st.com>
Date: Mon, 9 Nov 2020 14:03:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201008193538.129401-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-09_02:2020-11-05,
 2020-11-09 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix TA3-GPIO-C key on
 STM32MP1 DHCOM PDK2
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

On 10/8/20 9:35 PM, Marek Vasut wrote:
> On the prototype DHCOM, the TA3-GPIO-C button was connected to pin PI11 of
> the STM32MP15xx, however on the production SoM this was changed to pin PG0
> to free up the IRQ line 11 for LAN8710i PHY IRQ. Update the connection in
> the DT. Since the IRQ line 0 is used for PMIC as well and cannot be shared
> with the button, make the button polled.
> 
> Fixes: 87cabf9405cb ("ARM: dts: stm32: Add GPIO keys for STM32MP1 DHCOM PDK2")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
> index 5dff24e39af8..9a0a59678097 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
> @@ -46,6 +46,16 @@
>   			linux,code = <KEY_A>;
>   			gpios = <&gpiof 3 GPIO_ACTIVE_LOW>;
>   		};
> +
> +		/*
> +		 * The EXTi IRQ line 0 is shared with PMIC,
> +		 * so mark this as polled GPIO key.
> +		 */
> +		button-2 {
> +			label = "TA3-GPIO-C";
> +			linux,code = <KEY_C>;
> +			gpios = <&gpiog 0 GPIO_ACTIVE_LOW>;
> +		};
>   	};
>   
>   	gpio-keys {
> @@ -59,13 +69,6 @@
>   			wakeup-source;
>   		};
>   
> -		button-2 {
> -			label = "TA3-GPIO-C";
> -			linux,code = <KEY_C>;
> -			gpios = <&gpioi 11 GPIO_ACTIVE_LOW>;
> -			wakeup-source;
> -		};
> -
>   		button-3 {
>   			label = "TA4-GPIO-D";
>   			linux,code = <KEY_D>;
> 

Applied on stm32-dt-for-v5.10-fixes.

regards
alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
