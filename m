Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B6E407726
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Sep 2021 15:14:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21043C5A4D8;
	Sat, 11 Sep 2021 13:14:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03C9AC5A4D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Sep 2021 13:14:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 856E86137E;
 Sat, 11 Sep 2021 13:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631366066;
 bh=sLEhvPGHt/OVIy/lMim2xitRpoLNc3mWtdRlyNS81oM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ajML2CtJncL8gHa7dsLbijVON6AOvEZvo7dso41Xolu3Xazxq6eda7DMluaKGbsDB
 Fs7qe3n6Cod2xA9F2siA6jWANsfzkoe2PwbrwrLWjlSeLVNPH6zyYs75zZSlF603Sq
 RFh+dL1BWqHeGIctqzXhajCd1uS6iUFBXT1r2Ntp+VDgNu+k5MMh6wBBdbQtoKDcrM
 gTrTAlWaFOB/4Rq5g1bwYzyIhyVy5j1nJjsBRc7F7DMurY41WvXOBSxXJOUG2SNBhv
 /KMV/nC5x0y2Dgh0kqRsef+Drp2pzXLiZ2VYpZN/SQrPs5Ib5A64n5UMXTHWqT2ip8
 wD4bVLCjqYi1Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat, 11 Sep 2021 09:14:20 -0400
Message-Id: <20210911131423.286235-2-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210911131423.286235-1-sashal@kernel.org>
References: <20210911131423.286235-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 4.9 2/4] mfd: Don't use
	irq_create_mapping() to resolve a mapping
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

From: Marc Zyngier <maz@kernel.org>

[ Upstream commit 9ff80e2de36d0554e3a6da18a171719fe8663c17 ]

Although irq_create_mapping() is able to deal with duplicate
mappings, it really isn't supposed to be a substitute for
irq_find_mapping(), and can result in allocations that take place
in atomic context if the mapping didn't exist.

Fix the handful of MFD drivers that use irq_create_mapping() in
interrupt context by using irq_find_mapping() instead.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mfd/ab8500-core.c | 2 +-
 drivers/mfd/stmpe.c       | 4 ++--
 drivers/mfd/tc3589x.c     | 2 +-
 drivers/mfd/wm8994-irq.c  | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index 2f212bdc187a..83484c43b1dc 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -489,7 +489,7 @@ static int ab8500_handle_hierarchical_line(struct ab8500 *ab8500,
 		if (line == AB8540_INT_GPIO43F || line == AB8540_INT_GPIO44F)
 			line += 1;
 
-		handle_nested_irq(irq_create_mapping(ab8500->domain, line));
+		handle_nested_irq(irq_find_mapping(ab8500->domain, line));
 	}
 
 	return 0;
diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index b0c7bcdaf5df..61fb4873c061 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1033,7 +1033,7 @@ static irqreturn_t stmpe_irq(int irq, void *data)
 
 	if (variant->id_val == STMPE801_ID ||
 	    variant->id_val == STMPE1600_ID) {
-		int base = irq_create_mapping(stmpe->domain, 0);
+		int base = irq_find_mapping(stmpe->domain, 0);
 
 		handle_nested_irq(base);
 		return IRQ_HANDLED;
@@ -1061,7 +1061,7 @@ static irqreturn_t stmpe_irq(int irq, void *data)
 		while (status) {
 			int bit = __ffs(status);
 			int line = bank * 8 + bit;
-			int nestedirq = irq_create_mapping(stmpe->domain, line);
+			int nestedirq = irq_find_mapping(stmpe->domain, line);
 
 			handle_nested_irq(nestedirq);
 			status &= ~(1 << bit);
diff --git a/drivers/mfd/tc3589x.c b/drivers/mfd/tc3589x.c
index 274bf39968aa..96187c1e5f8f 100644
--- a/drivers/mfd/tc3589x.c
+++ b/drivers/mfd/tc3589x.c
@@ -187,7 +187,7 @@ static irqreturn_t tc3589x_irq(int irq, void *data)
 
 	while (status) {
 		int bit = __ffs(status);
-		int virq = irq_create_mapping(tc3589x->domain, bit);
+		int virq = irq_find_mapping(tc3589x->domain, bit);
 
 		handle_nested_irq(virq);
 		status &= ~(1 << bit);
diff --git a/drivers/mfd/wm8994-irq.c b/drivers/mfd/wm8994-irq.c
index 18710f3b5c53..2c58d9b99a39 100644
--- a/drivers/mfd/wm8994-irq.c
+++ b/drivers/mfd/wm8994-irq.c
@@ -159,7 +159,7 @@ static irqreturn_t wm8994_edge_irq(int irq, void *data)
 	struct wm8994 *wm8994 = data;
 
 	while (gpio_get_value_cansleep(wm8994->pdata.irq_gpio))
-		handle_nested_irq(irq_create_mapping(wm8994->edge_irq, 0));
+		handle_nested_irq(irq_find_mapping(wm8994->edge_irq, 0));
 
 	return IRQ_HANDLED;
 }
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
