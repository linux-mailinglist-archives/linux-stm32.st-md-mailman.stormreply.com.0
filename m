Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A461C8349
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 09:15:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E987C36B0D;
	Thu,  7 May 2020 07:15:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 399C1C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 07:15:29 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0477DNFR027002; Thu, 7 May 2020 09:15:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=L51sRJlfOsw4Y7/MDpiNrdjYapAryMpWAkXSpi9QQMY=;
 b=HRxjFxukXyKSMaGNQBkkWJ6P9pwuXC6m/u402TaI5cIh+7kndEykDz4wN80nn4MXVHHa
 1j28srPK3cmTG83qYegPsTqT5F0gdgvGw4J9TN8Hcjn4NtkuuOqhzi//3ss9UOPEnwNF
 CdS3z2fuw6rQxe5O6VNqjTmvjfwSuV6sBAYejGHA1Hpp6eWK7LlInQE2rS1UHDze5w/p
 qSwWGuTMx6Dqsm2POVWyQKGtECFXM43Wj4e3kFQ6x7Vy3L6wHoXGiQUEajt2kI9RfTyI
 4iFKwYo3GC3/Ak+KSka6HzwiTnwIK5H/Eoa6eFxww2mCPd9L0TlV4UGC4hk3Vri1uxOB YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30rxb2a4tr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 May 2020 09:15:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A04C810002A;
 Thu,  7 May 2020 09:15:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 91ABC222CCC;
 Thu,  7 May 2020 09:15:16 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 7 May
 2020 09:15:12 +0200
To: Etienne Carriere <etienne.carriere@linaro.org>,
 <linux-kernel@vger.kernel.org>
References: <20200506174840.19856-1-etienne.carriere@linaro.org>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <52715352-c1f1-970a-5441-7780fc48c933@st.com>
Date: Thu, 7 May 2020 09:15:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200506174840.19856-1-etienne.carriere@linaro.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-07_04:2020-05-05,
 2020-05-07 signatures=0
Cc: Etienne Carriere <etienne.carriere@st.com>, devicetree@vger.kernel.org,
 robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: bump PSCI to version 1.0
	on stm32mp15x
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

Hi Etienne

On 5/6/20 7:48 PM, Etienne Carriere wrote:
> From: Etienne Carriere <etienne.carriere@st.com>
> 
> Declare PSCI v1.0 support instead of v0.1 as the former is supported
> by the PSCI firmware stacks stm32mp15x relies on.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> ---
>   arch/arm/boot/dts/stm32mp151.dtsi | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index 3ea05ba48215..ebceead1b120 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -24,10 +24,8 @@
>   	};
>   
>   	psci {
> -		compatible = "arm,psci";
> +		compatible = "arm,psci-1.0";
>   		method = "smc";
> -		cpu_off = <0x84000002>;
> -		cpu_on = <0x84000003>;
>   	};
>   
>   	intc: interrupt-controller@a0021000 {
> 

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
