Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4EF6012F8
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Oct 2022 17:50:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79857C65048;
	Mon, 17 Oct 2022 15:50:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAED3C65040
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 15:50:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29HEnXPi031465;
 Mon, 17 Oct 2022 17:50:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=phlzu4FsLYCgo+33k55masOClxFOICgga//eKhVT5DA=;
 b=m0kBsPwO7CE8y2TIS764D0+CDjpFLbruiUt5BdWM/Y+5Qa6z8so8W7gWR8xiunow8D/2
 Ag3MKDsbAGZK/mY32jTN+NytkpII29vKQ6mQ5exp3vsgT/rkKIMLluW571BGiBb8N+cs
 6jcYfXL3toxjYhrwSxp85jYYJQJPaggP2Y1OfdRpBNSDsPZ5n0grj9yNfgYzK96TeQ9Y
 AeMZ1BN0gLKokbG3J3Odh5dbCZTQy/ayv1Z/SkTNTRLZX2vhALBbS77hM9Y94gaDlw62
 GMNuMEfZLEKwOJuaCg4Ndpi9p8IE5gl80CX3OLRPrsnMECb4LY8Qzh97z0r3H8hEbtop aQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k7krjnsh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 17:50:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F230210002A;
 Mon, 17 Oct 2022 17:50:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ED63723C6A0;
 Mon, 17 Oct 2022 17:50:38 +0200 (CEST)
Received: from localhost (10.75.127.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 17:50:38 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 17 Oct 2022 17:49:56 +0200
Message-ID: <20221017174953.v2.2.Ifa806ff30d7c669ba9a3df9c6b64698a2dcc073a@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221017154957.277120-1-patrick.delaunay@foss.st.com>
References: <20221017154957.277120-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.120]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_13,2022-10-17_02,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 2/3] nvmem: stm32: add warning when upper
	OTPs are updated
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

As the upper OTPs are ECC protected, they support only one 32 bits word
programming.
For a second modification of this word, these ECC become invalid and
this OTP will be no more accessible, the shadowed value is invalid.

This patch adds a warning to indicate an upper OTP update, because this
operation is dangerous as OTP is not locked by the driver after the first
update to avoid a second update.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 drivers/nvmem/stm32-romem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/nvmem/stm32-romem.c b/drivers/nvmem/stm32-romem.c
index d93baee01d7b..bb8aa72ba2f9 100644
--- a/drivers/nvmem/stm32-romem.c
+++ b/drivers/nvmem/stm32-romem.c
@@ -132,6 +132,9 @@ static int stm32_bsec_write(void *context, unsigned int offset, void *buf,
 		}
 	}
 
+	if (offset + bytes >= priv->lower * 4)
+		dev_warn(dev, "Update of upper OTPs with ECC protection (word programming, only once)\n");
+
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
