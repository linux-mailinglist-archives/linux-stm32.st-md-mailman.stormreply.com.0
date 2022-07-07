Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93112569BEB
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Jul 2022 09:44:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58B0CC640FD;
	Thu,  7 Jul 2022 07:44:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11264C640F5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jul 2022 07:44:23 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2675mDVw030880;
 Thu, 7 Jul 2022 09:44:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=KGECI26kQYwVXazLZQENvXzgMLdMJaLCna55/BysDPI=;
 b=PZJq7kr4OpLhM4IEufrAJMgW7gk3qZXDpM71gBbqRCIRbprLYSQfmTwhyvgOlMeYU0SK
 1D6iC+b6MAVhCeL2vByUVaST/QgoDL7Mv6Fyhzy1+a/zCwOEAPotR50eRFLlhTs8Fxjy
 4VYU0VgZ3nKVuV8A14SaFJkjWMnrTY5/Q/wmvkFMRCshsCU95bqgqdr5TG+R1PNgf0EE
 vyBZ7YIwhglvB16coLkMtzZMXx5wOsYbyr8ipRVE11MzxRSqDSgP+h1nG5n5gpmIu1LO
 QWU3gmbbprxuyD1vdz48BKzcXBQrPx/r9Au6rttpbDFyJdCS2QybZkEgm5KUGOwGCx24 Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h4uadk010-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jul 2022 09:44:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B21FB100038;
 Thu,  7 Jul 2022 09:44:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC9FF211F07;
 Thu,  7 Jul 2022 09:44:06 +0200 (CEST)
Received: from localhost (10.75.127.50) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 7 Jul
 2022 09:44:06 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <wsa@kernel.org>, <robh+dt@kernel.org>
Date: Thu, 7 Jul 2022 09:44:02 +0200
Message-ID: <20220707074402.2429786-3-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707074402.2429786-1-alain.volmat@foss.st.com>
References: <20220707074402.2429786-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_06,2022-06-28_01,2022-06-22_01
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 mcoquelin.stm32@gmail.com, alain.volmat@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/2] i2c: stm32: add support for the
	STM32MP13 soc
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

Add a new compatible for the stm32mp13.  Fast Mode Plus control
register address differ from the one for STM32MP15.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 6d4aa64b195d..d1c59d83a65b 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -410,6 +410,12 @@ static const struct stm32f7_i2c_setup stm32mp15_setup = {
 	.fmp_clr_offset = 0x40,
 };
 
+static const struct stm32f7_i2c_setup stm32mp13_setup = {
+	.rise_time = STM32F7_I2C_RISE_TIME_DEFAULT,
+	.fall_time = STM32F7_I2C_FALL_TIME_DEFAULT,
+	.fmp_clr_offset = 0x4,
+};
+
 static inline void stm32f7_i2c_set_bits(void __iomem *reg, u32 mask)
 {
 	writel_relaxed(readl_relaxed(reg) | mask, reg);
@@ -2468,6 +2474,7 @@ static const struct dev_pm_ops stm32f7_i2c_pm_ops = {
 static const struct of_device_id stm32f7_i2c_match[] = {
 	{ .compatible = "st,stm32f7-i2c", .data = &stm32f7_setup},
 	{ .compatible = "st,stm32mp15-i2c", .data = &stm32mp15_setup},
+	{ .compatible = "st,stm32mp13-i2c", .data = &stm32mp13_setup},
 	{},
 };
 MODULE_DEVICE_TABLE(of, stm32f7_i2c_match);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
