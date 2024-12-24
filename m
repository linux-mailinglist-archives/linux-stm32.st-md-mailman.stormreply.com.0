Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD019FC09E
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Dec 2024 18:07:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6407AC78F67;
	Tue, 24 Dec 2024 17:07:53 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10626C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Dec 2024 17:07:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6473340002;
 Tue, 24 Dec 2024 17:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735060071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kbQep8baX7V18i3WQzlRcus+JcLBQAZAEQ0EVnsTNJ0=;
 b=QLRtoFxKhPx0761tFyItDBBDh2ZlFhF74KE6N+ECmWyJZguR1WQ5Ubts5K4LFjzLqsiF8f
 znkeDr/77Gx65+E0itx1DTZB5nG6gmx+RZ5PoaZ348+69I1KFnN8av9noGAGWqGVqa8VJH
 /47qulqvgam/S4uoVPc9phHZzhGwvSiZDuuFV3dpfkin0H8Khid96WKjSwJDVCdkUlpw1z
 T+5MCcHJ5EE35MNfDSFbQQD3KEUm93JXLCEUgKCidBEmGQk7JER2pakRH+bareC++ojpDF
 xBHAi4D1P//sZEySLVewnaP8Lt0ihrF6PYH2v7ExzKqcTZ6RPIzkkSanj9zaGg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Dec 2024 18:06:04 +0100
MIME-Version: 1.0
Message-Id: <20241224-winbond-6-11-rc1-quad-support-v2-19-ad218dbc406f@bootlin.com>
References: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
In-Reply-To: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
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
Subject: [Linux-stm32] [PATCH v2 19/27] spi: spi-mem: Create macros for DTR
	operation
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

We do have macros for defining command, address, dummy and data
cycles. We also have a .dtr flag that implies sampling the bus on both
edges, but there are currently no macros enabling it. We might make use
of such macros, so let's create:
- SPI_MEM_DTR_OP_CMD
- SPI_MEM_DTR_OP_ADDR
- SPI_MEM_DTR_OP_DUMMY
- SPI_MEM_DTR_OP_DATA_OUT
- SPI_MEM_DTR_OP_DATA_OUT

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/spi/spi-mem.h | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index ca6ea01c40f85095ac2730cb424cfb21d7daa700..306c05dd13789017da2c5339cddc031f03302bb9 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -20,6 +20,14 @@
 		.opcode = __opcode,				\
 	}
 
+#define SPI_MEM_DTR_OP_CMD(__opcode, __buswidth)		\
+	{							\
+		.nbytes = 1,					\
+		.opcode = __opcode,				\
+		.buswidth = __buswidth,				\
+		.dtr = true,					\
+	}
+
 #define SPI_MEM_OP_ADDR(__nbytes, __val, __buswidth)		\
 	{							\
 		.nbytes = __nbytes,				\
@@ -27,6 +35,14 @@
 		.val = __val,					\
 	}
 
+#define SPI_MEM_DTR_OP_ADDR(__nbytes, __val, __buswidth)	\
+	{							\
+		.nbytes = __nbytes,				\
+		.val = __val,					\
+		.buswidth = __buswidth,				\
+		.dtr = true,					\
+	}
+
 #define SPI_MEM_OP_NO_ADDR	{ }
 
 #define SPI_MEM_OP_DUMMY(__nbytes, __buswidth)			\
@@ -35,6 +51,13 @@
 		.buswidth = __buswidth,				\
 	}
 
+#define SPI_MEM_DTR_OP_DUMMY(__nbytes, __buswidth)		\
+	{							\
+		.nbytes = __nbytes,				\
+		.buswidth = __buswidth,				\
+		.dtr = true,					\
+	}
+
 #define SPI_MEM_OP_NO_DUMMY	{ }
 
 #define SPI_MEM_OP_DATA_IN(__nbytes, __buf, __buswidth)		\
@@ -45,6 +68,15 @@
 		.buf.in = __buf,				\
 	}
 
+#define SPI_MEM_DTR_OP_DATA_IN(__nbytes, __buf, __buswidth)	\
+	{							\
+		.dir = SPI_MEM_DATA_IN,				\
+		.nbytes = __nbytes,				\
+		.buf.in = __buf,				\
+		.buswidth = __buswidth,				\
+		.dtr = true,					\
+	}
+
 #define SPI_MEM_OP_DATA_OUT(__nbytes, __buf, __buswidth)	\
 	{							\
 		.buswidth = __buswidth,				\
@@ -53,6 +85,15 @@
 		.buf.out = __buf,				\
 	}
 
+#define SPI_MEM_DTR_OP_DATA_OUT(__nbytes, __buf, __buswidth)	\
+	{							\
+		.dir = SPI_MEM_DATA_OUT,			\
+		.nbytes = __nbytes,				\
+		.buf.out = __buf,				\
+		.buswidth = __buswidth,				\
+		.dtr = true,					\
+	}
+
 #define SPI_MEM_OP_NO_DATA	{ }
 
 /**

-- 
2.47.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
