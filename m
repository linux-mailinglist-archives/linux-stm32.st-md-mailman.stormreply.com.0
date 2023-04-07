Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 225AA6DA98F
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Apr 2023 09:51:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0F69C6B446;
	Fri,  7 Apr 2023 07:51:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3695BC6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Apr 2023 07:51:41 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3377codq012393; Fri, 7 Apr 2023 09:51:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=JZQ9ebk0VsNr3bmE9JHa8crYpwLrWBU1DloiIHkXoPc=;
 b=LATOAoa6VAv2sIlM+tG5p8SCCPc4K8iKdJp918Z0eSEhRFkDt1YH18iBa5sck1l+33rf
 cDQcHCFQF43sray9y1qxFdISoxpjSP/5yOhVMmBOFiBdytWdqCBl27HKdjs35gtPfW8n
 A5ONJu1TGJl02KSkQWCt0jUNmNEQpWKdSVhEYYnvh+JhTckINgJn08EDdd/PkrRQEjxH
 SDqA00tBDGHPh0bDgNyKq4yqmPtVw9ECW4fNq1JrlWisyeioRctkcXqf0fHxvURU+CTG
 qohwj3RtootheEg6yzbL2IVgS9yqjAsGFlN2lNGccEzIF4bl/4AdAe10DLTr12ZBcnKc xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pteygr23x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Apr 2023 09:51:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 61B49100113;
 Fri,  7 Apr 2023 09:42:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5AB5E216EFD;
 Fri,  7 Apr 2023 09:42:23 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 7 Apr
 2023 09:42:23 +0200
Message-ID: <ae67208f-7e04-5d53-9b7d-77bf4547a790@foss.st.com>
Date: Fri, 7 Apr 2023 09:42:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Roan van Dijk <roan@protonic.nl>, <corbet@lwn.net>
References: <20230330091613.1445734-1-roan@protonic.nl>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230330091613.1445734-1-roan@protonic.nl>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_04,2023-04-06_03,2023-02-09_01
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 linux-doc@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] ARM: stm32: add initial documentation
	for STM32MP151
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

Hi Roan

On 3/30/23 11:16, Roan van Dijk wrote:
> This patch adds initial documentation of STM32MP151 microprocessor (MPU)
> based on Arm Cortex-A7.
> 
> Signed-off-by: Roan van Dijk <roan@protonic.nl>
> ---
> 



Applied on stm32-next.

Thanks.
Alex

> v2:
>   - Adds stm32mp151 to index.rst
> 
>   Documentation/arm/index.rst                   |  1 +
>   .../arm/stm32/stm32mp151-overview.rst         | 36 +++++++++++++++++++
>   2 files changed, 37 insertions(+)
>   create mode 100644 Documentation/arm/stm32/stm32mp151-overview.rst
> 
> diff --git a/Documentation/arm/index.rst b/Documentation/arm/index.rst
> index ae42fe886f0d..056ac11372af 100644
> --- a/Documentation/arm/index.rst
> +++ b/Documentation/arm/index.rst
> @@ -58,6 +58,7 @@ SoC-specific documents
>      stm32/stm32f769-overview
>      stm32/stm32f429-overview
>      stm32/stm32mp13-overview
> +   stm32/stm32mp151-overview
>      stm32/stm32mp157-overview
>      stm32/stm32-dma-mdma-chaining
>   
> diff --git a/Documentation/arm/stm32/stm32mp151-overview.rst b/Documentation/arm/stm32/stm32mp151-overview.rst
> new file mode 100644
> index 000000000000..f42a2ac309c0
> --- /dev/null
> +++ b/Documentation/arm/stm32/stm32mp151-overview.rst
> @@ -0,0 +1,36 @@
> +===================
> +STM32MP151 Overview
> +===================
> +
> +Introduction
> +------------
> +
> +The STM32MP151 is a Cortex-A MPU aimed at various applications.
> +It features:
> +
> +- Single Cortex-A7 application core
> +- Standard memories interface support
> +- Standard connectivity, widely inherited from the STM32 MCU family
> +- Comprehensive security support
> +
> +More details:
> +
> +- Cortex-A7 core running up to @800MHz
> +- FMC controller to connect SDRAM, NOR and NAND memories
> +- QSPI
> +- SD/MMC/SDIO support
> +- Ethernet controller
> +- ADC/DAC
> +- USB EHCI/OHCI controllers
> +- USB OTG
> +- I2C, SPI busses support
> +- Several general purpose timers
> +- Serial Audio interface
> +- LCD-TFT controller
> +- DCMIPP
> +- SPDIFRX
> +- DFSDM
> +
> +:Authors:
> +
> +- Roan van Dijk <roan@protonic.nl>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
