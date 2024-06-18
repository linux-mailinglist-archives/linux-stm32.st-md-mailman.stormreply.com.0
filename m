Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F106690D002
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2024 15:30:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 928E9C78013;
	Tue, 18 Jun 2024 13:30:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51651C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2024 13:30:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45IAH8wh004229;
 Tue, 18 Jun 2024 15:30:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 IBFo4NrFdnbxxz+8CwZSbwc83Ry8OyJ9RuDGb1//7a8=; b=8TeIvVghPTAok+Ix
 1t9upPJRrMhlDfab1gqCWCS8p1Xmi1GJR7i2mr5PKk78otLrbNF3oGc9Eme8T7lo
 SAi6TxqHRQbAnKYvPbkjGT11M5f/mv8FRQc9B4dS61TbkRZ/5Ffrt1MKpQDLZYFt
 2NWPE/SujbugQ1GJPrF+RGpiMBwEZVpCFEu4GlC9NBkIrXa8EC944RJPPTvEsP+N
 kfx6f9/eneMss64pa2AOcKMTivA2Xkh3/5qixL231fWp0pfD1D74Vnu+Dxw+t0OQ
 O0a51Mx6CGy1GVc3AMhOTAKWwY7mhAoF75AgmpPeWxS5uuz6dlHiLo0pxYOsDqgK
 m1oVQw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ys1ucuekb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jun 2024 15:30:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3087D40047;
 Tue, 18 Jun 2024 15:30:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CCAF721862B;
 Tue, 18 Jun 2024 15:29:56 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 18 Jun
 2024 15:29:56 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 18 Jun 2024 15:29:50 +0200
Message-ID: <20240618132951.2743935-3-patrice.chotard@foss.st.com>
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/3] spi: stm32: qspi: Clamp
	stm32_qspi_get_mode() output to CCR_BUSWIDTH_4
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

In case usage of OCTAL mode, buswidth parameter can take the value 8.
As return value of stm32_qspi_get_mode() is used to configure fields
of CCR registers that are 2 bits only (fields IMODE, ADMODE, ADSIZE,
 DMODE), clamp return value of stm32_qspi_get_mode() to 4.

Fixes: a557fca630cc ("spi: stm32_qspi: Add transfer_one_message() spi callback")
Cc: stable@vger.kernel.org
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/spi/spi-stm32-qspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index 6944e85d8367..955c920c4b63 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -349,7 +349,7 @@ static int stm32_qspi_wait_poll_status(struct stm32_qspi *qspi)
 
 static int stm32_qspi_get_mode(u8 buswidth)
 {
-	if (buswidth == 4)
+	if (buswidth >= 4)
 		return CCR_BUSWIDTH_4;
 
 	return buswidth;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
