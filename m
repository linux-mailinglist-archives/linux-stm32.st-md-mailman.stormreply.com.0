Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6417091A677
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 14:20:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15818C6B460;
	Thu, 27 Jun 2024 12:20:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9CABC5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 12:20:45 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R95ARN020835;
 Thu, 27 Jun 2024 14:20:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 AGl8CVfDYYSZflNFW+9FeYoeCPrKt6+mzA+//qho8Gc=; b=ARC3XNZDq7mKTDtw
 Rd/HVBSE9YxIXlVoQpeT+6Ype3wcHoIr888t2gA9qlKgLMhiKcjMRvnR/Zf4HPL8
 pSDT/uWI/rQaNF85uvoNSDKw9LNUyhRphQHx82kdlySQg3R+qWm6C4bKFP4vgTYp
 ZEZ9thnCiLNCdDICQHKES477pNEK4hO10przJi3OV4KkJ3enb1oLOQPOcdShUAD8
 PRcWAU6eIzNUnkeFvULwpQQgcNW2m9Hdy22WtZFW811UtlVhtyviv0PB7vBmlNO+
 +aEXimxg/WkGkY5+M6vLdwtxpTjKebOMtP0F+ZBWbntsfiWHNExqzG425KB6cuNX
 VbPv/g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ywnxxngmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2024 14:20:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 462774002D;
 Thu, 27 Jun 2024 14:20:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CAA30218601;
 Thu, 27 Jun 2024 14:19:08 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 27 Jun
 2024 14:19:07 +0200
Message-ID: <0b155f29-17d1-4863-be38-fb6c1dec4c31@foss.st.com>
Date: Thu, 27 Jun 2024 14:19:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe Roullier <christophe.roullier@foss.st.com>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Marek Vasut <marex@denx.de>
References: <20240610080309.290444-1-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240610080309.290444-1-christophe.roullier@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_06,2024-06-27_03,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/3] Series DTs to deliver Ethernet for
	STM32MP13
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

On 6/10/24 10:03, Christophe Roullier wrote:
> STM32MP13 is STM32 SOC with 2 GMACs instances
>      GMAC IP version is SNPS 4.20.
>      GMAC IP configure with 1 RX and 1 TX queue.
>      DMA HW capability register supported
>      RX Checksum Offload Engine supported
>      TX Checksum insertion supported
>      Wake-Up On Lan supported
>      TSO supported
> 
> Christophe Roullier (3):
>    ARM: dts: stm32: add ethernet1 and ethernet2 support on stm32mp13
>    ARM: dts: stm32: add ethernet1/2 RMII pins for STM32MP13F-DK board
>    ARM: dts: stm32: add ethernet1 for STM32MP135F-DK board
> 
>   arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi | 71 +++++++++++++++++++++
>   arch/arm/boot/dts/st/stm32mp131.dtsi        | 38 +++++++++++
>   arch/arm/boot/dts/st/stm32mp133.dtsi        | 31 +++++++++
>   arch/arm/boot/dts/st/stm32mp135f-dk.dts     | 23 +++++++
>   4 files changed, 163 insertions(+)
> 
> 
> base-commit: 28f961f9d5b7c3d9b9f93cc59e54477ba1278cf9

Series applied on stm32-next.

regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
