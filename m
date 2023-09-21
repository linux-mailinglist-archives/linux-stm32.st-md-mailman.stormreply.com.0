Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FD57A9276
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Sep 2023 10:03:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5969AC6C822;
	Thu, 21 Sep 2023 08:03:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52706C6B46F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Sep 2023 08:03:38 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38L52ATc018997; Thu, 21 Sep 2023 10:03:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=xuMwQg6
 e1Wn4J45HkR4xLWFNEWC3Wmj+tN4CFCgiioA=; b=3RU7hiF9MdRO82scr535kov
 XC1NRnLK3FUrv3mJ27BqDj2OHtrrwiQrJhA28/zPMrdqcDf4GjF6UnEiZ0Cp0dRp
 Da8fY3u9yXRrhz2V1BPoXZ7Pl7ew/jk8lYxBgzA2t1TClsvf19jbeGFxugYXmaMF
 PiMbnNYptMRKijM0BHrScp+EAx5rhwoyw2msVUDVjCsGiX/KtbTCsQhdynO4Y8HP
 x66iD3moQg0/ZXHUGV4qAl8FMqBoystoajnl/PCx9+EBsYIUc/TUj9Qnpe+1cUov
 3BYqxa5RFCzsY0yyPhB/xO5SnJuu6fi1FOJ1W9YLwivECzjcAT/1ue6hzr25mBA=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t7ybkm004-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Sep 2023 10:03:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EB06C100058;
 Thu, 21 Sep 2023 10:03:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E0A0320FA2A;
 Thu, 21 Sep 2023 10:03:07 +0200 (CEST)
Received: from localhost (10.201.20.32) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 21 Sep
 2023 10:03:07 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 21 Sep 2023 10:02:52 +0200
Message-ID: <20230921080301.253563-1-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-21_06,2023-09-20_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/9] hwrng: stm32: support STM32MP13x
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

The STM32MP13x platforms have a RNG hardware block that supports
customization, a conditional reset sequences that allows to
recover from certain situations and a configuration locking
mechanism.

This series adds support for the mentionned features. Note that
the hardware RNG can and should be managed in the secure world
for this platform, hence the rng not being default enabled on
the STM32MP135F-DK board.

Changes in V2:
	- Use pm_ptr() and add __maybe_unused on PM API
	- Correct bug using WARN_ON

Changes in V3:
	- Squash of bindings patches
	- st,rng-lock-conf property declaration rework
	- Fix stm32_rng_pm_ops declaration in patch [5/9]

Gatien Chevallier (9):
  dt-bindings: rng: introduce new compatible for STM32MP13x
  hwrng: stm32 - use devm_platform_get_and_ioremap_resource() API
  hwrng: stm32 - implement STM32MP13x support
  hwrng: stm32 - implement error concealment
  hwrng: stm32 - rework error handling in stm32_rng_read()
  hwrng: stm32 - restrain RNG noise source clock
  hwrng: stm32 - support RNG configuration locking mechanism
  hwrng: stm32 - rework power management sequences
  ARM: dts: stm32: add RNG node for STM32MP13x platforms

 .../devicetree/bindings/rng/st,stm32-rng.yaml |  20 +-
 arch/arm/boot/dts/st/stm32mp131.dtsi          |   8 +
 drivers/char/hw_random/stm32-rng.c            | 511 +++++++++++++++---
 3 files changed, 455 insertions(+), 84 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
