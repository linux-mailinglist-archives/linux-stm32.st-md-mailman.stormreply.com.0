Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 721324A5B91
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Feb 2022 12:52:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1515EC60460;
	Tue,  1 Feb 2022 11:52:01 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20512C597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Feb 2022 11:51:59 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <afa@pengutronix.de>)
 id 1nErhS-0003Vm-14; Tue, 01 Feb 2022 12:51:54 +0100
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <afa@pengutronix.de>)
 id 1nErhL-00GmlN-SF; Tue, 01 Feb 2022 12:51:47 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue,  1 Feb 2022 12:51:41 +0100
Message-Id: <20220201115142.3999860-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 kernel@pengutronix.de, Dillon Min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RFT PATCH] spi: stm32: ignore Rx queue not empty in
	stm32f4 Tx only mode
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

STM32F4_SPI_SR_RXNE and STM32F4_SPI_SR_OVR are distinct bits in the same
status register.  ~STM32F4_SPI_SR_OVR | STM32F4_SPI_SR_RXNE is thus
equal to ~STM32F4_SPI_SR_OVR.

The original intention was likely for transmission-only transfers to
ignore interrupts both for when the Rx queue has bytes (RXNE) as well
as when these bytes haven't been read in time (OVR).

Fix the typo by adding the missing parenthesis.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
Noticed reading driver code. Untested on actual Hardware.
If you can test this, please do.
---
 drivers/spi/spi-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 9bd3fd1652f7..56062f88881d 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -763,7 +763,7 @@ static irqreturn_t stm32f4_spi_irq_event(int irq, void *dev_id)
 	if (!spi->cur_usedma && (spi->cur_comm == SPI_SIMPLEX_TX ||
 				 spi->cur_comm == SPI_3WIRE_TX)) {
 		/* OVR flag shouldn't be handled for TX only mode */
-		sr &= ~STM32F4_SPI_SR_OVR | STM32F4_SPI_SR_RXNE;
+		sr &= ~(STM32F4_SPI_SR_OVR | STM32F4_SPI_SR_RXNE);
 		mask |= STM32F4_SPI_SR_TXE;
 	}
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
