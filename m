Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FE99A03A1
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2024 10:06:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BBEEC78033;
	Wed, 16 Oct 2024 08:06:45 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A907BC78031
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 08:06:40 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G3vNF3018119;
 Wed, 16 Oct 2024 10:06:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=jkUgw4lFb6dzmWnsWacZxr
 xZH1PIAFIkAz1dcBQJTJk=; b=f3umWwBPVWdTXKzCJ1HJ0tj8ydR5NSQqsj/vX3
 r0teK9QssdobqakfLXaGaA56Bu6Vyr6HvxnudJ4EBWhXlknuBimAe9fq32Q8NdIE
 ARe3rkgUNY0jV8fp8F8RMXn8uG+mIyhKuZccmJI8OhzqpwDmcqwM3Dc0cfQQ3SrI
 VVCI26aIXB9u0YzvGsq+lbdVetgiSvmRNke6ai6ke0fp95cmBXuoDEqr/WznWjsz
 VDaoBCS5Y4xkmqvtDsXooE5bKWDPccK/mbP7ozE/97fJ2ovk38/5WxDxXwanVHGg
 b6uSL90No1grOrRQESZliA2s00J+NEc+VZSm3D1X2Mx2Ecig==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42842jechh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2024 10:06:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D128640048;
 Wed, 16 Oct 2024 10:05:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A0C823CB49;
 Wed, 16 Oct 2024 10:04:32 +0200 (CEST)
Received: from localhost (10.48.86.225) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 16 Oct
 2024 10:04:31 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 16 Oct 2024 10:04:17 +0200
Message-ID: <20241016-rng-mp25-v2-v4-0-5dca590cb092@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIFzD2cC/22MQQqDMBBFr1Jm3cgk0US66j1KF1UnmoVGMhJax
 Ls3uqpQ+Jv34b0VmKInhttlhUjJsw9ThvJ6gXZ4TT0J32UGhaqUKKWIUy/GWVUiKdGY0iA5KUk
 6yMYcyfn3UXs8Mw+elxA/Rzyp/f3fyUNhjeuMtKhqbO8uMBe8FG0YYS8l/WtXZ1tnu7ZGY2c1V
 dSc7W3bvpuHZw/mAAAA
X-Change-ID: 20241011-rng-mp25-v2-b6460ef11e1f
To: Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>, <marex@denx.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.86.225]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 0/4] Add support for stm32mp25x RNG
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

This patchset adds support for the Random Number
Generator(RNG) present on the stm32mp25x platforms.
On these platforms, the clock management and the RNG
parameters are different.

While there, update the RNG max clock frequency on
stm32mp15 platforms according to the latest specs.

Tested on the stm32mp257f-ev1 platform with a deep
power sequence with rngtest before/after the sequence with
satisfying results.

Same was done on stm32mp135f-dk to make sure no regression was added.

On stm32mp157c-dk2, I didn't perform a power sequence but the rngtest
results were satisfying.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
Changes in v4:
- Changed the restrictions on clock names per compatible
- Link to v3: https://lore.kernel.org/r/20241015-rng-mp25-v2-v3-0-87630d73e5eb@foss.st.com

Changes in v3:
- Add restriction on clock-names some compatibles
- Use clk_bulk APIs in the RNG driver to avoid manually handling clocks.
- Link to v2: https://lore.kernel.org/r/20241011-rng-mp25-v2-v2-0-76fd6170280c@foss.st.com

Changes in V2:
	-Fixes in bindings
	-Removed MP25 RNG example
	-Renamed RNG clocks for mp25 to "core" and "bus"

---
Gatien Chevallier (4):
      dt-bindings: rng: add st,stm32mp25-rng support
      hwrng: stm32 - implement support for STM32MP25x platforms
      hwrng: stm32 - update STM32MP15 RNG max clock frequency
      arm64: dts: st: add RNG node on stm32mp251

 .../devicetree/bindings/rng/st,stm32-rng.yaml      | 28 +++++++-
 arch/arm64/boot/dts/st/stm32mp251.dtsi             | 10 +++
 drivers/char/hw_random/stm32-rng.c                 | 76 ++++++++++++++++------
 3 files changed, 94 insertions(+), 20 deletions(-)
---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241011-rng-mp25-v2-b6460ef11e1f

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
