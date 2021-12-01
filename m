Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED48464D41
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Dec 2021 12:48:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FD64C5EC75;
	Wed,  1 Dec 2021 11:48:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5510C5719E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Dec 2021 11:48:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B19D5HL028937;
 Wed, 1 Dec 2021 12:48:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=7odZAZhCVgaOiJipJ40jrarQIFv9heW0d1vSNIFNSZg=;
 b=dvAmKLFUsRSFG3HDFoPaVZgFIDHJWGRG6r32XKpk7/2v7PYQ6CiD43uYb1aY7WmxZiSM
 ugcLlTGzD6aNhd98Y7EPDKzmA57TeV+9w/Bfrlxb3SeJ4Oxlk33M6wJEIIN8WSn4cNpP
 yujhr8JM8JYlIYWfMDfVoIlv61G/plvcqdUx+YC93eeFHH1kXJ3ZCfQ5XjeXk2z1ATyy
 4BL8m2daiHffWNfkzuia7DOpCTtCUOBii1t36dU3QoH6hkqXTptvNf46YGGtnvOI7x5K
 mhSQ1AS/soB2MA7hiS7SN6VAAL2KcGn5dlAiPGHCFe/J2O5U+0bO0jOhvohehztdZ25R kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cp67m921x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Dec 2021 12:48:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 44E71100039;
 Wed,  1 Dec 2021 12:48:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3EBD82194D5;
 Wed,  1 Dec 2021 12:48:11 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 1 Dec 2021 12:48:10
 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>
Date: Wed, 1 Dec 2021 12:47:50 +0100
Message-ID: <20211201114751.828474-2-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201114751.828474-1-alain.volmat@foss.st.com>
References: <20211201114751.828474-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_10,2021-12-01_01,2020-04-07_01
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, alain.volmat@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] i2c: stm32: get rid of
	stm32f7_i2c_release_bus return value
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

Function stm32f7_i2c_release_bus is always returning 0, hence it
should be a void function.  Update the function and remove the
return value error checking code in caller functions.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 66145d2b9b55..fcf43b3ac64f 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -828,7 +828,7 @@ static void stm32f7_i2c_smbus_reload(struct stm32f7_i2c_dev *i2c_dev)
 	writel_relaxed(cr2, i2c_dev->base + STM32F7_I2C_CR2);
 }
 
-static int stm32f7_i2c_release_bus(struct i2c_adapter *i2c_adap)
+static void stm32f7_i2c_release_bus(struct i2c_adapter *i2c_adap)
 {
 	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(i2c_adap);
 
@@ -838,8 +838,6 @@ static int stm32f7_i2c_release_bus(struct i2c_adapter *i2c_adap)
 			     STM32F7_I2C_CR1_PE);
 
 	stm32f7_i2c_hw_config(i2c_dev);
-
-	return 0;
 }
 
 static int stm32f7_i2c_wait_free_bus(struct stm32f7_i2c_dev *i2c_dev)
@@ -856,11 +854,7 @@ static int stm32f7_i2c_wait_free_bus(struct stm32f7_i2c_dev *i2c_dev)
 
 	dev_info(i2c_dev->dev, "bus busy\n");
 
-	ret = stm32f7_i2c_release_bus(&i2c_dev->adap);
-	if (ret) {
-		dev_err(i2c_dev->dev, "Failed to recover the bus (%d)\n", ret);
-		return ret;
-	}
+	stm32f7_i2c_release_bus(&i2c_dev->adap);
 
 	return -EBUSY;
 }
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
