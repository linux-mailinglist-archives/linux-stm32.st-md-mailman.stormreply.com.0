Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D6D6405D1
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Dec 2022 12:28:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 980EEC65E62;
	Fri,  2 Dec 2022 11:28:44 +0000 (UTC)
Received: from mx4.securetransport.de (mx4.securetransport.de [178.254.6.145])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id
 1B8C7C6506E for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Dec 2022 11:28:42 +0000 (UTC)
Received: from mail.dh-electronics.com (unknown [77.24.89.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx4.securetransport.de (Postfix) with ESMTPSA id 1A7EC7201A0;
 Fri,  2 Dec 2022 12:27:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1669980481;
 bh=Yw80B+VbXYxZbZl5QOEChJ2+lPK3kstlswLK+D6i38Q=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=mD1aba1DxgiExqPfgQvBYDdKgKQ7a5pVMsRNPU/PeJtuMHs0nKNujCm0HI7Aus7Xa
 svDc7ZqtEgh2sWVAltEYrP+uJd+AGryYNwJcXwLka1bjm7eB1D0fdh4x3j/PPGextN
 DpEh9XgfgF73CEoV4Ycfxk1V3hp3v889Tsxddtyu5sn2Q4UFh5OPSAnINDiVEyDO7i
 RxImd/flNi9QiZObGhFPiQE+n7iCPIeCxslgaBqvCeaw5uhy4172belboDEa28wyZ6
 o4rrjf+sITs23iWSope0G290OxeXiI/384CEJ7LcpqlYhHvwdFh0qp6/npoCTndCd5
 P/vx2AaRiqMUQ==
Received: from DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) by
 DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Fri, 2 Dec 2022 11:42:39 +0100
Received: from localhost.localdomain (172.16.51.2) by
 DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20 via Frontend Transport; Fri, 2 Dec 2022 11:42:39 +0100
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date: Fri, 2 Dec 2022 11:41:27 +0100
Message-ID: <20221202104127.122761-4-cniedermaier@dh-electronics.com>
X-Mailer: git-send-email 2.11.0
X-klartext: yes
In-Reply-To: <20221202104127.122761-1-cniedermaier@dh-electronics.com>
References: <20221202104127.122761-1-cniedermaier@dh-electronics.com>
MIME-Version: 1.0
Cc: marex@denx.de, Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 krzysztof.kozlowski+dt@linaro.org, Alexander Dahl <ada@thorsis.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, jirislaby@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH V4 4/4] serial: stm32: Add support for rs485
	RX_DURING_TX output GPIO
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

If a RX_DURING_TX GPIO is defined by the DT property "rs485-rx-during-tx-gpios"
this patch switches this GPIO accordingly to the RS485 flag RX_DURING_TX in user
space. Controlled by this GPIO, now the hardware is responsible for connecting
or disconnecting RX during TX.

Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
---
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Alexander Dahl <ada@thorsis.com>
Cc: Marek Vasut <marex@denx.de>
Cc: kernel@dh-electronics.com
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-serial@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
---
V2: - Rework of the commit message
V3: - No changes
V4: - Direct call of gpiod_set_value_cansleep() without if statement
---
 drivers/tty/serial/stm32-usart.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index a1490033aa16..f1b1df78118f 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -226,7 +226,11 @@ static int stm32_usart_config_rs485(struct uart_port *port, struct ktermios *ter
 
 	stm32_usart_clr_bits(port, ofs->cr1, BIT(cfg->uart_enable_bit));
 
-	rs485conf->flags |= SER_RS485_RX_DURING_TX;
+	if (port->rs485_rx_during_tx_gpio)
+		gpiod_set_value_cansleep(port->rs485_rx_during_tx_gpio,
+					 !!(rs485conf->flags & SER_RS485_RX_DURING_TX));
+	else
+		rs485conf->flags |= SER_RS485_RX_DURING_TX;
 
 	if (rs485conf->flags & SER_RS485_ENABLED) {
 		cr1 = readl_relaxed(port->membase + ofs->cr1);
-- 
2.11.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
