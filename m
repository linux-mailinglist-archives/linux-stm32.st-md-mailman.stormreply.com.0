Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A216903DB
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Feb 2023 10:33:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03782C6A5F1;
	Thu,  9 Feb 2023 09:33:55 +0000 (UTC)
Received: from mr85p00im-hyfv06021401.me.com (mr85p00im-hyfv06021401.me.com
 [17.58.23.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C2B1C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Feb 2023 09:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1675934298; bh=XD/z4m8ShfTjdX5zyRnwyZNUrruVN7/aqLfYSreiI8w=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=SrUC3+R+0idJacNKqunB9TmAMvJMq/z0AaJadeiDYV+rM16jxs6YaPuUFyiPmIfFG
 CZg3z30XrvHeO8zVoCkqNAT1AmfIKrykWLmGmJG4iNULQZGnjJoZ4ajvZZcfnmcWY9
 rCsPi0Uc/U50mPoJdmY+33oQUJ1LFJpkwAqQV9JZuZUGDfIb6G1TxMHKJsR24cZaby
 WubrpXhZf/qhcg+ngwhr6HIyjuNj8/6MdpV3pqoths6HG1z3ie5eGqi4wLWtv457vt
 DDpPLSFTpJxn/typJ6tMk7g5igRR3JtGU7EthPtpX4zuDl9+teH0BxSoij89ioIE+5
 yAnUliqcHaXIQ==
Received: from localhost (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
 by mr85p00im-hyfv06021401.me.com (Postfix) with ESMTPSA id
 92EDD3039F87; Thu,  9 Feb 2023 09:18:17 +0000 (UTC)
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
Date: Thu,  9 Feb 2023 10:16:50 +0100
Message-Id: <20230209091659.1409-3-avolmat@me.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209091659.1409-1-avolmat@me.com>
References: <20230209091659.1409-1-avolmat@me.com>
MIME-Version: 1.0
X-Proofpoint-GUID: Z1xhIilBMX_QQ3CxGK0zZvZBSCCIY3zb
X-Proofpoint-ORIG-GUID: Z1xhIilBMX_QQ3CxGK0zZvZBSCCIY3zb
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.816,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2020-02-14=5F02,2022-01-18=5F01,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 phishscore=0
 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2302090088
X-Mailman-Approved-At: Thu, 09 Feb 2023 09:33:53 +0000
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Alain Volmat <avolmat@me.com>
Subject: [Linux-stm32] [PATCH 02/11] ARM: sti: removal of stih415/stih416
	related entries
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

ST's STiH415 and STiH416 platforms have already been removed since
a while.  Remove some remaining bits within the mach-sti.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 arch/arm/mach-sti/Kconfig    | 20 +-------------------
 arch/arm/mach-sti/board-dt.c |  2 --
 2 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/arch/arm/mach-sti/Kconfig b/arch/arm/mach-sti/Kconfig
index b2d45cf10a3c..609957dead98 100644
--- a/arch/arm/mach-sti/Kconfig
+++ b/arch/arm/mach-sti/Kconfig
@@ -19,31 +19,13 @@ menuconfig ARCH_STI
 	select PL310_ERRATA_769419 if CACHE_L2X0
 	select RESET_CONTROLLER
 	help
-	  Include support for STMicroelectronics' STiH415/416, STiH407/10 and
+	  Include support for STMicroelectronics' STiH407/10 and
 	  STiH418 family SoCs using the Device Tree for discovery.  More
 	  information can be found in Documentation/arm/sti/ and
 	  Documentation/devicetree.
 
 if ARCH_STI
 
-config SOC_STIH415
-	bool "STiH415 STMicroelectronics Consumer Electronics family"
-	default y
-	help
-	  This enables support for STMicroelectronics Digital Consumer
-	  Electronics family StiH415 parts, primarily targeted at set-top-box
-	  and other digital audio/video applications using Flattned Device
-	  Trees.
-
-config SOC_STIH416
-	bool "STiH416 STMicroelectronics Consumer Electronics family"
-	default y
-	help
-	  This enables support for STMicroelectronics Digital Consumer
-	  Electronics family StiH416 parts, primarily targeted at set-top-box
-	  and other digital audio/video applications using Flattened Device
-	  Trees.
-
 config SOC_STIH407
 	bool "STiH407 STMicroelectronics Consumer Electronics family"
 	default y
diff --git a/arch/arm/mach-sti/board-dt.c b/arch/arm/mach-sti/board-dt.c
index ffecbf29646f..8c313f07bd02 100644
--- a/arch/arm/mach-sti/board-dt.c
+++ b/arch/arm/mach-sti/board-dt.c
@@ -12,8 +12,6 @@
 #include "smp.h"
 
 static const char *const stih41x_dt_match[] __initconst = {
-	"st,stih415",
-	"st,stih416",
 	"st,stih407",
 	"st,stih410",
 	"st,stih418",
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
