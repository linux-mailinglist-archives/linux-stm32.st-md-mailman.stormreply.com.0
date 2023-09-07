Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CDC797044
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Sep 2023 08:21:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38140C6B471;
	Thu,  7 Sep 2023 06:21:29 +0000 (UTC)
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com
 [162.62.57.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E59FAC6B467
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Sep 2023 02:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1694052015;
 bh=Lhf4n1nBq4VAEDet52XCaOndkj8vQcHGv7waBa1OZl0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=FIEJ3zpYI4S8inuU9KR9pB889EB393rB1TF8hOOFUfkmFtcFIz9cs6VQbkA4hE776
 eONwKcLvBQbIZTyUTS/ZbVMmtxPQHWQuAhhTw8wpvYKGmPhhl1o+hAuw/a/f+WRYly
 pOEI2jZRnNN2fIvk4wYZQyffPGmW3aX5WcOMF5wk=
Received: from RT-NUC.. ([39.156.73.12])
 by newxmesmtplogicsvrszc2-0.qq.com (NewEsmtp) with SMTP
 id EEB27808; Thu, 07 Sep 2023 09:59:43 +0800
X-QQ-mid: xmsmtpt1694052001t6cwiynfr
Message-ID: <tencent_5D0A837E219E2CFDCB0495DAD7D5D1204407@qq.com>
X-QQ-XMAILINFO: NQR8mRxMnur9GVejZOqymyOCfTJKiLGmBPL7+7quQyquwS3OB2Gq/OewjNcZQa
 R3UmyCZo5Q1bz9iL/9q5RpvMvv/uWpt0ZY4mNaaQEQlqJ1plAMs4Y8okMUK1FFfRqp9rgx5lhcOQ
 k1N7nMMXe6ZG7OZKFmSRKsaE24N8BGGkoTmMfVrMYfwjCOfTfyCn8tSgzKca7MR4palCrkZk+L8h
 5azCXhUrb28MpbEcbt86qGaIZJtWgP7R1AymBcVyVaJOgSRq0RgAdIyNcxB/fry2nEiv7qfxjRUN
 kzFfxTR6Rj+N7j8bsoC31krlbyUpmK3YBbyulMOF8Oy20H6/o658+DWsE+vySGOa++4OGyhyVRRx
 6YBPAbYu+3sz+7ceWTCTN8C4Sen3vjcwoJfRHRhXAfHXGNP4eJAOtU+LQaxrcwZkBag9c3Pv4NyG
 O4DjGMgBg2UUzN6WsGNJnhwo9b3Q4vURldACPNGHIQ3CiMTpTuTr2l6lsh+NFhu6ZXZ72TAojscq
 L+9gJkTE/5QCpuwsfDfhYtB9jcbtOhXy4ms43Ll76rSo+ZYsIghKEUijqpllCUaYXHrm3s7GnFnD
 vpfyGA+mlRe8n7Q4xKHw4qe01LKUbBDxX8nh0N34VwFhFannpTTneQ9tLuS2Mq33q63jz3gBin6q
 b8Bz4SPvBtfsgZnkX3jSibCJ7FMR4JQFUi8gqFSXSnZR6iOd5xlxPvS8lca86br+fZHd9PjJedO1
 bHgCyKlugrYH+Y4hpIor4soYylEJPksG833jeAfNV7Vw5qycDsqCcPNaqVwdkkSs7vhNTI0t231d
 7+/we2ZLeX7QlfmzbsdlbcUZ13ZtKzMa5GvLFXnNFDZtVyk97ve6ZfB2c+MnXI/fELPJJmAADVCK
 mtuNlioTc29T4+MnwbMrgiARcOURhupGt2BNumJXBqcuTkdm3/wLwz2Zv23Z+QZ0HZ1on0xYG0oe
 L58wBOAYye2i1rJgmYRUnL9khIWydDgS6a/kkpjo3a2g0M9c/yEjC1aXuF/zQZUb65yOQmENs=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Rong Tao <rtoax@foxmail.com>
To: olsajiri@gmail.com,
	andrii@kernel.org,
	daniel@iogearbox.net
Date: Thu,  7 Sep 2023 09:59:14 +0800
X-OQ-MSGID: <f1088b90f525d4a0a46d77c2e5bfcc3854015714.1694051654.git.rongtao@cestc.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694051654.git.rongtao@cestc.cn>
References: <cover.1694051654.git.rongtao@cestc.cn>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 07 Sep 2023 06:21:28 +0000
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stanislav Fomichev <sdf@google.com>
Subject: [Linux-stm32] [PATCH bpf-next v12 2/2] selftests/bpf:
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

Acked-by: Jiri Olsa <jolsa@kernel.org>
Signed-off-by: Rong Tao <rongtao@cestc.cn>
---
 tools/testing/selftests/bpf/trace_helpers.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/bpf/trace_helpers.c b/tools/testing/selftests/bpf/trace_helpers.c
index dc4efaf538ae..4faa898ff7fc 100644
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
@@ -109,8 +111,10 @@ struct ksyms *load_kallsyms_local(void)
 
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
