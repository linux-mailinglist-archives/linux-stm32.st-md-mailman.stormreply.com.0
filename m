Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE882F63D5
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 16:11:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DE6DC424C0;
	Thu, 14 Jan 2021 15:11:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40818C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 15:11:32 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10EF23VH010887; Thu, 14 Jan 2021 16:11:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=WaZ5bg6WPRMoUvlAIWZN6JCUBmMap+s2PBMI/B12alg=;
 b=GbV6ajqjGScjfBfJlt7cdkilHrFBTJUksYFswjQrTQlRwcaCB6/oDMr2C9LTwVbM5EPt
 mARFuPhSYavUFQG1g+yGe6u0AbQMK1SQ7kTij/KO9zvHn9Vk6uwqDcru0npqmNKFZ+mL
 5aC7TkXFQ/JuF9q6RYWkXYzWanf9eE0qbbJ1QHv54hWSzx8URFJO8qpdEEjfhykpTe+E
 E98KpnK3aKY56W6Ikgh3FwBmLrHtFn4M0Af4Pn4CTRWUERyInUqjcWCWocmOMt7uIIjj
 /7kIsrWBIaQvpQ9Xr8bzFWhEyr2RW5SLER748Fa89Xsf5GpK9/Erz51l7Dyl/VGOXxVW YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 362379e7f9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 16:11:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1E89C10002A;
 Thu, 14 Jan 2021 16:11:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D4AE273FB7;
 Thu, 14 Jan 2021 16:11:27 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan
 2021 16:11:26 +0100
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20201229175521.268234-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <c893ad3e-dba2-e1b2-ed7a-24937532d0e6@foss.st.com>
Date: Thu, 14 Jan 2021 16:11:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201229175521.268234-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_05:2021-01-14,
 2021-01-14 signatures=0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: Fix GPIO hog flags
	on DHCOM PicoITX
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

On 12/29/20 6:55 PM, Marek Vasut wrote:
> The GPIO hog flags are ignored by gpiolib-of.c now, set the flags to 0.
> Due to a change in gpiolib-of.c, setting flags to GPIO_ACTIVE_LOW and
> using output-low DT property leads to the GPIO being set high instead.
> 
> Fixes: ac68793f49de ("ARM: dts: stm32: Add DHCOM based PicoITX board")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi
> index 25528a1c096f..757707766fa0 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi
> @@ -49,7 +49,7 @@ &gpioa {
>   	 */
>   	usb-port-power-hog {

On my tree this node is "usb-port-power". Do you want to update the node 
name too ? I can do it directly during the merge if you want.
(Note, it is the case for DRC02 hog update).

regards
alex

>   		gpio-hog;
> -		gpios = <13 GPIO_ACTIVE_LOW>;
> +		gpios = <13 0>;
>   		output-low;
>   		line-name = "usb-port-power";
>   	};
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
