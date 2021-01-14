Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A86F2F6380
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 15:54:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7443C424C0;
	Thu, 14 Jan 2021 14:54:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29C79C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 14:54:47 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10EEq2Po031408; Thu, 14 Jan 2021 15:54:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=t1aCGvwJANnEU+JgtZW2Di0fRF74mJdA3h2Ro20FTWw=;
 b=1WlTg7Te9EHN+wks7bA580rysh9uXdKyJR46HXwJ6OO/A0GEYgE/x1/n38KQGdeDSD4S
 wUAAPqpoDGxVAj0cPSy2XW9HQ9xleiAwbdm7Yc7l2PPzc95CuDOlGEZhmtojH9gnr5tz
 IwBY6h0xJGD4nvE52j7LzjvxPAderbubAuyP6uewRW2oacmlHIb2bjsS1j+hVByBEFZx
 XFX9FdFFfo360B1Hp/T8Buha8EMYw046ky7cILzBI/i0mGWTXmOgyuX/voNYijKqSekG
 N04pe9ta3FmK/fX80bZ/oyVvEQrnL+UI8aXeIx/bpSC3kQ66vATQP8yGQNNltlMleXrQ vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35y5gxdkp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 15:54:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DD62510002A;
 Thu, 14 Jan 2021 15:54:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C7F3E2636E0;
 Thu, 14 Jan 2021 15:54:35 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan
 2021 15:54:35 +0100
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20201201111441.138289-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <5e622cc1-01a8-c6d7-d172-6679deb679b3@foss.st.com>
Date: Thu, 14 Jan 2021 15:54:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201111441.138289-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_05:2021-01-14,
 2021-01-14 signatures=0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: Enable internal
 pull-ups for SDMMC1 on DHCOM SoM
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

On 12/1/20 12:14 PM, Marek Vasut wrote:
> The default state of SD bus and clock line is logical HI. SD card IO is
> open-drain and pulls the bus lines LO. Always enable the SD bus pull ups
> to guarantee this behavior on DHCOM SoM. Note that on SoMs with SD bus
> voltage level shifter, the pull ups are built into the level shifter,
> however that has no negative impact.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> index daff5318f301..97c6e0cd582c 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> @@ -400,6 +400,20 @@ &sdmmc1 {
>   	status = "okay";
>   };
>   
> +&sdmmc1_b4_pins_a {
> +	/*
> +	 * SD bus pull-up resistors:
> +	 * - optional on SoMs with SD voltage translator
> +	 * - mandatory on SoMs without SD voltage translator
> +	 */
> +	pins1 {
> +		bias-pull-up;
> +	};
> +	pins2 {
> +		bias-pull-up;
> +	};
> +};
> +
>   &sdmmc2 {
>   	pinctrl-names = "default", "opendrain", "sleep";
>   	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
> 

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
