Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9270813630
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Dec 2023 17:29:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C416C6B47D;
	Thu, 14 Dec 2023 16:29:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EBEEC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Dec 2023 16:29:17 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BEFk9WK028436; Thu, 14 Dec 2023 17:28:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=pAFj17HSIvNG/OLKmPGmMGVsrYHbgRXqCu1eFIvc9PU=; b=3b
 yN0jhljL5JhheeeJFR9IjZaIjEXxOFX95NxnHVUx8D74jxLUIXAhLS3RZv9N1iGJ
 aFUBSWUW2hynJ0Iop4ChAApJWNAzQ+a0ulntP0/B/TY7v5lROyq4bB3vvhGuKtIV
 hgohmF39qCD13T1JBQMJGNyQM0TCkSDuEPwwG6o1IBfMKfjwwHygulWibAwBCreI
 gPVVXE6JpjV8YsrknCC/Hy9KfuK2x3qap/e97pPSBTCFr/fCiZfbFUpmUJ9B2XQF
 FiJAMJzTb/L+4URlOX2AaJ9hPTOWAq7xzlmg0rjoSLu47PyukjBDQxT4utifTZYX
 BZb9fYSttgY12Uftr4+g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uvehmpevx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Dec 2023 17:28:53 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 10B76100053;
 Thu, 14 Dec 2023 17:28:43 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EEA6A2747B2;
 Thu, 14 Dec 2023 17:28:42 +0100 (CET)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 14 Dec
 2023 17:28:41 +0100
Message-ID: <0145e75a-0d4c-4e34-a247-7852796f0552@foss.st.com>
Date: Thu, 14 Dec 2023 17:28:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>
References: <20231117143338.1173475-1-patrick.delaunay@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20231117143338.1173475-1-patrick.delaunay@foss.st.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-14_11,2023-12-14_01,2023-05-22_02
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Udit Kumar <u-kumar1@ti.com>, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Linux-stm32] [PATCH 0/4] stm32: add support for STM32MP25 BSEC
 to control OTP data
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

On 11/17/23 15:33, Patrick Delaunay wrote:
> 
> Non volatile memory area is available on STM32MP25 with OTP in BSEC.
> 
> The 12 Kbits of OTP (effective) for STM32MP25x SoC Family
> are organized into the following regions:
> - lower OTP (OTP0 to OTP127) = 4096 lower OTP bits,
>    bitwise (1-bit) programmable
> - mid OTP (OTP128 to OTP255) = 4096 middle OTP bits,
>    bulk (32-bit) programmable
> - upper OTP (OTP256 to OTP383) = 4096 upper OTP bits,
>    bulk (32-bit) programmable,
>    only accessible when BSEC is in closed state.
> 
> BSEC is only accessible by secure world, so the OTP access is done
> by driver with OP-TEE TA, as on STM32MP13x family.
> 
> 
> 
> Patrick Delaunay (4):
>    dt-bindings: nvmem: add new stm32mp25 compatible for stm32-romem
>    nvmem: stm32: add support for STM32MP25 BSEC to control OTP data
>    arm64: defconfig: enable NVMEM STM32 ROMEM for stm32mp25
>    nvmem: add bsec support to stm32mp25
> 
>   .../bindings/nvmem/st,stm32-romem.yaml           |  1 +
>   arch/arm64/boot/dts/st/stm32mp251.dtsi           | 16 ++++++++++++++++
>   arch/arm64/configs/defconfig                     |  1 +
>   drivers/nvmem/stm32-romem.c                      | 16 ++++++++++++++++
>   4 files changed, 34 insertions(+)
> 


patch[4] (DT) applied on stm32-next.

thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
