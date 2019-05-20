Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB202AF2C
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 09:07:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52D2DC59789
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 07:07:43 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B6C6C06F9C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 09:04:42 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id CD27E70C92FBE0086081;
 Mon, 20 May 2019 17:04:38 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Mon, 20 May 2019 17:04:29 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-kernel@vger.kernel.org>
Date: Mon, 20 May 2019 17:13:15 +0800
Message-ID: <20190520091315.27898-2-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520091315.27898-1-wangkefeng.wang@huawei.com>
References: <20190520091315.27898-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 27 May 2019 07:07:42 +0000
Cc: Hulk Robot <hulkci@huawei.com>, Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [Linux-stm32] [PATCH 2/2] hwtracing: stm: fix double-free in
	stm_source_register_device()
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

If device_add() in stm_source_register_device() fails,
stm_source_device_release() is called to free src, free
src again on err path will trigger double free issue.

BUG: KASAN: double-free or invalid-free in stm_source_register_device+0xd0/0x1a0 [stm_core]

CPU: 1 PID: 8556 Comm: syz-executor.0 Tainted: G         C        5.1.0+ #28
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1ubuntu1 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xa9/0x10e lib/dump_stack.c:113
 print_address_description+0x65/0x270 mm/kasan/report.c:188
 kasan_report_invalid_free+0x60/0xa0 mm/kasan/report.c:279
 __kasan_slab_free+0x159/0x180 mm/kasan/common.c:430
 slab_free_hook mm/slub.c:1420 [inline]
 slab_free_freelist_hook mm/slub.c:1447 [inline]
 slab_free mm/slub.c:2994 [inline]
 kfree+0xe1/0x270 mm/slub.c:3949
 stm_source_register_device+0xd0/0x1a0 [stm_core]
 stm_heartbeat_init+0xb6/0x1b0 [stm_heartbeat]
 do_one_initcall+0xb9/0x3b5 init/main.c:914
 do_init_module+0xe0/0x330 kernel/module.c:3468
 load_module+0x38eb/0x4270 kernel/module.c:3819
 __do_sys_finit_module+0x162/0x190 kernel/module.c:3909
 do_syscall_64+0x72/0x2a0 arch/x86/entry/common.c:298
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

 ...

Allocated by task 8556:
 save_stack+0x19/0x80 mm/kasan/common.c:71
 set_track mm/kasan/common.c:79 [inline]
 __kasan_kmalloc.constprop.2+0xa0/0xd0 mm/kasan/common.c:489
 stm_source_register_device+0x46/0x1a0 [stm_core]
 stm_heartbeat_init+0xb6/0x1b0 [stm_heartbeat]
 do_one_initcall+0xb9/0x3b5 init/main.c:914
 do_init_module+0xe0/0x330 kernel/module.c:3468
 load_module+0x38eb/0x4270 kernel/module.c:3819
 __do_sys_finit_module+0x162/0x190 kernel/module.c:3909
 do_syscall_64+0x72/0x2a0 arch/x86/entry/common.c:298
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 8556:
 save_stack+0x19/0x80 mm/kasan/common.c:71
 set_track mm/kasan/common.c:79 [inline]
 __kasan_slab_free+0x130/0x180 mm/kasan/common.c:451
 slab_free_hook mm/slub.c:1420 [inline]
 slab_free_freelist_hook mm/slub.c:1447 [inline]
 slab_free mm/slub.c:2994 [inline]
 kfree+0xe1/0x270 mm/slub.c:3949
 device_release+0x46/0x100 drivers/base/core.c:1064
 kobject_cleanup lib/kobject.c:691 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:67 [inline]
 kobject_put+0x1a8/0x220 lib/kobject.c:737
 put_device+0x1b/0x30 drivers/base/core.c:2210
 stm_source_register_device+0xc8/0x1a0 [stm_core]
 stm_heartbeat_init+0xb6/0x1b0 [stm_heartbeat]
 do_one_initcall+0xb9/0x3b5 init/main.c:914
 do_init_module+0xe0/0x330 kernel/module.c:3468
 load_module+0x38eb/0x4270 kernel/module.c:3819
 __do_sys_finit_module+0x162/0x190 kernel/module.c:3909
 do_syscall_64+0x72/0x2a0 arch/x86/entry/common.c:298
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

Don't call kfree(src) if device_add() fails to fix it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 drivers/hwtracing/stm/core.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index 7b2ab7b2cc4d..5ce30f8f8c4f 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -1258,15 +1258,20 @@ int stm_source_register_device(struct device *parent,
 	src->dev.release = stm_source_device_release;
 
 	err = kobject_set_name(&src->dev.kobj, "%s", data->name);
-	if (err)
+	if (err) {
+		put_device(&src->dev);
+		kfree(src);
 		goto err;
+	}
 
 	pm_runtime_no_callbacks(&src->dev);
 	pm_runtime_forbid(&src->dev);
 
 	err = device_add(&src->dev);
-	if (err)
-		goto err;
+	if (err) {
+		put_device(&src->dev);
+		return err;
+	}
 
 	stm_output_init(&src->output);
 	spin_lock_init(&src->link_lock);
@@ -1275,12 +1280,6 @@ int stm_source_register_device(struct device *parent,
 	data->src = src;
 
 	return 0;
-
-err:
-	put_device(&src->dev);
-	kfree(src);
-
-	return err;
 }
 EXPORT_SYMBOL_GPL(stm_source_register_device);
 
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
