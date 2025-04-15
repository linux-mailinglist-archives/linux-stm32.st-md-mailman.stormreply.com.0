Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D39FAA89BDE
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 13:19:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 804C0C78F81;
	Tue, 15 Apr 2025 11:19:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0637C78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 11:19:00 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F7cHed002917;
 Tue, 15 Apr 2025 13:18:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 YLoRpcl9tXKtJLd+8WJKIJFOTcibTvljhF2F7NJ//oI=; b=57/gd+C6H30Mh4iZ
 aXksiGpXyY8P+14TpOknatRLPbbQulu2qLYcGUHNmP2/AfHKLzHrTfeHzC0+6if2
 QU9Bibmt5KOjQ8P+9k+PwJuxnqZR8CG4hXh8ni8vk0NaXi/uCxA5cExOPvPqmxj4
 qPBzOQBH9FRtq9noftV4n+VV89LnYSvkUTLW9QqBEPYF07UxsEHF0ULooY8nesbL
 /gy2twGs35daVZsbJ1goF0wECIcjxGarptKBn6CWmZARM05DAsSXCb+/gieEgOaB
 +vgqHZLkb8z1+SRNb0ro7m0/P4dQmRFOgQAAlLay/upa8Wq8RwWpwTZ1/VFcdA0t
 KNR40Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45yfh1vvwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Apr 2025 13:18:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0E2184004D;
 Tue, 15 Apr 2025 13:17:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5BA949B3DEE;
 Tue, 15 Apr 2025 13:17:11 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 13:17:11 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
Date: Tue, 15 Apr 2025 13:16:50 +0200
Message-ID: <20250415111654.2103767-3-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415111654.2103767-1-christian.bruel@foss.st.com>
References: <20250415111654.2103767-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
Cc: devicetree@vger.kernel.org, maz@kernel.org, linux-kernel@vger.kernel.org,
 Christian Bruel <christian.bruel@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/6] arm64: dts: st: Use 128kB size for
	aliased GIC400 register access on stm32mp25 SoCs
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

Adjust the size of 8kB GIC regions to 128kB so that each 4kB is mapped 16
times over a 64kB region.
The offset is then adjusted in the irq-gic driver.

see commit 12e14066f4835 ("irqchip/GIC: Add workaround for aliased GIC400")

Fixes: 5d30d03aaf785 ("arm64: dts: st: introduce stm32mp25 SoCs family")
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Suggested-by: Marc Zyngier <maz@kernel.org>
Acked-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 379e290313dc..87110f91e489 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -119,9 +119,9 @@ intc: interrupt-controller@4ac00000 {
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		reg = <0x0 0x4ac10000 0x0 0x1000>,
-		      <0x0 0x4ac20000 0x0 0x2000>,
-		      <0x0 0x4ac40000 0x0 0x2000>,
-		      <0x0 0x4ac60000 0x0 0x2000>;
+		      <0x0 0x4ac20000 0x0 0x20000>,
+		      <0x0 0x4ac40000 0x0 0x20000>,
+		      <0x0 0x4ac60000 0x0 0x20000>;
 	};
 
 	psci {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
