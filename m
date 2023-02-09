Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A186903E2
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Feb 2023 10:33:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3738C6A606;
	Thu,  9 Feb 2023 09:33:55 +0000 (UTC)
Received: from mr85p00im-ztdg06011201.me.com (mr85p00im-ztdg06011201.me.com
 [17.58.23.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9877C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Feb 2023 09:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1675934352; bh=W/tQKYd86i5nc4KgjfqJW6Leh53d55gvFFQz2lW1qD4=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=n9QgbhF5xfWfwI3MRDgrGUMMLZHrOKyxLp9VnhauH8AAj8kdgktQAT2y+DXYLkoHe
 XTZ/1omOajE5Gx9lzBMg4E7/3E4avsc+DZdqG2a/cXVcisHxyVVJQdTeF7sIKfyjir
 IzWR60e5jX5RkdiLK2SwAi6hQEid/RGobXGWzRv9gONXb37Sr+y9SW+IDaqEgRxDeM
 wLgyOs7q7BWTJwEk/Cx7fLUFTVPuHkPNyJH9mlrUZ5a0tCSaUJ5w3gj1eiSlywCjlI
 ebsSPQvEZp0Stl/dKmlbzEqf+jm7mJaEG2D2RT6DwNbyFbz+YIS0km2a1Yv04V35d/
 4wq0XDYvxgxsg==
Received: from localhost (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
 by mr85p00im-ztdg06011201.me.com (Postfix) with ESMTPSA id
 D25A796235D; Thu,  9 Feb 2023 09:19:11 +0000 (UTC)
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
Date: Thu,  9 Feb 2023 10:16:57 +0100
Message-Id: <20230209091659.1409-10-avolmat@me.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209091659.1409-1-avolmat@me.com>
References: <20230209091659.1409-1-avolmat@me.com>
MIME-Version: 1.0
X-Proofpoint-GUID: SZKA_EDCIfu3HN1OxMf2qmWOrx9-D0Lf
X-Proofpoint-ORIG-GUID: SZKA_EDCIfu3HN1OxMf2qmWOrx9-D0Lf
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0
 mlxlogscore=865 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2302090088
X-Mailman-Approved-At: Thu, 09 Feb 2023 09:33:54 +0000
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Alain Volmat <avolmat@me.com>
Subject: [Linux-stm32] [PATCH 09/11] dt-bindings: reset: remove
	stih415/stih416 reset bindings
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

Remove the stih415 and stih416 reset dt-bindings since those
two platforms are no more supported.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 include/dt-bindings/reset/stih415-resets.h | 28 ------------
 include/dt-bindings/reset/stih416-resets.h | 52 ----------------------
 2 files changed, 80 deletions(-)
 delete mode 100644 include/dt-bindings/reset/stih415-resets.h
 delete mode 100644 include/dt-bindings/reset/stih416-resets.h

diff --git a/include/dt-bindings/reset/stih415-resets.h b/include/dt-bindings/reset/stih415-resets.h
deleted file mode 100644
index 96f7831a1db0..000000000000
--- a/include/dt-bindings/reset/stih415-resets.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * This header provides constants for the reset controller
- * based peripheral powerdown requests on the STMicroelectronics
- * STiH415 SoC.
- */
-#ifndef _DT_BINDINGS_RESET_CONTROLLER_STIH415
-#define _DT_BINDINGS_RESET_CONTROLLER_STIH415
-
-#define STIH415_EMISS_POWERDOWN		0
-#define STIH415_NAND_POWERDOWN		1
-#define STIH415_KEYSCAN_POWERDOWN	2
-#define STIH415_USB0_POWERDOWN		3
-#define STIH415_USB1_POWERDOWN		4
-#define STIH415_USB2_POWERDOWN		5
-#define STIH415_SATA0_POWERDOWN		6
-#define STIH415_SATA1_POWERDOWN		7
-#define STIH415_PCIE_POWERDOWN		8
-
-#define STIH415_ETH0_SOFTRESET		0
-#define STIH415_ETH1_SOFTRESET		1
-#define STIH415_IRB_SOFTRESET		2
-#define STIH415_USB0_SOFTRESET		3
-#define STIH415_USB1_SOFTRESET		4
-#define STIH415_USB2_SOFTRESET		5
-#define STIH415_KEYSCAN_SOFTRESET	6
-
-#endif /* _DT_BINDINGS_RESET_CONTROLLER_STIH415 */
diff --git a/include/dt-bindings/reset/stih416-resets.h b/include/dt-bindings/reset/stih416-resets.h
deleted file mode 100644
index f682c906ed5a..000000000000
--- a/include/dt-bindings/reset/stih416-resets.h
+++ /dev/null
@@ -1,52 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * This header provides constants for the reset controller
- * based peripheral powerdown requests on the STMicroelectronics
- * STiH416 SoC.
- */
-#ifndef _DT_BINDINGS_RESET_CONTROLLER_STIH416
-#define _DT_BINDINGS_RESET_CONTROLLER_STIH416
-
-#define STIH416_EMISS_POWERDOWN		0
-#define STIH416_NAND_POWERDOWN		1
-#define STIH416_KEYSCAN_POWERDOWN	2
-#define STIH416_USB0_POWERDOWN		3
-#define STIH416_USB1_POWERDOWN		4
-#define STIH416_USB2_POWERDOWN		5
-#define STIH416_USB3_POWERDOWN		6
-#define STIH416_SATA0_POWERDOWN		7
-#define STIH416_SATA1_POWERDOWN		8
-#define STIH416_PCIE0_POWERDOWN		9
-#define STIH416_PCIE1_POWERDOWN		10
-
-#define STIH416_ETH0_SOFTRESET		0
-#define STIH416_ETH1_SOFTRESET		1
-#define STIH416_IRB_SOFTRESET		2
-#define STIH416_USB0_SOFTRESET		3
-#define STIH416_USB1_SOFTRESET		4
-#define STIH416_USB2_SOFTRESET		5
-#define STIH416_USB3_SOFTRESET		6
-#define STIH416_SATA0_SOFTRESET		7
-#define STIH416_SATA1_SOFTRESET		8
-#define STIH416_PCIE0_SOFTRESET		9
-#define STIH416_PCIE1_SOFTRESET		10
-#define STIH416_AUD_DAC_SOFTRESET	11
-#define STIH416_HDTVOUT_SOFTRESET	12
-#define STIH416_VTAC_M_RX_SOFTRESET	13
-#define STIH416_VTAC_A_RX_SOFTRESET	14
-#define STIH416_SYNC_HD_SOFTRESET	15
-#define STIH416_SYNC_SD_SOFTRESET	16
-#define STIH416_BLITTER_SOFTRESET	17
-#define STIH416_GPU_SOFTRESET		18
-#define STIH416_VTAC_M_TX_SOFTRESET	19
-#define STIH416_VTAC_A_TX_SOFTRESET	20
-#define STIH416_VTG_AUX_SOFTRESET	21
-#define STIH416_JPEG_DEC_SOFTRESET	22
-#define STIH416_HVA_SOFTRESET		23
-#define STIH416_COMPO_M_SOFTRESET	24
-#define STIH416_COMPO_A_SOFTRESET	25
-#define STIH416_VP8_DEC_SOFTRESET	26
-#define STIH416_VTG_MAIN_SOFTRESET	27
-#define STIH416_KEYSCAN_SOFTRESET	28
-
-#endif /* _DT_BINDINGS_RESET_CONTROLLER_STIH416 */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
