Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB513B84CB
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jun 2021 16:13:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F983C59781;
	Wed, 30 Jun 2021 14:13:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92DF3C57B7D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jun 2021 14:13:10 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UECxYD020784; Wed, 30 Jun 2021 16:12:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=5I8tQSLMXAAujkR8soP/b4U1k8eGZouqFSb3xx1crDs=;
 b=OzlaYzzC8Qdgb+NmR6xBHm2yf14Kpc9X+zqnTpeneVzw79d7aT9y1ugWNRtcIqncSzTi
 liXCD9JeH20nqncXJHBARvv08O6vJErYRxf25wA8KAhQRFyWbIK8PXHqIbhfdbpGzmzI
 zsxFjgmC7/RyxqIhRAu/iuI8tom7PIyr7UZYRmCAnKxDPOjsBDPp441/0MaPwLYeCu5+
 jf3Z2Yae10PnFwpG1Nv081LQfowbG2h0DT4x7KoP3cVxk/TIV6kj56yaKJrg/t/SrnGe
 vFUg2Vv7ukPLXtWoanu6CWoTbKEeTc8F0gsrcpbQDX/hodZbP8fTPMB9u1VRi8weIBEn LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39gn11a5gn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 16:12:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 253C510002A;
 Wed, 30 Jun 2021 16:12:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A5E523151C;
 Wed, 30 Jun 2021 16:12:57 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 30 Jun 2021 16:12:56
 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>
Date: Wed, 30 Jun 2021 16:11:41 +0200
Message-ID: <1625062303-15327-2-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625062303-15327-1-git-send-email-alain.volmat@foss.st.com>
References: <1625062303-15327-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-30_06:2021-06-29,
 2021-06-30 signatures=0
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, alain.volmat@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/3] i2c: stm32f7: recover the bus on access
	timeout
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

When getting an access timeout, ensure that the bus is in a proper
state prior to returning the error.

Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index b9b19a2a2ffa..d596733136c3 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1702,6 +1702,7 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
 			i2c_dev->msg->addr);
 		if (i2c_dev->use_dma)
 			dmaengine_terminate_all(dma->chan_using);
+		stm32f7_i2c_wait_free_bus(i2c_dev);
 		ret = -ETIMEDOUT;
 	}
 
@@ -1751,6 +1752,7 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 		dev_dbg(dev, "Access to slave 0x%x timed out\n", f7_msg->addr);
 		if (i2c_dev->use_dma)
 			dmaengine_terminate_all(dma->chan_using);
+		stm32f7_i2c_wait_free_bus(i2c_dev);
 		ret = -ETIMEDOUT;
 		goto pm_free;
 	}
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
