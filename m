Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CBF2F6749
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 18:19:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3062BC424C0;
	Thu, 14 Jan 2021 17:19:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B500DC32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 17:19:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10EHGteL013630; Thu, 14 Jan 2021 18:18:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=cUj1yf2hybpTigFaCAblbQIfka7vGPKUzsMBvqfy8/8=;
 b=2brnYtg+uCRlmhchREuRQhrp5OuoZ2YrYtHKhM4pe9iukUbae2LZKrplex/W00torm3n
 /e0SYTFyFFdoV/ZxObj1stqNNDTJs25Z1dS//INg1kCFMOsqlnnFlDs6qhf3xoxaAZNf
 yrdpuP8Vc+pcviepXqtVJ/dw8Rx0JB2It4AiC4AT26soihi97RJz1eewyuQ5JhHos806
 w8AF8ftC6pzuGhhP18SivUrAoOdttm2QQOlEBe8dnktNeYDuXVDerM7lCYwcDAMpFHCM
 cQvL3oGSXFFzoFFebU56U/HghN4Ne62TSaEFXf0haDTutcbX8B3xawOGKG4Vheyc7rH5 dQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35yp3y3uug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 18:18:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1170B10002A;
 Thu, 14 Jan 2021 18:18:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 066832C38A1;
 Thu, 14 Jan 2021 18:18:55 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan
 2021 18:18:54 +0100
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20201224062438.92582-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <07c83c12-e167-0458-e6f2-cc5fcac943d6@foss.st.com>
Date: Thu, 14 Jan 2021 18:18:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201224062438.92582-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_06:2021-01-14,
 2021-01-14 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix GPIO hog names on
	DHCOM
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

On 12/24/20 7:24 AM, Marek Vasut wrote:
> The GPIO hog node name should match regex '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$',
> make it so and fix the following two make dtbs_check warnings:
> 
> arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dt.yaml: hog-usb-port-power: $nodename:0: 'hog-usb-port-power' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
> arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dt.yaml: hog-usb-hub: $nodename:0: 'hog-usb-hub' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi   | 4 ++--
>   arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
> index 62ab23824a3e..cb68afbbea68 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
> @@ -33,7 +33,7 @@ &gpiob {
>   	 * during TX anyway and that it only controls drive enable DE
>   	 * line. Hence, the RX is always enabled here.
>   	 */
> -	rs485-rx-en {
> +	rs485-rx-en-hog {
>   		gpio-hog;
>   		gpios = <8 GPIO_ACTIVE_HIGH>;
>   		output-low;
> @@ -61,7 +61,7 @@ &gpioi {
>   	 * order to reset the Hub when USB bus is powered down, but
>   	 * so far there is no such functionality.
>   	 */
> -	usb-hub {
> +	usb-hub-hog {
>   		gpio-hog;
>   		gpios = <2 GPIO_ACTIVE_HIGH>;
>   		output-high;
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi
> index 356150d28c42..b99f2b891629 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi
> @@ -43,7 +43,7 @@ &gpioa {
>   	 * in order to turn on port power when USB bus is powered up, but so
>   	 * far there is no such functionality.
>   	 */
> -	usb-port-power {
> +	usb-port-power-hog {
>   		gpio-hog;
>   		gpios = <13 GPIO_ACTIVE_LOW>;
>   		output-low;
> 

Applied on stm32-fixes with a Fixes tag added.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
