Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3A4A2568E
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2025 11:01:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C840C78F7C;
	Mon,  3 Feb 2025 10:01:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99B63CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2025 10:01:19 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5139s5PH007730;
 Mon, 3 Feb 2025 11:01:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 pltFvt4GqCMF1mOOU8FaNNegbJdsmJ9GwmxeyuQCI2s=; b=av3HLmBj9SHhTMnZ
 YDazKXDK2Tu219vkrqw6/SVx6rdLmwdxKvbBPPZ+SgBOTUZC4/dIY10w1fo0Z2MD
 yUxWyOlZjz0q90co0c9YGJkyUIfPYrvOPo/wV1eP0Cq1SjvDksiAMgZLk4Mvcs2g
 pzlYsqvxCkaxnVSF0OnGtyTlPpBDvtQ80wC9ZZNZcgojh+lCede/sT6+vTyopAIL
 UIjmsTDeoYZnJ6eckRwv91VBWfdyUKK4hBoMA64M7O4WQDRMSaRLFxjP0OXBe7mR
 CcyAepjRo+kbjCv/ymDNkqVd1C8a99moFE/805VAsrrvN30W5Ls+HjF4TjA9ht2S
 yftI1w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44jujv811y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2025 11:01:15 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 001A740056;
 Mon,  3 Feb 2025 11:00:21 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EE8092AAE6D;
 Mon,  3 Feb 2025 10:58:09 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Feb
 2025 10:58:09 +0100
Message-ID: <e564afad-0cdf-4f1e-bc98-e31fd66d43a5@foss.st.com>
Date: Mon, 3 Feb 2025 10:58:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe Parant <c.parant@phytec.fr>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20250110150216.309760-1-c.parant@phytec.fr>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250110150216.309760-1-c.parant@phytec.fr>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_04,2025-01-31_02,2024-11-22_01
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: Re: [Linux-stm32] [PATCH 00/11] Rework and fix STM32MP15x PHYTEC dts
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

On 1/10/25 16:02, Christophe Parant wrote:
> This patch series rename and reorganize the STM32MP15x PHYTEC
> baseboard (phyBOARD-Sargas) and SoM (phyCORE-STM32MP15x) device tree
> files.
> Indeed, the current device tree naming and organization is not really
> consistent as it does not align with others STM32MP boards (use common
> dtsi file as much as possible, use one dtsi for SoM and one dtsi for
> baseboard).
> 
> The series also fixes some important pinctrl issues and minor one (coding
> style). Additional pinctrl is also added for the optionnal interfaces
> that are not enabled by default (FMC, LTDC, DCMI, PWM).
> 
> Christophe Parant (11):
>    ARM: dts: stm32mp15: phycore: Rename device tree files
>    ARM: dts: stm32mp15: phyboard-sargas: Introduce SoM device tree
>    dt-bindings: arm: stm32: Rename STM32MP15x Phytec board and SoM
>    ARM: dts: stm32mp15: Add new pinmux groups for phycore and phyboard
>    ARM: dts: stm32mp15: phyboard-sargas: Fix uart4 and sai2 pinctrl
>    ARM: dts: stm32mp15: phycore: qspi: Fix memory map and pinctrl
>    ARM: dts: stm32mp15: phycore: Add dummy memory-node
>    ARM: dts: stm32mp15: phyboard-sargas: Move aliases from dts to dtsi
>    ARM: dts: stm32mp15: phycore: Disable optional SoM peripherals
>    ARM: dts: stm32mp15: phycore and phyboard: Fix coding style issues
>    ARM: dts: stm32mp15: phycore and phyboard: Add optional interfaces
> 
>   .../devicetree/bindings/arm/stm32/stm32.yaml  |   7 +-
>   arch/arm/boot/dts/st/Makefile                 |   2 +-
>   arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi   | 164 +++++++++
>   .../st/stm32mp157c-phyboard-sargas-rdk.dts    |  42 +++
>   .../dts/st/stm32mp157c-phycore-stm32mp1-3.dts |  60 ---
>   .../dts/st/stm32mp15xx-phyboard-sargas.dtsi   | 286 +++++++++++++++
>   ...-som.dtsi => stm32mp15xx-phycore-som.dtsi} | 344 ++++--------------
>   7 files changed, 564 insertions(+), 341 deletions(-)
>   create mode 100644 arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
>   delete mode 100644 arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dts
>   create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
>   rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp15-som.dtsi => stm32mp15xx-phycore-som.dtsi} (53%)
> 

Can you please fix this yaml issue:

arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dtb: touch@44: 
touchscreen: Unevaluated properties are not allowed ('st,adc-freq', 
'st,mod-12b', 'st,ref-sel', 'st,sample-time' were unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#

thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
