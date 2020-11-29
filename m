Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 915592C7ACD
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Nov 2020 19:55:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E3A7C424BF;
	Sun, 29 Nov 2020 18:55:06 +0000 (UTC)
Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D571AC32EA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Nov 2020 18:55:02 +0000 (UTC)
Received: from dslb-178-004-174-066.178.004.pools.vodafone-ip.de
 ([178.4.174.66] helo=martin-debian-2.paytec.ch)
 by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <martin@kaiser.cx>)
 id 1kjRqd-0005jB-5H; Sun, 29 Nov 2020 19:54:59 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>
Date: Sun, 29 Nov 2020 19:52:26 +0100
Message-Id: <20201129185228.16213-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201024133154.22767-1-martin@kaiser.cx>
References: <20201024133154.22767-1-martin@kaiser.cx>
MIME-Version: 1.0
Cc: Martin Kaiser <martin@kaiser.cx>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH RESEND v2 1/3] mailbox: stm32-ipcc: add
	COMPILE_TEST dependency
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

This allows compiling the driver on architectures where the hardware is not
available. Most other mailbox drivers support this as well.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
Reviewed-by: Fabien Dessenne <fabien.dessenne@st.com>
---
changes in v2
- added Fabien's review tag

Dear all,

this has been around for some weeks now. Is there anything else you need
before these simple patches can be merged?

Thanks,
Martin

 drivers/mailbox/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 05b1009e2820..abbf5d67ffa2 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -201,7 +201,7 @@ config BCM_FLEXRM_MBOX
 
 config STM32_IPCC
 	tristate "STM32 IPCC Mailbox"
-	depends on MACH_STM32MP157
+	depends on MACH_STM32MP157 || COMPILE_TEST
 	help
 	  Mailbox implementation for STMicroelectonics STM32 family chips
 	  with hardware for Inter-Processor Communication Controller (IPCC)
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
