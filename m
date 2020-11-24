Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 836072C339F
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Nov 2020 23:00:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17282C56630;
	Tue, 24 Nov 2020 22:00:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8C81C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 22:00:54 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AOLwW2m018710; Tue, 24 Nov 2020 23:00:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=STMicroelectronics;
 bh=/nsqPmbt8hlWF/ePqLKnAQe8oN8M+aSPJvRRrQxajqw=;
 b=RvyzlBTd8uOvpig9x0ILiM4nOLUyL916s2Yhq6xCThcQFgQoHVYNr1veNP/0zPjb5yjA
 o8Y3eNO4p2s0U3O+vnrdwOkZTN4TGRQ1Jdfu5vzfoQ465gCJx3JrKKn2bxiIXsIGOpMv
 mgIi3VReKPF2BH/TMCSAvVC0Bv+u973Fc5MhqK6hhbyez1jtb01wJGYEzsDrrh99Caro
 IDoF3AQQVaqFyi0wCzHZeGY7UiXIxlKWaS3fw1DOdrSZRtBjE7QHkSUFHtoNdCrNf8Ry
 biylLd6+YnDlZn1UFQsMNdLIWldRUNrGMaVmYUAHACjcuNo2npTlnX/pHFkwxAk4Zj/v kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y05h9w0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 23:00:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6004910002A;
 Tue, 24 Nov 2020 23:00:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3FF85207403;
 Tue, 24 Nov 2020 23:00:25 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG1NODE3.st.com (10.75.127.3)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Nov 2020 23:00:24
 +0100
From: Antonio Borneo <antonio.borneo@st.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, <netdev@vger.kernel.org>,
 Yonglong Liu <liuyonglong@huawei.com>, Willy Liu <willy.liu@realtek.com>
Date: Tue, 24 Nov 2020 22:59:32 +0100
Message-ID: <20201124215932.885306-1-antonio.borneo@st.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124143848.874894-1-antonio.borneo@st.com>
References: <20201124143848.874894-1-antonio.borneo@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_09:2020-11-24,
 2020-11-24 signatures=0
Cc: linux-kernel@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>,
 linuxarm@huawei.com, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2] net: phy: realtek: read actual speed on
	rtl8211f to detect downshift
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

The rtl8211f supports downshift and before commit 5502b218e001
("net: phy: use phy_resolve_aneg_linkmode in genphy_read_status")
the read-back of register MII_CTRL1000 was used to detect the
negotiated link speed.
The code added in commit d445dff2df60 ("net: phy: realtek: read
actual speed to detect downshift") is working fine also for this
phy and it's trivial re-using it to restore the downshift
detection on rtl8211f.

Add the phy specific read_status() pointing to the existing
function rtlgen_read_status().

Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
Link: https://lore.kernel.org/r/478f871a-583d-01f1-9cc5-2eea56d8c2a7@huawei.com
---
To: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
To: Russell King <linux@armlinux.org.uk>
To: "David S. Miller" <davem@davemloft.net>
To: Jakub Kicinski <kuba@kernel.org>
To: netdev@vger.kernel.org
To: Yonglong Liu <liuyonglong@huawei.com>
To: Willy Liu <willy.liu@realtek.com>
Cc: linuxarm@huawei.com
Cc: Salil Mehta <salil.mehta@huawei.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20201124143848.874894-1-antonio.borneo@st.com>

V1 => V2
	move from a generic implementation affecting every phy
	to a rtl8211f specific implementation
---
 drivers/net/phy/realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
index 575580d3ffe0..8ff8a4edc173 100644
--- a/drivers/net/phy/realtek.c
+++ b/drivers/net/phy/realtek.c
@@ -621,6 +621,7 @@ static struct phy_driver realtek_drvs[] = {
 		PHY_ID_MATCH_EXACT(0x001cc916),
 		.name		= "RTL8211F Gigabit Ethernet",
 		.config_init	= &rtl8211f_config_init,
+		.read_status	= rtlgen_read_status,
 		.ack_interrupt	= &rtl8211f_ack_interrupt,
 		.config_intr	= &rtl8211f_config_intr,
 		.suspend	= genphy_suspend,

base-commit: 9bd2702d292cb7b565b09e949d30288ab7a26d51
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
