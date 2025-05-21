Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4D9ABF47F
	for <lists+linux-stm32@lfdr.de>; Wed, 21 May 2025 14:40:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EA07C78F6B;
	Wed, 21 May 2025 12:40:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DB9AC78F6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 May 2025 12:40:56 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LBZixL023351;
 Wed, 21 May 2025 14:40:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=YAurZhITL/W1gNO4Qx2jNL
 y6BWLNhxB2Zemmn6C9FOU=; b=qWTxxILRjEdWm0xqkbJd/OFZWBcJ5CDChUI130
 oHmS5YYPBclY5vOa/tyvXQ6JaAc0ef9GoDBheNGVbGohO8lJHnE2JtPSp41aA18M
 jhL3rtvl317fOFLVwkvkW7ah8NhlnKrB21Jp3KBlpS0eulqTLmAt/lp8vrUR7L88
 r5rMi2NiEPpuxuR3+drek/sIos2luUunT/Z9RYv1f3rSIOhL4J7k+erUpOems8Wt
 6877NnFewSZ5Urx2LMSNfGpUlzsNVc49DF7gvMDUEWktwrUu7sAwMNOCEYgUd5jC
 /8UZoU8PjtMhdWYGgn7Gh83QqpZar+KbnoUFwMcI72W5RAXw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwf4440b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 May 2025 14:40:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5A79740048;
 Wed, 21 May 2025 14:39:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 37E80CAA543;
 Wed, 21 May 2025 14:38:51 +0200 (CEST)
Received: from localhost (10.252.1.130) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 14:38:50 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Wed, 21 May 2025 14:38:48 +0200
Message-ID: <20250521-upstream_rcc_mp21-v3-0-cac9d8f63d20@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFjJLWgC/32NQQ7CIBBFr9LMWhqcBlBX3sM0DaFTy6KlYZBoG
 u4u9gAu30v++zswRU8Mt2aHSNmzD2uF7tSAm+36JOHHyoASlVQoxWvjFMkuQ3RuWDY8i1FeNJI
 ZndFXqLst0uTfR/PRV549pxA/x0XGn/1Xyyik6Jwx2mpStXyfAnPLqXVhgb6U8gVc1YDctAAAA
 A==
X-Change-ID: 20250520-upstream_rcc_mp21-d0862e7dc769
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.1.130]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
Cc: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/3] Introduce Clock and Reset Driver for
 STM32MP21 Platform
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

This patchset implements a new driver to manage clock and reset functionalities
for the STM32MP21 platform.

Changes in v3:
- Fixes dt-bindings documentation
  - drop minItems for access-controllers
  - remove rcc label from example
  - remove double '::' from 'See also::'
- Add patch to report these fixes to STM32MP25
- Fixes typos in RCC drivers (Alock)
- Link to v2: https://lore.kernel.org/r/20250520-upstream_rcc_mp21-v2-0-3c776a6e5862@foss.st.com

Changes in v2:
  - add list item for access-controlers and fix maxItems value from bindings
  - drop STM32MP21_LAST_CLK and STM32MP21_LAST_RESET defines from bindings
  - typo fixes from ALOK TIWARI
  

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
Gabriel Fernandez (3):
      dt-bindings: stm32: add STM32MP21 clocks and reset bindings
      clk: stm32: introduce clocks for STM32MP21 platform
      dt-bindings: stm32: cosmetic fixes for STM32MP25 clock and reset bindings

 .../bindings/clock/st,stm32mp21-rcc.yaml           |  199 +++
 .../bindings/clock/st,stm32mp25-rcc.yaml           |   13 +-
 drivers/clk/stm32/Kconfig                          |    7 +
 drivers/clk/stm32/Makefile                         |    1 +
 drivers/clk/stm32/clk-stm32mp21.c                  | 1586 ++++++++++++++++++++
 drivers/clk/stm32/stm32mp21_rcc.h                  |  651 ++++++++
 include/dt-bindings/clock/st,stm32mp21-rcc.h       |  426 ++++++
 include/dt-bindings/reset/st,stm32mp21-rcc.h       |  138 ++
 8 files changed, 3014 insertions(+), 7 deletions(-)
---
base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
change-id: 20250520-upstream_rcc_mp21-d0862e7dc769

Best regards,
-- 
Gabriel Fernandez <gabriel.fernandez@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
