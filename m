Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7DxXIByQIWrMIwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Jun 2026 16:47:56 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E6A641080
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Jun 2026 16:47:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=163.com header.s=s110527 header.b=dmnRZO+f;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=163.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B91CFC8F273;
	Thu,  4 Jun 2026 14:47:55 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB12BC8F272
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2026 14:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=DD
 wGW2pys0vPhR9XnnFtzJeEbqlKqeAZPfHzYinW+fQ=; b=dmnRZO+fCPvHXalWlC
 1syI0ZT+NZPjaRMf263QPbmJLNYpJqx5vLIWj4hOnfu4WZDXjIzSbBY0WpwvsAXO
 QipVBmFtLDDXBGX6DpMif1rvBIbrsY8RtdF/y+K/xmnKEN7C07XFpStNNOpdMwIW
 aI2w0tsOw/aLEpY9uTKQMcnn0=
Received: from PC-YLX4CAEK.company.local (unknown [])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wDnv_a_jyFqQRuWBQ--.57918S2; 
 Thu, 04 Jun 2026 22:46:24 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Ding Hui <dinghui@lixiang.com>,
 netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER),
 linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32
 ARCHITECTURE), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE), 
 linux-kernel@vger.kernel.org (open list)
Date: Thu,  4 Jun 2026 22:45:54 +0800
Message-Id: <20260604144557.3175399-1-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDnv_a_jyFqQRuWBQ--.57918S2
X-Coremail-Antispam: 1Uf129KBjvJXoWfJw4DKrWxKr4UJr18ur1fCrg_yoWkGw1kpF
 Wayw4qkryDJrsxGw48Jw48uFyYyay5AFW3Ww4fXwsI9w43KrnavF1SyFWYvas7CFW0vw4k
 tF4DCa9rCF1UZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bnzuAUUUUU=
X-Originating-IP: [220.248.55.69]
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC9AH2I2ohj8FAxAAA3h
Cc: j.raczynski@samsung.com, xiasanbo@lixiang.com, liuxuanjun@lixiang.com,
 yangchen11@lixiang.com
