Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEEE5AFE56
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Sep 2022 10:01:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A91AAC62D6D;
	Wed,  7 Sep 2022 08:01:09 +0000 (UTC)
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22F24C03FC0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Sep 2022 08:01:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,296,1654527600"; d="scan'208";a="131952805"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 07 Sep 2022 17:01:04 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3CA06400A8A2;
 Wed,  7 Sep 2022 17:01:00 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed,  7 Sep 2022 09:00:56 +0100
Message-Id: <20220907080056.3460-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH] clocksource/drivers/renesas-ostm: Add
	support for RZ/V2L SoC
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

The OSTM block is identical on Renesas RZ/G2L and RZ/V2L SoC's, so instead
of adding dependency for each SoC's add dependency on ARCH_RZG2L. The
ARCH_RZG2L config option is already selected by ARCH_R9A07G044 and
ARCH_R9A07G054.

With the above change OSTM will be enabled on RZ/V2L SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Hi All,

Resending this patch as this hasn't been merged and I haven't received any
feedback from the maintainer. There are no code changes as compared to v1
[0] (I have included the RB tag from Geert).

[0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220406072417.14185-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar
---
 drivers/clocksource/renesas-ostm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 21d1392637b8..8da972dc1713 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -224,7 +224,7 @@ static int __init ostm_init(struct device_node *np)
 
 TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
 
-#ifdef CONFIG_ARCH_R9A07G044
+#ifdef CONFIG_ARCH_RZG2L
 static int __init ostm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
