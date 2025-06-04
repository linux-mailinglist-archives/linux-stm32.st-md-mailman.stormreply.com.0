Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 446C7ACDCDE
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Jun 2025 13:49:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD25DC32EA8;
	Wed,  4 Jun 2025 11:49:36 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFAC7C32E93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Jun 2025 11:49:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 968F4A50460;
 Wed,  4 Jun 2025 11:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1699FC4CEE7;
 Wed,  4 Jun 2025 11:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749037774;
 bh=4YpqR/oThvhMVs76qJVATQq41r8mEVz6PYiOWFGh/YM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ipDwMw2KIHeut7SfDYdFnV7kuraDOosTSSqj7googBlS16KunQrGqQcTKOW7wOn1X
 q4FSZkIO+7lXbOblr0hHvlVRk7tXmmeMTg8/0YmAY35ErAIz32TA6jUzwNmDTxtq0w
 jOu03DRMysDHYYd6YdTsdqaTkuWZzfdC+ngoKFLa2YWsEQ41WuTDDk0ebVoi8UrjI8
 Y1PXEr1x3n/pQQIbCLiBdkiz2iPKet8WxDeibHQo8shBYeaVMXHHgBs+uhlPTrOwHi
 DObHV0hnZB2BocEtDeDcQnNiCxfJsJZYZIyUlVjaopu2b/mvcFePF/RszTgZkHv6ET
 GTSM5OfO0N9Xw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Date: Wed,  4 Jun 2025 07:49:17 -0400
Message-Id: <20250604114923.208380-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604114923.208380-1-sashal@kernel.org>
References: <20250604114923.208380-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Cc: Sasha Levin <sashal@kernel.org>, linux-watchdog@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-stm32@st-md-mailman.stormreply.com, Guenter Roeck <linux@roeck-us.net>
Subject: [Linux-stm32] [PATCH AUTOSEL 6.15 4/9] watchdog: stm32: Fix wakeup
	source leaks on device unbind
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

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

[ Upstream commit b6f8a417e17f1929bb8e7e6ba9f4677f1f3ce364 ]

Device can be unbound or probe can fail, so driver must also release
memory for the wakeup source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20250406203531.61322-1-krzysztof.kozlowski@linaro.org
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** Based on my comprehensive analysis of the commit and examination
of the Linux kernel repository, this commit should be backported to
stable kernel trees. ## Analysis of the Commit ### Nature of the Bug Fix
This commit addresses a **memory leak** in the STM32 watchdog driver's
wakeup source handling. The change is minimal but important: ```c //
Before: ret = device_init_wakeup(dev, true); // After: ret =
devm_device_init_wakeup(dev); ``` The original code creates a wakeup
source using `device_init_wakeup()` but never properly releases it when
the device is unbound or the driver is removed. The fix uses
`devm_device_init_wakeup()`, which automatically handles cleanup through
the device-managed resource framework. ### Strong Alignment with Similar
Backported Commits This commit follows **exactly the same pattern** as
the similar commits #1 and #2 that were marked as **"Backport Status:
YES"**: - **GPIO mpc8xxx commit**: Also changed `device_init_wakeup(dev,
true)` to `devm_device_init_wakeup(dev)` and was explicitly marked for
stable with `Cc: stable@vger.kernel.org` - **GPIO zynq commit**: Added
proper cleanup with `device_init_wakeup(&pdev->dev, 0)` in the remove
function, also marked for stable ### Key Factors Supporting Backporting
1. **Clear Bug Fix**: Fixes a definitive memory leak - each time the
device is unbound, wakeup source memory (struct wakeup_source, device
name strings, sysfs entries) is not freed 2. **Minimal Risk**: The
change is extremely low-risk: - `devm_device_init_wakeup()` is just a
wrapper that provides automatic cleanup - No functional behavior changes
during normal operation - Only adds proper resource management on device
removal 3. **Small and Contained**: Single line change with no
architectural implications 4. **Part of Systematic Cleanup**: My
analysis of the kernel repository revealed this is part of a larger
cleanup effort with 10+ similar fixes across different subsystems in
2024-2025 5. **Real Impact**: While not critical, the leak affects: -
Embedded systems with limited memory - Development environments with
frequent driver loading/unloading - Systems that dynamically bind/unbind
devices 6. **Stable Tree Criteria Compliance**: - Fixes an actual bug
affecting users - Extremely minimal regression risk - Confined to a
single driver - No new features or architectural changes ### Risk
Assessment The technical risk is **extremely low**. The
`devm_device_init_wakeup()` function is a simple wrapper around
`device_init_wakeup(dev, true)` that adds automatic cleanup via
`devm_add_action_or_reset()`. There are no functional changes to the
watchdog or power management behavior - only proper resource cleanup is
added. This commit exemplifies an ideal stable backport candidate: it
fixes a real bug with minimal code change and virtually no risk of
introducing regressions.

 drivers/watchdog/stm32_iwdg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index 8ad06b54c5adc..b356a272ff9a0 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -291,7 +291,7 @@ static int stm32_iwdg_irq_init(struct platform_device *pdev,
 		return 0;
 
 	if (of_property_read_bool(np, "wakeup-source")) {
-		ret = device_init_wakeup(dev, true);
+		ret = devm_device_init_wakeup(dev);
 		if (ret)
 			return ret;
 
-- 
2.39.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
