Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB97D050BB
	for <lists+linux-stm32@lfdr.de>; Thu, 08 Jan 2026 18:36:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7FD0C8F284;
	Thu,  8 Jan 2026 17:36:31 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74575C8F282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jan 2026 17:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ol51REnBkcONdR3lXu77UErJ4M8e9HJNZBUczbA3AZQ=; b=sAlyu0tl1zdKYunzeoFuRL3z6B
 Q+77jMCKsB/A+S5QG7PTxvpJsBGckuSZ203KQ0GZnwBB9t7+cInH9DF8lRK9y0Rxkc+kZ/JP19JfA
 NZpDMjtaEBYvXTf350UlRNZmwbksKHo3JSzQvjGtgU3N8T6ogfa/bc9rlB0f7FkHmZpr2B9HpP8f3
 yNcplUrBJJ1HHU1xXNawMfUxcArlWK1KCHrVj+9DJSWzc5tXnxPrVrEAw3QVqeLmEdlO2l7XWhlLR
 EvolKxEMaWiWV5Tqx4dCr35QRdYZlPcOcWjsTxUqTiVO6swrn5HVW3OWZ80p1201Wzf1zLauyE/70
 Ald2jTNg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42950 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vdtvt-000000002zQ-2aJ5;
 Thu, 08 Jan 2026 17:36:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vdtvs-00000002Gtb-2U9G; Thu, 08 Jan 2026 17:36:24 +0000
In-Reply-To: <aV_q2Kneinrk3Z-W@shell.armlinux.org.uk>
References: <aV_q2Kneinrk3Z-W@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vdtvs-00000002Gtb-2U9G@rmk-PC.armlinux.org.uk>
Date: Thu, 08 Jan 2026 17:36:24 +0000
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 4/9] net: stmmac: descs: fix
 buffer 1 off-by-one error
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

norm_set_tx_desc_len_on_ring() incorrectly tests the buffer length,
leading to a length of 2048 being squeezed into a bitfield covering
bits 10:0 - which results in the buffer 1 size being zero.

If this field is zero, buffer 1 is ignored, and thus is equivalent to
transmitting a zero length buffer.

The path to norm_set_tx_desc_len_on_ring() is only possible when the
hardware does not support enhanced descriptors (plat->enh_desc clear)
which is dependent on the hardware.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/descs_com.h   | 26 ++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/descs_com.h b/drivers/net/ethernet/stmicro/stmmac/descs_com.h
index 40f7f2da9c5e..cb3bfc1571f9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/descs_com.h
+++ b/drivers/net/ethernet/stmicro/stmmac/descs_com.h
@@ -39,15 +39,19 @@ static inline void enh_desc_end_tx_desc_on_ring(struct dma_desc *p, int end)
 		p->des0 &= cpu_to_le32(~ETDES0_END_RING);
 }
 
+/* The maximum buffer 1 size is 8KiB - 1. However, we limit to 4KiB. */
 static inline void enh_set_tx_desc_len_on_ring(struct dma_desc *p, int len)
 {
-	if (unlikely(len > BUF_SIZE_4KiB)) {
-		p->des1 |= cpu_to_le32((((len - BUF_SIZE_4KiB)
+	unsigned int buffer1_max_length = BUF_SIZE_4KiB;
+
+	if (unlikely(len > buffer1_max_length)) {
+		p->des1 |= cpu_to_le32((((len - buffer1_max_length)
 					<< ETDES1_BUFFER2_SIZE_SHIFT)
-			    & ETDES1_BUFFER2_SIZE_MASK) | (BUF_SIZE_4KiB
+			    & ETDES1_BUFFER2_SIZE_MASK) | (buffer1_max_length
 			    & ETDES1_BUFFER1_SIZE_MASK));
-	} else
+	} else {
 		p->des1 |= cpu_to_le32((len & ETDES1_BUFFER1_SIZE_MASK));
+	}
 }
 
 /* Normal descriptors */
@@ -73,16 +77,20 @@ static inline void ndesc_end_tx_desc_on_ring(struct dma_desc *p, int end)
 		p->des1 &= cpu_to_le32(~TDES1_END_RING);
 }
 
+/* The maximum buffer 1 size is 2KiB - 1, limited by the mask width */
 static inline void norm_set_tx_desc_len_on_ring(struct dma_desc *p, int len)
 {
-	if (unlikely(len > BUF_SIZE_2KiB)) {
-		unsigned int buffer1 = (BUF_SIZE_2KiB - 1)
-					& TDES1_BUFFER1_SIZE_MASK;
-		p->des1 |= cpu_to_le32((((len - buffer1)
+	unsigned int buffer1_max_length = BUF_SIZE_2KiB - 1;
+
+	if (unlikely(len > buffer1_max_length)) {
+		unsigned int buffer1 = buffer1_max_length &
+				       TDES1_BUFFER1_SIZE_MASK;
+		p->des1 |= cpu_to_le32((((len - buffer1_max_length)
 					<< TDES1_BUFFER2_SIZE_SHIFT)
 				& TDES1_BUFFER2_SIZE_MASK) | buffer1);
-	} else
+	} else {
 		p->des1 |= cpu_to_le32((len & TDES1_BUFFER1_SIZE_MASK));
+	}
 }
 
 /* Specific functions used for Chain mode */
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
