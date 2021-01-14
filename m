Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2784E2F6381
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 15:54:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E571EC3FAD6;
	Thu, 14 Jan 2021 14:54:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AA07C424C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 14:54:58 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10EEk9Os006514; Thu, 14 Jan 2021 15:54:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=lghksj/PyqUJzQnC6Ua9YqInOS1D33mZ4nn5NlR4Ylo=;
 b=Kuil4JSBGRQUv++1c9Wr0OLqUHxgdIfk6ou8v9fEetheySp047gUCUxzsanRGiZ1ogXy
 FuugCvkSQl8ylTBVZUuuWvLhwjCrYG2Ytip/W4hNtTWFBjHKuTVLXFaSd2ex1nZT3z+8
 v7fi/dWEQ3zVM7xKXeUxPkR8ZxyNFY1TM3jPvTlG+DB6dQj6vK4vlsaDoR1STRykbP9M
 doLucVPOerr1Mk6rZ1iMOkFNOmSGKdmv+0Y0wcprM+qA1VQd2evhDMdHvtt/YcwWbUgq
 gI6gwHv3KLwpxco2OzmwP0vdAAMmeVqLiSJTW1nxlmlOvKxyxAs0Kzh9WpYEEsXqf7wZ UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 362379e4gx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 15:54:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 497C610002A;
 Thu, 14 Jan 2021 15:54:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3CDC32636E0;
 Thu, 14 Jan 2021 15:54:53 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan
 2021 15:54:52 +0100
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20201201111441.138289-1-marex@denx.de>
 <20201201111441.138289-2-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <b0d83adb-56d9-0ea7-b66c-c043ebcccbe6@foss.st.com>
Date: Thu, 14 Jan 2021 15:54:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201111441.138289-2-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_05:2021-01-14,
 2021-01-14 signatures=0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Linux-stm32] [PATCH 2/2] ARM: dts: stm32: Disable SDMMC1 CKIN
	feedback clock
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
> The STM32MP1 DHCOM SoM can be built with either bus voltage level shifter
> or without one on the SDMMC1 interface. Because the SDMMC1 interface is
> limited to 50 MHz and hence SD high-speed anyway, disable the SD feedback
> clock to permit operation of the same U-Boot image on both SoM with and
> without voltage level shifter.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> index 97c6e0cd582c..2a20818c91e4 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> @@ -394,7 +394,6 @@ &sdmmc1 {
>   	disable-wp;
>   	st,sig-dir;
>   	st,neg-edge;
> -	st,use-ckin;
>   	bus-width = <4>;
>   	vmmc-supply = <&vdd_sd>;
>   	status = "okay";
> 

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
