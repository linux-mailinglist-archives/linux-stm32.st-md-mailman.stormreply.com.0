Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B2D240239
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Aug 2020 09:13:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B4E4C3FAD3;
	Mon, 10 Aug 2020 07:13:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16C06C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Aug 2020 07:13:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07A77SK1013394; Mon, 10 Aug 2020 09:12:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=cifgomN05QxiscKyTe4tmhqBKFm7XD+dPybDFIfuoiQ=;
 b=u9F/vn/hGG2cT1Ob8Sn9fLzouRKaLMf8hnkALgom47jYsd1I6H043arSPt30Pf2NdaP7
 E0fx+rJCLMJnlNFXxklLvzzEPNxzTrj2ifxwfU7Et06wUZjqeg4k5E0YxbbVZ1IGQNq+
 wfEALTmfYM0X1/oDrIFRyprlHSXrpU64WAZ0kW5Yah49T12VxtzG1Me/jYKxVesbRiVp
 RFP1p4ldBAV15M4ZESFaOcDGVCP56/TGqkhHwk0TXLgJF3QCBwQkXU7wujzRHBanhlsg
 XJuyXbORy0wKzBwn3fO0Yir7UvQLf+LsNg1Ui3o63lumxrYKVhOdU49+Jwb20K2LQyW1 YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32sm9r6n5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 09:12:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9849A100039;
 Mon, 10 Aug 2020 09:12:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 88A312AD9ED;
 Mon, 10 Aug 2020 09:12:51 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Aug 2020 09:12:51
 +0200
From: Alain Volmat <alain.volmat@st.com>
To: <broonie@kernel.org>, <amelie.delaunay@st.com>
Date: Mon, 10 Aug 2020 09:12:36 +0200
Message-ID: <1597043558-29668-4-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597043558-29668-1-git-send-email-alain.volmat@st.com>
References: <1597043558-29668-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-10_02:2020-08-06,
 2020-08-10 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 alain.volmat@st.com, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/5] spi: stm32: fix stm32_spi_prepare_mbr
	in case of odd clk_rate
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

From: Amelie Delaunay <amelie.delaunay@st.com>

Fix spi->clk_rate when it is odd to the nearest lowest even value because
minimum SPI divider is 2.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
v2: identical to v1

 drivers/spi/spi-stm32.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index e5450233f3f8..571dea72bf7e 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -441,7 +441,8 @@ static int stm32_spi_prepare_mbr(struct stm32_spi *spi, u32 speed_hz,
 {
 	u32 div, mbrdiv;
 
-	div = DIV_ROUND_UP(spi->clk_rate, speed_hz);
+	/* Ensure spi->clk_rate is even */
+	div = DIV_ROUND_UP(spi->clk_rate & ~0x1, speed_hz);
 
 	/*
 	 * SPI framework set xfer->speed_hz to master->max_speed_hz if
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
