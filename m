Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEF6A093C1
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 15:45:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2CB3C78F6F;
	Fri, 10 Jan 2025 14:45:26 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DFBAC78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 14:45:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB452FF80D;
 Fri, 10 Jan 2025 14:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736520320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yep2fpLxz2x0BrYyE5exhny4uIKamjx0bibrwjwb1p8=;
 b=FvseSOy+GwxDVMVt4cgSN2BhSDtd4uEKCzW792wX+bUze7nJXZ9D9dtaWfsefvjGiQq0BL
 0CaVSxfhLM1+qlxaarveaEjxCcqiflVRS7PzCY139lwSJuY/9xlJq5TFcyzVhimWb200F4
 46e3n2h5IV3uGEL6cVKawfIl8Tp72kgtLXFxhJTSWns0xHdjXHe5pAc6elPUCfdOoenwbV
 2SrFSD+BiZs+cEfDpx2SUf+ibfv5ki0XrGgqvqpyuSXUqnpxgiKtELKrmm/gKndJmnfpSf
 3PW2GIwaGkx2S41nZKGmLG6CLBmQ4V+KwBUODZeSPppclIvRD62DMtpLmWw9TA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 10 Jan 2025 15:45:03 +0100
MIME-Version: 1.0
Message-Id: <20250110-winbond-6-11-rc1-quad-support-v3-1-7ab4bd56cf6e@bootlin.com>
References: <20250110-winbond-6-11-rc1-quad-support-v3-0-7ab4bd56cf6e@bootlin.com>
In-Reply-To: <20250110-winbond-6-11-rc1-quad-support-v3-0-7ab4bd56cf6e@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, 
 Serge Semin <fancer.lancer@gmail.com>, Han Xu <han.xu@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Raju Rangoju <Raju.Rangoju@amd.com>
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Steam Lin <stlin2@winbond.com>, linux-spi@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Pratyush Yadav <pratyush@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 01/27] spi: spi-mem: Extend spi-mem
 operations with a per-operation maximum frequency
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

In the spi subsystem, the bus frequency is derived as follows:
- the controller may expose a minimum and maximum operating frequency
- the hardware description, through the spi peripheral properties,
  advise what is the maximum acceptable frequency from a device/wiring
  point of view.
Transfers must be observed at a frequency which fits both (so in
practice, the lowest maximum).

Actually, this second point mixes two information and already takes the
lowest frequency among:
- what the spi device is capable of (what is written in the component
  datasheet)
- what the wiring allows (electromagnetic sensibility, crossovers,
  terminations, antenna effect, etc).

This logic works until spi devices are no longer capable of sustaining
their highest frequency regardless of the operation. Spi memories are
typically subject to such variation. Some devices are capable of
spitting their internally stored data (essentially in read mode) at a
very fast rate, typically up to 166MHz on Winbond SPI-NAND chips, using
"fast" commands. However, some of the low-end operations, such as
regular page read-from-cache commands, are more limited and can only be
executed at 54MHz at most. This is currently a problem in the SPI-NAND
subsystem. Another situation, even if not yet supported, will be with
DTR commands, when the data is latched on both edges of the clock. The
same chips as mentioned previously are in this case limited to
80MHz. Yet another example might be continuous reads, which, under
certain circumstances, can also run at most at 104 or 120MHz.

As a matter of fact, the "one frequency per chip" policy is outdated and
more fine grain configuration is needed: we need to allow per-operation
frequency limitations. So far, all datasheets I encountered advertise a
maximum default frequency, which need to be lowered for certain specific
operations. So based on the current infrastructure, we can still expect
firmware (device trees in general) to continued advertising the same
maximum speed which is a mix between the PCB limitations and the chip
maximum capability, and expect per-operation lower frequencies when this
is relevant.

Add a `struct spi_mem_op` member to carry this information. Not
providing this field explicitly from upper layers means that there is no
further constraint and the default spi device maximum speed will be
carried instead. The SPI_MEM_OP() macro is also expanded with an
optional frequency argument, because virtually all operations can be
subject to such a limitation, and this will allow for a smooth and
discrete transition.

For controller drivers which do not implement the spi-mem interface, the
per-transfer speed is also set acordingly to a lower (than the maximum
default) speed when relevant.

Acked-by: Pratyush Yadav <pratyush@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c |  2 ++
 drivers/spi/spi-mem.c       | 28 ++++++++++++++++++++++++++++
 include/linux/spi/spi-mem.h | 12 +++++++++++-
 3 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index b1df7f6271616ba1e6a9718b7aea2512795505dc..94f33c8be031ac60208e22e4e3fa0d90cfae093c 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1214,6 +1214,8 @@ spinand_select_op_variant(struct spinand_device *spinand,
 			if (ret)
 				break;
 
+			spi_mem_adjust_op_freq(spinand->spimem, &op);
+
 			if (!spi_mem_supports_op(spinand->spimem, &op))
 				break;
 
diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index abc6792e738c730166ef9b0aa505ce5225893938..12299ce89a1cc80495858dbbbaa822f2968bb7ab 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -187,6 +187,10 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 			return false;
 	}
 
