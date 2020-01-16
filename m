Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6141813E798
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jan 2020 18:27:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13950C36B11;
	Thu, 16 Jan 2020 17:27:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54C57C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2020 17:27:30 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F3C0246D3;
 Thu, 16 Jan 2020 17:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579195649;
 bh=LV/BZbBT0dIxJVUKESzPV9/ZnvEA6aMRs4D8sEBcqr0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YV4nWlLyVLzpCnpedVgmSnQaXe4ruXm1d0sFMPBQCdAWIsvf90Z4K6AzfKRuxysd1
 a1gpo9y6vK/Q9vW+v7PZ19VjaQh8yTWVCKqBCobK3GfLaAMiR+PZd0X0/KG4IvVTSH
 XacaDySIdQIjqDVbXl4t/3f5zepj9vrxbFGMF5j0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 16 Jan 2020 12:21:24 -0500
Message-Id: <20200116172403.18149-155-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116172403.18149-1-sashal@kernel.org>
References: <20200116172403.18149-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 4.14 212/371] serial: stm32: fix rx
	error handling
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

From: Erwan Le Ray <erwan.leray@st.com>

[ Upstream commit 4f01d833fdcdd6f9b85d9e5d5d7568eb683626a7 ]

- Fixes parity and framing error bit by clearing parity and framing error
  flag. The current implementation doesn't clear the error bits when an
  error is detected.
- Fixes the incorrect name of framing error clearing flag in header file.
- Fixes misalignement between data frame and errors status. The status
  read for "n" frame was the status of "n+1" frame".
- Fixes break detection was not triggered by the expected register.

