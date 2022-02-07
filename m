Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 447074AC442
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Feb 2022 16:47:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BD8AC5AB61;
	Mon,  7 Feb 2022 15:47:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C901C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 15:47:41 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2178w9x3026801;
 Mon, 7 Feb 2022 11:54:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=fKhm3MzBX58/rjslTyH107YUk+1mSMLnBpiwn/M6efQ=;
 b=4PrXwlafbQ7zCJEyWjLUPCdGPfVUYzIVhXXoo/5z8zqp+vebRl12OeE9IgVJzeuYT1/J
 p+d5D5Fsl3SKMs62IZrr63VIbUvzfhUCu7PFI5Lv3AYiqI4z54kpz/78AqKPPyKhnlv3
 49AHoGrUXov0dNy/2UINkKqSKi6nYfakO6E1NQdMRXAUhoeEKig59KNMSuHlPIOfwZ8K
 eX41txqCCTGmoF32HanEWJHYft/Ntt8nT0qBqA5lNE7w3TKWaBpXxFPMfRPdhq86JDaH
 pnnZUMtikl5Kq3pAdeZ8jniRqCngI81PA6ItecQDDJRnTJ6gUujUnl/bwr0p9o0Kdn8y /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e2nfyay1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 11:54:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A8A12100034;
 Mon,  7 Feb 2022 11:54:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 97972216ED4;
 Mon,  7 Feb 2022 11:54:45 +0100 (CET)
Received: from [10.48.0.252] (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 7 Feb
 2022 11:54:45 +0100
Message-ID: <38a9ce0a-b63e-8321-bd85-c42638f31d39@foss.st.com>
Date: Mon, 7 Feb 2022 11:54:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Olivier Moysan <olivier.moysan@foss.st.com>, Marek Vasut <marex@denx.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
References: <20220124153525.17314-1-olivier.moysan@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220124153525.17314-1-olivier.moysan@foss.st.com>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_04,2022-02-07_01,2021-12-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/1] ARM: dts: stm32: fix AV96 board SAI2
 pin muxing on stm32mp15
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

Hi Olivier

On 1/24/22 16:35, Olivier Moysan wrote:
> Replace sai2a-2 node name by sai2a-sleep-2, to avoid name
> duplication.
> 
> Fixes: 1a9a9d226f0f ("ARM: dts: stm32: fix AV96 board SAI2 pin muxing on stm32mp15")
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>   arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index 3b65130affec..6161f5906ec1 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -1190,7 +1190,7 @@
>   		};
>   	};
>   
> -	sai2a_sleep_pins_c: sai2a-2 {
> +	sai2a_sleep_pins_c: sai2a-sleep-2 {
>   		pins {
>   			pinmux = <STM32_PINMUX('D', 13, ANALOG)>, /* SAI2_SCK_A */
>   				 <STM32_PINMUX('D', 11, ANALOG)>, /* SAI2_SD_A */



Applied on stm32-next.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
