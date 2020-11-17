Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 049512B5E21
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Nov 2020 12:19:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFE9BC3FADD;
	Tue, 17 Nov 2020 11:19:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F620C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Nov 2020 11:19:48 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AHBHdIH013698; Tue, 17 Nov 2020 12:19:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=RjgGdVvBAqG4pUc+emH48DVA7ViLFerpkVk7vIIeH4s=;
 b=RTfkfHL9k98Nt494o7k7V+RvYCbQ/cig6R2k9SHyWtGqSubOaiiRogtZ0fsbuyb9Ig23
 t8F9eEF5Gv4JHC0ItWFQFBHRagD0LJXsiQr/y25iOD+kP7DkFsUmtuZeJPNr9WY5sXBT
 2GsvbDlNdcw/4C80TaJYdOA7bu1+tKZ9s/auHVurtfW1ie0OtE24+1UqMFrQznbe1o/1
 HGps3SxeelSxMYHAGwmmsDASI+W2S9lFjPEvjgj6y/kcfw45Wo61FQuBFVrg+mASlNOu
 HJZ0WkNYPcDlso42VGuLJ4JPjzWeWa17PZlHFMPdp5VuVO4Kf4CKFoDB5MHfx1N1nvG9 ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34t5w1rqun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 12:19:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E497810002A;
 Tue, 17 Nov 2020 12:19:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CDE5E241A55;
 Tue, 17 Nov 2020 12:19:40 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Nov
 2020 12:19:39 +0100
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20201021102855.18026-1-a.fatoum@pengutronix.de>
 <20201021102855.18026-2-a.fatoum@pengutronix.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <352478be-cd69-2089-baaf-6f796cfc6cfd@st.com>
Date: Tue, 17 Nov 2020 12:18:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201021102855.18026-2-a.fatoum@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-17_03:2020-11-17,
 2020-11-17 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] ARM: dts: stm32: support child mfd
 cells for the stm32mp1 TAMP syscon
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

Hi Ahmad

On 10/21/20 12:28 PM, Ahmad Fatoum wrote:
> The stm32mp1 TAMP peripheral has 32 backup registers that survive
> a warm reset. This makes them suitable for storing a reboot
> mode, which the vendor's kernel tree is already doing[0].
> 
> The actual syscon-reboot-mode child node can be added by a board.dts or
> fixed up by the bootloader. For the child node to be probed, the
> compatible needs to include simple-mfd. The binding now specifies this,
> so have the SoC dtsi adhere to it.
> 
> [0]: https://github.com/STMicroelectronics/linux/commit/2e9bfc29dd
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
> v1 -> v2:
>    - Dropped simple-bus. simple-mfd is all that's needed
>    - reworded commit message
> ---
>   arch/arm/boot/dts/stm32mp151.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index 842ecffae73a..662c2408d41b 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1542,7 +1542,7 @@ i2c6: i2c@5c009000 {
>   		};
>   
>   		tamp: tamp@5c00a000 {
> -			compatible = "st,stm32-tamp", "syscon";
> +			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
>   			reg = <0x5c00a000 0x400>;
>   		};
>   
> 

Series applied on stm32-next.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
