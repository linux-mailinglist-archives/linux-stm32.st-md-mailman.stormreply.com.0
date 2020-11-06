Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 140282A99F7
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Nov 2020 17:58:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB5B1C424BA;
	Fri,  6 Nov 2020 16:58:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5495AC3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 16:58:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6GvLoW020517; Fri, 6 Nov 2020 17:58:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=XenMXX7jpB+ldiDL9YwCU3HGZQwucqgew9IYEnutEX4=;
 b=G+w1ZZppV+wz4iskZtLF22i51Wp0PIbDYORQukZd9mV22WrkWZZn7KRPHXpIcLlK+KHk
 BCu8Jqr8cYsB66F+yIQRRyA1Iw7O91K60L/Zvgz9LCNMdIWMqd1N73PaqPt5/hoGmQjT
 9z2fSyg2n7ujlrhcd1yocy28WRgyhnafwtASxLQZhTeMwF1dOuOAx7BcgZpqfTMPhTyx
 Ug+LxZD7yAj3MEK0JcpumUdmP2pO7xLml98DJdgf1Ni3dnshsfYxUklwtiF0FeBmP2L2
 tVgb+QJnAV4IsIwnV+CLf4TmYua+6384txXEHXlpx+cniBr5l753Zv61fmKyM9fPhlhB iQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34h0328gra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 17:58:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 585DE10002A;
 Fri,  6 Nov 2020 17:58:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 490A52C41F5;
 Fri,  6 Nov 2020 17:58:14 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 17:58:13
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Russell King
 <linux@armlinux.org.uk>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Badhri Jagan Sridharan <badhri@google.com>, Jun Li <lijun.kernel@gmail.com>
Date: Fri, 6 Nov 2020 17:58:03 +0100
Message-ID: <20201106165805.31534-4-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106165805.31534-1-amelie.delaunay@st.com>
References: <20201106165805.31534-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 3/5] usb: typec: stusb160x: fix
	power-opmode property with typec-power-opmode
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

Device tree property is named typec-power-opmode, not power-opmode.

Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/stusb160x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
index 2a618f02f4f1..d21750bbbb44 100644
--- a/drivers/usb/typec/stusb160x.c
+++ b/drivers/usb/typec/stusb160x.c
@@ -562,7 +562,7 @@ static int stusb160x_get_fw_caps(struct stusb160x *chip,
 	 * Supported power operation mode can be configured through device tree
 	 * else it is read from chip registers in stusb160x_get_caps.
 	 */
-	ret = fwnode_property_read_string(fwnode, "power-opmode", &cap_str);
+	ret = fwnode_property_read_string(fwnode, "typec-power-opmode", &cap_str);
 	if (!ret) {
 		ret = typec_find_pwr_opmode(cap_str);
 		/* Power delivery not yet supported */
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