+	if (op->max_freq && mem->spi->controller->min_speed_hz &&
+	    op->max_freq < mem->spi->controller->min_speed_hz)
+		return false;
+
 	return spi_mem_check_buswidth(mem, op);
 }
 EXPORT_SYMBOL_GPL(spi_mem_default_supports_op);
@@ -364,6 +368,9 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 	u8 *tmpbuf;
 	int ret;
 
+	/* Make sure the operation frequency is correct before going futher */
+	spi_mem_adjust_op_freq(mem, (struct spi_mem_op *)op);
+
 	ret = spi_mem_check_op(op);
 	if (ret)
 		return ret;
@@ -410,6 +417,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 	xfers[xferpos].tx_buf = tmpbuf;
 	xfers[xferpos].len = op->cmd.nbytes;
 	xfers[xferpos].tx_nbits = op->cmd.buswidth;
+	xfers[xferpos].speed_hz = op->max_freq;
 	spi_message_add_tail(&xfers[xferpos], &msg);
 	xferpos++;
 	totalxferlen++;
@@ -424,6 +432,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 		xfers[xferpos].tx_buf = tmpbuf + 1;
 		xfers[xferpos].len = op->addr.nbytes;
 		xfers[xferpos].tx_nbits = op->addr.buswidth;
+		xfers[xferpos].speed_hz = op->max_freq;
 		spi_message_add_tail(&xfers[xferpos], &msg);
 		xferpos++;
 		totalxferlen += op->addr.nbytes;
@@ -435,6 +444,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 		xfers[xferpos].len = op->dummy.nbytes;
 		xfers[xferpos].tx_nbits = op->dummy.buswidth;
 		xfers[xferpos].dummy_data = 1;
+		xfers[xferpos].speed_hz = op->max_freq;
 		spi_message_add_tail(&xfers[xferpos], &msg);
 		xferpos++;
 		totalxferlen += op->dummy.nbytes;
@@ -450,6 +460,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 		}
 
 		xfers[xferpos].len = op->data.nbytes;
+		xfers[xferpos].speed_hz = op->max_freq;
 		spi_message_add_tail(&xfers[xferpos], &msg);
 		xferpos++;
 		totalxferlen += op->data.nbytes;
@@ -528,6 +539,23 @@ int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
 }
 EXPORT_SYMBOL_GPL(spi_mem_adjust_op_size);
 
+/**
+ * spi_mem_adjust_op_freq() - Adjust the frequency of a SPI mem operation to
+ *			      match controller, PCB and chip limitations
+ * @mem: the SPI memory
+ * @op: the operation to adjust
+ *
+ * Some chips have per-op frequency limitations and must adapt the maximum
+ * speed. This function allows SPI mem drivers to set @op->max_freq to the
+ * maximum supported value.
+ */
+void spi_mem_adjust_op_freq(struct spi_mem *mem, struct spi_mem_op *op)
+{
+	if (!op->max_freq || op->max_freq > mem->spi->max_speed_hz)
+		op->max_freq = mem->spi->max_speed_hz;
+}
+EXPORT_SYMBOL_GPL(spi_mem_adjust_op_freq);
+
 static ssize_t spi_mem_no_dirmap_read(struct spi_mem_dirmap_desc *desc,
 				      u64 offs, size_t len, void *buf)
 {
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index c46d2b8029be5b3cee1cb6a5dc00e3d1a0e9ced2..84ec524987921a95963235de4b6f728ef2fc5987 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -68,6 +68,9 @@ enum spi_mem_data_dir {
 	SPI_MEM_DATA_OUT,
 };
 
+#define SPI_MEM_OP_MAX_FREQ(__freq)				\
+	.max_freq = __freq
+
 /**
  * struct spi_mem_op - describes a SPI memory operation
  * @cmd.nbytes: number of opcode bytes (only 1 or 2 are valid). The opcode is
@@ -97,6 +100,9 @@ enum spi_mem_data_dir {
  *		 operation does not involve transferring data
  * @data.buf.in: input buffer (must be DMA-able)
  * @data.buf.out: output buffer (must be DMA-able)
+ * @max_freq: frequency limitation wrt this operation. 0 means there is no
+ *	      specific constraint and the highest achievable frequency can be
+ *	      attempted.
  */
 struct spi_mem_op {
 	struct {
@@ -135,14 +141,17 @@ struct spi_mem_op {
 			const void *out;
 		} buf;
 	} data;
+
+	unsigned int max_freq;
 };
 
-#define SPI_MEM_OP(__cmd, __addr, __dummy, __data)		\
+#define SPI_MEM_OP(__cmd, __addr, __dummy, __data, ...)		\
 	{							\
 		.cmd = __cmd,					\
 		.addr = __addr,					\
 		.dummy = __dummy,				\
 		.data = __data,					\
+		__VA_ARGS__					\
 	}
 
 /**
@@ -371,6 +380,7 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 #endif /* CONFIG_SPI_MEM */
 
 int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op);
+void spi_mem_adjust_op_freq(struct spi_mem *mem, struct spi_mem_op *op);
 
 bool spi_mem_supports_op(struct spi_mem *mem,
 			 const struct spi_mem_op *op);

-- 
2.47.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
