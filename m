Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E8C59538B
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Aug 2022 09:17:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5E97C640F7;
	Tue, 16 Aug 2022 07:17:07 +0000 (UTC)
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B589C03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Aug 2022 12:10:35 +0000 (UTC)
X-QQ-mid: bizesmtp84t1660219808t257rave
Received: from localhost.localdomain ( [182.148.14.53])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 11 Aug 2022 20:10:06 +0800 (CST)
X-QQ-SSF: 01000000002000G0V000B00A0000020
X-QQ-FEAT: BlCEEhbwceZ42iDDS+I2K7ro8/+dFD8sE1sTUHBVmhgwuWhcj0cbasPVVbJor
 Qs3xKyCCpBzHh/keBR+fbW5nZvbZaXWuLzsfkY2uPvw7W3SeDA5sFdG5jxS002eCS+yLIfB
 p2vQWb9UNzrga+EJzXNcH+7ypDa/Y1ATrVWHVBo2fctEYIxjrks5t68Y7a97MAl+KNeCr/d
 8Tm0AfswwCu19trE4ZHVO/jylTiESaBv2vV5Z397ZUV6yPZ9wwGW3rY2mJRg/r1+l51NTXe
 P+znsBJa1dY9pwTCRZUUg+PMDAKV1l09HrNxXwJdol25pw5JRcQHW4iN2rcWY23gc1yv07h
 MkKlKrcTjf2z/cOHYX013yXgTGqKW8jDkNj65e59WrYo0G01z5eEbYs4xk9PSrsPEZLPaFK
 RbmmTn4KOlE=
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: mcoquelin.stm32@gmail.com
Date: Thu, 11 Aug 2022 20:09:59 +0800
Message-Id: <20220811120959.18752-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
X-Mailman-Approved-At: Tue, 16 Aug 2022 07:17:06 +0000
Cc: linux-kernel@vger.kernel.org, Jason Wang <wangborong@cdjrlc.com>,
 vkoul@kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dmaengine: stm32-dmamux: Fix comment typo
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

The double `end' is duplicated in the comment, remove one.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
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
2.36.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
