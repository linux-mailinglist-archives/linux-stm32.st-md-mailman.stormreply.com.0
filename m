Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE8A7BDA97
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Oct 2023 14:02:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E01EC6A613;
	Mon,  9 Oct 2023 12:02:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC6F6C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Oct 2023 12:02:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3997geT5019817; Mon, 9 Oct 2023 14:02:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=Ooh4/yFf2JrfwSnSbYFLoguRGY36sVafq2HkIA5SYLU=; b=AJ
 2z5BLPOcyLWbr1PZ/gTxyvfnaYiryLmKpeGdAx/avu12n162KReV1M+NCElLCssi
 LGCMcQNb0vkumr0vnFQwbaBRpIxUrhrP52PSMKVBJC2IGXkkYKsLHsHWMprHpDoW
 PkbtGQG4jujNBM7PvL5n+Jjb6hCo1BHr/7r0jMcZon/UK6qNDjaHecSIs7wr932H
 kW8LfByqRARtPG4BMAqBsmFGd2rSEPyXM1a4R1i+IC4M5mRODRcFIvYkWi0YsWGP
 IZ5KAKPW8dZUgkW0/58ywmdFlA9I3pQHBfnHHM48QwjyExmtUomOKew4UCtFbCmp
 cliaoWKvGQICaNMfW4Sg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tkhfdw1n8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 14:02:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B85D610005E;
 Mon,  9 Oct 2023 14:02:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF5B5233C9B;
 Mon,  9 Oct 2023 14:02:11 +0200 (CEST)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 14:02:10 +0200
Message-ID: <5bd1a669-9eab-717f-6f58-0ecb4587cf22@foss.st.com>
Date: Mon, 9 Oct 2023 14:02:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, Olivia Mackall
 <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
References: <20230921080301.253563-1-gatien.chevallier@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230921080301.253563-1-gatien.chevallier@foss.st.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_11,2023-10-09_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/9] hwrng: stm32: support STM32MP13x
	platforms
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

On 9/21/23 10:02, Gatien Chevallier wrote:
> The STM32MP13x platforms have a RNG hardware block that supports
> customization, a conditional reset sequences that allows to
> recover from certain situations and a configuration locking
> mechanism.
> 
> This series adds support for the mentionned features. Note that
> the hardware RNG can and should be managed in the secure world
> for this platform, hence the rng not being default enabled on
> the STM32MP135F-DK board.
> 
> Changes in V2:
> 	- Use pm_ptr() and add __maybe_unused on PM API
> 	- Correct bug using WARN_ON
> 
> Changes in V3:
> 	- Squash of bindings patches
> 	- st,rng-lock-conf property declaration rework
> 	- Fix stm32_rng_pm_ops declaration in patch [5/9]
> 
> Gatien Chevallier (9):
>    dt-bindings: rng: introduce new compatible for STM32MP13x
>    hwrng: stm32 - use devm_platform_get_and_ioremap_resource() API
>    hwrng: stm32 - implement STM32MP13x support
>    hwrng: stm32 - implement error concealment
>    hwrng: stm32 - rework error handling in stm32_rng_read()
>    hwrng: stm32 - restrain RNG noise source clock
>    hwrng: stm32 - support RNG configuration locking mechanism
>    hwrng: stm32 - rework power management sequences
>    ARM: dts: stm32: add RNG node for STM32MP13x platforms
> 
>   .../devicetree/bindings/rng/st,stm32-rng.yaml |  20 +-
>   arch/arm/boot/dts/st/stm32mp131.dtsi          |   8 +
>   drivers/char/hw_random/stm32-rng.c            | 511 +++++++++++++++---
>   3 files changed, 455 insertions(+), 84 deletions(-)
> 

Patch[9] applied on stm32-next.

thanks
alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
