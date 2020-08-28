Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BC425578D
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 11:26:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F4027C32E90;
	Fri, 28 Aug 2020 09:26:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0E73C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 09:26:47 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07S9D0U7028714; Fri, 28 Aug 2020 11:26:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=xytjGJ+R7UXiyIWaXczFQ53RwgTuScaV6bkp+jYqjlc=;
 b=ZRx2TB2Khg3RQdMMD2jsSS44LfA3U6PEV0xYHZ78AEr05WnTVO8ZVECXbzg26PbxL7ax
 jjgXoca451hZJ1euVcsdtMt2S4XVaxLEik42pNMS55Ub+OcC18qpADcigslNKKcBrofk
 +Om3+Ws9xYJFRFZCNOBgRqC0qUj6qIINoHRaCfZyGoHNBDyNbjYpMq37xbW//B/vMgh7
 b80EMN+6cxULCNVT/U9FNxvbkQH3rLlzk9IW0c1nb4GskRJMEsMXQmdylvYgIoZH6rrg
 +97PfzQACnuzY9VdQPfTIjtzJhhH7W8PcuXOIA+pqxVdJug3C2b2+BubWJRtIrI8e61l kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 333b6xjrs2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Aug 2020 11:26:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 353E310002A;
 Fri, 28 Aug 2020 11:26:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 22DD62AD2DD;
 Fri, 28 Aug 2020 11:26:38 +0200 (CEST)
Received: from [10.211.2.133] (10.75.127.47) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Aug
 2020 11:26:37 +0200
To: Marek Vasut <marex@denx.de>
References: <20200805123629.97146-1-marex@denx.de>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <57e79f1d-c3b5-76e9-01b9-c79d41b95da5@st.com>
Date: Fri, 28 Aug 2020 11:26:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200805123629.97146-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-28_05:2020-08-28,
 2020-08-28 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] ARM: dts: stm32: Add STM32MP1 UART8
	RTS/CTS pinmux
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

On 8/5/20 2:36 PM, Marek Vasut wrote:
> Add extra RTS/CTS line pinmux for STM32MP1 UART8.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)

Acked-by: Fabrice Gasnier <fabrice.gasnier@st.com>

> 
> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index b5a66429670c..ba8f52ea7674 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -1700,6 +1700,14 @@ pins2 {
>  		};
>  	};
>  
> +	uart8_rtscts_pins_a: uart8rtscts-0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('G', 7, AF8)>, /* UART8_RTS */
> +				 <STM32_PINMUX('G', 10, AF8)>; /* UART8_CTS */
> +			bias-disable;
> +		};
> +	};
> +
>  	spi4_pins_a: spi4-0 {
>  		pins {
>  			pinmux = <STM32_PINMUX('E', 12, AF5)>, /* SPI4_SCK */
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
