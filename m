Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF1F2C7ACF
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Nov 2020 19:55:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B5E2C56630;
	Sun, 29 Nov 2020 18:55:14 +0000 (UTC)
Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0466FC3089F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Nov 2020 18:55:13 +0000 (UTC)
Received: from dslb-178-004-174-066.178.004.pools.vodafone-ip.de
 ([178.4.174.66] helo=martin-debian-2.paytec.ch)
 by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <martin@kaiser.cx>)
 id 1kjRqq-0005jB-13; Sun, 29 Nov 2020 19:55:12 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>
Date: Sun, 29 Nov 2020 19:52:28 +0100
Message-Id: <20201129185228.16213-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201129185228.16213-1-martin@kaiser.cx>
References: <20201024133154.22767-1-martin@kaiser.cx>
 <20201129185228.16213-1-martin@kaiser.cx>
MIME-Version: 1.0
Cc: Martin Kaiser <martin@kaiser.cx>, kernel test robot <lkp@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH RESEND v2 3/3] mailbox: stm32-ipcc: cast void
	pointers to unsigned long
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

Now that the driver can be enabled by COMPILE_TEST, we see warnings on
64bit platforms when void pointers are cast to unsigned int (and
vice versa).

warning: cast to smaller integer type 'unsigned int' from 'void *'
           unsigned int chan = (unsigned int)link->con_priv;
...
warning: cast to 'void *' from smaller integer type 'unsigned int'
           ipcc->controller.chans[i].con_priv = (void *)i;

Update these casts to use unsigned long variables, which are the same
size as pointers on all platforms.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
Reviewed-by: Fabien Dessenne <fabien.dessenne@st.com>
---
changes in v2
- added this patch to fix COMPILE_TEST warnings

 drivers/mailbox/stm32-ipcc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
index ab8fe56af948..b84e0587937c 100644
--- a/drivers/mailbox/stm32-ipcc.c
+++ b/drivers/mailbox/stm32-ipcc.c
@@ -144,11 +144,11 @@ static irqreturn_t stm32_ipcc_tx_irq(int irq, void *data)
 
 static int stm32_ipcc_send_data(struct mbox_chan *link, void *data)
 {
-	unsigned int chan = (unsigned int)link->con_priv;
+	unsigned long chan = (unsigned long)link->con_priv;
 	struct stm32_ipcc *ipcc = container_of(link->mbox, struct stm32_ipcc,
 					       controller);
 
-	dev_dbg(ipcc->controller.dev, "%s: chan:%d\n", __func__, chan);
+	dev_dbg(ipcc->controller.dev, "%s: chan:%lu\n", __func__, chan);
 
 	/* set channel n occupied */
 	stm32_ipcc_set_bits(&ipcc->lock, ipcc->reg_proc + IPCC_XSCR,
@@ -163,7 +163,7 @@ static int stm32_ipcc_send_data(struct mbox_chan *link, void *data)
 
 static int stm32_ipcc_startup(struct mbox_chan *link)
 {
-	unsigned int chan = (unsigned int)link->con_priv;
+	unsigned long chan = (unsigned long)link->con_priv;
 	struct stm32_ipcc *ipcc = container_of(link->mbox, struct stm32_ipcc,
 					       controller);
 	int ret;
@@ -183,7 +183,7 @@ static int stm32_ipcc_startup(struct mbox_chan *link)
 
 static void stm32_ipcc_shutdown(struct mbox_chan *link)
 {
-	unsigned int chan = (unsigned int)link->con_priv;
+	unsigned long chan = (unsigned long)link->con_priv;
 	struct stm32_ipcc *ipcc = container_of(link->mbox, struct stm32_ipcc,
 					       controller);
 
@@ -206,7 +206,7 @@ static int stm32_ipcc_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct stm32_ipcc *ipcc;
 	struct resource *res;
-	unsigned int i;
+	unsigned long i;
 	int ret;
 	u32 ip_ver;
 	static const char * const irq_name[] = {"rx", "tx"};
@@ -265,7 +265,7 @@ static int stm32_ipcc_probe(struct platform_device *pdev)
 						irq_thread[i], IRQF_ONESHOT,
 						dev_name(dev), ipcc);
 		if (ret) {
-			dev_err(dev, "failed to request irq %d (%d)\n", i, ret);
+			dev_err(dev, "failed to request irq %lu (%d)\n", i, ret);
 			goto err_clk;
 		}
 	}
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
