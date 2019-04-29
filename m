Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 180E4DFEA
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 11:55:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C147C35E07
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 09:55:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4C29C35E04
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 09:54:57 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3T9kxuR031685; Mon, 29 Apr 2019 11:54:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=NpKHSHilJ8VtsKy2Eh73u7f/s16+/jfGkYS573A6cho=;
 b=URwv2GxebEgOjfAMFTa3Ak+GpQVsVLlauhQc8u9c9crOUnXwEZdquDHQZCqdgi0Fq21g
 JuLUOKDh6yr4vOBZEChwo+VxCcrJAS6zg5ioRLZOHBiwm/Ya8AncCG+daoGZXE3gnBE4
 vR+3S7vKPACustyWcxoEaIhBU1HczcXvlllGv8mU5fcaPHseINPyNPDYHrfyGL/plqsw
 /RzY/hZwgqmErWxYLzeCwDK4ZBA76U+M4yGgQdt3lXK6+rWVHEYkgij3tuv/ne43W9A7
 PsnfsPjOqa3VF/ylyhU8yMxKP+hlrJKEKTm2u2Bo3UaonDSE7p1Wi+Q3HOwGh19ORzbC Rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2s4cj0be9r-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 29 Apr 2019 11:54:45 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0FD7C34;
 Mon, 29 Apr 2019 09:54:45 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag4node3.st.com [10.75.127.12])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D7D7E14F5;
 Mon, 29 Apr 2019 09:54:44 +0000 (GMT)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG4NODE3.st.com
 (10.75.127.12) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 29 Apr
 2019 11:54:44 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1347.000; Mon, 29 Apr 2019 11:54:44 +0200
From: Gerald BAEZA <gerald.baeza@st.com>
To: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
 <sboyd@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Thread-Topic: [PATCH 1/1] clk: stm32mp1: Add ddrperfm clock
Thread-Index: AQHU/nGSI1KYPhvKvEC7x41++h176w==
Date: Mon, 29 Apr 2019 09:54:44 +0000
Message-ID: <1556531652-27740-1-git-send-email-gerald.baeza@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-29_05:, , signatures=0
X-Mailman-Approved-At: Mon, 29 Apr 2019 09:55:48 +0000
Cc: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Gerald BAEZA <gerald.baeza@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH 1/1] clk: stm32mp1: Add ddrperfm clock
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

From: Gabriel Fernandez <gabriel.fernandez@st.com>

Add ddrperfm clock for DDR Performance Monitor driver

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
Signed-off-by: Gerald Baeza <gerald.baeza@st.com>
---
 drivers/clk/clk-stm32mp1.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index a0ae8dc..a875649 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -1402,6 +1402,7 @@ enum {
 	G_CRYP1,
 	G_HASH1,
 	G_BKPSRAM,
+	G_DDRPERFM,
 
 	G_LAST
 };
@@ -1488,6 +1489,7 @@ static struct stm32_gate_cfg per_gate_cfg[G_LAST] = {
 	K_GATE(G_STGENRO,	RCC_APB4ENSETR, 20, 0),
 	K_MGATE(G_USBPHY,	RCC_APB4ENSETR, 16, 0),
 	K_GATE(G_IWDG2,		RCC_APB4ENSETR, 15, 0),
+	K_GATE(G_DDRPERFM,	RCC_APB4ENSETR, 8, 0),
 	K_MGATE(G_DSI,		RCC_APB4ENSETR, 4, 0),
 	K_MGATE(G_LTDC,		RCC_APB4ENSETR, 0, 0),
 
@@ -1899,6 +1901,7 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
 	PCLK(CRC1, "crc1", "ck_axi", 0, G_CRC1),
 	PCLK(USBH, "usbh", "ck_axi", 0, G_USBH),
 	PCLK(ETHSTP, "ethstp", "ck_axi", 0, G_ETHSTP),
+	PCLK(DDRPERFM, "ddrperfm", "pclk4", 0, G_DDRPERFM),
 
 	/* Kernel clocks */
 	KCLK(SDMMC1_K, "sdmmc1_k", sdmmc12_src, 0, G_SDMMC1, M_SDMMC12),
-- 
2.7.4
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
