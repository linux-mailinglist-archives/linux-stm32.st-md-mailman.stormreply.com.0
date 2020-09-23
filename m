Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1916C275BE1
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Sep 2020 17:32:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDA30C3FAD5
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Sep 2020 15:32:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 922FDC32EA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Sep 2020 15:32:30 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08NFQbAc023439; Wed, 23 Sep 2020 17:32:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=lixnU98BcH//BmD0t62aZsBAXQJMii/2t70pRirg8Uc=;
 b=rQ8q8CcU2Gl0hd27bL9BHykNeFB8GtZhy0q7f4xFP6uRAbpP8sMzBLarzGkf3d2E2JoM
 0N7dfjbjSjUmwJURECXZqz7+PmIrOoYcPCKw1gz0eD30XeOTr27z6/96SkSd38qCcdua
 hO3Zs3yXyYKXUdJCnfd3xauvdJFk1Iyo1R+On/2Mei3mbxN2crxjGiL5ATsgXTGxRj+W
 kZMEMFUsVdCh1W2oUmxheHVO9ZeeyfJrYQDJFrXTYZm8NHqcVmhvB1nah6wYmXREXgmM
 v3YmgR83J6/YiDOH1hwOxvyWXvwemTYUakt9FgnYqDNcqEaQmI8burUtU3RAIetvXIWI sQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33n7rvwwk8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Sep 2020 17:32:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6A84F10002A;
 Wed, 23 Sep 2020 17:32:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E273721FEA1;
 Wed, 23 Sep 2020 17:32:14 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 23 Sep
 2020 17:31:34 +0200
To: Holger Assmann <h.assmann@pengutronix.de>, Rob Herring
 <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20200828130002.1701-1-h.assmann@pengutronix.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <685b9dcf-2139-9641-e1e4-6a1a74673077@st.com>
Date: Wed, 23 Sep 2020 17:31:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828130002.1701-1-h.assmann@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-23_12:2020-09-23,
 2020-09-23 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: lxa-mc1: enable DDR50
	mode on eMMC
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

Hi

On 8/28/20 3:00 PM, Holger Assmann wrote:
> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> 
> The "eMMC high-speed DDR mode (3.3V I/O)" at 50MHz is supported on
> the eMMC-interface of the lxa-mc1. Set it in the device tree to
> benefit from the speed improvement.
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Signed-off-by: Holger Assmann <h.assmann@pengutronix.de>
> ---
>   arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> index b85025d00943..1e5333fd437f 100644
> --- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> @@ -212,6 +212,7 @@
>   	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_b>;
>   	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_b>;
>   	bus-width = <8>;
> +	mmc-ddr-3_3v;
>   	no-1-8-v;
>   	no-sd;
>   	no-sdio;
> 

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
