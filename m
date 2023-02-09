Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 165A86903E3
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Feb 2023 10:33:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA97AC6A609;
	Thu,  9 Feb 2023 09:33:55 +0000 (UTC)
Received: from mr85p00im-ztdg06021101.me.com (mr85p00im-ztdg06021101.me.com
 [17.58.23.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA8DAC6A5E9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Feb 2023 09:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1675934355; bh=XKcEoiU2gkIsuf8FhslnaifLYaGCRhQ1TwjiGMV9VfI=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=CG5JwAgrBupVZ01JDGld5KaTSiptcgPQB1En7wRekjQeEDQNzSi6kGY+ANBrkLzXK
 RvxLX2w5ClVXMLSpH2jBRCmF04WwIq7Vg7rDaLtXRyw/mvA6T1F1/rO3j6IjwW3zgL
 BSEHWgA7lw8XlrshKdX2taOdqDYYd2wryuxhNuvwaZZ4NwkCSHDXYel0t5T3el6355
 STgoy0w76an0YzoAKdJrOZMeg923Gz5HtBzArEqDQrWGVgpV+rtzSWiTQj30/g1fUu
 RnMRKaoJgCulSIBH8waq+KIR+4z9SeLBIf/67b6ANcIM4TKUweBvWRAEGE2mZO6+tT
 LJyolwwr70BDQ==
Received: from localhost (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
 by mr85p00im-ztdg06021101.me.com (Postfix) with ESMTPSA id
 08FBA81141; Thu,  9 Feb 2023 09:19:15 +0000 (UTC)
From: Alain Volmat <avolmat@me.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Date: Thu,  9 Feb 2023 10:16:58 +0100
Message-Id: <20230209091659.1409-11-avolmat@me.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209091659.1409-1-avolmat@me.com>
References: <20230209091659.1409-1-avolmat@me.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: e1PY_4y3to8Pai-Bcf2MWlipBBW67qqk
X-Proofpoint-GUID: e1PY_4y3to8Pai-Bcf2MWlipBBW67qqk
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-14=5F01:2022-01-14=5F01,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=954 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2302090088
X-Mailman-Approved-At: Thu, 09 Feb 2023 09:33:54 +0000
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Alain Volmat <avolmat@me.com>
Subject: [Linux-stm32] [PATCH 10/11] dt-bindings: clock: remove stih416
	bindings
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

Remove the stih416 clock dt-bindings since this platform is no
more supported.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 include/dt-bindings/clock/stih416-clks.h | 17 -----------------
 1 file changed, 17 deletions(-)
 delete mode 100644 include/dt-bindings/clock/stih416-clks.h

diff --git a/include/dt-bindings/clock/stih416-clks.h b/include/dt-bindings/clock/stih416-clks.h
deleted file mode 100644
index 74302278024e..000000000000
--- a/include/dt-bindings/clock/stih416-clks.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * This header provides constants clk index STMicroelectronics
- * STiH416 SoC.
- */
-#ifndef _CLK_STIH416
-#define _CLK_STIH416
-
-/* CLOCKGEN A0 */
-#define CLK_ICN_REG		0
-#define CLK_ETH1_PHY		4
-
-/* CLOCKGEN A1 */
-#define CLK_ICN_IF_2		0
-#define CLK_GMAC0_PHY		3
-
-#endif
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
