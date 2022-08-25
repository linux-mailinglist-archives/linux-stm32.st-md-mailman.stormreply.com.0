Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 918935A2135
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Aug 2022 08:51:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C57DC64100;
	Fri, 26 Aug 2022 06:51:31 +0000 (UTC)
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 638F1C640FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 14:49:12 +0000 (UTC)
X-QQ-mid: bizesmtp85t1661438938tnq9k2mq
Received: from localhost.localdomain ( [182.148.14.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 25 Aug 2022 22:48:52 +0800 (CST)
X-QQ-SSF: 01000000002000B0B000B00A0000000
X-QQ-FEAT: ExN6mnmVozCHB9rzUJb2bWcWCbvtjCTYCWTJXH3HIWPzPaXyrdnXDCQcn5aYk
 HoSJ0JImuqB4hwQw8WfqNcB/ZHns5PpfwE0m3/ta1Qzj1WiaEHgnQiSGJ6PH7ksRWG8HG/X
 GKiVmZNkNg+yFsrQmAxsmVpJi20EuLElPtFtRNpoRcmID53WVtt1t7beBSRgMCgRYJKbhPB
 3nLlgqcb4Slerd7XUIqCHa/etk01KEq5j4CuW3Ig1pP7w4u3k/Ygf8VoAYdIphVJLBcWqQo
 /+IjSBffUjdseQtOxFjli5Wraaqgs22lpt8qQoPNZEYp6wXv7Y8N0+3wmuwMa3LLeqYlMJB
 0MTTC6eY5CqAaZvaNYi1vav9e5g3QR5nBzgCWAWxHoI5MnjSdOS3sYVwVhNvFs+wh7R0gJ/
X-QQ-GoodBg: 0
From: Shaomin Deng <dengshaomin@cdjrlc.com>
To: vkoul@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 dmaengine@vger.kernel.org
Date: Thu, 25 Aug 2022 10:48:51 -0400
Message-Id: <20220825144851.4490-1-dengshaomin@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Mailman-Approved-At: Fri, 26 Aug 2022 06:51:29 +0000
Cc: Shaomin Deng <dengshaomin@cdjrlc.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dmaengine: stm32-dmamux: Fix comments typo
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

Fix the double word "end" in comments.

Signed-off-by: Shaomin Deng <dengshaomin@cdjrlc.com>
---
 drivers/dma/stm32-dmamux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/stm32-dmamux.c b/drivers/dma/stm32-dmamux.c
index eee0c5aa5fb5..ca18dee3ccc0 100644
--- a/drivers/dma/stm32-dmamux.c
+++ b/drivers/dma/stm32-dmamux.c
@@ -45,7 +45,7 @@ struct stm32_dmamux_data {
 						 */
 	u32 dma_reqs[]; /* Number of DMA Request per DMA masters.
 			 *  [0] holds number of DMA Masters.
-			 *  To be kept at very end end of this structure
+			 *  To be kept at very end of this structure
 			 */
 };
 
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
