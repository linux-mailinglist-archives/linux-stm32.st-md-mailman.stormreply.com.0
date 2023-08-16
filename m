Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC4C77DBA9
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Aug 2023 10:06:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92BA7C6B45F;
	Wed, 16 Aug 2023 08:06:20 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A265AC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 08:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=DFCSa0bKnBx/detxGAhP6SEXintID1n5Sv8s4xGXPaA=; b=T+d3KCiS7aS2zac7vnzY9jD0L2
 a73KzbrITljHnG3bCVwKaYIEGHuVmijM969/tKjKKpP+isrt04F+ueDWq2Rb/0z7ZjagPcJkPc0NJ
 adfDdDbV8rONIm1nusqUgZDqeCz2S/3YGV6qWR1/6WspfMAHwxdZsfQJIO7tiyiI3PXZ9EHeaSRhX
 WK6BadsKTd88gDgxygUj5TiEs6Mx+LvieQh4TPwS2/Lpw2TdhBekP/gW/biNmi30sGOuXIo8id3I1
 b/VZR42rTfQ4y7QlFP3LNaWgKzipyPioePXr9FrnqGLqq6TFt64+IP9RxDw1OcijkFWoMTFvRAGSB
 7HIrkzWg==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1qWBXh-0009hR-VY; Wed, 16 Aug 2023 10:06:14 +0200
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <sean@geanix.com>)
 id 1qWBXh-000VYp-DJ; Wed, 16 Aug 2023 10:06:13 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 16 Aug 2023 10:05:52 +0200
Message-ID: <20230816080552.3045491-1-sean@geanix.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/27001/Tue Aug 15 09:40:17 2023)
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Sean Nyekjaer <sean@geanix.com>
Subject: [Linux-stm32] [PATCH v3] i2c: stm32f7: Add atomic_xfer method to
	driver
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

Add an atomic_xfer method to the driver so that it behaves correctly
when controlling a PMIC that is responsible for device shutdown.

The atomic_xfer method added is similar to the one from the i2c-mv64xxx
driver. When running an atomic_xfer a bool flag in the driver data is
set, the interrupt is not unmasked on transfer start, and the IRQ
handler is manually invoked while waiting for pending transfers to
complete.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
Changes since v1:
 - Removed dma in atomic

Changes since v2:
 - Changed stm32f7_i2c_xfer_msg() so we have less of a diff
 - Changed try_wait_for_completion -> completion_done

 drivers/i2c/busses/i2c-stm32f7.c | 51 +++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 579b30581725..16e2cb0b82bf 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -357,6 +357,7 @@ struct stm32f7_i2c_dev {
 	u32 dnf_dt;
 	u32 dnf;
 	struct stm32f7_i2c_alert *alert;
+	bool atomic;
 };
 
 /*
@@ -915,7 +916,8 @@ static void stm32f7_i2c_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
 
 	/* Configure DMA or enable RX/TX interrupt */
 	i2c_dev->use_dma = false;
-	if (i2c_dev->dma && f7_msg->count >= STM32F7_I2C_DMA_LEN_MIN) {
+	if (i2c_dev->dma && f7_msg->count >= STM32F7_I2C_DMA_LEN_MIN
+	    && !i2c_dev->atomic) {
 		ret = stm32_i2c_prep_dma_xfer(i2c_dev->dev, i2c_dev->dma,
 					      msg->flags & I2C_M_RD,
 					      f7_msg->count, f7_msg->buf,
@@ -939,6 +941,9 @@ static void stm32f7_i2c_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
 			cr1 |= STM32F7_I2C_CR1_TXDMAEN;
 	}
 
+	if (i2c_dev->atomic)
+		cr1 &= ~STM32F7_I2C_ALL_IRQ_MASK; /* Disable all interrupts */
+
 	/* Configure Start/Repeated Start */
 	cr2 |= STM32F7_I2C_CR2_START;
 
@@ -1670,7 +1675,22 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
+static int stm32f7_i2c_wait_polling(struct stm32f7_i2c_dev *i2c_dev)
+{
+	ktime_t timeout = ktime_add_ms(ktime_get(), i2c_dev->adap.timeout);
+
+	while (ktime_compare(ktime_get(), timeout) < 0) {
+		udelay(5);
+		stm32f7_i2c_isr_event(0, i2c_dev);
+
+		if (completion_done(&i2c_dev->complete))
+			return 1;
+	}
+
+	return 0;
+}
+
+static int stm32f7_i2c_xfer_core(struct i2c_adapter *i2c_adap,
 			    struct i2c_msg msgs[], int num)
 {
 	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(i2c_adap);
@@ -1694,8 +1714,12 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
 
 	stm32f7_i2c_xfer_msg(i2c_dev, msgs);
 
-	time_left = wait_for_completion_timeout(&i2c_dev->complete,
-						i2c_dev->adap.timeout);
+	if (!i2c_dev->atomic)
+		time_left = wait_for_completion_timeout(&i2c_dev->complete,
+							i2c_dev->adap.timeout);
+	else
+		time_left = stm32f7_i2c_wait_polling(i2c_dev);
+
 	ret = f7_msg->result;
 	if (ret) {
 		if (i2c_dev->use_dma)
@@ -1727,6 +1751,24 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
 	return (ret < 0) ? ret : num;
 }
 
+static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
+			    struct i2c_msg msgs[], int num)
+{
+	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(i2c_adap);
+
+	i2c_dev->atomic = false;
+	return stm32f7_i2c_xfer_core(i2c_adap, msgs, num);
+}
+
+static int stm32f7_i2c_xfer_atomic(struct i2c_adapter *i2c_adap,
+			    struct i2c_msg msgs[], int num)
+{
+	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(i2c_adap);
+
+	i2c_dev->atomic = true;
+	return stm32f7_i2c_xfer_core(i2c_adap, msgs, num);
+}
+
 static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 				  unsigned short flags, char read_write,
 				  u8 command, int size,
@@ -2095,6 +2137,7 @@ static u32 stm32f7_i2c_func(struct i2c_adapter *adap)
 
 static const struct i2c_algorithm stm32f7_i2c_algo = {
 	.master_xfer = stm32f7_i2c_xfer,
+	.master_xfer_atomic = stm32f7_i2c_xfer_atomic,
 	.smbus_xfer = stm32f7_i2c_smbus_xfer,
 	.functionality = stm32f7_i2c_func,
 	.reg_slave = stm32f7_i2c_reg_slave,
-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
