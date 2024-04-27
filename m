Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CE78B47E8
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Apr 2024 22:36:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB12CC71293;
	Sat, 27 Apr 2024 20:36:32 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F125DC71293
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Apr 2024 20:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=k1; bh=gZ01Lhe4pAwdcuNCxaIYgv6RGXpiS5mlcEHdQcrIkWs=; b=HseIkX
 QeeKpgVS9jKY4BFhE/0UABE1zW0Qtb4VnivHX577i1yOEm/I+47oowrPMH9LHqnb
 MkwiKA+2NOg+KZwq2G91nlmmV01I+/7mZayTfWuToS6V/yewif7lNRllCbkQTXIj
 3lSqVJV6CX4HrrakUN+dmjXfh3gU6Xy+TzgG3pr5sQF8yThqDDl17yCg0mOuET2O
 gqYIHau5mkauEbFYudMXLFdHwIW9Lbx9Ipej6NRnPPUTGAB4dAlJfoWgWKaioOJ1
 gYBEpL6ZHriOdPz8Gfo3FviY/0Jy1BhXWB36135S/GSfv94r8K5x52vqVqCMpivg
 OVycBaShXiLV6cBg==
Received: (qmail 1781964 invoked from network); 27 Apr 2024 22:36:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 27 Apr 2024 22:36:20 +0200
X-UD-Smtp-Session: l3s3148p1@P+gS+RkX0s9ehh9l
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Date: Sat, 27 Apr 2024 22:36:00 +0200
Message-ID: <20240427203611.3750-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
References: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 08/15] i2c: stm32f4: use 'time_left' variable
	with wait_for_completion_timeout()
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

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_completion_timeout() causing patterns like:

	timeout = wait_for_completion_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-stm32f4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index 859ac0cf7f6c..f8b12be6ef55 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -681,7 +681,7 @@ static int stm32f4_i2c_xfer_msg(struct stm32f4_i2c_dev *i2c_dev,
 {
 	struct stm32f4_i2c_msg *f4_msg = &i2c_dev->msg;
 	void __iomem *reg = i2c_dev->base + STM32F4_I2C_CR1;
-	unsigned long timeout;
+	unsigned long time_left;
 	u32 mask;
 	int ret;
 
@@ -706,11 +706,11 @@ static int stm32f4_i2c_xfer_msg(struct stm32f4_i2c_dev *i2c_dev,
 		stm32f4_i2c_set_bits(reg, STM32F4_I2C_CR1_START);
 	}
 
-	timeout = wait_for_completion_timeout(&i2c_dev->complete,
-					      i2c_dev->adap.timeout);
+	time_left = wait_for_completion_timeout(&i2c_dev->complete,
+						i2c_dev->adap.timeout);
 	ret = f4_msg->result;
 
-	if (!timeout)
+	if (!time_left)
 		ret = -ETIMEDOUT;
 
 	return ret;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
