Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 177CE6903D9
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Feb 2023 10:33:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB58EC6A5EA;
	Thu,  9 Feb 2023 09:33:54 +0000 (UTC)
Received: from mr85p00im-ztdg06011201.me.com (mr85p00im-ztdg06011201.me.com
 [17.58.23.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 314C5C6A5E8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Feb 2023 09:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1675934270; bh=7pXasyRfKVF9IUAegxYhrYLSu6imwBLW9zNCQeKHD28=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=gQAkvJMpUts7a8vDkqQd8GpQeoy7dmn5CdJoIVWcMt2TI05q7hZtVu7ymLgwmxtPW
 jYrQFag7YJqsQna1g/p3iooJtr6pIu9D+CFDfBPNJXscL12udNk6LMru2QFpGyaTyB
 OanYyBAZ//EDDKLCQD23RWvAPalvEdZuiu0q+SIgSG9blEkG85+9vQjn9glf8aFVCD
 7d4uXJyZe8rGsZNMz2KWBKkIIYmcTSm3MYTmK8yRrsHhwhhb58rXPelT3/mb08wHh5
 4KanEtSETSy7fxWuJTtssk2AecLCWWGR24r1yl8P/wTWE10lPUIe8bWX5+WN+eCboR
 xwIJb9qWOYBbA==
Received: from localhost (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
 by mr85p00im-ztdg06011201.me.com (Postfix) with ESMTPSA id
 B9FD79622C0; Thu,  9 Feb 2023 09:17:49 +0000 (UTC)
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
Date: Thu,  9 Feb 2023 10:16:48 +0100
Message-Id: <20230209091659.1409-1-avolmat@me.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: C2vTVmPR7z1gInH5yviJ2h-bYafnNbiR
X-Proofpoint-GUID: C2vTVmPR7z1gInH5yviJ2h-bYafnNbiR
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2302090088
X-Mailman-Approved-At: Thu, 09 Feb 2023 09:33:53 +0000
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Alain Volmat <avolmat@me.com>
Subject: [Linux-stm32] [PATCH 00/11] ARM: removal of STiH415/STiH416
	remainings bits
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

Most of code in order to support STiH415 and STiH416 have already
been removed from the kernel in 2016, however few bits are still
remainings.
This serie removes the last pieces of support for STiH415, STiH416
and STiD127.

Alain Volmat (11):
  Documentation: arm: remove stih415/stih416 related entries
  ARM: sti: removal of stih415/stih416 related entries
  irqchip/st: remove stih415/stih416 and stid127 platforms support
  dt-bindings: irqchip: sti: remove stih415/stih416 and stid127
  dt-bindings: arm: sti: remove bindings for stih415 and stih416
  thermal/drivers/st: remove syscfg based driver
  net: ethernet: stmmac: dwmac-sti: remove stih415/stih416/stid127
  dt-bindings: net: dwmac: sti: remove stih415/sti416/stid127
  dt-bindings: reset: remove stih415/stih416 reset bindings
  dt-bindings: clock: remove stih416 bindings
  ARM: debug: removal of STiH415/STiH416 related debug uart

 Documentation/arm/index.rst                   |   2 -
 Documentation/arm/sti/overview.rst            |  10 +-
 Documentation/arm/sti/stih415-overview.rst    |  14 --
 Documentation/arm/sti/stih416-overview.rst    |  13 --
 .../devicetree/bindings/arm/sti.yaml          |   2 -
 .../st,sti-irq-syscfg.txt                     |   9 +-
 .../devicetree/bindings/net/sti-dwmac.txt     |   3 +-
 arch/arm/Kconfig.debug                        |  28 ---
 arch/arm/mach-sti/Kconfig                     |  20 +-
 arch/arm/mach-sti/board-dt.c                  |   2 -
 drivers/irqchip/irq-st.c                      |  15 --
 .../net/ethernet/stmicro/stmmac/dwmac-sti.c   |  60 +-----
 drivers/thermal/st/Kconfig                    |   4 -
 drivers/thermal/st/Makefile                   |   1 -
 drivers/thermal/st/st_thermal_syscfg.c        | 174 ------------------
 include/dt-bindings/clock/stih416-clks.h      |  17 --
 include/dt-bindings/reset/stih415-resets.h    |  28 ---
 include/dt-bindings/reset/stih416-resets.h    |  52 ------
 18 files changed, 8 insertions(+), 446 deletions(-)
 delete mode 100644 Documentation/arm/sti/stih415-overview.rst
 delete mode 100644 Documentation/arm/sti/stih416-overview.rst
 delete mode 100644 drivers/thermal/st/st_thermal_syscfg.c
 delete mode 100644 include/dt-bindings/clock/stih416-clks.h
 delete mode 100644 include/dt-bindings/reset/stih415-resets.h
 delete mode 100644 include/dt-bindings/reset/stih416-resets.h

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