Fixes: 48a6092fb41f ("serial: stm32-usart: Add STM32 USART Driver")
Signed-off-by: Erwan Le Ray <erwan.leray@st.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/tty/serial/stm32-usart.c | 54 +++++++++++++++++++++-----------
 drivers/tty/serial/stm32-usart.h | 10 ++----
 2 files changed, 37 insertions(+), 27 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 03a583264d9e..c43590077372 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -118,35 +118,51 @@ static void stm32_receive_chars(struct uart_port *port, bool threaded)
 
 	while (stm32_pending_rx(port, &sr, &stm32_port->last_res, threaded)) {
 		sr |= USART_SR_DUMMY_RX;
-		c = stm32_get_char(port, &sr, &stm32_port->last_res);
 		flag = TTY_NORMAL;
-		port->icount.rx++;
 
+		/*
+		 * Status bits has to be cleared before reading the RDR:
+		 * In FIFO mode, reading the RDR will pop the next data
+		 * (if any) along with its status bits into the SR.
+		 * Not doing so leads to misalignement between RDR and SR,
+		 * and clear status bits of the next rx data.
+		 *
+		 * Clear errors flags for stm32f7 and stm32h7 compatible
+		 * devices. On stm32f4 compatible devices, the error bit is
+		 * cleared by the sequence [read SR - read DR].
+		 */
+		if ((sr & USART_SR_ERR_MASK) && ofs->icr != UNDEF_REG)
+			stm32_clr_bits(port, ofs->icr, USART_ICR_ORECF |
+				       USART_ICR_PECF | USART_ICR_FECF);
+
+		c = stm32_get_char(port, &sr, &stm32_port->last_res);
+		port->icount.rx++;
 		if (sr & USART_SR_ERR_MASK) {
-			if (sr & USART_SR_LBD) {
-				port->icount.brk++;
-				if (uart_handle_break(port))
-					continue;
-			} else if (sr & USART_SR_ORE) {
-				if (ofs->icr != UNDEF_REG)
-					writel_relaxed(USART_ICR_ORECF,
-						       port->membase +
-						       ofs->icr);
+			if (sr & USART_SR_ORE) {
 				port->icount.overrun++;
 			} else if (sr & USART_SR_PE) {
 				port->icount.parity++;
 			} else if (sr & USART_SR_FE) {
-				port->icount.frame++;
+				/* Break detection if character is null */
+				if (!c) {
+					port->icount.brk++;
+					if (uart_handle_break(port))
+						continue;
+				} else {
+					port->icount.frame++;
+				}
 			}
 
 			sr &= port->read_status_mask;
 
-			if (sr & USART_SR_LBD)
-				flag = TTY_BREAK;
-			else if (sr & USART_SR_PE)
+			if (sr & USART_SR_PE) {
 				flag = TTY_PARITY;
-			else if (sr & USART_SR_FE)
-				flag = TTY_FRAME;
+			} else if (sr & USART_SR_FE) {
+				if (!c)
+					flag = TTY_BREAK;
+				else
+					flag = TTY_FRAME;
+			}
 		}
 
 		if (uart_handle_sysrq_char(port, c))
@@ -569,14 +585,14 @@ static void stm32_set_termios(struct uart_port *port, struct ktermios *termios,
 	if (termios->c_iflag & INPCK)
 		port->read_status_mask |= USART_SR_PE | USART_SR_FE;
 	if (termios->c_iflag & (IGNBRK | BRKINT | PARMRK))
-		port->read_status_mask |= USART_SR_LBD;
+		port->read_status_mask |= USART_SR_FE;
 
 	/* Characters to ignore */
 	port->ignore_status_mask = 0;
 	if (termios->c_iflag & IGNPAR)
 		port->ignore_status_mask = USART_SR_PE | USART_SR_FE;
 	if (termios->c_iflag & IGNBRK) {
-		port->ignore_status_mask |= USART_SR_LBD;
+		port->ignore_status_mask |= USART_SR_FE;
 		/*
 		 * If we're ignoring parity and break indicators,
 		 * ignore overruns too (for real raw support).
diff --git a/drivers/tty/serial/stm32-usart.h b/drivers/tty/serial/stm32-usart.h
index ffc0c5285e51..9d087881913a 100644
--- a/drivers/tty/serial/stm32-usart.h
+++ b/drivers/tty/serial/stm32-usart.h
@@ -108,7 +108,6 @@ struct stm32_usart_info stm32h7_info = {
 #define USART_SR_RXNE		BIT(5)
 #define USART_SR_TC		BIT(6)
 #define USART_SR_TXE		BIT(7)
-#define USART_SR_LBD		BIT(8)
 #define USART_SR_CTSIF		BIT(9)
 #define USART_SR_CTS		BIT(10)		/* F7 */
 #define USART_SR_RTOF		BIT(11)		/* F7 */
@@ -120,8 +119,7 @@ struct stm32_usart_info stm32h7_info = {
 #define USART_SR_SBKF		BIT(18)		/* F7 */
 #define USART_SR_WUF		BIT(20)		/* H7 */
 #define USART_SR_TEACK		BIT(21)		/* F7 */
-#define USART_SR_ERR_MASK	(USART_SR_LBD | USART_SR_ORE | \
-				 USART_SR_FE | USART_SR_PE)
+#define USART_SR_ERR_MASK	(USART_SR_ORE | USART_SR_FE | USART_SR_PE)
 /* Dummy bits */
 #define USART_SR_DUMMY_RX	BIT(16)
 
@@ -166,8 +164,6 @@ struct stm32_usart_info stm32h7_info = {
 /* USART_CR2 */
 #define USART_CR2_ADD_MASK	GENMASK(3, 0)	/* F4 */
 #define USART_CR2_ADDM7		BIT(4)		/* F7 */
-#define USART_CR2_LBDL		BIT(5)
-#define USART_CR2_LBDIE		BIT(6)
 #define USART_CR2_LBCL		BIT(8)
 #define USART_CR2_CPHA		BIT(9)
 #define USART_CR2_CPOL		BIT(10)
@@ -224,12 +220,10 @@ struct stm32_usart_info stm32h7_info = {
 
 /* USART_ICR */
 #define USART_ICR_PECF		BIT(0)		/* F7 */
-#define USART_ICR_FFECF		BIT(1)		/* F7 */
-#define USART_ICR_NCF		BIT(2)		/* F7 */
+#define USART_ICR_FECF		BIT(1)		/* F7 */
 #define USART_ICR_ORECF		BIT(3)		/* F7 */
 #define USART_ICR_IDLECF	BIT(4)		/* F7 */
 #define USART_ICR_TCCF		BIT(6)		/* F7 */
-#define USART_ICR_LBDCF		BIT(8)		/* F7 */
 #define USART_ICR_CTSCF		BIT(9)		/* F7 */
 #define USART_ICR_RTOCF		BIT(11)		/* F7 */
 #define USART_ICR_EOBCF		BIT(12)		/* F7 */
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