Subject: [Linux-stm32] [PATCH v3] net: stmmac: fix fatal bus error on resume
	by reinitializing RX buffers
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[163.com:s=s110527];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[163.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk,bootlin.com,lixiang.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:rmk+kernel@armlinux.org.uk,m:maxime.chevallier@bootlin.com,m:dinghui@lixiang.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:j.raczynski@samsung.com,m:xiasanbo@lixiang.com,m:liuxuanjun@lixiang.com,m:yangchen11@lixiang.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[dinghui1111@163.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_FROM(0.00)[163.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[163.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dinghui1111@163.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10E6A641080

From: Ding Hui <dinghui@lixiang.com>

On suspend, stmmac_suspend() calls stmmac_disable_all_queues() which
stops the RX NAPI, but the RX DMA engine may still be running for a
short window before stmmac_stop_all_dma() takes effect. During that
window the hardware can write incoming frames into the buffers pointed
to by the RX descriptors and write back the descriptors (clearing the
OWN bit and overwriting RDES0/1/2 with status/timestamp data). Because
NAPI is already disabled, the driver never refills these descriptors,
so the RX ring is left in a "consumed but not refilled" state with
stale content in the descriptor buffer-address fields.

On resume, stmmac_clear_descriptors() only re-arms the OWN bit and
does not repopulate the RX buffer address fields. When the DMA is
restarted it dereferences these stale addresses and triggers a fatal
bus error (not kernel panic, just a Fatal Bus Error interrupt and
RX DMA engine halts).

Fix this by introducing stmmac_reinit_rx_descriptors(), called from
stmmac_resume() immediately after stmmac_clear_descriptors(). The
helper iterates every RX descriptor slot and re-programs its buffer
address fields:

 - For normal (page_pool) queues: restore RDES0/1 from buf->addr and
   RDES2 from buf->sec_addr. The DMA mapping has remained valid across
   suspend/resume because no pages were freed. Slots left NULL by a
   prior GFP_ATOMIC failure in stmmac_rx_refill() before suspend
   are re-allocated here with GFP_KERNEL;
   -ENOMEM is returned and resume is aborted if allocation fails.
   The slots with null buffer are unacceptable, because they will
   cause a DMA suspend dead lock problem by the condition of
   Current Descriptor Pointer == Descriptor Tail Pointer.

 - For AF_XDP zero-copy queues: restore the DMA address from
   xsk_buff_xdp_get_dma(buf->xdp). Slots with no xdp buffer
   (e.g. TX-only socket, empty fill ring) attempt xsk_buff_alloc()
   first; on failure the descriptor is zeroed so the DMA engine skips
   the slot safely via an RBU event.

 - For chain mode: call stmmac_mode_init() to rebuild the des3 next-
   descriptor pointer chain, which hardware may have overwritten with
   a PTP timestamp value (as noted in chain_mode.c:refill_desc3()).

After reprogramming all address fields, a final pass restores OWN=1
on every valid slot. This is necessary because set_sec_addr and
chain-mode init unconditionally overwrite des3 (clearing the OWN bit
set by stmmac_clear_descriptors()), and must run after all address
writes are complete.

Also fix stmmac_init_rx_buffers() to actually use its gfp_t flags
parameter instead of the hardcoded GFP_ATOMIC | __GFP_NOWARN.

Signed-off-by: Ding Hui <dinghui@lixiang.com>

---
Changes in v3:
- Re-allocate page_pool NULL slots (from prior GFP_ATOMIC failures)
  with GFP_KERNEL in stmmac_reinit_rx_descriptors(); return -ENOMEM and
  abort resume.
- For XSK NULL slots, attempt xsk_buff_alloc() first; fall back to
  stmmac_clear_desc() only when allocation fails.
- Add a re-arm loop at the end of stmmac_reinit_rx_descriptors() to
  restore OWN=1 on all valid slots, since set_sec_addr and
  chain-mode init both write des3 unconditionally.
- stmmac_reinit_rx_descriptors() now returns int; stmmac_resume()
  checks the return value and propagates -ENOMEM with mutex/rtnl cleanup.
- Fix stmmac_init_rx_buffers() to use its flags parameter instead of
  hardcoded GFP_ATOMIC | __GFP_NOWARN.
  (884d2b845477 ("net: stmmac: Add GFP_DMA32 for rx buffers if no 64
  capability"))
- Run stmmac_reinit_rx_descriptors() after stmmac_clear_descriptors()
  so that stmmac_clear_desc() on XSK NULL slots overrides the OWN
  bit set by stmmac_clear_descriptors().
- Update commit message.
- Link to v2:
  https://lore.kernel.org/netdev/20260526022620.501229-1-dinghui1111@163.com/

Changes in v2:
- Introducing stmmac_reinit_rx_descriptors() to reinitializing rx
  buffers without any allocation.
- Modify commit log.
- Link to v1:
  https://lore.kernel.org/netdev/20260515053856.2310369-1-dinghui1111@163.com/
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 161 +++++++++++++++++-
 1 file changed, 160 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3591755ea30b..36428e4ba8fd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1660,7 +1660,7 @@ static int stmmac_init_rx_buffers(struct stmmac_priv *priv,
 {
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
 	struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];
-	gfp_t gfp = (GFP_ATOMIC | __GFP_NOWARN);
+	gfp_t gfp = flags;
 
 	if (priv->dma_cap.host_dma_width <= 32)
 		gfp |= GFP_DMA32;
@@ -1693,6 +1693,145 @@ static int stmmac_init_rx_buffers(struct stmmac_priv *priv,
 	return 0;
 }
 
+/**
+ * stmmac_reinit_rx_descriptors - re-program RX descriptor buffer addresses
+ *				   after stmmac_clear_descriptors()
+ * @priv: driver private structure
+ * @dma_conf: structure holding the dma data
+ * @queue: RX queue index
+ *
+ * Description: Called in the resume path after stmmac_clear_descriptors()
+ * has re-armed the OWN bit on every descriptor.  Walk buf_pool[] and
+ * re-program the buffer-address fields of every RX descriptor from the
+ * buffers that are already attached to the queue.  Slots whose page was
+ * never allocated (GFP_ATOMIC failure before suspend) are re-allocated
+ * here with GFP_KERNEL; the resume path is in process context.
+ *
+ * Between suspend and resume the hardware may have written back status/
+ * length information into the descriptor address fields (RDESx are reused
+ * for status on completion for GMAC4/XGMAC), so the address fields must be
+ * repopulated before the DMA is restarted.
+ *
+ * For XSK slots that have no xdp buffer at suspend time (TX-only socket,
+ * empty fill ring for Rx), xsk_buff_alloc() is attempted but does not
+ * return an error on failure because we can't identify a real TX-only
+ * socket from an alloc error (same as stmmac_alloc_rx_buffers_zc() in
+ * __init_dma_rx_desc_rings); on failure the descriptor is zeroed so the DMA
+ * engine skips the slot safely.
+ *
+ * To avoid the DMA stall after resume in non-XSK mode, this function
+ * re-allocates pages for NULL slots using GFP_KERNEL (the resume path runs
+ * in process context). If allocation fails, -%ENOMEM is returned immediately
+ * and the resume is aborted; the caller should report the error.
+ *
+ * This helper must be called after stmmac_clear_descriptors() and before
+ * stmmac_hw_setup() in stmmac_resume() because we need to wipe the OWN bit
+ * set in stmmac_clear_descriptors() for NULL slots in XSK mode.
+ */
+static int stmmac_reinit_rx_descriptors(struct stmmac_priv *priv,
+					struct stmmac_dma_conf *dma_conf,
+					u32 queue)
+{
+	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
+	struct stmmac_rx_buffer *buf;
+	struct dma_desc *p;
+	int i;
+
+	if (rx_q->xsk_pool) {
+		for (i = 0; i < dma_conf->dma_rx_size; i++) {
+			buf = &rx_q->buf_pool[i];
+			p = stmmac_get_rx_desc(priv, rx_q, i);
+
+			/* The XSK pool may not be fully populated (e.g.
+			 * xdpsock TX-only, empty fill ring).  Try to refill
+			 * from the pool; on failure zero the descriptor so the
+			 * DMA engine skips this slot safely.
+			 */
+			if (!buf->xdp) {
+				buf->xdp = xsk_buff_alloc(rx_q->xsk_pool);
+				if (!buf->xdp) {
+					stmmac_clear_desc(priv, p);
+					continue;
+				}
+			}
+
+			stmmac_set_desc_addr(priv, p,
+					     xsk_buff_xdp_get_dma(buf->xdp));
+			stmmac_set_desc_sec_addr(priv, p, 0, false);
+		}
+	} else {
+		for (i = 0; i < dma_conf->dma_rx_size; i++) {
+			buf = &rx_q->buf_pool[i];
+			p = stmmac_get_rx_desc(priv, rx_q, i);
+
+			/* buf->page can be NULL when stmmac_rx_refill() hit a
+			 * GFP_ATOMIC failure before suspend and left the slot
+			 * without a buffer. The resume path runs in process
+			 * context, so re-allocate with GFP_KERNEL. Allocation
+			 * failure aborts the resume.
+			 */
+			if (!buf->page) {
+				int err;
+
+				err = stmmac_init_rx_buffers(priv, dma_conf, p,
+							     i, GFP_KERNEL,
+							     queue);
+				if (err)
+					return err;
+				/* stmmac_init_rx_buffers() already programmed
+				 * the descriptor; skip the reprogramming below.
+				 */
+				continue;
+			}
+
+			stmmac_set_desc_addr(priv, p, buf->addr);
+			stmmac_set_desc_sec_addr(priv, p, buf->sec_addr,
+						 priv->sph_active &&
+						 buf->sec_page);
+
+			if (dma_conf->dma_buf_sz == BUF_SIZE_16KiB)
+				stmmac_init_desc3(priv, p);
+		}
+	}
+
+	/* Chain mode: re-link descriptor 'next' pointers. This is
+	 * allocation-free; it just rewrites the per-descriptor next
+	 * field which may have been clobbered by HW writeback.
+	 */
+	if (priv->descriptor_mode == STMMAC_CHAIN_MODE) {
+		void *des = priv->extend_desc ? (void *)rx_q->dma_erx
+					      : (void *)rx_q->dma_rx;
+
+		stmmac_mode_init(priv, des, rx_q->dma_rx_phy,
+				 dma_conf->dma_rx_size, priv->extend_desc);
+	}
+
+	/* Re-arm OWN=1 on every valid slot.
+	 *
+	 * Two address-programming helpers write des3 unconditionally and
+	 * therefore clear the OWN bit that stmmac_clear_descriptors() set:
+	 *
+	 *  - stmmac_desc_ops.set_sec_addr (called by stmmac_set_desc_sec_addr()):
+	 *    writes des3 with upper_32_bits(addr).
+	 *
+	 *  - stmmac_mode_ops.init() (called by stmmac_mode_init() above): writes
+	 *    des3 with the next-descriptor physical address.
+	 *
+	 * A single pass over valid slots restores OWN=1 after all descriptor
+	 * fields have been written.  NULL slots are left with OWN=0 for XSK mode
+	 * so the Rx DMA engine stalls safely.
+	 */
+	for (i = 0; i < dma_conf->dma_rx_size; i++) {
+		buf = &rx_q->buf_pool[i];
+		p = stmmac_get_rx_desc(priv, rx_q, i);
+
+		if (rx_q->xsk_pool ? !!buf->xdp : !!buf->page)
+			stmmac_set_rx_owner(priv, p, false);
+	}
+
+	return 0;
+}
+
 /**
  * stmmac_free_rx_buffer - free RX dma buffers
  * @priv: private structure
@@ -8272,6 +8411,7 @@ int stmmac_resume(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct stmmac_priv *priv = netdev_priv(ndev);
+	u32 queue;
 	int ret;
 
 	if (priv->plat->resume) {
@@ -8321,6 +8461,25 @@ int stmmac_resume(struct device *dev)
 	stmmac_free_tx_skbufs(priv);
 	stmmac_clear_descriptors(priv, &priv->dma_conf);
 
+	/* Re-program the RX descriptor buffer-address fields.  Slots that
+	 * had no page at suspend time (GFP_ATOMIC failure) are re-allocated
+	 * here with GFP_KERNEL; XSK slots without an xdp buffer are refilled
+	 * from the pool if possible.  Any unrecoverable allocation failure
+	 * is reported so the resume can be aborted cleanly.
+	 */
+	for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++) {
+		ret = stmmac_reinit_rx_descriptors(priv, &priv->dma_conf,
+						   queue);
+		if (ret) {
+			netdev_err(priv->dev,
+				   "%s: rx desc reinit failed on queue %u\n",
+				   __func__, queue);
+			mutex_unlock(&priv->lock);
+			rtnl_unlock();
+			return ret;
+		}
+	}
+
 	ret = stmmac_hw_setup(ndev);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
