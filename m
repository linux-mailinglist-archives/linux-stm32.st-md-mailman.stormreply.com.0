Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF6B90D003
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2024 15:30:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA01EC78015;
	Tue, 18 Jun 2024 13:30:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53127C78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2024 13:30:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45IACIj1029241;
 Tue, 18 Jun 2024 15:30:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 HYcrM2zeixLrf144VTZhcSvMBMDzoKSjg21opagkbjU=; b=NfFNU26ajJSx2lLd
 R6Mx9zmU03eEM7cIEMorjN6d/T2NRISho6aP7QdOLve7WuL3VDU4DIQR/4xESXUO
 Wz5Ucew1Ou+dI+kLRsUIGnTl+2w8CO4FNEjA1DT+ptVGQE1CTuUin8+oN22dOMOE
 VcS+yNv7P7CWZVdU5j1kPVEvUXdxCZkKMkmJ6f2FZd+MtHiLKGK9a5guC85ereht
 xQrWX5CrI7/K2qZFWOG9jxrN231VzPN2NBzmRueZydrdXBmdxbxcrEtOfcBIYDRX
 Ck/Vfena/lHQzU8R53TOf8dVi+H/QOinT5+J7kWVMwl+9QoKYyh7BDo3/YiOe4fd
 Mt87Dw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ys1ucuek4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jun 2024 15:30:23 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4B49E4002D;
 Tue, 18 Jun 2024 15:30:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8DA80218623;
 Tue, 18 Jun 2024 15:29:57 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 18 Jun
 2024 15:29:57 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 18 Jun 2024 15:29:51 +0200
Message-ID: <20240618132951.2743935-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240618132951.2743935-1-patrice.chotard@foss.st.com>
References: <20240618132951.2743935-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/3] spi: add OCTAL mode support
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Add OCTAL mode support.
Issue detected using "--octal" spidev_test's option.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/spi/spi.c       | 6 ++++--
 include/linux/spi/spi.h | 5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 9bc9fd10d538..9da736d51a2b 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -4156,7 +4156,8 @@ static int __spi_validate(struct spi_device *spi, struct spi_message *message)
 				return -EINVAL;
 			if (xfer->tx_nbits != SPI_NBITS_SINGLE &&
 				xfer->tx_nbits != SPI_NBITS_DUAL &&
-				xfer->tx_nbits != SPI_NBITS_QUAD)
+				xfer->tx_nbits != SPI_NBITS_QUAD &&
+				xfer->tx_nbits != SPI_NBITS_OCTAL)
 				return -EINVAL;
 			if ((xfer->tx_nbits == SPI_NBITS_DUAL) &&
 				!(spi->mode & (SPI_TX_DUAL | SPI_TX_QUAD)))
@@ -4171,7 +4172,8 @@ static int __spi_validate(struct spi_device *spi, struct spi_message *message)
 				return -EINVAL;
 			if (xfer->rx_nbits != SPI_NBITS_SINGLE &&
 				xfer->rx_nbits != SPI_NBITS_DUAL &&
-				xfer->rx_nbits != SPI_NBITS_QUAD)
+				xfer->rx_nbits != SPI_NBITS_QUAD &&
+				xfer->rx_nbits != SPI_NBITS_OCTAL)
 				return -EINVAL;
 			if ((xfer->rx_nbits == SPI_NBITS_DUAL) &&
 				!(spi->mode & (SPI_RX_DUAL | SPI_RX_QUAD)))
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index e8e1e798924f..98fdef6e28f2 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -1085,12 +1085,13 @@ struct spi_transfer {
 	unsigned	dummy_data:1;
 	unsigned	cs_off:1;
 	unsigned	cs_change:1;
-	unsigned	tx_nbits:3;
-	unsigned	rx_nbits:3;
+	unsigned	tx_nbits:4;
+	unsigned	rx_nbits:4;
 	unsigned	timestamped:1;
 #define	SPI_NBITS_SINGLE	0x01 /* 1-bit transfer */
 #define	SPI_NBITS_DUAL		0x02 /* 2-bit transfer */
 #define	SPI_NBITS_QUAD		0x04 /* 4-bit transfer */
+#define	SPI_NBITS_OCTAL	0x08 /* 8-bit transfer */
 	u8		bits_per_word;
 	struct spi_delay	delay;
 	struct spi_delay	cs_change_delay;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
