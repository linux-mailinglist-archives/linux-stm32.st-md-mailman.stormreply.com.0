Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7671C76F08
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jul 2019 18:27:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C312C16363;
	Fri, 26 Jul 2019 16:27:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D641C1635F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jul 2019 16:27:10 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6QG7fWq014148; Fri, 26 Jul 2019 18:27:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=n6HKe0PgjUg51eRmGPMx0Q+MwoGoF4rstkH/lFHzWaM=;
 b=JsisJ/fpUkrGVDfSbnAzLrhU0vpu091fbUaYeaRC1Do+Xg5R8AE1Wdflko+wosp4+R7F
 ya+MTVXY6X0yGUrx2znky65+IAwBMKRttphn0UXtGe3GuDxucpAACX+UQmTk3q3poqeC
 /DcYKUe81hr1OIfNwuVYApiAUVhWiMLl2SDq6d1fn6P/iPB0ORPk8iXb+1Hy1XIeQQA8
 gM2gLphuWIzte4rglgFqd7h56FKz+gcjVNe5DiVtVuYPCroIYfnHwgXM83CWu3yPYQGz
 X3sch1vB/47ieQ44MWFKSwACSBmJYcw/smxwLA/hkavoRMvNjBkqXJ9CtUS6zsD0HViW dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tx60absu1-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 26 Jul 2019 18:27:03 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 10B1231;
 Fri, 26 Jul 2019 16:27:03 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DF60D4FD0;
 Fri, 26 Jul 2019 16:27:02 +0000 (GMT)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 26 Jul
 2019 18:27:02 +0200
To: Erwan Le Ray <erwan.leray@st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
References: <1561972686-23281-1-git-send-email-erwan.leray@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <8cb628b9-dbbf-98d6-e09a-2ecc082315d4@st.com>
Date: Fri, 26 Jul 2019 18:27:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1561972686-23281-1-git-send-email-erwan.leray@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-26_12:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: fix -Wall W=1
 compilation warnings for can1_sleep pinctrl
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

Hi Erwan		

On 7/1/19 11:18 AM, Erwan Le Ray wrote:
> Fix compilations warnings detected by -Wall W=1 compilation option:
> - node has a unit name, but no reg property
> 
> Signed-off-by: Erwan Le Ray <erwan.leray@st.com>
> 
> diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
> index 140a983..ce98fd8 100644
> --- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
> @@ -427,7 +427,7 @@
>   				};
>   			};
>   
> -			m_can1_sleep_pins_a: m_can1-sleep@0 {
> +			m_can1_sleep_pins_a: m_can1-sleep-0 {
>   				pins {
>   					pinmux = <STM32_PINMUX('H', 13, ANALOG)>, /* CAN1_TX */
>   						 <STM32_PINMUX('I', 9, ANALOG)>; /* CAN1_RX */
> 

Thanks for cleaning the STM32 DT. Applied on stm32-next. Note that I 
changed commit title to indicate which STM32 platform is targeted by 
this patch.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
