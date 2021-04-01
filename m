Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A539235128D
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Apr 2021 11:43:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C3C9C57B54;
	Thu,  1 Apr 2021 09:43:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EB3BC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Apr 2021 09:43:33 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1319gKom021282; Thu, 1 Apr 2021 11:43:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ElCTswr//GFCTAToCJhfoRZXnB9MVrksSyYjSKrxAoU=;
 b=Jqx/K1QwmWTis3eaCEw7rOD/e2XGnexB1jM0Kn6W6KfsQRexI8OipI+pwt05qsOB10mf
 NXSeO7mOPPOg2OaacbUVHBSeMzPJdSVkKgjDNcg4CmjFnmZoCHxaS3vOUpmvqOtFii9l
 5hqI527BdNFlPoZ+ZfC5l0BeWduO09mYFaZmfANBpTPpSbdC9HMbbc8VyavSsJ+ob+tN
 dr6hMlmx3iiAlhGrNwaV+a2CKMiU6iH/JgI0dbOtEne7wThijrLPTgyo3JQtcbzJM4y/
 5T9DvcTZAbMk6KYkLSSMabeln/z2M9Fy4hiGF1xORtt/4t1qDFUQ842Ijf5qdBdGbK97 CA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37n291k6b9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 11:43:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 39B9110002A;
 Thu,  1 Apr 2021 11:43:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2888222D63D;
 Thu,  1 Apr 2021 11:43:16 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Apr
 2021 11:43:15 +0200
To: Kurt Kanzenbach <kurt@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>
References: <20210316080644.19809-1-kurt@linutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <ce610592-3d91-e5ad-ffe9-b8567af886f1@foss.st.com>
Date: Thu, 1 Apr 2021 11:43:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210316080644.19809-1-kurt@linutronix.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-01_04:2021-03-31,
 2021-04-01 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add PTP clock to
	Ethernet controller
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

Hi Kurt

On 3/16/21 9:06 AM, Kurt Kanzenbach wrote:
> Add the PTP clock to the Ethernet controller. Otherwise, the driver uses the
> main clock to derive the PTP frequency which is not necessarily the correct one.
> 
> Tested with linuxptp on Olimex STMP1-OLinuXino-LIME2.
> 
> Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
> ---
>   arch/arm/boot/dts/stm32mp151.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index 3c75abacb374..d1f596ea2fd5 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1421,11 +1421,13 @@
>   				      "mac-clk-tx",
>   				      "mac-clk-rx",
>   				      "eth-ck",
> +				      "ptp_ref",
>   				      "ethstp";
>   			clocks = <&rcc ETHMAC>,
>   				 <&rcc ETHTX>,
>   				 <&rcc ETHRX>,
>   				 <&rcc ETHCK_K>,
> +				 <&rcc ETHPTP_K>,
>   				 <&rcc ETHSTP>;
>   			st,syscon = <&syscfg 0x4>;
>   			snps,mixed-burst;
> 

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
