Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F29D3CA1C1
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jul 2021 17:57:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4688C59781;
	Thu, 15 Jul 2021 15:57:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C47AFC57B6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 15:57:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16FFmMXj010083; Thu, 15 Jul 2021 17:57:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=VNGn0IVLO9+NpQKh4m+NF5xwaAwgrHbwwalQONVnnjw=;
 b=EtUJGprXaaUvDrLW/BkU1qKRPo4UOMMxmOf0gcESBnJSXM6FgXkWyC0CIYcvTs6m4UJO
 h4yS8saIvQMPGWp9mITLPr3KbguppgTsPUr2IXedwQ0doVx32VNTRuFkucc0J8gj1xka
 jIy35YcLDTxYDEN5GfAcOskGnK3riVV6AFTIilPkX1t1dNPxlPmmpyL5toFEOG/0IIpW
 mg/lM6R9NzOf5bwXddoroR2dCnKrtMBaWYGW5jbnmX1r2ITBkmYA0Vtp8lryZfjlh8yN
 nuGvb8hzBQtIKlKOZlwQ3nSbfCK8u1e4dRuIbiZYqm0ZSJet8vIwmzu6hM5tqlMuCx92 LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39tfwab4tc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jul 2021 17:57:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F2A7910002A;
 Thu, 15 Jul 2021 17:57:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E54C4233C7B;
 Thu, 15 Jul 2021 17:57:20 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 15 Jul
 2021 17:57:13 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20210620185421.89967-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <23886bba-d753-3aec-b111-e44aa3b8ab69@foss.st.com>
Date: Thu, 15 Jul 2021 17:57:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210620185421.89967-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-15_10:2021-07-14,
 2021-07-15 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Prefer HW RTC on DHCOM
	SoM
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

On 6/20/21 8:54 PM, Marek Vasut wrote:
> The DHCOM SoM has two RTC, one is the STM32 RTC built into the SoC
> and another is Microcrystal RV RTC. By default, only the later has
> battery backup, the former does not. The order in which the RTCs
> are probed on boot is random, which means the kernel might pick up
> system time from the STM32 RTC which has no battery backup. This
> then leads to incorrect initial system time setup, even though the
> HW RTC has correct time configured in it.
> 
> Add DT alias entries, so that the RTCs get assigned fixed IDs and
> the HW RTC is always picked by the kernel as the default RTC, thus
> resulting in correct system time in early userspace.
> 
> Fixes: 34e0c7847dcf ("ARM: dts: stm32: Add DH Electronics DHCOM STM32MP1 SoM and PDK2 board")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> index 2af0a6752674..8349c9099e30 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> @@ -12,6 +12,8 @@ / {
>   	aliases {
>   		ethernet0 = &ethernet0;
>   		ethernet1 = &ksz8851;
> +		rtc0 = &hwrtc;
> +		rtc1 = &rtc;
>   	};
>   
>   	memory@c0000000 {
> @@ -248,7 +250,7 @@ &i2c4 {
>   	/delete-property/dmas;
>   	/delete-property/dma-names;
>   
> -	rtc@32 {
> +	hwrtc: rtc@32 {
>   		compatible = "microcrystal,rv8803";
>   		reg = <0x32>;
>   	};
> 

Applied on stm32-next.

regards
alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
