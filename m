Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 533912F659B
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 17:19:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15A60C424C0;
	Thu, 14 Jan 2021 16:19:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1EB1C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 16:19:13 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10EGGGHe022609; Thu, 14 Jan 2021 17:19:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=rddRtqVCGo2/6u7tPmR1sw7fXLkgqltZPFNI8iClNnU=;
 b=gp7FkibQGXXIPMgCNr+yMwN5r0WZkZZuDVTvEj9ZjBCGi4AS6JsRxgb0mhvXvc7JWQLV
 gUtohozaNQCjXgaUyKTZctYZN4SKRKNJZDj2X8iYujoDfOaLK9NmsJJWYHi6GBIlAc8N
 sv39eqrWCTGdSiDRuRUvSGAz/yCZ8yjHZ8pS8LwAsEnXs6tLiz+KaAUEURIKTnWRyU/a
 eKBlvmKkviHT/obFOFM2gRWpaS62p84LqGW6yfkNudO0RVPvCtX6LeopqK0IafOm2XvU
 +U2uHlIPuEPnO6iHx7UBfKXFTLfr5P6AeVwMpSfDxAZhU4K1AV41m8QvyScPXaL5ea66 jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 362379ehw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 17:19:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6C99C10002A;
 Thu, 14 Jan 2021 17:19:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5F95425F414;
 Thu, 14 Jan 2021 17:19:09 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan
 2021 17:19:08 +0100
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20210107150742.166630-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <483eddb7-faa9-c6d4-62cc-15122452ef65@foss.st.com>
Date: Thu, 14 Jan 2021 17:19:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210107150742.166630-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_06:2021-01-14,
 2021-01-14 signatures=0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Disable optional TSC2004
	on DRC02 board
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



On 1/7/21 4:07 PM, Marek Vasut wrote:
> The DRC02 has no use for the on-SoM touchscreen controller, and the
> on-SoM touchscreen controller may not even be populated, which then
> results in error messages in kernel log. Disable the touchscreen
> controller in DT.
> 
> Fixes: fde180f06d7b ("ARM: dts: stm32: Add DHSOM based DRC02 board")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
> index 8d1fea332665..5088dd3a301b 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
> @@ -87,6 +87,12 @@ eeprom@50 {
>   	};
>   };
>   
> +&i2c4 {
> +	touchscreen@49 {
> +		status = "disabled";
> +	};
> +};
> +
>   &i2c5 {	/* TP7/TP8 */
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&i2c5_pins_a>;
> 

Applied on stm32-fixes.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
