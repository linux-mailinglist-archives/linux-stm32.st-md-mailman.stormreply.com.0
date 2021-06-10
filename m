Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 391243A2E4B
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jun 2021 16:33:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E44C8C58D5B;
	Thu, 10 Jun 2021 14:33:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 768ECC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 14:33:44 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15AEMOAC008243; Thu, 10 Jun 2021 16:33:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=/hkRnTEMeC7+hgFh6oD0/FMI5Nxfp+iUUqwGzvsdDa4=;
 b=Wg299IqSLi4nruuOKVB0+Qs1wqEVojRMAnDkLkrwuqNIdss1p4GxUpvBFIJVbxrjYb5/
 67Q1+3L0zs0AhVBOzi4RTOz5kEdOqXGJ1TE+IBUxie2vlEQXwjq0lPvomgQml5ZrrD1p
 iSyankZjuaXyzXKhKGxTKHF85IF/fmrfwwTw68GwKsFp4jhGwFBbQyH+S5QJF92Cfnef
 4sgWIiIH/9USTQwIBDzh23RDVQfNDMwHHgYchhRfvDIauTFfovMN2Xpfy66qJW/KTOZz
 bI8bwN2m5ncSb3Z87bhvbXttYxFAhEMEzT8uZ6hBDxc3DtMpJcRhW73IYAxVlru5WFqS lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 393ee5jexu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 16:33:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 89BD4100034;
 Thu, 10 Jun 2021 16:33:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 41D0522A6FF;
 Thu, 10 Jun 2021 16:33:27 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Jun
 2021 16:33:26 +0200
To: <arnd@arndb.de>, <robh+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 <jagan@amarulasolutions.com>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Marcin Sloniewski
 <marcin.sloniewski@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20210415101037.1465-1-alexandre.torgue@foss.st.com>
 <20210415101037.1465-10-alexandre.torgue@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <b155f309-0bfb-3fa5-4b2b-c0128f6981b5@foss.st.com>
Date: Thu, 10 Jun 2021 16:33:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210415101037.1465-10-alexandre.torgue@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-10_10:2021-06-10,
 2021-06-10 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 09/13] ARM: dts: stm32: fix stpmic node
 for stm32mp1 boards
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

On 4/15/21 12:10 PM, Alexandre Torgue wrote:
> On some STM32 MP15 boards, stpmic node is not correct which generates
> warnings running "make dtbs_check W=1" command. Issues are:
> 
> -"regulator-active-discharge" is not a boolean but an uint32.
> -"regulator-over-current-protection" is not a valid entry for vref_ddr.
> -LDO4 has a fixed voltage (3v3) so min/max entries are not allowed.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

Applied on stm32-next.

Thanks.
Alex

> 
> diff --git a/arch/arm/boot/dts/stm32mp157a-stinger96.dtsi b/arch/arm/boot/dts/stm32mp157a-stinger96.dtsi
> index 113c48b2ef93..a4b14ef3caee 100644
> --- a/arch/arm/boot/dts/stm32mp157a-stinger96.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157a-stinger96.dtsi
> @@ -184,8 +184,6 @@
>   
>   			vdd_usb: ldo4 {
>   				regulator-name = "vdd_usb";
> -				regulator-min-microvolt = <3300000>;
> -				regulator-max-microvolt = <3300000>;
>   				interrupts = <IT_CURLIM_LDO4 0>;
>   			};
>   
> @@ -208,7 +206,6 @@
>   			vref_ddr: vref_ddr {
>   				regulator-name = "vref_ddr";
>   				regulator-always-on;
> -				regulator-over-current-protection;
>   			};
>   
>   			bst_out: boost {
> @@ -219,13 +216,13 @@
>   			vbus_otg: pwr_sw1 {
>   				regulator-name = "vbus_otg";
>   				interrupts = <IT_OCP_OTG 0>;
> -				regulator-active-discharge;
> +				regulator-active-discharge = <1>;
>   			};
>   
>   			vbus_sw: pwr_sw2 {
>   				regulator-name = "vbus_sw";
>   				interrupts = <IT_OCP_SWOUT 0>;
> -				regulator-active-discharge;
> +				regulator-active-discharge = <1>;
>   			};
>   		};
>   
> diff --git a/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi b/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi
> index 6cf49a0a9e69..0c0b66788ea1 100644
> --- a/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi
> @@ -173,8 +173,6 @@
>   
>   			vdd_usb: ldo4 {
>   				regulator-name = "vdd_usb";
> -				regulator-min-microvolt = <3300000>;
> -				regulator-max-microvolt = <3300000>;
>   				interrupts = <IT_CURLIM_LDO4 0>;
>   			};
>   
> @@ -197,7 +195,6 @@
>   			vref_ddr: vref_ddr {
>   				regulator-name = "vref_ddr";
>   				regulator-always-on;
> -				regulator-over-current-protection;
>   			};
>   
>   			 bst_out: boost {
> @@ -213,7 +210,7 @@
>   			 vbus_sw: pwr_sw2 {
>   				regulator-name = "vbus_sw";
>   				interrupts = <IT_OCP_SWOUT 0>;
> -				regulator-active-discharge;
> +				regulator-active-discharge = <1>;
>   			 };
>   		};
>   
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> index 272a1a67a9ad..769fcf74685a 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> @@ -327,8 +327,6 @@
>   
>   			vdd_usb: ldo4 {
>   				regulator-name = "vdd_usb";
> -				regulator-min-microvolt = <3300000>;
> -				regulator-max-microvolt = <3300000>;
>   				interrupts = <IT_CURLIM_LDO4 0>;
>   			};
>   
> @@ -350,7 +348,6 @@
>   			vref_ddr: vref_ddr {
>   				regulator-name = "vref_ddr";
>   				regulator-always-on;
> -				regulator-over-current-protection;
>   			};
>   
>   			bst_out: boost {
> @@ -366,7 +363,7 @@
>   			vbus_sw: pwr_sw2 {
>   				regulator-name = "vbus_sw";
>   				interrupts = <IT_OCP_SWOUT 0>;
> -				regulator-active-discharge;
> +				regulator-active-discharge = <1>;
>   			};
>   		};
>   
> diff --git a/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi b/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
> index 713485a95795..6706d8311a66 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
> @@ -146,8 +146,6 @@
>   
>   			vdd_usb: ldo4 {
>   				regulator-name = "vdd_usb";
> -				regulator-min-microvolt = <3300000>;
> -				regulator-max-microvolt = <3300000>;
>   				interrupts = <IT_CURLIM_LDO4 0>;
>   			};
>   
> @@ -171,7 +169,6 @@
>   			vref_ddr: vref_ddr {
>   				regulator-name = "vref_ddr";
>   				regulator-always-on;
> -				regulator-over-current-protection;
>   			};
>   
>   			bst_out: boost {
> @@ -182,13 +179,13 @@
>   			vbus_otg: pwr_sw1 {
>   				regulator-name = "vbus_otg";
>   				interrupts = <IT_OCP_OTG 0>;
> -				regulator-active-discharge;
> +				regulator-active-discharge = <1>;
>   			};
>   
>   			vbus_sw: pwr_sw2 {
>   				regulator-name = "vbus_sw";
>   				interrupts = <IT_OCP_SWOUT 0>;
> -				regulator-active-discharge;
> +				regulator-active-discharge = <1>;
>   			};
>   		};
>   
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
