Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B00E464D42
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Dec 2021 12:48:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C281C5EC79;
	Wed,  1 Dec 2021 11:48:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 671FDC5A4D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Dec 2021 11:48:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B18J5Zw005489;
 Wed, 1 Dec 2021 12:48:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=f9hOVrZF5B8620y7OV+t9H0owKISOojaDC6v2r59cwA=;
 b=vhRtUQ2TpEANL5LgLRDHhSLfmUb8DM/s2KEPPF8jNBJiqBL38mSU7fHf+Zo84N+Grci9
 JEgeyUqIXjYzvUN7UczKeRPMBjTod4WBi21yPs43cofxq59NzregRvDGAM0jksyJlvyb
 lk2drtqUK+8NXCF6AZr3eDpG1NiZ20TYYA1X4xP4HrPqGgb9W0O2vGUpOpVZBFss2FTD
 UhnT/EGnS+FO48DORLNR5n4QAB+zMQLzMwVEpoP0LXgoOEGjMoOUDybs8zhZscTBA203
 HZ5uTsK/cHjkYKpUKtbv9sZWv/WJQvlPkjAZJ/08evw+K94ug5/hMkT/VUtIC2pm9MSz fA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cnx6ckdb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Dec 2021 12:48:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A821910003A;
 Wed,  1 Dec 2021 12:48:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A0C1D2194D5;
 Wed,  1 Dec 2021 12:48:11 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 1 Dec 2021 12:48:11
 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>
Date: Wed, 1 Dec 2021 12:47:51 +0100
Message-ID: <20211201114751.828474-3-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201114751.828474-1-alain.volmat@foss.st.com>
References: <20211201114751.828474-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_10,2021-12-01_01,2020-04-07_01
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, alain.volmat@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/2] i2c: stm32f7: remove noisy and
	imprecise log messages
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

From: Wolfram Sang <wsa@kernel.org>

The log messages talk about 'bus recovery' while it is not a bus
recovery with 9 pulses but merely a controller reset. Controller resets
are not worth log messages. The 'bus busy' message should be emitted by
upper layers, a busy bus may be expected in some cases.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>
---
v2: s/expectected/expected
    reworked on top of patch making stm32f7_i2c_release_bus a void
function

 drivers/i2c/busses/i2c-stm32f7.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index fcf43b3ac64f..6d4aa64b195d 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -832,8 +832,6 @@ static void stm32f7_i2c_release_bus(struct i2c_adapter *i2c_adap)
 {
 	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(i2c_adap);
 
-	dev_info(i2c_dev->dev, "Trying to recover bus\n");
-
 	stm32f7_i2c_clr_bits(i2c_dev->base + STM32F7_I2C_CR1,
 			     STM32F7_I2C_CR1_PE);
 
@@ -852,8 +850,6 @@ static int stm32f7_i2c_wait_free_bus(struct stm32f7_i2c_dev *i2c_dev)
 	if (!ret)
 		return 0;
 
-	dev_info(i2c_dev->dev, "bus busy\n");
-
 	stm32f7_i2c_release_bus(&i2c_dev->adap);
 
 	return -EBUSY;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
