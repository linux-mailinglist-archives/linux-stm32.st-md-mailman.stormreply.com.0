Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 436F76903DA
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Feb 2023 10:33:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF518C6A5EE;
	Thu,  9 Feb 2023 09:33:54 +0000 (UTC)
Received: from mr85p00im-hyfv06021301.me.com (mr85p00im-hyfv06021301.me.com
 [17.58.23.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB051C6A5E8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Feb 2023 09:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1675934294; bh=fKfon97iRdA8hONSJw4rAYjTeMrB0lcLvBVxv7x5uFI=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=tXaCT+kUjCu4Ej8v/nGvOuhLZSG0/qu7/iJhwCHTuwRfwMw58kImGknThco7uD2mJ
 z/EFZYHIgFrgc89siFXz9evVW3+Ml8gLiabAVM60bJrGlV3zjxNp8y6IBLvZQEvwTO
 ajkU76tJaSjgSfAUeBZuiYjyEVOOoS3BXgQpVaiRsut6SqiCtMEG+VW0csqV0kkhzZ
 rzqhpb1IM6+JMDmom96VeaTAgG0PxnTEnC3Xnm1Yzv4OP+UM9ZaF/797iFXPePlQh1
 GxQ3YsJyvF2mbeeJCeyYwpPZVv/p7iNYsz1cSK0tySLhfMrN9E+t5QtWq3Scw7QBD7
 HIdycWis1SVhg==
Received: from localhost (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
 by mr85p00im-hyfv06021301.me.com (Postfix) with ESMTPSA id
 CEB2D21512D0; Thu,  9 Feb 2023 09:18:13 +0000 (UTC)
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
Date: Thu,  9 Feb 2023 10:16:49 +0100
Message-Id: <20230209091659.1409-2-avolmat@me.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209091659.1409-1-avolmat@me.com>
References: <20230209091659.1409-1-avolmat@me.com>
MIME-Version: 1.0
X-Proofpoint-GUID: xV8W_Ts5GUg7FdbjkxVSEpo5WGNTiTsX
X-Proofpoint-ORIG-GUID: xV8W_Ts5GUg7FdbjkxVSEpo5WGNTiTsX
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2302090088
X-Mailman-Approved-At: Thu, 09 Feb 2023 09:33:53 +0000
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Alain Volmat <avolmat@me.com>
Subject: [Linux-stm32] [PATCH 01/11] Documentation: arm: remove
	stih415/stih416 related entries
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

ST's STiH415 and STiH416 platforms support have been removed since
a long time already.  This commit updates the sti related documentation
overview to remove related entries and update the sti part to add
STiH407/STiH410 and STiH418 platforms which are still actively
supported.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 Documentation/arm/index.rst                |  2 --
 Documentation/arm/sti/overview.rst         | 10 +++-------
 Documentation/arm/sti/stih415-overview.rst | 14 --------------
 Documentation/arm/sti/stih416-overview.rst | 13 -------------
 4 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/arm/sti/stih415-overview.rst
 delete mode 100644 Documentation/arm/sti/stih416-overview.rst

diff --git a/Documentation/arm/index.rst b/Documentation/arm/index.rst
index 8c636d4a061f..e70fc72ef136 100644
--- a/Documentation/arm/index.rst
+++ b/Documentation/arm/index.rst
@@ -70,11 +70,9 @@ SoC-specific documents
 
    spear/overview
 
-   sti/stih416-overview
    sti/stih407-overview
    sti/stih418-overview
    sti/overview
-   sti/stih415-overview
 
    vfp/release-notes
 
diff --git a/Documentation/arm/sti/overview.rst b/Documentation/arm/sti/overview.rst
index 70743617a74f..ae16aced800f 100644
--- a/Documentation/arm/sti/overview.rst
+++ b/Documentation/arm/sti/overview.rst
@@ -7,22 +7,18 @@ Introduction
 
   The ST Microelectronics Multimedia and Application Processors range of
   CortexA9 System-on-Chip are supported by the 'STi' platform of
-  ARM Linux. Currently STiH415, STiH416 SOCs are supported with both
-  B2000 and B2020 Reference boards.
+  ARM Linux. Currently STiH407, STiH410 and STiH418 are supported.
 
 
 configuration
 -------------
 
-  A generic configuration is provided for both STiH415/416, and can be used as the
-  default by::
-
-	make stih41x_defconfig
+  The configuration for the STi platform is supported via the multi_v7_defconfig.
 
 Layout
 ------
 
-  All the files for multiple machine families (STiH415, STiH416, and STiG125)
+  All the files for multiple machine families (STiH407, STiH410, and STiH418)
   are located in the platform code contained in arch/arm/mach-sti
 
   There is a generic board board-dt.c in the mach folder which support
diff --git a/Documentation/arm/sti/stih415-overview.rst b/Documentation/arm/sti/stih415-overview.rst
deleted file mode 100644
index b67452d610c4..000000000000
--- a/Documentation/arm/sti/stih415-overview.rst
+++ /dev/null
@@ -1,14 +0,0 @@
-================
-STiH415 Overview
-================
-
-Introduction
-------------
-
-    The STiH415 is the next generation of HD, AVC set-top box processors
-    for satellite, cable, terrestrial and IP-STB markets.
-
-    Features:
-
-    - ARM Cortex-A9 1.0 GHz, dual-core CPU
-    - SATA2x2,USB 2.0x3, PCIe, Gbit Ethernet MACx2
diff --git a/Documentation/arm/sti/stih416-overview.rst b/Documentation/arm/sti/stih416-overview.rst
deleted file mode 100644
index 93f17d74d8db..000000000000
--- a/Documentation/arm/sti/stih416-overview.rst
+++ /dev/null
@@ -1,13 +0,0 @@
-================
-STiH416 Overview
-================
-
-Introduction
-------------
-
-    The STiH416 is the next generation of HD, AVC set-top box processors
-    for satellite, cable, terrestrial and IP-STB markets.
-
-    Features
-    - ARM Cortex-A9 1.2 GHz dual core CPU
-    - SATA2x2,USB 2.0x3, PCIe, Gbit Ethernet MACx2
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
