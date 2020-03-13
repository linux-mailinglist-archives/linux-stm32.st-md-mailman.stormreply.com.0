Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 657E1184796
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2020 14:13:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22EADC36B0E;
	Fri, 13 Mar 2020 13:13:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9DFDC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2020 13:13:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02DD7L64023461; Fri, 13 Mar 2020 14:13:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=oUI8ZXDq4EiPObS+0wbkrkh1Q7HpkSyN8K/N9gjWHwY=;
 b=CMYrR8XBBnQtWJkA0eWefudDD9tn9gsZT+GMJWILTLOZQXISvjGUkZozI5RgrAlEej7E
 K26gR/vCvzJnXvccC54NJ5ZY7qlXk61EkVin6FWr+6iogkfVCuvRjv1Z3qK+viYZyNCz
 Al4pVtZs3kkxEH7UgQ6ZzB19S8CcN4dhLO1Wkrd1mHzpl6q0+crBBGjg0FT2Ru5QYzbN
 Ac1lulXTPrDkN6+Zpqlce1abtkUexXV0v7QcHq5VUzr3C8LzIbe0y4+YTqFfFPmq+m6e
 QVf95UmlFyj9+62dckN+X2O6Nrqcl4GZh1EYhaGTrWTH6d3n0wMgjPy468bX+P2eQzo+ Cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yqt82guej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Mar 2020 14:13:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CA20310002A;
 Fri, 13 Mar 2020 14:13:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 849672A8913;
 Fri, 13 Mar 2020 14:13:00 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 13 Mar
 2020 14:12:59 +0100
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
References: <20200224172031.27868-1-a.fatoum@pengutronix.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <e5a6ce75-061d-fa75-8fe6-285b4259952f@st.com>
Date: Fri, 13 Mar 2020 14:12:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224172031.27868-1-a.fatoum@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-13_04:2020-03-12,
 2020-03-13 signatures=0
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: add cpu clock-frequency
 property on stm32mp15x
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

On 2/24/20 6:20 PM, Ahmad Fatoum wrote:
> All of the STM32MP151[1], STM32MP153[2] and STM32MP157[3] have their
> Cortex-A7 cores running at 650 MHz.
> 
> Add the clock-frequency property to CPU nodes to avoid warnings about
> them missing.
> 
> [1]: https://www.st.com/en/microcontrollers-microprocessors/stm32mp151.html
> [2]: https://www.st.com/en/microcontrollers-microprocessors/stm32mp153.html
> [3]: https://www.st.com/en/microcontrollers-microprocessors/stm32mp157.html
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Applied on stm32-next.

Thanks.
Alex

> ---
>   arch/arm/boot/dts/stm32mp151.dtsi | 1 +
>   arch/arm/boot/dts/stm32mp153.dtsi | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index fb41d0778b00..fd46a8e11126 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -17,6 +17,7 @@ cpus {
>   
>   		cpu0: cpu@0 {
>   			compatible = "arm,cortex-a7";
> +			clock-frequency = <650000000>;
>   			device_type = "cpu";
>   			reg = <0>;
>   		};
> diff --git a/arch/arm/boot/dts/stm32mp153.dtsi b/arch/arm/boot/dts/stm32mp153.dtsi
> index 2d759fc6015c..6d9ab08667fc 100644
> --- a/arch/arm/boot/dts/stm32mp153.dtsi
> +++ b/arch/arm/boot/dts/stm32mp153.dtsi
> @@ -10,6 +10,7 @@ / {
>   	cpus {
>   		cpu1: cpu@1 {
>   			compatible = "arm,cortex-a7";
> +			clock-frequency = <650000000>;
>   			device_type = "cpu";
>   			reg = <1>;
>   		};
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
