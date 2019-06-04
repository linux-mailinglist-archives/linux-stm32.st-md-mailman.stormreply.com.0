Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB3F34885
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2019 15:21:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A2C5C5716B
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2019 13:21:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E1B2C5716A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2019 13:21:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x54DHe5h015265; Tue, 4 Jun 2019 15:21:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Z2wZnvXgH6bB09YHyNfYI32IlYynHCA1Xqq9/7lFTwg=;
 b=H+I7whk9sG8h4A89ycMv5XHr1o7DazjFe9o/suKueQljc0gCwHkcZKiPP8ZO72HqyO9N
 KsELv+j+c8gXO+WvAhhb4FDUdC+5kljDnqeqS0uceyHzFlDHuditRub05LqtzFLCAF3L
 aIrIYywGTIzQ0D/uHBHrn4syzqPkmMqUG2PmkfYnLO8Ld/pfiVdX/yJiv8iUUa52BeNN
 7guXsQ9Mpk74TSDAjHEKoIhtxYkN9i+WjgEYaMa8/rjlyHR5Kt7onZftDkoWJgFZP8je
 MOmDmRVeqkFF2sFS6TPsuOZHuyQl0DSXGGBCObvpLydJ2KNxGtkZN3RRGeHTplD0eomE jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sunmegvxm-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 04 Jun 2019 15:21:13 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BB0F34;
 Tue,  4 Jun 2019 13:21:11 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DF6662A65;
 Tue,  4 Jun 2019 13:21:10 +0000 (GMT)
Received: from localhost (10.75.127.45) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Tue, 4 Jun 2019 15:21:10 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <wsa@the-dreams.de>, <pierre-yves.mordret@st.com>
Date: Tue, 4 Jun 2019 15:20:51 +0200
Message-ID: <1559654451-26612-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-04_09:, , signatures=0
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] i2c: i2c-stm32f7: Add
	I2C_SMBUS_I2C_BLOCK_DATA support
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

This patch adds the support of I2C_SMBUS_I2C_BLOCK_DATA transaction type
for the stm32f7 SMBUS Controller.
Use emulated I2C_SMBUS_I2C_BLOCK_DATA transactions as there is no specific
hardware in STM32 I2C to manage this (e.g. like no need for PEC here).
Emulated transfer will fall back calling i2c transfer method where there's
already support for DMAs for example.
So, use the I2C_FUNC_SMBUS_I2C_BLOCK in stm32f7_i2c_func(), and rely on
emulated transfer by returning -EOPNOTSUPP in the smbus_xfer() routine
for such a case.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 48337be..68a751e 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -953,6 +953,9 @@ static int stm32f7_i2c_smbus_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
 		cr2 &= ~STM32F7_I2C_CR2_RD_WRN;
 		f7_msg->read_write = I2C_SMBUS_READ;
 		break;
+	case I2C_SMBUS_I2C_BLOCK_DATA:
+		/* Rely on emulated i2c transfer (through master_xfer) */
+		return -EOPNOTSUPP;
 	default:
 		dev_err(dev, "Unsupported smbus protocol %d\n", f7_msg->size);
 		return -EOPNOTSUPP;
@@ -1803,7 +1806,8 @@ static u32 stm32f7_i2c_func(struct i2c_adapter *adap)
 		I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
 		I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
 		I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_BLOCK_PROC_CALL |
-		I2C_FUNC_SMBUS_PROC_CALL | I2C_FUNC_SMBUS_PEC;
+		I2C_FUNC_SMBUS_PROC_CALL | I2C_FUNC_SMBUS_PEC |
+		I2C_FUNC_SMBUS_I2C_BLOCK;
 }
 
 static struct i2c_algorithm stm32f7_i2c_algo = {
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
