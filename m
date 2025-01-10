Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EFEA093E8
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 15:45:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10DEFC78F75;
	Fri, 10 Jan 2025 14:45:53 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39C5BC78F71
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 14:45:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52486FF809;
 Fri, 10 Jan 2025 14:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736520352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EpRU8Ni8GjnsQQyxRFEa2zYtIybiX1a/U99sUmUB8ik=;
 b=ps2xwVTlM2PTpfSbUiaA7GQikbBH2xvfr/ZvvllsjJplPe0WaeZjLR3zfkV5ZPJo9Fsvfw
 Hvr/eNi/+vf5xgAEq3I6OWryO5KLCo2GlusGdMXRZQN3ls18h+0riFckUUqD9oNbjI/gR5
 0m3WtbaalZjIWYBQtsudpoGqxwxL12PtG0RvDneXjNijWN6EDWlsydN6yevpu2gg7yKNUr
 a/p/z1DcxBrwliH5lFJMR7tggXrkA4gBMPupZ1/c4m30EBZPNtO3XRfczF2zZwitdePeJE
 Y4T+AovB8ht2v/imVIx+K6HoyMofI2fs3bA6uDikBjR/LNw8J9gnI5lezSkcNw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 10 Jan 2025 15:45:20 +0100
MIME-Version: 1.0
Message-Id: <20250110-winbond-6-11-rc1-quad-support-v3-18-7ab4bd56cf6e@bootlin.com>
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 18/27] spi: spi-mem: Reorder spi-mem macro
	assignments
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

Follow the order in which all the `struct spi_mem_op` members are
defined.

This is purely aesthetics, there is no functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/spi/spi-mem.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index c7a7719c264846ad9fce613ba96d9284ad7893e7..ca6ea01c40f85095ac2730cb424cfb21d7daa700 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -15,16 +15,16 @@
 
 #define SPI_MEM_OP_CMD(__opcode, __buswidth)			\
 	{							\
+		.nbytes = 1,					\
 		.buswidth = __buswidth,				\
 		.opcode = __opcode,				\
-		.nbytes = 1,					\
 	}
 
 #define SPI_MEM_OP_ADDR(__nbytes, __val, __buswidth)		\
 	{							\
 		.nbytes = __nbytes,				\
-		.val = __val,					\
 		.buswidth = __buswidth,				\
+		.val = __val,					\
 	}
 
 #define SPI_MEM_OP_NO_ADDR	{ }
@@ -39,18 +39,18 @@
 
 #define SPI_MEM_OP_DATA_IN(__nbytes, __buf, __buswidth)		\
 	{							\
+		.buswidth = __buswidth,				\
 		.dir = SPI_MEM_DATA_IN,				\
 		.nbytes = __nbytes,				\
 		.buf.in = __buf,				\
-		.buswidth = __buswidth,				\
 	}
 
 #define SPI_MEM_OP_DATA_OUT(__nbytes, __buf, __buswidth)	\
 	{							\
+		.buswidth = __buswidth,				\
 		.dir = SPI_MEM_DATA_OUT,			\
 		.nbytes = __nbytes,				\
 		.buf.out = __buf,				\
-		.buswidth = __buswidth,				\
 	}
 
 #define SPI_MEM_OP_NO_DATA	{ }

-- 
2.47.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
