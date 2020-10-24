Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DC929A56C
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Oct 2020 08:23:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 604AFC3087A;
	Tue, 27 Oct 2020 07:23:05 +0000 (UTC)
Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96945C424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Oct 2020 13:32:27 +0000 (UTC)
Received: from dslb-188-096-149-111.188.096.pools.vodafone-ip.de
 ([188.96.149.111] helo=martin-debian-2.paytec.ch)
 by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <martin@kaiser.cx>)
 id 1kWJej-0005I1-Bn; Sat, 24 Oct 2020 15:32:25 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>
Date: Sat, 24 Oct 2020 15:31:54 +0200
Message-Id: <20201024133154.22767-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201024133154.22767-1-martin@kaiser.cx>
References: <20201024133154.22767-1-martin@kaiser.cx>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 27 Oct 2020 07:23:03 +0000
Cc: Martin Kaiser <martin@kaiser.cx>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/2] mailbox: stm32-ipcc: remove duplicate
	error message
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

platform_get_irq_byname already prints an error message if the requested irq
was not found. Don't print another message in the driver.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/mailbox/stm32-ipcc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
index ef966887aa15..ab8fe56af948 100644
--- a/drivers/mailbox/stm32-ipcc.c
+++ b/drivers/mailbox/stm32-ipcc.c
@@ -257,9 +257,6 @@ static int stm32_ipcc_probe(struct platform_device *pdev)
 	for (i = 0; i < IPCC_IRQ_NUM; i++) {
 		ipcc->irqs[i] = platform_get_irq_byname(pdev, irq_name[i]);
 		if (ipcc->irqs[i] < 0) {
-			if (ipcc->irqs[i] != -EPROBE_DEFER)
-				dev_err(dev, "no IRQ specified %s\n",
-					irq_name[i]);
 			ret = ipcc->irqs[i];
 			goto err_clk;
 		}
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
