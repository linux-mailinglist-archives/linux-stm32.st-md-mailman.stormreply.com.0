Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE20914309
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2024 08:57:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A50FC71287;
	Mon, 24 Jun 2024 06:57:17 +0000 (UTC)
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A184C7128D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 10:20:44 +0000 (UTC)
X-QQ-mid: bizesmtpsz15t1718965135tf36p6
X-QQ-Originating-IP: P0/GW/bcSHhST6SeWoBh2w5Z3xI7MzBTCUiyhlDOLOk=
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 21 Jun 2024 18:18:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13424936374893162487
From: WangYuli <wangyuli@uniontech.com>
To: alexandre.torgue@foss.st.com, joabreu@synopsys.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com
Date: Fri, 21 Jun 2024 18:18:36 +0800
Message-ID: <F19E93E071D95714+20240621101836.167600-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.43.4
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-Mailman-Approved-At: Mon, 24 Jun 2024 06:57:15 +0000
Cc: Li Wencheng <liwencheng@phytium.com.cn>,
 Wang Yinfeng <wangyinfeng@phytium.com.cn>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, guanwentao@uniontech.com,
 Wang Zhimin <wangzhimin1179@phytium.com.cn>, WangYuli <wangyuli@uniontech.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Chen Baozi <chenbaozi@phytium.com.cn>
Subject: [Linux-stm32] [PATCH] net: stmmac: Add a barrier to make sure all
	access coherent
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

Add a memory barrier to sync TX descriptor to avoid data error.
Besides, increase the ring buffer size to avoid buffer overflow.

Signed-off-by: Wang Zhimin <wangzhimin1179@phytium.com.cn>
Signed-off-by: Li Wencheng <liwencheng@phytium.com.cn>
Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
Signed-off-by: Wang Yinfeng <wangyinfeng@phytium.com.cn>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h    | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/norm_desc.c | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 9cd62b2110a1..7cc2fecbaf18 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -50,10 +50,10 @@
  */
 #define DMA_MIN_TX_SIZE		64
 #define DMA_MAX_TX_SIZE		1024
-#define DMA_DEFAULT_TX_SIZE	512
+#define DMA_DEFAULT_TX_SIZE	1024
 #define DMA_MIN_RX_SIZE		64
 #define DMA_MAX_RX_SIZE		1024
-#define DMA_DEFAULT_RX_SIZE	512
+#define DMA_DEFAULT_RX_SIZE	1024
 #define STMMAC_GET_ENTRY(x, size)	((x + 1) & (size - 1))
 
 #undef FRAME_FILTER_DEBUG
diff --git a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
index 68a7cfcb1d8f..40088a390f7b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
@@ -200,6 +200,10 @@ static void ndesc_prepare_tx_desc(struct dma_desc *p, int is_fs, int len,
 	else
 		norm_set_tx_desc_len_on_ring(p, len);
 
+	/* The own bit must be the latest setting done when prepare the
+	 * descriptor and then barrier is needed to make sure that all is coherent.
+	 */
+	wmb();
 	if (tx_own)
 		p->des0 |= cpu_to_le32(TDES0_OWN);
 }
-- 
2.43.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
