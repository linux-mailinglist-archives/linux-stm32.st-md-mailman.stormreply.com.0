Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9741ABDF0E
	for <lists+linux-stm32@lfdr.de>; Tue, 20 May 2025 17:31:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 857AFC78F9C;
	Tue, 20 May 2025 15:31:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7167BC78F9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 May 2025 15:31:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KFMZ9h014091;
 Tue, 20 May 2025 17:30:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=lk7D3+J+dO4N7nuT17NijQ
 wiCNmJdFyl56IfBFqF/xU=; b=rGXxvaOmKPW1GVxiuQOJhoM9eawEJGXYy7DL5y
 YrIkMQEaN0lHTPvIO00NJkS7B+UtAYqrNLwar4UOjhwFX32Q0LSNRpgsFK0tcOXu
 xMdoKf8yt0Uty1Bbe3M4noqBdNL1Ua2h2VqUunKQ5E9c9AHSWFTJYH76h/ArIMRu
 ovsRrUvA4KkTXgPb68KGlj1Gl64c7vWmUHjqCNPoVkHf28A9vVvMLHdMebATxVl4
 KqznOGAyJOCZhaAF+kJfvrQkb/HNk33TiCYJnJa48bzM5ZpgeLkT7TqYiWUMMzIt
 RWLD5VZUBb9Sxs6T/54bOYCoBJwaxw2qj40iPFtdkQcSUNfA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46phbgnnk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 May 2025 17:30:54 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1585F40047;
 Tue, 20 May 2025 17:29:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A3FD8B23C3F;
 Tue, 20 May 2025 17:28:54 +0200 (CEST)
Received: from localhost (10.48.87.146) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 17:28:54 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 20 May 2025 17:28:36 +0200
Message-ID: <20250520-upstream_rcc_mp21-v2-0-3c776a6e5862@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKSfLGgC/x3MTQqAIBBA4avErBNsIPu5SoSITjWLSsaKILp70
 vJbvPdAImFK0BcPCF2ceN8ysCzAL26bSXHIBtRY6xq1OmM6hNxqxXu7RqxU0K1BaoJvTAe5i0I
 T3/9zGN/3A8Snj0hjAAAA
X-Change-ID: 20250520-upstream_rcc_mp21-d0862e7dc769
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.146]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01
Cc: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/2] Introduce Clock and Reset Driver for
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

Changes in v2:
  - add list item for access-controlers and fix maxItems value from bindings
  - drop STM32MP21_LAST_CLK and STM32MP21_LAST_RESET defines from bindings
  - typo fixes from ALOK TIWARI
  

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
Gabriel Fernandez (2):
      dt-bindings: stm32: add STM32MP21 clocks and reset bindings
      clk: stm32: introduce clocks for STM32MP21 platform

 .../bindings/clock/st,stm32mp21-rcc.yaml           |  204 +++
 drivers/clk/stm32/Kconfig                          |    7 +
 drivers/clk/stm32/Makefile                         |    1 +
 drivers/clk/stm32/clk-stm32mp21.c                  | 1586 ++++++++++++++++++++
 drivers/clk/stm32/stm32mp21_rcc.h                  |  651 ++++++++
 include/dt-bindings/clock/st,stm32mp21-rcc.h       |  426 ++++++
 include/dt-bindings/reset/st,stm32mp21-rcc.h       |  138 ++
 7 files changed, 3013 insertions(+)
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
