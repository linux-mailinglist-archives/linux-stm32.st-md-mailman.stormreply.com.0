Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B02283D75ED
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jul 2021 15:20:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78986C597B8;
	Tue, 27 Jul 2021 13:20:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1AD2C597AB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jul 2021 13:20:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F53F61AF0;
 Tue, 27 Jul 2021 13:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627392005;
 bh=ZrM7mpef1J97AF2lCJYTrQjbSs1wkpfGPP0dtCY0iiA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C28G0BfjRuBrQLNqvShvZPl28TlgjhMaUvvimZwAUxdyEuxSAbw9izZIJC0j+WZkD
 fJ81EmGBKL7jmBnImf5H/+VTYH1TOyLVu+XgONinmXXoHQdXqQZBPKpHKdAr2vnKjO
 1ClSWTZsmslyPWQZjA4OqgXvn3Ly7tsH0S3cuNarjoPj36P1M6+naJnG3yU51WOGhJ
 oz/zgee8Ryg6sH8Xiu+gigzvt7hnBsonHLetiBcYUD/GEbvMNZeefXPXLnnEzaT+iG
 ANeJynTnI5DZTQ2KL52YaCQOlgDLNJlMrBkVNSo/h+ONg6iSmTIOsBlIXXesOA5FgD
 5WOdViSgGQKCQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 27 Jul 2021 09:19:54 -0400
Message-Id: <20210727132002.835130-2-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727132002.835130-1-sashal@kernel.org>
References: <20210727132002.835130-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.4 2/9] spi: stm32h7: fix full duplex
	irq handler handling
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

From: Alain Volmat <alain.volmat@foss.st.com>

[ Upstream commit e4a5c19888a5f8a9390860ca493e643be58c8791 ]

In case of Full-Duplex mode, DXP flag is set when RXP and TXP flags are
set. But to avoid 2 different handlings, just add TXP and RXP flag in
the mask instead of DXP, and then keep the initial handling of TXP and
RXP events.
Also rephrase comment about EOTIE which is one of the interrupt enable
bits. It is not triggered by any event.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Link: https://lore.kernel.org/r/1625042723-661-3-git-send-email-alain.volmat@foss.st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/spi/spi-stm32.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 3af6a5a3a4b2..92bf667951b0 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -913,15 +913,18 @@ static irqreturn_t stm32h7_spi_irq_thread(int irq, void *dev_id)
 	ier = readl_relaxed(spi->base + STM32H7_SPI_IER);
 
 	mask = ier;
-	/* EOTIE is triggered on EOT, SUSP and TXC events. */
+	/*
+	 * EOTIE enables irq from EOT, SUSP and TXC events. We need to set
+	 * SUSP to acknowledge it later. TXC is automatically cleared
+	 */
+
 	mask |= STM32H7_SPI_SR_SUSP;
 	/*
-	 * When TXTF is set, DXPIE and TXPIE are cleared. So in case of
-	 * Full-Duplex, need to poll RXP event to know if there are remaining
-	 * data, before disabling SPI.
+	 * DXPIE is set in Full-Duplex, one IT will be raised if TXP and RXP
+	 * are set. So in case of Full-Duplex, need to poll TXP and RXP event.
 	 */
-	if (spi->rx_buf && !spi->cur_usedma)
-		mask |= STM32H7_SPI_SR_RXP;
+	if ((spi->cur_comm == SPI_FULL_DUPLEX) && !spi->cur_usedma)
+		mask |= STM32H7_SPI_SR_TXP | STM32H7_SPI_SR_RXP;
 
 	if (!(sr & mask)) {
 		dev_warn(spi->dev, "spurious IT (sr=0x%08x, ier=0x%08x)\n",
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
