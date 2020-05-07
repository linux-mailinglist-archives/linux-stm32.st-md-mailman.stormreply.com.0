Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7A31C87D9
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 13:15:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C587C3F93E;
	Thu,  7 May 2020 11:15:57 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8B38C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 11:15:55 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id v63so2843544pfb.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 04:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=q5Ur7h/8oNS0E2jiQqG3CicZ1bVNQn1Ydx7PFOHfa0s=;
 b=vR5ulAiFzgiMVcgSPCb6i5yphLLVEtvHKU/b5abZlIFH43323JlPd5KMMStpRnXzBh
 WaI6/rirsojCkduRRV/ISOPLZmdiIuEpB57Y1eFvwFAo8LqTyxDXcix6QMLHG7BFeobo
 jgZi1O968NO0xyNItwoWpBW2XGhT4JWh3z8hpxUjrVpoDc3RGTxwtkEfTzM5pn8eGh4h
 UQdlyay/n0BgUc6MZhoACDDKw6l24cg92w0h6UUWWg0eE2Prim1/PQhMkJcNBe6RLvi2
 XmVGQw0ZN0XpQToieiNZ50lWcepk2YyOIh4UtDooZjjoniNj8hGu+QqrRLEqcvwUpPvn
 uIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=q5Ur7h/8oNS0E2jiQqG3CicZ1bVNQn1Ydx7PFOHfa0s=;
 b=kcrrcvVcE0BEv8+PxPCkQVhJyycjJpInFKq9gBozwFYXQ/s0ejjLcUu5oSYZeF70w4
 w0bmH7iCSJC3Wx7mXZzImkIvMWqGBgdQHlqaiQKOdsbRA42++x9fLD/zLTYZ+rUSw4lc
 7L2bFy2bkDbuYnrV46uLJ3tiT/n/6/fm9tRD/24Tinn+SNXL0gvbUpF+ngnZnMjB0mVV
 QfXslAm3v6NZu46eHLmI/QuadHzKQR/SPLqOJ/WMrmI74lZXuN0OeuKdBBkEehRYTsdJ
 KPM6kgHZwNQ7YuAwNbJ95u2hhGP90iFF6bH6+vEun4rKutsG71jbQdCNB98R9m1/BeTO
 s+YA==
X-Gm-Message-State: AGi0Pub7ucDJ/c1zlUsTJ7MwdZnCGawkx6Hn1UB2GNZfzikojMnDJg3Q
 nIXBCdTW/LBnN/bhSvY+eKY=
X-Google-Smtp-Source: APiQypIkSq2sEnKfRxF2yLpUtwLsawR7IO0elGcrndZ1UHxIKE6n1f7LU+bM9YsoKY6q1jiE71yOWQ==
X-Received: by 2002:a63:f70e:: with SMTP id x14mr10338566pgh.394.1588850154438; 
 Thu, 07 May 2020 04:15:54 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id d184sm4492752pfc.130.2020.05.07.04.15.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 04:15:53 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 philippe.schenker@toradex.com
Date: Thu,  7 May 2020 19:15:49 +0800
Message-Id: <1588850149-24393-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH V2 4/4] i2c: stm32f4: Fix stmpe811 get xyz
	data timeout issue
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

As stm32f429's internal flash is 2Mbytes and compiled kernel
image bigger than 2Mbytes, so we have to load kernel image
to sdram on stm32f429-disco board which has 8Mbytes sdram space.

based on above context, as you knows kernel running on external
sdram is more slower than internal flash. besides, we need read 4
bytes to get touch screen xyz(x, y, pressure) coordinate data in
stmpe811 interrupt.

so, in stm32f4_i2c_handle_rx_done, as i2c read slower than running
in xip mode, have to adjust 'STOP/START bit set time' from last two
bytes to last one bytes. else, will get i2c timeout in reading
touch screen coordinate.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 drivers/i2c/busses/i2c-stm32f4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index d6a69df..83004f2 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -439,7 +439,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
 	int i;
 
 	switch (msg->count) {
-	case 2:
+	case 1:
 		/*
 		 * In order to correctly send the Stop or Repeated Start
 		 * condition on the I2C bus, the STOP/START bit has to be set
@@ -454,7 +454,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
 		else
 			stm32f4_i2c_set_bits(reg, STM32F4_I2C_CR1_START);
 
-		for (i = 2; i > 0; i--)
+		for (i = 1; i > 0; i--)
 			stm32f4_i2c_read_msg(i2c_dev);
 
 		reg = i2c_dev->base + STM32F4_I2C_CR2;
@@ -463,7 +463,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
 
 		complete(&i2c_dev->complete);
 		break;
-	case 3:
+	case 2:
 		/*
 		 * In order to correctly generate the NACK pulse after the last
 		 * received data byte, we have to enable NACK before reading N-2
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
