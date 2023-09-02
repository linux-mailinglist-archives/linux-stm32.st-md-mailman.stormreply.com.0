Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F3179126D
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Sep 2023 09:41:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79C25C6B471;
	Mon,  4 Sep 2023 07:41:40 +0000 (UTC)
Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com
 [162.62.57.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F29E0C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Sep 2023 05:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1693631761;
 bh=VDeJU94IWnvseyKaMxC4IUln27g8AmHmoNXDqEplCe8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=y98HrSljU15JiM4eaxs4iPQ85bCyaOAwK51n36h4MBI17vJXGmmWzMKvHnAKpvB0Y
 De7nRbXL+INgiwL1YV1poTb9pTre1cNVHbvmbL8l/yd/TdxUSw7gAtmLkWnWltX3+d
 +/TEgY7xqCtDRjy0xjiVOCidefICoTdu2vyAm+e8=
Received: from rtoax.lan ([120.245.114.63])
 by newxmesmtplogicsvrsza12-0.qq.com (NewEsmtp) with SMTP
 id 3EA29043; Sat, 02 Sep 2023 13:15:42 +0800
X-QQ-mid: xmsmtpt1693631746tb9aw2kru
Message-ID: <tencent_610B9D67B15C66A858BD5E8DF623CA18840A@qq.com>
X-QQ-XMAILINFO: NKv2G1wnhDBne0mgP5e8Y2tcHeHRdNu5Q0RL7PHJuVBIhlza8+x+J6yuCnozKQ
 Bd9sjr0FaoV3Ewulrh4ofynlPvtSqJj0N4bqDCnALENDC7cLq6+A6XtJqom7ARNR2SI7KUkW+2Px
 YE/2Rl1vGzdus6T9H6+OP/gXEI8S/YvhxThr0D+xcwzUHWlkEGbdwY6Ca3TmU++IwmyV8xkgRwb+
 s/9p2A9q9kCFxnfiri24XCl5v+SWlPslQl4GBZRDnjv3o+ijfsedpZVLK+Sfn4X9ygwK/rBQ0zDR
 RzIoP91t9hgg4Tp9nTmngcMAV6LM5VG+/6dAhVTARq+GjVtzSO7IdWzp5pVmCMz/PExE+itSKo0g
 8u8JLQxnT4o3xu28ixiB4h5CoB5hle4/zsPwJ8zb4Y1AzedwWwTiJajaWZi5tM5tgwUa1+aNCTW+
 IRFRyzcvsTa9z6SPrDcGrm46oXQb9tqxKq6Ai4rj/I9CgTIeAMaaFsbYUWntyzAPpJa5C/JbsVFo
 LJb9j4jikTBh0JwRLT3CTKQSzURW1rWwMnkgJ8SF92le7JklBvN4J0ylrHl1p+fugu1dlLOUy14d
 pQcBOyACmcepJSi1qiLQdn7rGZ3VHRzWr/A1iwgsk4h6wegkus95GtWUFjTMSZqHLGJfNAQLB2j3
 S9XZ9PNno6wsJT4Y8+tkQio4kiymt6z0KKi+963FWUG1n0STvHxYspD8fvzR7GVQMwl7DUZe7GQq
 mCVS5spq0myogqsAcP7UeMUc35ExqE5i7Kb92sbS3rIyqddty+UilEWe8l+/IDdcKbqPUEyy/L0t
 QHhRmXWV9MM1RnB5URGv/ATDhJ9H/NJPBaC7iQJDV2s+04cu5/1SSoOyhMD6lm3OvSoNqg7fWw8L
 UvJP4IuoevqrBUrG1CNtsH2r8PLOkWimwODo1iALnhKNI2Q/zPNpW5pQwCof8PVvkU5SJdOTtszh
 MHlQLJzim8Nx39r/oI0RAlFb5levTZV9AsZhT+bAV9R6Y+eEi6vbkZIeS/nzykbn/clWHFTKrIPb
 1+I6SV8yfZAXm895L7
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Rong Tao <rtoax@foxmail.com>
To: olsajiri@gmail.com, andrii@kernel.org, daniel@iogearbox.net, sdf@google.com
Date: Sat,  2 Sep 2023 13:14:05 +0800
X-OQ-MSGID: <20230902051421.139040-2-rtoax@foxmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230902051421.139040-1-rtoax@foxmail.com>
References: <tencent_4F0CF08592B31A2E69546C5E174785109F09@qq.com>
 <20230902051421.139040-1-rtoax@foxmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Sep 2023 07:41:38 +0000
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
Subject: [Linux-stm32] [PATCH bpf-next v10 2/2] selftests/bpf:
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
index d64c4ef336e1..500b60226e5e 100644
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
@@ -115,8 +117,10 @@ struct ksyms *load_kallsyms_local(void)
 
 int load_kallsyms(void)
 {
+	pthread_mutex_lock(&ksyms_mutex);
 	if (!ksyms)
 		ksyms = load_kallsyms_local();
+	pthread_mutex_unlock(&ksyms_mutex);
 	return ksyms ? 0 : 1;
 }
 
-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
