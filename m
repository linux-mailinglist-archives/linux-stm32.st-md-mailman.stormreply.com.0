Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE88A47849
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 09:53:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAA63C7A83E;
	Thu, 27 Feb 2025 08:53:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 206D3C7A83B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 08:53:38 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R36PsX012384;
 Thu, 27 Feb 2025 09:53:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 vDh0QzHySWFeLsgaXeAdtBYWTRMbknlsM54A0jYUL0A=; b=Ej8XH+TIlqHnUxSf
 2N0exeWAvWHYcziNBb1OR5fXkWUn2yOug4Vq8a9L/Cs6x9aFDSPXQ5G5i96Ahd0/
 xLbGvUe1jYjK6H+Wmr7g4huAxyrd726IE+9/zlGQxESLrgb9J1K4+MKNtdGxkjo6
 CPKRLSKSsQTu54XjyczfIFLJEQ8XwF+RoTR3jYfDyh5bN8FBmvMc3HkZIsSv8FQ3
 RB1IFe1inZqhZkDFE4yHuptDFPT9Ts1zv/HYRb763aMKL3Ba/3daqWTAkHsGJ0SH
 aJXB07aA5PyNYmDu1Km+cBs8pJirQ95rxq7fccAVD/GXf4+A4Idq9Org4UWPmypr
 Ko2umg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 451psv9em4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2025 09:53:36 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 807454002D;
 Thu, 27 Feb 2025 09:53:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CE1E83A11D5;
 Thu, 27 Feb 2025 09:52:45 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 09:52:45 +0100
Message-ID: <5467805a-c8a7-4c09-9ff5-1cf77541c3fb@foss.st.com>
Date: Thu, 27 Feb 2025 09:52:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe Parant <c.parant@phytec.fr>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20250110150216.309760-1-c.parant@phytec.fr>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250110150216.309760-1-c.parant@phytec.fr>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_04,2025-02-26_01,2024-11-22_01
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

Hi Christophe

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

Using b4 to get your series, I just see that there no mailing list and 
Dt maintainer in CC of your series. Did you use "get_maintainer.pl" script ?

Can you please resend adding correct CC and TO list ?

Note: ARM: dts: stm32mp15: --> ARM: dts: stm32

thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
