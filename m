Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 722FC1C4DD0
	for <lists+linux-stm32@lfdr.de>; Tue,  5 May 2020 07:52:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30E01C36B2E;
	Tue,  5 May 2020 05:52:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F84AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 May 2020 05:52:34 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0455l5X6027087; Tue, 5 May 2020 07:52:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Tkcg9s1uDu/OOadkPkeZF9B5T6AZFP5XkTZX0ihRw8k=;
 b=CI9ezifyJBfwqbQsaqh8o4ZvjtLehvt6i+UNxWZruakeg+8UXPU8iIljCfAl2KVQJ1/I
 b7KdHpzD+ozDtarb4Ou6q1PF0xZwyYg6pZ44B4FGtb7Y+FcvtXgHsTeBYkpWqCO9xvwn
 uhqvf3cOHrc9JjHnOvbrbUocT261I/IjtHTNis2kjzCbjRCyS0A41bAUs2Fl5w72Q7zD
 4bbzJ+We2jRW6vq99a977sOBtW2x4rrvzBlioYSo68LpaATZ9ifQW3M0whIjxxOpGbGn
 aUksql+sktcTaYKQYzYFh62CrDq/eb1PzSCT3OK74teuej2K11aEqZdIxA5dVrwuftU2 yQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30rxb1wy0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 07:52:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D1E57100039;
 Tue,  5 May 2020 07:52:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3EA721CA81;
 Tue,  5 May 2020 07:52:20 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 5 May 2020 07:52:20
 +0200
From: Alain Volmat <alain.volmat@st.com>
To: <wsa@kernel.org>, <robh+dt@kernel.org>
Date: Tue, 5 May 2020 07:51:09 +0200
Message-ID: <1588657871-14747-3-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
References: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-05_02:2020-05-04,
 2020-05-05 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, alain.volmat@st.com,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/4] i2c: addition of client reg/unreg
	callbacks
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

Addition of two callbacks reg_client and unreg_client that can be
implemented by adapter drivers in order to take action whenever a
client is being registered to it.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 drivers/i2c/i2c-core-base.c | 11 +++++++++++
 include/linux/i2c.h         |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 2e4560671183..4c84c6264314 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -319,6 +319,12 @@ static int i2c_device_probe(struct device *dev)
 	if (!client)
 		return 0;
 
+	if (client->adapter->algo->reg_client) {
+		status = client->adapter->algo->reg_client(client);
+		if (status)
+			return status;
+	}
+
 	driver = to_i2c_driver(dev->driver);
 
 	client->irq = client->init_irq;
@@ -417,6 +423,8 @@ static int i2c_device_probe(struct device *dev)
 put_sync_adapter:
 	if (client->flags & I2C_CLIENT_HOST_NOTIFY)
 		pm_runtime_put_sync(&client->adapter->dev);
+	if (client->adapter->algo->reg_client)
+		client->adapter->algo->unreg_client(client);
 
 	return status;
 }
@@ -445,6 +453,9 @@ static int i2c_device_remove(struct device *dev)
 	if (client->flags & I2C_CLIENT_HOST_NOTIFY)
 		pm_runtime_put(&client->adapter->dev);
 
+	if (client->adapter->algo->unreg_client)
+		client->adapter->algo->unreg_client(client);
+
 	return status;
 }
 
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 45d36ba4826b..61b838caf454 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -509,6 +509,8 @@ i2c_register_board_info(int busnum, struct i2c_board_info const *info,
  *   so e.g. PMICs can be accessed very late before shutdown. Optional.
  * @functionality: Return the flags that this algorithm/adapter pair supports
  *   from the ``I2C_FUNC_*`` flags.
+ * @reg_client: Callback informing that a new client is being registered
+ * @unreg_client: Callback informing that a client is being removed
  * @reg_slave: Register given client to I2C slave mode of this adapter
  * @unreg_slave: Unregister given client from I2C slave mode of this adapter
  *
@@ -545,6 +547,10 @@ struct i2c_algorithm {
 	/* To determine what the adapter supports */
 	u32 (*functionality)(struct i2c_adapter *adap);
 
+	/* To inform the adapter of the probe/remove of a client */
+	int (*reg_client)(struct i2c_client *client);
+	void (*unreg_client)(struct i2c_client *client);
+
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	int (*reg_slave)(struct i2c_client *client);
 	int (*unreg_slave)(struct i2c_client *client);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
