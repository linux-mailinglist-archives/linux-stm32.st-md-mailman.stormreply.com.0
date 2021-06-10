Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2C93A2DB2
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jun 2021 16:05:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4306CC58D5B;
	Thu, 10 Jun 2021 14:05:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C637AC57B79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 14:05:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15ADvVuo012097; Thu, 10 Jun 2021 16:05:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=R7DEJpzXKz+sL2yOYmRELVPUe14MWKq9dSDsUdZfp2c=;
 b=qNiy/xUIgC+5vZVEq75Qqqx7Oiq4cL2P1n//q1ltWAnx+3r/pW7GXejAYrol0WMl+vU0
 y0frLzkyD2ssCw4PKPQX8VkyEHcWqb8FpxGPHb5W/bUZF56pHQJu04i6OUAMSugSvUps
 jf0672oOzCJkUQM5zbneL+Eb49mOi5cR2ab2IqubRP1VyPME5ndkAjVxO+FuZY9rYmik
 EE1vFgOXylWi82GAroXv2VYaySLZ2D5/mk5Br9nT5ujmIYochhLqO+Rip15Psaqn7oN5
 UBXcUiFtoAeC4EA/qsNPNHzBCd13u4eJAXKAykqa0IJFzTDjO6NBwBbzdX2hctvYGSpS Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 392xq7y62m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 16:05:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 85A3310002A;
 Thu, 10 Jun 2021 16:05:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C872229818;
 Thu, 10 Jun 2021 16:05:40 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Jun
 2021 16:05:39 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20210610002552.134067-1-marex@denx.de>
 <20210610002552.134067-3-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <91f38f47-3e71-db70-ebe7-9c9092ad6172@foss.st.com>
Date: Thu, 10 Jun 2021 16:05:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210610002552.134067-3-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-10_07:2021-06-10,
 2021-06-10 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 3/3] ARM: dts: stm32: Rename
 spi-flash/mx66l51235l@N to flash@N on DHCOM SoM
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

On 6/10/21 2:25 AM, Marek Vasut wrote:
> Fix the following dtbs_check warning:
> spi-flash@0: $nodename:0: 'spi-flash@0' does not match '^flash(@.*)?$'
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: kernel@dh-electronics.com
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 2 +-
>   arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> index c3e3466dacaa..8f4fd3a06a31 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> @@ -437,7 +437,7 @@ &qspi {
>   	#size-cells = <0>;
>   	status = "okay";
>   
> -	flash0: mx66l51235l@0 {
> +	flash0: flash@0 {
>   		compatible = "jedec,spi-nor";
>   		reg = <0>;
>   		spi-rx-bus-width = <4>;
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> index 013ae369791d..2b0ac605549d 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> @@ -198,7 +198,7 @@ &qspi {
>   	#size-cells = <0>;
>   	status = "okay";
>   
> -	flash0: spi-flash@0 {
> +	flash0: flash@0 {
>   		compatible = "jedec,spi-nor";
>   		reg = <0>;
>   		spi-rx-bus-width = <4>;
> 

For the 3 patches of this series:

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
