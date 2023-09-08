Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2340A798AE5
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Sep 2023 18:52:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3D37C6B47E;
	Fri,  8 Sep 2023 16:52:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DAA0C6B44F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Sep 2023 16:52:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 388ENMo1022982; Fri, 8 Sep 2023 18:51:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=r6Gr5rp
 kk1VW/S8lUEi+0DFipylC3JBR3dSDFFvyWsM=; b=DXqR1kjzDGez2o1yInWz6mE
 +f7FN/ooVNI4sPI//vBezx44ZAPwd3WsN1bdFr4IJd71FMWC2/zC1Vgsf4dHW7wp
 F+axhkwfTjmrJTnq6/YPFtLi78/MlPPB6Bfa85zSSeUOQQZc57ZKRu5+N01v3DUr
 n8GOn9AJZzmLi0+jS6UYzI+bCtWSW84RRkb6Eg2nnrh2VthYqRlf/6chgE6X5GSp
 Nx2Ak93t4MZJGD2ImyxMPB+7geJMP3H3W+rto853LjJ3KjVnSV0a7almZAswM/g7
 IGFuD6NhKAIVbjfrhRWrEbSaOqP7HhmqHpcojGoaxnUlodi1gAUzrMv3LEOZ7Wg=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sxwjp2g4e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Sep 2023 18:51:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 487F710004B;
 Fri,  8 Sep 2023 18:51:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3ED6D209EEB;
 Fri,  8 Sep 2023 18:51:28 +0200 (CEST)
Received: from localhost (10.201.20.32) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 8 Sep
 2023 18:51:27 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 8 Sep 2023 18:51:10 +0200
Message-ID: <20230908165120.730867-1-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_12,2023-09-05_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 00/10] hwrng: stm32: support STM32MP13x
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

Gatien Chevallier (10):
  dt-bindings: rng: introduce new compatible for STM32MP13x
  hwrng: stm32 - use devm_platform_get_and_ioremap_resource() API
  hwrng: stm32 - implement STM32MP13x support
  hwrng: stm32 - implement error concealment
  hwrng: stm32 - rework error handling in stm32_rng_read()
  hwrng: stm32 - restrain RNG noise source clock
  dt-bindings: rng: add st,rng-lock-conf
  hwrng: stm32 - support RNG configuration locking mechanism
  hwrng: stm32 - rework power management sequences
  ARM: dts: stm32: add RNG node for STM32MP13x platforms

 .../devicetree/bindings/rng/st,stm32-rng.yaml |  18 +-
 arch/arm/boot/dts/st/stm32mp131.dtsi          |   8 +
 drivers/char/hw_random/stm32-rng.c            | 509 +++++++++++++++---
 3 files changed, 452 insertions(+), 83 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
