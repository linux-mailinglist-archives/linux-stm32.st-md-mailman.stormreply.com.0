Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F15469D417C
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F38FC7A838;
	Wed, 20 Nov 2024 17:49:44 +0000 (UTC)
Received: from cmccmta1.chinamobile.com (cmccmta8.chinamobile.com
 [111.22.67.151])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E41BEC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2024 07:27:02 +0000 (UTC)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
 by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee2672dbd3e43c-26454;
 Fri, 08 Nov 2024 15:27:01 +0800 (CST)
X-RM-TRANSID: 2ee2672dbd3e43c-26454
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.101])
 by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee9672dbd1fbf3-8d45f;
 Fri, 08 Nov 2024 15:27:01 +0800 (CST)
X-RM-TRANSID: 2ee9672dbd1fbf3-8d45f
From: guanjing <guanjing@cmss.chinamobile.com>
To: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Date: Fri,  8 Nov 2024 13:37:08 +0800
Message-Id: <20241108053708.171916-1-guanjing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: guanjing <guanjing@cmss.chinamobile.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] fixup for "firewall: introduce stm32_firewall
	framework"
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

Fixes: 5c9668cfc6d7 ("firewall: introduce stm32_firewall framework")
Signed-off-by: guanjing <guanjing@cmss.chinamobile.com>
---
 include/linux/bus/stm32_firewall_device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bus/stm32_firewall_device.h
index 18e0a2fc3816..5178b72bc920 100644
--- a/include/linux/bus/stm32_firewall_device.h
+++ b/include/linux/bus/stm32_firewall_device.h
@@ -115,7 +115,7 @@ void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 su
 #else /* CONFIG_STM32_FIREWALL */
 
 int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *firewall,
-				unsigned int nb_firewall);
+				unsigned int nb_firewall)
 {
 	return -ENODEV;
 }
-- 
2.33.0



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
