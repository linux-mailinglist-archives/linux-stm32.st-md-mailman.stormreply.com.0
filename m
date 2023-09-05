Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D461A793561
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Sep 2023 08:32:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BC5DC6C827;
	Wed,  6 Sep 2023 06:32:01 +0000 (UTC)
Received: from out203-205-251-60.mail.qq.com (out203-205-251-60.mail.qq.com
 [203.205.251.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ED0EC6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Sep 2023 14:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1693922711;
 bh=8KlD3VW8L/5ayf8Ou0ZPfzGKalOanhbYs3ssojj7Rzo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=LdVlag21s+/faTL1akapXYiZja4GG2XtDEo/qT8ygWc1hYPXmDbomZTX/1SqGEdAm
 1faIpbJ6D99z6I3eyi78bGWA9Jq8nOgSsbiwIz3xMkyYuvRvFtvDXNYuKBuJjIf8ry
 j71sRqHv8E65mEMHc6/VFQeqVYZGeY8FUPOnUtwU=
Received: from rtoax.lan ([120.245.114.157])
 by newxmesmtplogicsvrszc2-0.qq.com (NewEsmtp) with SMTP
 id 12C80033; Tue, 05 Sep 2023 22:04:44 +0800
X-QQ-mid: xmsmtpt1693922699t0dv0dw9r
Message-ID: <tencent_B44B7295FED7E0D11EC445032021F2AC8107@qq.com>
X-QQ-XMAILINFO: OUMxvQDaATieCv4GzYM8TxrYu4PTLFyfFshfV5c5Zjsi/jYVNr1yaBkldHod6j
 lYb/2nctmJPtCLSeVterfhWNKVaSC1Hw1IXm43J7JQKHcZIHEC9/ml08GA/RSOOeoNzFyUEefE+G
 EcbQwZL+CtmgWlY1tjnHgI5jqlM7igrBcNXLotQDNdy5OzBrGYwgf6k4JeyF0ecgqV+DhVnSHl5n
 6W7lM0BN4e/QdFYJ7r1V1lLKkjc6iKJeGKMpY9v09jTX2frjav0WIJUBfJyoVLqewoumV1fFJ9f0
 BjCrtVPjE5S7tYSI4mPRBc/ikuw021AYVYfeWA6r04p0/3j06WyA7o2pFG8yxA59plf/l2eucODK
 6An1iUGxxsciTjCmIRqwtTpOuHyAxgB/cCJR1D7wghzgtsNhRG/9BGUCsJ+iYwXWxJOpJB7EEHNT
 bUE7o/v/mPmH+2UZHR+zKDSEbHXdjX8fNHF77RXU0cTe17g/AdlYz8YSzIWzI4TnKHWMPtNYiJLo
 Z70i7AQlD+Us/ppjvPnz+OeSH24eMqUwPpqUhQRNYv3VXA9CpN9Ie2nslF7+YHK1b7pHHAHDtDUp
 OIH0ODulB6EktMufPvGYl1gni9Sfi0K7YQAJ8IdzEO30axwlkYFhuwzmHrYattgHmdWqYe5sQoYg
 6DyVDjIWY8VMSjs693sQJG7Z8z6Yoj3PHu3CbkERAE5/kQbR4E/DcVbBIT8E70up71mZ+YWjGbvt
 eFexZLgVTmf2sr5VSQwAji+5jgtjLwWQUM4z4x3XU3O7/uHtHluy+nxAU8doCLvYhrV8ejNAdD/2
 BFafAQZYJqO1AGuvtio+OjbA6aIfOEdV372IlMFvxpQRrx3TNbvGho+r3bZSu1KTB/6aewSIrVDj
 EiUd3ONBwTPXksWhId9V1Yqb+holqTA+CJglFgFPvsa/YQOw318nFbLHlFnlGX0mAXLOoIrTzaGt
 yf2hthNx0TYpClbb7kny+hHDO2iXTLOlYdc9Gf2FjBdZXYmGbooTzu+Kl02Wwc
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Rong Tao <rtoax@foxmail.com>
To: olsajiri@gmail.com, andrii@kernel.org, daniel@iogearbox.net, sdf@google.com
Date: Tue,  5 Sep 2023 22:04:19 +0800
X-OQ-MSGID: <b554ee17328a8bab6a815d1d3b8e7ecf6124cc68.1693922135.git.rongtao@cestc.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1693922135.git.rongtao@cestc.cn>
References: <cover.1693922135.git.rongtao@cestc.cn>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 06 Sep 2023 06:32:00 +0000
Cc: "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Hao Luo <haoluo@google.com>,
 Mykola Lysenko <mykolal@fb.com>, open list <linux-kernel@vger.kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 KP Singh <kpsingh@kernel.org>, Song Liu <song@kernel.org>,
 Yafang Shao <laoar.shao@gmail.com>, Rong Tao <rongtao@cestc.cn>,
 Yonghong Song <yonghong.song@linux.dev>,
 "open list:BPF \[GENERAL\] Safe Dynamic Programs and Tools"
 <bpf@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [PATCH bpf-next v11 2/2] selftests/bpf:
	trace_helpers.c: Add a global ksyms initialization mutex
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

From: Rong Tao <rongtao@cestc.cn>

As Jirka said [0], we just need to make sure that global ksyms
initialization won't race.

[0] https://lore.kernel.org/lkml/ZPCbAs3ItjRd8XVh@krava/

Signed-off-by: Rong Tao <rongtao@cestc.cn>
---
 tools/testing/selftests/bpf/trace_helpers.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/bpf/trace_helpers.c b/tools/testing/selftests/bpf/trace_helpers.c
index 7d026c128252..411f87d5aac7 100644
--- a/tools/testing/selftests/bpf/trace_helpers.c
+++ b/tools/testing/selftests/bpf/trace_helpers.c
@@ -7,6 +7,7 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <poll.h>
+#include <pthread.h>
 #include <unistd.h>
 #include <linux/perf_event.h>
 #include <sys/mman.h>
@@ -26,6 +27,7 @@ struct ksyms {
 };
 
 static struct ksyms *ksyms;
+static pthread_mutex_t ksyms_mutex = PTHREAD_MUTEX_INITIALIZER;
 
 static int ksyms__add_symbol(struct ksyms *ksyms, const char *name,
 			     unsigned long addr)
@@ -110,8 +112,10 @@ struct ksyms *load_kallsyms_local(struct ksyms *ksyms)
 
 int load_kallsyms(void)
 {
+	pthread_mutex_lock(&ksyms_mutex);
 	if (!ksyms)
 		ksyms = load_kallsyms_local(NULL);
+	pthread_mutex_unlock(&ksyms_mutex);
 	return ksyms ? 0 : 1;
 }
 
-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
