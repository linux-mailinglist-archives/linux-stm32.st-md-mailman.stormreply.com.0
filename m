Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF42B1B41E
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Aug 2025 15:09:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06107C3F92D;
	Tue,  5 Aug 2025 13:09:59 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 178EEC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Aug 2025 13:09:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 18B3A601D9;
 Tue,  5 Aug 2025 13:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396ACC4CEF0;
 Tue,  5 Aug 2025 13:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754399396;
 bh=Qyw2Seyv99FKHqkQGzgzhkf96Afcfp/hz1VcHx8L4aU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oa90mp6nH2jmdGDeDx1W6U4hN+VoFrpFYw8lSlcVrLD7Kstvd5GNfHl2W+ARRl/Ga
 55iTAvlm8ApdzRQ+/YVnX8SVLD5+zeItIpXqmnm9PHBhyo6w6VD0e7isyWKeAhvnmL
 b9mkh/z15OXSaT1aXtGJXO4bEYanDb6m5SHhIQ8r0gRg6EW8HjdXG1s7WY+JBf5oPv
 gKkXplf0G9px9l1bT0u/WECjJcj3mJnKuUtAt1UuMeUdulH0Tt1NBglRnjfG5DcT0n
 /ZHhp79srmnIb7ZleUdNF+3WYWlbreS9Kv58xWxnJCOq30ArtYOqmiSiEW9hIEC/QS
 DBUCEBVdOEDxw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Date: Tue,  5 Aug 2025 09:08:40 -0400
Message-Id: <20250805130945.471732-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250805130945.471732-1-sashal@kernel.org>
References: <20250805130945.471732-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Cc: Sasha Levin <sashal@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 6.16-5.4] pinctrl: stm32: Manage irq
	affinity settings
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

From: Cheick Traore <cheick.traore@foss.st.com>

[ Upstream commit 4c5cc2f65386e22166ce006efe515c667aa075e4 ]

Trying to set the affinity of the interrupts associated to stm32
pinctrl results in a write error.

Fill struct irq_chip::irq_set_affinity to use the default helper
function.

Signed-off-by: Cheick Traore <cheick.traore@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
Link: https://lore.kernel.org/20250610143042.295376-3-antonio.borneo@foss.st.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my analysis, here's my assessment:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Fixes a real bug**: The commit message explicitly states "Trying to
   set the affinity of the interrupts associated to stm32 pinctrl
   results in a write error." This is a functional bug that affects
   users trying to configure IRQ affinity on STM32 platforms.

2. **Small and contained fix**: The change is minimal - just adding a
   single line:
  ```c
  .irq_set_affinity = IS_ENABLED(CONFIG_SMP) ?
  irq_chip_set_affinity_parent : NULL,
  ```
  This is a one-line fix that adds the missing callback to the irq_chip
  structure.

3. **Follows established patterns**: My analysis shows that other
   GPIO/pinctrl drivers already implement this callback in the same way:
   - `drivers/pinctrl/renesas/pinctrl-rzg2l.c`
   - `drivers/gpio/gpio-thunderx.c`
   - `drivers/gpio/gpio-msc313.c`

   The STM32 driver was missing this standard callback that other
similar drivers have.

4. **No architectural changes**: This is purely a bug fix that enables
   existing kernel functionality (IRQ affinity setting) to work
   properly. It doesn't introduce new features or change any
   architecture.

5. **Minimal regression risk**: The fix uses the standard
   `irq_chip_set_affinity_parent` helper function that's already well-
   tested in the kernel. The conditional compilation with
   `IS_ENABLED(CONFIG_SMP)` ensures it's only enabled on SMP systems
   where it's relevant.

6. **Related to known issues**: My search found related commits like
   `3e17683ff4a8` ("irqchip/stm32-exti: Fix irq_set_affinity return
   value") showing that the STM32 platform has had IRQ affinity issues
   that needed fixing.

7. **Clear user impact**: Without this fix, users cannot set IRQ
   affinity for GPIO interrupts on STM32 platforms, which can impact
   system performance optimization and interrupt load balancing on
   multi-core STM32 systems.

The commit meets all the stable tree criteria: it fixes an important
bug, is small and self-contained, has minimal risk, and doesn't
introduce new functionality. This is exactly the type of fix that should
be backported to ensure stable kernels have proper functionality.

 drivers/pinctrl/stm32/pinctrl-stm32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index ba49d48c3a1d..e6ad63df82b7 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -411,6 +411,7 @@ static struct irq_chip stm32_gpio_irq_chip = {
 	.irq_set_wake	= irq_chip_set_wake_parent,
 	.irq_request_resources = stm32_gpio_irq_request_resources,
 	.irq_release_resources = stm32_gpio_irq_release_resources,
+	.irq_set_affinity = IS_ENABLED(CONFIG_SMP) ? irq_chip_set_affinity_parent : NULL,
 };
 
 static int stm32_gpio_domain_translate(struct irq_domain *d,
-- 
2.39.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
