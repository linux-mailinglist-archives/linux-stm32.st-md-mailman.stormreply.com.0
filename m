Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D24A638448
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Nov 2022 08:11:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B3D4C65E45;
	Fri, 25 Nov 2022 07:11:46 +0000 (UTC)
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4723FC6504B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 12:09:31 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NGjjg5NNXz8QrkZ;
 Tue, 22 Nov 2022 20:09:27 +0800 (CST)
Received: from szxlzmapp04.zte.com.cn ([10.5.231.166])
 by mse-fl2.zte.com.cn with SMTP id 2AMC9KZH006279;
 Tue, 22 Nov 2022 20:09:20 +0800 (+08)
 (envelope-from yang.yang29@zte.com.cn)
Received: from mapi (szxlzmapp02[null]) by mapi (Zmail) with MAPI id mid14;
 Tue, 22 Nov 2022 20:09:23 +0800 (CST)
Date: Tue, 22 Nov 2022 20:09:23 +0800 (CST)
X-Zmail-TransId: 2b04637cbbf3ffffffffe6ce2da8
X-Mailer: Zmail v1.0
Message-ID: <202211222009239312149@zte.com.cn>
Mime-Version: 1.0
From: <yang.yang29@zte.com.cn>
To: <peppe.cavallaro@st.com>
X-MAIL: mse-fl2.zte.com.cn 2AMC9KZH006279
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.137.novalocal with ID
 637CBBF7.000 by FangMail milter!
X-FangMail-Envelope: 1669118967/4NGjjg5NNXz8QrkZ/637CBBF7.000/10.5.228.133/[10.5.228.133]/mse-fl2.zte.com.cn/<yang.yang29@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 637CBBF7.000/4NGjjg5NNXz8QrkZ
X-Mailman-Approved-At: Fri, 25 Nov 2022 07:11:45 +0000
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, yang.yang29@zte.com.cn,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 xu.panda@zte.com.cn, kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] =?utf-8?q?=5BPATCH_linux-next=5D_net=3A_stmmac=3A_u?=
	=?utf-8?q?se_sysfs=5Fstreq=28=29_instead_of_strncmp=28=29?=
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

From: Xu Panda <xu.panda@zte.com.cn>

Replace the open-code with sysfs_streq().

Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
Signed-off-by: Yang Yang <yang.yang29@zte.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 0a9d13d7976f..4167e768a86a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7562,31 +7562,31 @@ static int __init stmmac_cmdline_opt(char *str)
 	if (!str || !*str)
 		return 1;
 	while ((opt = strsep(&str, ",")) != NULL) {
-		if (!strncmp(opt, "debug:", 6)) {
+		if (sysfs_streq(opt, "debug:")) {
 			if (kstrtoint(opt + 6, 0, &debug))
 				goto err;
-		} else if (!strncmp(opt, "phyaddr:", 8)) {
+		} else if (sysfs_streq(opt, "phyaddr:")) {
 			if (kstrtoint(opt + 8, 0, &phyaddr))
 				goto err;
-		} else if (!strncmp(opt, "buf_sz:", 7)) {
+		} else if (sysfs_streq(opt, "buf_sz:")) {
 			if (kstrtoint(opt + 7, 0, &buf_sz))
 				goto err;
-		} else if (!strncmp(opt, "tc:", 3)) {
+		} else if (sysfs_streq(opt, "tc:")) {
 			if (kstrtoint(opt + 3, 0, &tc))
 				goto err;
-		} else if (!strncmp(opt, "watchdog:", 9)) {
+		} else if (sysfs_streq(opt, "watchdog:")) {
 			if (kstrtoint(opt + 9, 0, &watchdog))
 				goto err;
-		} else if (!strncmp(opt, "flow_ctrl:", 10)) {
+		} else if (sysfs_streq(opt, "flow_ctrl:")) {
 			if (kstrtoint(opt + 10, 0, &flow_ctrl))
 				goto err;
-		} else if (!strncmp(opt, "pause:", 6)) {
+		} else if (sysfs_streq(opt, "pause:", 6)) {
 			if (kstrtoint(opt + 6, 0, &pause))
 				goto err;
-		} else if (!strncmp(opt, "eee_timer:", 10)) {
+		} else if (sysfs_streq(opt, "eee_timer:")) {
 			if (kstrtoint(opt + 10, 0, &eee_timer))
 				goto err;
-		} else if (!strncmp(opt, "chain_mode:", 11)) {
+		} else if (sysfs_streq(opt, "chain_mode:")) {
 			if (kstrtoint(opt + 11, 0, &chain_mode))
 				goto err;
 		}
-- 
2.15.2
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
