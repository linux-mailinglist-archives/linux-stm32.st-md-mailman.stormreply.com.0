Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B14230031F
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Jan 2021 13:34:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 184D0C56630;
	Fri, 22 Jan 2021 12:34:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80D1BC3089F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jan 2021 10:51:32 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10MAlTlr011271; Fri, 22 Jan 2021 11:51:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=mt7WvfN2Btmo/ZaNnjB5VDrsbrquImJLFtGfvSfZYp0=;
 b=H/bifTmAItFYp9w96qyj9P8rCqvH4mP79nMzfkdqumpz2MlfDBpCOwYvucQBDe/+5Hug
 va1YBhP2iRZV7RaexPTA/bXECdfMT13xFi5hbuIIdxku2hzZyHobcg0TWWWcz7BrJJgN
 dCdVNVz1nERqwxGp15zd37C1FyXlq7yqit0YLQt4/fRM7DTvNuiGO+l6QbR8wGkTY3g0
 7GKr6gIjMtjsLNm6WhHs3fzPeaEEq60yIe3+ix0vmBejTLGLNl4nQW8oClrtkZYZgc+t
 Ucxe9tF5+eTap5Tb+QUWuoaQQTFYCynP0w+bivRhRNTjbNsES2GJfOrJimN1xzjNiMv5 qQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3668pe1e1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 11:51:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E0FB110002A;
 Fri, 22 Jan 2021 11:51:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC6DE22DBCA;
 Fri, 22 Jan 2021 11:51:19 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 22 Jan 2021 11:51:19
 +0100
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Etienne Carriere
 <etienne.carriere@st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 22 Jan 2021 11:50:48 +0100
Message-ID: <20210122105101.27374-2-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210122105101.27374-1-gabriel.fernandez@foss.st.com>
References: <20210122105101.27374-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-22_06:2021-01-21,
 2021-01-22 signatures=0
X-Mailman-Approved-At: Fri, 22 Jan 2021 12:34:42 +0000
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 01/14] clk: stm32mp1: merge 'clk-hsi-div' and
	'ck_hsi' into one clock
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

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

This patch is to prepare STM32MP1 clocks in trusted mode.
This Merge will facilitate to have a more coherent clock tree
in no trusted / trusted world.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/clk-stm32mp1.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index a875649df8b8..35d5aee8f9b0 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -1657,16 +1657,16 @@ static const struct stm32_mux_cfg ker_mux_cfg[M_LAST] = {
 };
 
 static const struct clock_config stm32mp1_clock_cfg[] = {
-	/* Oscillator divider */
-	DIV(NO_ID, "clk-hsi-div", "clk-hsi", CLK_DIVIDER_POWER_OF_TWO,
-	    RCC_HSICFGR, 0, 2, CLK_DIVIDER_READ_ONLY),
-
 	/*  External / Internal Oscillators */
 	GATE_MP1(CK_HSE, "ck_hse", "clk-hse", 0, RCC_OCENSETR, 8, 0),
 	/* ck_csi is used by IO compensation and should be critical */
 	GATE_MP1(CK_CSI, "ck_csi", "clk-csi", CLK_IS_CRITICAL,
 		 RCC_OCENSETR, 4, 0),
-	GATE_MP1(CK_HSI, "ck_hsi", "clk-hsi-div", 0, RCC_OCENSETR, 0, 0),
+	COMPOSITE(CK_HSI, "ck_hsi", PARENT("clk-hsi"), 0,
+		  _GATE_MP1(RCC_OCENSETR, 0, 0),
+		  _NO_MUX,
+		  _DIV(RCC_HSICFGR, 0, 2, CLK_DIVIDER_POWER_OF_TWO |
+		       CLK_DIVIDER_READ_ONLY, NULL)),
 	GATE(CK_LSI, "ck_lsi", "clk-lsi", 0, RCC_RDLSICR, 0, 0),
 	GATE(CK_LSE, "ck_lse", "clk-lse", 0, RCC_BDCR, 0, 0),
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
