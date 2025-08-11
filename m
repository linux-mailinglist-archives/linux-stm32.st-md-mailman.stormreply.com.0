Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A1DB20A39
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 15:30:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B40DFC32E8D;
	Mon, 11 Aug 2025 13:30:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C033C349C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 13:30:36 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BCc97o032379;
 Mon, 11 Aug 2025 15:30:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=2jQId8J7hJCUUyc0leXs7a
 3GHenaf+1ZJSfH2NICKrs=; b=5WPhiOz83OFz+h3h9LpGnHuzXRzWvTfDuQ9gSk
 lTFPf2PEZOLv7hBu3bcXzMvyYDpXFELxQqD5DFmLUMX6jLPy0nEE7Td7LbnkO26u
 LSLGaJa70dHEuEqjRixHCFL8QraoltOuUMKWjxeKvBlRwyNsZQuLTPOrUT1ecr6E
 BgxMxlYoy8vu3hIYrG6/65mc9Qa6B+31r67Wmr8EdH/xJajOUIxAs7w+JzyQinFv
 576ZurbegUwBMjfS8CyfIdbpcBabgLjw4CfhXEZ5PnVO02z4LlT8izeVVyacb/uu
 SZECueEu+JJIgB9hmBvVsmwfKfXH7ss1al7+2pH2AzohZXIw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48durkxvex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Aug 2025 15:30:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1D85F4002D;
 Mon, 11 Aug 2025 15:29:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0449C73D3F6;
 Mon, 11 Aug 2025 15:28:54 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Aug
 2025 15:28:53 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Mon, 11 Aug 2025 15:28:49 +0200
MIME-Version: 1.0
Message-ID: <20250811-upstream_fix_dts_omm-v3-1-c4186b7667cb@foss.st.com>
X-B4-Tracking: v=1; b=H4sIABDwmWgC/4XNSw7CIBCA4asY1tIMWLC68h7GNC0Py4LSMEg0T
 e8u7UoXxuU/k/lmJmiiM0jOu5lEkx26MJY47HdEDd14N9Tp0oQDF9CApI8JUzSdb617tjphG7y
 nCkD28gQ1t4yU0ymast7Y66304DCF+Nq+ZLZO/4CZUUaNbBQTRtec64sNiBWmSgVPVjLzD4axH
 wwvDIC1QsBR9lp8M8uyvAEJ7sqLAQEAAA==
X-Change-ID: 20250806-upstream_fix_dts_omm-c006b69042f1
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-11_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3] arm64: dts: st: Add memory-region-names
 property for stm32mp257f-ev1
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

In order to set the AMCR register, which configures the
memory-region split between ospi1 and ospi2, we need to
identify the ospi instance.

By using memory-region-names, it allows to identify the
ospi instance this memory-region belongs to.

Fixes: cad2492de91c ("arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board")
Cc: stable@vger.kernel.org
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v3:
- Set again "Cc: <stable@vger.kernel.org>"
- Link to v2: https://lore.kernel.org/r/20250811-upstream_fix_dts_omm-v2-1-00ff55076bd5@foss.st.com

Changes in v2:
- Update commit message.
- Use correct memory-region-names value.
- Remove "Cc: <stable@vger.kernel.org>" tag as the fixed patch is not part of a LTS.
- Link to v1: https://lore.kernel.org/r/20250806-upstream_fix_dts_omm-v1-1-e68c15ed422d@foss.st.com
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 2f561ad4066544445e93db78557bc4be1c27095a..7bd8433c1b4344bb5d58193a5e6314f9ae89e0a4 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -197,6 +197,7 @@ &i2c8 {
 
 &ommanager {
 	memory-region = <&mm_ospi1>;
+	memory-region-names = "ospi1";
 	pinctrl-0 = <&ospi_port1_clk_pins_a
 		     &ospi_port1_io03_pins_a
 		     &ospi_port1_cs0_pins_a>;

---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250806-upstream_fix_dts_omm-c006b69042f1

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
