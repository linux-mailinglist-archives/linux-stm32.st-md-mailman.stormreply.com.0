Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D136A2F63F5
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 16:13:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94B6AC3FAD6;
	Thu, 14 Jan 2021 15:13:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74393C424C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 15:13:19 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10EFC9Us008695; Thu, 14 Jan 2021 16:13:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=w56QzaOUjmM2sE52G5MMXjPr6h8xJpDUaUi9yaR8TO4=;
 b=YnxfqIA4dvgOW7LpIizoXi1PE8S4+lwqSIviZfYF/fFNXxsx6K+qWmrBd3qOvqvh84Zu
 qqqDgncsbVuPH+Lsv1Yuh8FOFMvdlIJIWoXWVEWTXxvGYyN9UU7m8UAj3aOrY2iT/C6N
 IKcDTOnUTqqFh8gu4iejgpvWV7P3GiEwVUu2m8oC7My4tkfwIOkAMFBEorkD81r9o4r3
 6UlWk+36ZbH18W3BbzTxr/N9D/dVeqrjF58RS/sP9fqpaFzoBqwYXM/J2yfEET+7dQZ4
 B1SqkUwA8Q1v8HUqFhLuS/7QVSktwfG+wi0yOyIoO6d1+PN5huOKQpgUcgvOzDjwYSVT QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35y5gxdpuy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 16:13:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2135D10002A;
 Thu, 14 Jan 2021 16:13:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 110FB273FBD;
 Thu, 14 Jan 2021 16:13:09 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan
 2021 16:13:08 +0100
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20201201111331.138177-1-marex@denx.de>
 <20201201111331.138177-3-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <c56b5260-6a45-d849-f91e-377f95861a80@foss.st.com>
Date: Thu, 14 Jan 2021 16:13:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201111331.138177-3-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_05:2021-01-14,
 2021-01-14 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Linux-stm32] [PATCH 3/3] ARM: dts: stm32: Disable WP on DHCOM
	uSD slot
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

On 12/1/20 12:13 PM, Marek Vasut wrote:
> The uSD slot has no WP detection, disable it.
> 
> Fixes: 34e0c7847dcf ("ARM: dts: stm32: Add DH Electronics DHCOM STM32MP1 SoM and PDK2 board")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> index c77ab1bfdd3e..daff5318f301 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> @@ -391,6 +391,7 @@ &sdmmc1 {
>   	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_dir_pins_a>;
>   	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a &sdmmc1_dir_sleep_pins_a>;
>   	cd-gpios = <&gpiog 1 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +	disable-wp;
>   	st,sig-dir;
>   	st,neg-edge;
>   	st,use-ckin;
> 

Series applied on stm32-fixes.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
