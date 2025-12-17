Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E2BCC6D74
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Dec 2025 10:39:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 635E6C58D7A;
	Wed, 17 Dec 2025 09:39:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65478C01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Dec 2025 09:39:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66EDC14BF;
 Wed, 17 Dec 2025 01:39:26 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E6813F73B;
 Wed, 17 Dec 2025 01:39:32 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 17 Dec 2025 09:39:20 +0000
MIME-Version: 1.0
Message-Id: <20251217-fix_stm_kconfig-v1-1-531fb3674549@arm.com>
X-B4-Tracking: v=1; b=H4sIAEd6QmkC/x2MQQqAIBAAvyJ7TsilFPpKhIittUQWGhGEf086D
 szMC5kSU4ZBvJDo5sxHrKAaAX51cSHJc2XAFnuFSsvAj83Xbjd/xMCLdAZD13qjFXqo1ZmoKv9
 xnEr5AJLfheBhAAAA
X-Change-ID: 20251216-fix_stm_kconfig-a72f40c7612c
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765964372; l=1374;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=hBD8idWBRc98CcgVCOVQqftAkyoPzpkmw9z9fattHZ0=;
 b=1AiX7Sr/THMt4LwAMI+UhY6kuUfv8AHTxTP/iXxTyTdpgGrgErjqtHdTKMEIrPIS8uMSj7tkO
 KgKwB/n9Q7TB1VoxdhfWBDZG7dt09Ii7PycevFnmGrIe+TWVsuJ4CSt
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
Cc: Leo Yan <leo.yan@arm.com>, coresight@lists.linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] stm class: Fix Kconfig symbols
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

Kconfig symbols must not include the CONFIG_ prefix.  Remove the CONFIG_
prefix for default values to work.

Fixes: a02509f301c6 ("stm class: Factor out default framing protocol")
Fixes: d69d5e83110f ("stm class: Add MIPI SyS-T protocol support")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/stm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/stm/Kconfig b/drivers/hwtracing/stm/Kconfig
index eda6b11d40a1f9ab49a1ec1e6faae8ee178c5ed3..cd7f0b0f3fbebc74775d8835187e49e5bd21d646 100644
--- a/drivers/hwtracing/stm/Kconfig
+++ b/drivers/hwtracing/stm/Kconfig
@@ -13,7 +13,7 @@ if STM
 
 config STM_PROTO_BASIC
 	tristate "Basic STM framing protocol driver"
-	default CONFIG_STM
+	default STM
 	help
 	  This is a simple framing protocol for sending data over STM
 	  devices. This was the protocol that the STM framework used
@@ -28,7 +28,7 @@ config STM_PROTO_BASIC
 
 config STM_PROTO_SYS_T
 	tristate "MIPI SyS-T STM framing protocol driver"
-	default CONFIG_STM
+	default STM
 	help
 	  This is an implementation of MIPI SyS-T protocol to be used
 	  over the STP transport. In addition to the data payload, it

---
base-commit: 40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
change-id: 20251216-fix_stm_kconfig-a72f40c7612c

Best regards,
-- 
Leo Yan <leo.yan@arm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
