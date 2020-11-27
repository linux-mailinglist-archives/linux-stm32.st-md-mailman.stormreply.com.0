Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB3B2C668B
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Nov 2020 14:17:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DFB4C56631;
	Fri, 27 Nov 2020 13:17:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16BF7C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 13:17:40 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ARCSdO0007149; Fri, 27 Nov 2020 14:17:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=XenMXX7jpB+ldiDL9YwCU3HGZQwucqgew9IYEnutEX4=;
 b=qPCKFoYVv9dt3F8SypMqylHcwU1r9jlPO4R9SGeixelEqb0Bmb9NYgzZ/kJOvBA/mIem
 fLYkPIVyThqISHF6t+gqJsEhwDw+HqFuPMp0WNuz7LMZgOU+d6b4XC9tFsvIkmBN6DyZ
 LKBV5MmQperULbaaB2B43f8z3UsjrBsT1IhagGmwNdLY+vdn3mHh/nYJm510AUaw0UXi
 ZQN6sQfZtaNLML6uqmdlNDUxSzDqEctfx8P+cwrCR+rjy5T9KGeJBoqji6MZCVS9rLRl
 UCilXFI/5tTgwGOTzjO4b+ubxv/3kDD37k3GE82jq5JLysSKKobsea0CQ7n60gwT8QMH Ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y01d2r2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 14:17:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA05C10002A;
 Fri, 27 Nov 2020 14:17:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B72C424A64B;
 Fri, 27 Nov 2020 14:17:36 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Nov 2020 14:17:36
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>
Date: Fri, 27 Nov 2020 14:17:35 +0100
Message-ID: <20201127131735.28280-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_06:2020-11-26,
 2020-11-27 signatures=0
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v5 1/1 RESEND] usb: typec: stusb160x: fix
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
