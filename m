Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8065480BD
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jun 2022 09:42:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C80BC6047C;
	Mon, 13 Jun 2022 07:42:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBF01C03FFF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jun 2022 07:42:50 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25D6RheL002746;
 Mon, 13 Jun 2022 09:42:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=7TbDr/UnlhPbLUjuZmXOO5o+yC3PIK6UnxSEib9OL4k=;
 b=mPUvV0QMMhUWOE+Ae68feKtYU4NifBaO3Cva1iYFJQgpbJIDfWdyB9VJ9EXw6HQDW+7D
 a2sT2JRWE5oHMhKQvAYgBBhiRwuuHRFpKFFSH3q9EXPBKFDlMva868fnSIJ+3PXGOPfP
 mjHiLTkxFdyvaYLxftH8lmJHQ/zwJSLGGc7QYzigFvl0JouXUysNMSCHCrHUhbv5/HPF
 0zGgAfLXsho3esFg93NtoP8L4b9U2Tl1mhWLKJQgpLtRl7I1ipF1QdtQV4wwG/spRbii
 9U5dfcF0C1yHH1f0o9pMMfhYtf5u2DpGQKXbbdlChK8fUO1wejP7v6BGXEON8DnAIEmn iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gmgfma9ga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 09:42:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4885210002A;
 Mon, 13 Jun 2022 09:42:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30E92211F07;
 Mon, 13 Jun 2022 09:42:42 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 13 Jun
 2022 09:42:41 +0200
Message-ID: <0a86b3bc-7a7a-a66f-0d9f-85035aaff032@foss.st.com>
Date: Mon, 13 Jun 2022 09:42:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20220504124945.77331-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220504124945.77331-1-marex@denx.de>
X-Originating-IP: [10.75.127.119]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_02,2022-06-09_02,2022-02-23_01
Cc: linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Move DHCOR BUCK3 VDD 2V9
 adjustment to 1V8 DTSI
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

On 5/4/22 14:49, Marek Vasut wrote:
> The Buck3 on DHCOR is used to supply IO voltage. It can output either 3V3
> in the default DHCOR configuration, or 2V9 in case of AV96 DHCOR variant
> which has extra Empirion DCDC converter in front of the 1V8 IO supply, or
> outright 1V8 in case of 1V8 IO DHCOR without the Empirion DCDC converter.
> 
> The 2V9 mode in case of AV96 DHCOR variant is used to reduce unnecessarily
> high input voltage to the Empirion DCDC converter, so move it into matching
> DTSI to stop confusing users.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcor-io1v8.dtsi | 5 +++++
>   arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi   | 4 ++--
>   2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-io1v8.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-io1v8.dtsi
> index 75172314d7afd..9937b28548c23 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-io1v8.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-io1v8.dtsi
> @@ -18,6 +18,11 @@ vdd_io: regulator-buck-io {
>   	};
>   };
>   
> +&vdd {
> +	regulator-min-microvolt = <2900000>;
> +	regulator-max-microvolt = <2900000>;
> +};
> +
>   &pwr_regulators {
>   	vdd-supply = <&vdd_io>;
>   };
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> index 6336c3ca0f0e2..134a798ad3f23 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> @@ -119,8 +119,8 @@ vdd_ddr: buck2 {
>   
>   			vdd: buck3 {
>   				regulator-name = "vdd";
> -				regulator-min-microvolt = <2900000>;
> -				regulator-max-microvolt = <2900000>;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
>   				regulator-always-on;
>   				regulator-initial-mode = <0>;
>   				regulator-over-current-protection;

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
