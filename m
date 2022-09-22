Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D545E6286
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Sep 2022 14:35:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17967C03FD5;
	Thu, 22 Sep 2022 12:35:20 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1288EC035BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Sep 2022 11:14:05 +0000 (UTC)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MYCKM6r99zHqKS;
 Thu, 22 Sep 2022 19:11:51 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 19:14:02 +0800
From: Xiu Jianfeng <xiujianfeng@huawei.com>
To: <alexander.shishkin@linux.intel.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>
Date: Thu, 22 Sep 2022 19:10:22 +0800
Message-ID: <20220922111022.245236-1-xiujianfeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 22 Sep 2022 12:35:18 +0000
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] stm: Add __init/__exit annotations to module
	init/exit funcs
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

Add missing __init/__exit annotations to module init/exit funcs.

Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
---
 drivers/hwtracing/stm/console.c   | 4 ++--
 drivers/hwtracing/stm/dummy_stm.c | 4 ++--
 drivers/hwtracing/stm/heartbeat.c | 4 ++--
 drivers/hwtracing/stm/p_basic.c   | 4 ++--
 drivers/hwtracing/stm/p_sys-t.c   | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/stm/console.c b/drivers/hwtracing/stm/console.c
index a00f65e21747..c324122321b9 100644
--- a/drivers/hwtracing/stm/console.c
+++ b/drivers/hwtracing/stm/console.c
@@ -54,12 +54,12 @@ static void stm_console_unlink(struct stm_source_data *data)
 	unregister_console(&sc->console);
 }
 
-static int stm_console_init(void)
+static int __init stm_console_init(void)
 {
 	return stm_source_register_device(NULL, &stm_console.data);
 }
 
-static void stm_console_exit(void)
+static void __exit stm_console_exit(void)
 {
 	stm_source_unregister_device(&stm_console.data);
 }
diff --git a/drivers/hwtracing/stm/dummy_stm.c b/drivers/hwtracing/stm/dummy_stm.c
index 38528ffdc0b3..992e545559ea 100644
--- a/drivers/hwtracing/stm/dummy_stm.c
+++ b/drivers/hwtracing/stm/dummy_stm.c
@@ -66,7 +66,7 @@ static int dummy_stm_link(struct stm_data *data, unsigned int master,
 	return 0;
 }
 
-static int dummy_stm_init(void)
+static int __init dummy_stm_init(void)
 {
 	int i, ret = -ENOMEM;
 
@@ -107,7 +107,7 @@ static int dummy_stm_init(void)
 
 }
 
-static void dummy_stm_exit(void)
+static void __exit dummy_stm_exit(void)
 {
 	int i;
 
diff --git a/drivers/hwtracing/stm/heartbeat.c b/drivers/hwtracing/stm/heartbeat.c
index 81d7b21d31ec..e2930ab803b4 100644
--- a/drivers/hwtracing/stm/heartbeat.c
+++ b/drivers/hwtracing/stm/heartbeat.c
@@ -62,7 +62,7 @@ static void stm_heartbeat_unlink(struct stm_source_data *data)
 	hrtimer_cancel(&heartbeat->hrtimer);
 }
 
-static int stm_heartbeat_init(void)
+static int __init stm_heartbeat_init(void)
 {
 	int i, ret;
 
@@ -102,7 +102,7 @@ static int stm_heartbeat_init(void)
 	return ret;
 }
 
-static void stm_heartbeat_exit(void)
+static void __exit stm_heartbeat_exit(void)
 {
 	int i;
 
diff --git a/drivers/hwtracing/stm/p_basic.c b/drivers/hwtracing/stm/p_basic.c
index 8980a6a5fd6c..921ad66574c5 100644
--- a/drivers/hwtracing/stm/p_basic.c
+++ b/drivers/hwtracing/stm/p_basic.c
@@ -30,12 +30,12 @@ static const struct stm_protocol_driver basic_pdrv = {
 	.write	= basic_write,
 };
 
-static int basic_stm_init(void)
+static int __init basic_stm_init(void)
 {
 	return stm_register_protocol(&basic_pdrv);
 }
 
-static void basic_stm_exit(void)
+static void __exit basic_stm_exit(void)
 {
 	stm_unregister_protocol(&basic_pdrv);
 }
diff --git a/drivers/hwtracing/stm/p_sys-t.c b/drivers/hwtracing/stm/p_sys-t.c
index 8254971c02e7..f7d05915695a 100644
--- a/drivers/hwtracing/stm/p_sys-t.c
+++ b/drivers/hwtracing/stm/p_sys-t.c
@@ -366,12 +366,12 @@ static const struct stm_protocol_driver sys_t_pdrv = {
 	.output_close		= sys_t_output_close,
 };
 
-static int sys_t_stm_init(void)
+static int __init sys_t_stm_init(void)
 {
 	return stm_register_protocol(&sys_t_pdrv);
 }
 
-static void sys_t_stm_exit(void)
+static void __exit sys_t_stm_exit(void)
 {
 	stm_unregister_protocol(&sys_t_pdrv);
 }
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
