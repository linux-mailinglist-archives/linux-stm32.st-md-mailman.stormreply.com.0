Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1F344BDE4
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Nov 2021 10:36:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BF15C5EC75;
	Wed, 10 Nov 2021 09:36:01 +0000 (UTC)
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A94D9C5EC6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 08:32:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.87,223,1631545200"; d="scan'208";a="99778047"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 10 Nov 2021 17:32:05 +0900
Received: from localhost.localdomain (unknown [10.226.92.40])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 52DB6400C4E7;
 Wed, 10 Nov 2021 17:32:02 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Date: Wed, 10 Nov 2021 08:31:52 +0000
Message-Id: <20211110083152.31144-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211110083152.31144-1-biju.das.jz@bp.renesas.com>
References: <20211110083152.31144-1-biju.das.jz@bp.renesas.com>
X-Mailman-Approved-At: Wed, 10 Nov 2021 09:36:00 +0000
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] clocksource/drivers/renesas-ostm: Add
	RZ/G2L OSTM support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

RZ/G2L SoC has Generic Timer Module(a.k.a OSTM) which needs to
deassert the reset line before accessing any registers.

This patch adds an entry point for RZ/G2L so that we can deassert
the reset line in probe callback.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clocksource/renesas-ostm.c | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 3d06ba66008c..6b28c45c86f7 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -9,6 +9,8 @@
 #include <linux/clk.h>
 #include <linux/clockchips.h>
 #include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/sched_clock.h>
 #include <linux/slab.h>
 
@@ -209,3 +211,39 @@ static int __init ostm_init(struct device_node *np)
 }
 
 TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
+
+#ifdef CONFIG_ARCH_R9A07G044
+static int __init ostm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct reset_control *rstc;
+	int ret;
+
+	rstc = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc), "failed to get reset");
+
+	reset_control_deassert(rstc);
+
+	ret = ostm_init(dev->of_node);
+	if (ret) {
+		reset_control_assert(rstc);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id ostm_of_table[] = {
+	{ .compatible = "renesas,rzg2l-ostm", },
+	{ }
+};
+
+static struct platform_driver ostm_device_driver = {
+	.driver		= {
+		.name	= "rzg2l_ostm",
+		.of_match_table = of_match_ptr(ostm_of_table),
+	},
+};
+builtin_platform_driver_probe(ostm_device_driver, ostm_probe);
+#endif
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
