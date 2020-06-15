Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C411F9CD4
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2020 18:16:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 911ABC36B14;
	Mon, 15 Jun 2020 16:16:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80C47C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 16:16:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FGE0Za008035; Mon, 15 Jun 2020 18:15:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=D0CIlRMyCMY46WlQS0au/Wr7dLxhaIcJQjjTERBtZsA=;
 b=H/YRPpXrpfShfwEpgd4fagcpv3XeCkQF7P8ceUXb2bWLvpcdz/CHO+CRaTO84YwfQl3H
 cLaJ7AP1U/XZwMY+wEET6EWzTyhRb4AiHOygrUR3wPjcftcoIqPSbm3V3sW3FoTvekK6
 14LUBMXumFG3kTYPF3lEHLlAXXZWs4/xI0YQ7Zjgrine+oL9Fbw4ATg9lJ1E43dEe3YT
 Q/SAz11SZg49fXbT2pe7MaNS2qLdM450+0iXok3e+1dGKB86pHaCXj0cgR6CKhhPugsP
 94FufdAnCqmCRoMRfdD7BUfPdo9mOtUXyNEoNpGgbWRYpchx6hA7S1C4Kd9e1AeIDjL0 Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mnph2be2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 18:15:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 86DA3100034;
 Mon, 15 Jun 2020 18:15:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1C42F2C5AD8;
 Mon, 15 Jun 2020 18:15:49 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 15 Jun 2020 18:15:48
 +0200
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Russell King
 <linux@armlinux.org.uk>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Mon, 15 Jun 2020 18:15:08 +0200
Message-ID: <20200615161512.19150-3-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615161512.19150-1-amelie.delaunay@st.com>
References: <20200615161512.19150-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_06:2020-06-15,
 2020-06-15 signatures=0
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/6] usb: typec: add typec_find_pwr_opmode
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

This patch adds a function that converts power operation mode string into
power operation mode value.

It is useful to configure power operation mode through device tree
property, as power capabilities may be linked to hardware design.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/usb/typec/class.c | 15 +++++++++++++++
 include/linux/usb/typec.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index c9234748537a..59e1837ef85e 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1448,6 +1448,21 @@ void typec_set_pwr_opmode(struct typec_port *port,
 }
 EXPORT_SYMBOL_GPL(typec_set_pwr_opmode);
 
+/**
+ * typec_find_pwr_opmode - Get the typec power operation mode capability
+ * @name: power operation mode string
+ *
+ * This routine is used to find the typec_pwr_opmode by its string @name.
+ *
+ * Returns typec_pwr_opmode if success, otherwise negative error code.
+ */
+int typec_find_pwr_opmode(const char *name)
+{
+	return match_string(typec_pwr_opmodes,
+			    ARRAY_SIZE(typec_pwr_opmodes), name);
+}
+EXPORT_SYMBOL_GPL(typec_find_pwr_opmode);
+
 /**
  * typec_find_orientation - Convert orientation string to enum typec_orientation
  * @name: Orientation string
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 5daa1c49761c..f7c63ee3d443 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -254,6 +254,7 @@ int typec_set_mode(struct typec_port *port, int mode);
 
 void *typec_get_drvdata(struct typec_port *port);
 
+int typec_find_pwr_opmode(const char *name);
 int typec_find_orientation(const char *name);
 int typec_find_port_power_role(const char *name);
 int typec_find_power_role(const char *name);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
