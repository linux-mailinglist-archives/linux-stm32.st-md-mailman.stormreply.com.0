Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE715E73B8
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Sep 2022 08:14:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF2E8C04003;
	Fri, 23 Sep 2022 06:14:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B101CC01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 06:14:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28N5H8IG018770;
 Fri, 23 Sep 2022 08:13:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=p6aDLSw8XMqkwH6ozqlC+a82nm4yOFGy3DN9VGZ5dtg=;
 b=2Yh+4s/dqBTbRPf2dR3O3JD1+H7h0zDIng+lMWIaIrR3OvnTBoq6ZlB5r+TZ97PaJT0x
 b+70AH2Rqg/lisKwO1i42YFHQygzgypekozvbuyAIn5+ZRW2bw7U7Kd22kT9oWWaDx31
 A3NTQLvH3acOwhiskgOFcEOfEt+iPVJ73N2nTD0BTJTpYNrCf+W8T78o7VuTqz33HOBb
 Z9Ycs+HbmlpoEZKkGE2y5DpZPAVljbD4O2YVxM7yVqzY7zaHAg8w99nnfP5Oyn9KjVE0
 Ct2sNDWwK7Favi6HcypnKS3btfdobmNln4ZpKLaQRA9yZnBFf6YKKwwhhIDNs14Buioi Bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jr11xd8h0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Sep 2022 08:13:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C363910002A;
 Fri, 23 Sep 2022 08:13:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BDA34212FB2;
 Fri, 23 Sep 2022 08:13:56 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.50) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 23 Sep
 2022 08:13:55 +0200
Message-ID: <d3c8207f-7237-d665-e6d2-344b4df968c6@foss.st.com>
Date: Fri, 23 Sep 2022 08:13:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20220923023745.272076-1-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220923023745.272076-1-marex@denx.de>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-23_02,2022-09-22_02,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Drop stm32mp15xc.dtsi
	from Avenger96
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Marek

On 9/23/22 04:37, Marek Vasut wrote:
> The Avenger96 is populated with STM32MP157A DHCOR SoM, drop the
> stm32mp15xc.dtsi which should only be included in DTs of devices
> which are populated with STM32MP15xC/F SoC as the stm32mp15xc.dtsi
> enables CRYP block not present in the STM32MP15xA/D SoC .
> 
> Fixes: 7e76f82acd9e1 ("ARM: dts: stm32: Split Avenger96 into DHCOR SoM and Avenger96 board")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm/boot/dts/stm32mp157a-dhcor-avenger96.dts | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157a-dhcor-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-dhcor-avenger96.dts
> index 2e3c9fbb4eb36..275167f26fd9d 100644
> --- a/arch/arm/boot/dts/stm32mp157a-dhcor-avenger96.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-dhcor-avenger96.dts
> @@ -13,7 +13,6 @@
>  /dts-v1/;
>  
>  #include "stm32mp157.dtsi"
> -#include "stm32mp15xc.dtsi"
>  #include "stm32mp15xx-dhcor-som.dtsi"
>  #include "stm32mp15xx-dhcor-avenger96.dtsi"
>  
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Patrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
