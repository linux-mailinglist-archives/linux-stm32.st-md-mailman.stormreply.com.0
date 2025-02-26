Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83001A4642D
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 16:10:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25879C7A832;
	Wed, 26 Feb 2025 15:10:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A82DC7A830
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 15:10:37 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QCD3Hx012382;
 Wed, 26 Feb 2025 16:10:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 8ewL/+uVM2seWyrZlyz4H0RFQuaYKzC45+3Da4nH/t0=; b=TO4UsmVXLWNtMv4Z
 Yh9qIQNeRvGI9qcLvgtzAb3wZNmt6WdJ8e9aatcrI1BVtx7+grrEXzNPhKTnzhVo
 8UkQFSfHTBz0XIsGcdK1HqRENglIQ6g5M/v9ljtvMgiT2uTLAXvJ59kmodhREVpv
 qWagnLPoK48zABDtsyT2/f79aAXq570oMn6ibK/hbcXyf69i8/RLhtktR/BQFIFW
 zjJ/jIm38zrlCZM6gIvydsf1R5DiynJGK/1ER8JsFsQcOMVaoM7bq/a+wsBhKafZ
 J3N1AyuqpojgVEBX6rLC3tT1Spflz6IgtpyH3T/9zQvIxwVYKSd4iSgSchm4W6Yr
 OHMImQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 451psv5a9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2025 16:10:21 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4DAF1400BB;
 Wed, 26 Feb 2025 16:08:55 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C731C5792D9;
 Wed, 26 Feb 2025 14:24:54 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 14:24:54 +0100
Message-ID: <2c8683f7-2c1c-4e18-9f76-53c528029b40@foss.st.com>
Date: Wed, 26 Feb 2025 14:24:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Woojung Huh
 <woojung.huh@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>
References: <20250203085820.609176-1-o.rempel@pengutronix.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250203085820.609176-1-o.rempel@pengutronix.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 0/4] Add support for Priva
	E-Measuringbox board
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

On 2/3/25 09:58, Oleksij Rempel wrote:
> This patch series introduces support for the Priva E-Measuringbox board
> based on the ST STM32MP133 SoC. The set includes all the necessary
> changes for device tree bindings, vendor prefixes, thermal support, and
> board-specific devicetree to pass devicetree validation and checkpatch
> tests.
> 
> changes v2:
> - drop: dt-bindings: net: Add TI DP83TD510 10BaseT1L PHY
> 
> Oleksij Rempel (2):
>    dt-bindings: vendor-prefixes: Add prefix for Priva
>    dt-bindings: arm: stm32: Add Priva E-Measuringbox board
> 
> Roan van Dijk (2):
>    arm: dts: stm32: Add thermal support for STM32MP131
>    arm: dts: stm32: Add Priva E-Measuringbox devicetree
> 
>   .../devicetree/bindings/arm/stm32/stm32.yaml  |   6 +
>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>   arch/arm/boot/dts/st/Makefile                 |   1 +
>   arch/arm/boot/dts/st/stm32mp131.dtsi          |  35 ++
>   arch/arm/boot/dts/st/stm32mp133c-prihmb.dts   | 496 ++++++++++++++++++
>   5 files changed, 540 insertions(+)
>   create mode 100644 arch/arm/boot/dts/st/stm32mp133c-prihmb.dts
> 
> --
> 2.39.5
> 

Series applied on stm32-next.

Cheers
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
