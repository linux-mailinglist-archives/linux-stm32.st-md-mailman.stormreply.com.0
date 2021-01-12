Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1AD2F2F84
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Jan 2021 13:57:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAC23C56635;
	Tue, 12 Jan 2021 12:57:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD146C5660F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jan 2021 12:57:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3ECDC23333;
 Tue, 12 Jan 2021 12:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610456257;
 bh=hYeILsnaxK+KNOA/EPB5IzZ+PmRqMc6c+QsaY+EWZpI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VBsiv3Cv8BQa+K6hvFMnWjjWFGpVkAiwTWJRTi7mmvJdpRi7sjjE6af3KhfIQZUcR
 Ohd9E7ur4XSndpAbngM2mKV1J0kVnBxeP+5kovC3gAd31FyojHx8KLn0KrofV9osF3
 FrrJt18PLjST6VQuuXO9C7lSjvAWh0GXRdjRKA6YPF7/f/GeDzmnVzW50rAjSE+/tI
 CG84Vs2HWxWstKkbcOp7HHFtlvcbVcplCyuoeu1uMGlkK5GBPfmke+tedgxHNm5a5q
 nNp7KmKItp2PXrns2NVsbMjMn+4b90zn8dfWZyw+y/jt4KZEJOgHICUQuUpY6WLKbM
 BZ2hqGrLO2xhQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 12 Jan 2021 07:57:17 -0500
Message-Id: <20210112125725.71014-8-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112125725.71014-1-sashal@kernel.org>
References: <20210112125725.71014-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 4.19 08/16] dmaengine: stm32-mdma: fix
	STM32_MDMA_VERY_HIGH_PRIORITY value
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

From: Amelie Delaunay <amelie.delaunay@foss.st.com>

[ Upstream commit e1263f9277bad198c2acc8092a41aea1edbea0e4 ]

STM32_MDMA_VERY_HIGH_PRIORITY is b11 not 0x11, so fix it with 0x3.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Link: https://lore.kernel.org/r/20210104142045.25583-1-amelie.delaunay@foss.st.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/stm32-mdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
index 9c6867916e890..0681c0fa44cfb 100644
--- a/drivers/dma/stm32-mdma.c
+++ b/drivers/dma/stm32-mdma.c
@@ -209,7 +209,7 @@
 #define STM32_MDMA_MAX_CHANNELS		63
 #define STM32_MDMA_MAX_REQUESTS		256
 #define STM32_MDMA_MAX_BURST		128
-#define STM32_MDMA_VERY_HIGH_PRIORITY	0x11
+#define STM32_MDMA_VERY_HIGH_PRIORITY	0x3
 
 enum stm32_mdma_trigger_mode {
 	STM32_MDMA_BUFFER,
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
