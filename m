Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F5399A831
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Oct 2024 17:47:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B990C71290;
	Fri, 11 Oct 2024 15:47:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22464C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2024 15:47:50 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BCUVHT000480;
 Fri, 11 Oct 2024 17:47:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=EWFrQzCRBMV4WxG/iPDIlA
 u8I6Hlt8CYexPjPZ/79FM=; b=aKnMQXAAPBuDQqaOQ9jtbxPosdQJMyEU4EntXp
 9N5I+cu7+SB+ild+A4DFs2SFQ+H8Tz5Shd+Xmn2BsGfEohVtuRPHVbWKQ2Hryx5n
 dhpfx+aXD9c9zGyH02RqNmVYcHugJ5ogIGYrLJdPkho6ir1Tey560zBsLV3OX8nl
 7MHc5iNqy/K6gMJAN5PXVK7ER/gNM6nUzpa3dSLWsluM41ugNvhv0qgefBZXwW75
 RgDWPTSQ95Ldrilz/1FXCWzDCwEfDw2pCy+/foUu/rAQgPhE3Taeh66Qo8bep0QO
 CYn5enq2QR+bgfpnXHM0+YN/PaBrQIf5TEmOAQ2b768sRzjQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 423f11da7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2024 17:47:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A789240049;
 Fri, 11 Oct 2024 17:46:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D43B229E023;
 Fri, 11 Oct 2024 17:43:14 +0200 (CEST)
Received: from localhost (10.252.28.117) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 11 Oct
 2024 17:43:14 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 11 Oct 2024 17:41:40 +0200
Message-ID: <20241011-rng-mp25-v2-v2-0-76fd6170280c@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADRHCWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxNDA0ND3aK8dN3cAiNT3TIj3SQzEzOD1DRDw1TDNCWgjoKi1LTMCrBp0bG
 1tQBlNmmyXQAAAA==
X-Change-ID: 20241011-rng-mp25-v2-b6460ef11e1f
To: Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>, <marex@denx.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.28.117]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/4] Add support for stm32mp25x RNG
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

 .../devicetree/bindings/rng/st,stm32-rng.yaml      | 30 +++++++-
 arch/arm64/boot/dts/st/stm32mp251.dtsi             | 10 +++
 drivers/char/hw_random/stm32-rng.c                 | 87 +++++++++++++++++-----
 3 files changed, 107 insertions(+), 20 deletions(-)
---
base-commit: 1d227fcc72223cbdd34d0ce13541cbaab5e0d72f
change-id: 20241011-rng-mp25-v2-b6460ef11e1f

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
