Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7D17051E2
	for <lists+linux-stm32@lfdr.de>; Tue, 16 May 2023 17:17:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43169C6B441;
	Tue, 16 May 2023 15:17:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 796D8C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 May 2023 15:17:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34GCFQ8d014872; Tue, 16 May 2023 17:17:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=/E/EqirfA5WHMXEwmJ82wXT1PWo3fz2gyrcgcd1p8vo=;
 b=z2knDP1gNNpEPQyFgeXlAuZlvCU5W2MKhC1G5MAdrVIf2klCsWlkNUmTMLpxqznlNMvd
 D909x33guFPM3Guf+G/F13euayBfYG6Favel362EH2JuW5YXti1SMhlzCjSgoVw95JjG
 bMLc2/hl3A/19w7ou7BrTpf8jYYc3FeNr00LnOMq2U9eEH7nwd3+b6339a/4uhrmIe5s
 1PRAAaL+Zgh1CzyEGnqqgnFQ4t7pDPD/C+iH4s0hGY+gVIEBpxBvl436RtxXTg2fqNl7
 a95Uo2Iu4EReeHZ+kPlvW7xCJCjQxVU5ocBwuGA16UbPQArzZ8e6/USINc5UqGgeOT53 pA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qkhp0hqsg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 17:17:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7044710002A;
 Tue, 16 May 2023 17:17:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6873D228A43;
 Tue, 16 May 2023 17:17:00 +0200 (CEST)
Received: from [10.252.0.230] (10.252.0.230) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 16 May
 2023 17:16:59 +0200
Message-ID: <5b8cdb16-dc93-e3c6-4e13-4e72dce18a58@foss.st.com>
Date: Tue, 16 May 2023 17:16:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20230505060158.16516-1-s.trumtrar@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230505060158.16516-1-s.trumtrar@pengutronix.de>
X-Originating-IP: [10.252.0.230]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_08,2023-05-16_01,2023-02-09_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v9 00/10] ARM: stm32: add support for
	Phycore STM32MP1
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

Hi Steffen

On 5/5/23 08:01, Steffen Trumtrar wrote:
> Hi,
> 
> this series adds support for the Phytec STM32MP1-based SoM and board.
> 
> Phytec itself calls the board "Phycore STM32MP1-3" and has other
> endnumbers. I only have access to the "-3" and that's what this series
> adds.
> 
>      Changes since v8:
>        - fix typo: rgmii-sleep-8 -> rgmii-sleep-3
>        - rebase to v6.3
> 
>      Changes since v7:
>        - remove unused gpu_reservde memory range
>        - get rid of duplicate ethernet clock assignments
>        - remove secure-status for sdmmc
>      
>      Changes since v6:
>        - rename mdio0->mdio
>      
>      Changes since v5:
>        - cleanup dt_bindings_check warnings
>      
>      Changes since v4:
>        - cleanup usage of "status = okay|disabled"
>        - fix remaining non-generic node names
>        - rework sai nodes to not duplicate the existing settings in stm32mp151.dtsi
>      
>      Changes since v3:
>        - cleanup board-compatible
>        - cleanup aliases
>        - rename nodes according to schema
>        - use interrupt flag
> 
> 
> Best regards,
> Steffen Trumtrar
> 
> 
> Steffen Trumtrar (10):
>    ARM: dts: stm32: Add alternate pinmux for ethernet
>    ARM: dts: stm32: Add alternate pinmux for sai2b
>    ARM: dts: stm32: Add new pinmux for sdmmc1_b4
>    ARM: dts: stm32: Add new pinmux for sdmmc2_d47
>    ARM: dts: stm32: Add pinmux for USART1 pins
>    ARM: dts: stm32: Add idle/sleep pinmux for USART3
>    ARM: dts: stm32: Add sleep pinmux for SPI1 pins_a
>    dt-bindings: arm: stm32: Add Phytec STM32MP1 board
>    ARM: dts: stm32: add STM32MP1-based Phytec SoM
>    ARM: dts: stm32: add STM32MP1-based Phytec board
> 
>   .../devicetree/bindings/arm/stm32/stm32.yaml  |   6 +
>   arch/arm/boot/dts/Makefile                    |   3 +-
>   arch/arm/boot/dts/stm32mp15-pinctrl.dtsi      | 231 +++++++
>   .../dts/stm32mp157c-phycore-stm32mp1-3.dts    |  60 ++
>   .../stm32mp157c-phycore-stm32mp15-som.dtsi    | 577 ++++++++++++++++++
>   5 files changed, 876 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts
>   create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
> 

Series applied on stm32-next. Thanks for your efforts!

Regards
Alex


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
