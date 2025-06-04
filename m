Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE46BACD795
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Jun 2025 07:53:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B2CEC32E92;
	Wed,  4 Jun 2025 05:53:54 +0000 (UTC)
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com
 [162.62.57.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10B83C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Jun 2025 05:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1749016414;
 bh=dxK57rrh1jvoo1g24molYIQ1YbfbH2OZpE0y+PyiV/c=;
 h=From:To:Cc:Subject:Date;
 b=j8EUBg02aEnilOpHZCWkZ0BRObtR1z8LLex8B0Nmvp5bywuBr0tqIFXqpgqtUN+Ek
 DWPPmbKeK4FnK0LlnspTPyYrY9B0PEtfBFOqyuVCiSacdCNh6hpkMGmiTvADD9h8hR
 R5EBvV1PNxaxflrmWghZzuC5hKu64CLZQWydpB9o=
Received: from NUC10.. ([39.156.73.10])
 by newxmesmtplogicsvrszgpua8-0.qq.com (NewEsmtp) with SMTP
 id D5E8A2A8; Wed, 04 Jun 2025 13:53:30 +0800
X-QQ-mid: xmsmtpt1749016410tl4fl36g6
Message-ID: <tencent_A6502A28AF21A3CA88B106F3421159869708@qq.com>
X-QQ-XMAILINFO: NQzH8pzEc5hGPs3uj3kHrPeahZXak4dASrsyrlzi8+3SJ7ZOTDpWGr79QAvJA0
 fhuR2sbv+Msr+YEK+VIb74pqi2uxdzWNu1OdHXfeB+gQ03Su/LZcBfmkwasrzX9FYuUnQXit9C+8
 0IGhc4QLAqbKjZD2amrQ9T+2pXDPAHE6zE9GoK//b4lUK7qCg59+iZvbfFjqbiBHo2ENmXdEPY9o
 zCcyfK05WmOKNR16Gm10Z71NYlowvtf8olaxSsExCHxDWghK7mKS53Z0w1Zlidk+iXMa/C4XQCiy
 3PtbVLIPiynLUyTUW/WJrl/7CuVbUIpWgTYSdKL2pqwNrw/tDpSXOQ1hw8QsaEC9qQxeM4siDjic
 xO5BKctg33BahoFO/o11+aebzWKaRomZaU9YeqRZILrG8rtEGKIjvpnFbIUvnHFq5qKCaV/1g9CE
 b+Tvda3WblLyGp5R4B1ybfjTRi7bzLIhcObdUeogv0Ovz6nBlKdAlkhDlk/7TzI+JgLq0urLwHZn
 Bd9mfje5NdZvG0aBDfd3HsARwebUUxi79N7F1hd+64PcRbaGV3qtIpaCdA6jwIHWOSb/VvXsf3Xq
 2IIeq/+33mu/I7IkCFknTgMP3obpfF8b6sR+EIZJfYDoRArzXNZcHoZUv/2RgZ4mWUUvtu4yLLBQ
 AML7h0BY4RTkSoFxrTSd5U0M4q0xWbywZiDdrTcKkLGDH4a8DZ0kJlCf2dljGbY0+QrBDnGbLd7U
 YrdmJeSInyQ/AiQwoj5qfElxvyst5HOcko0dhXHeacRUWEDDbeEXzm5w5+s7gzq8AkXqMZqt1nKK
 gawqU30CpqXDpEHnLpgGZ+tmOIklp4yY8TCXhdfQ9i1gjILJFTDL4EQZoLUrF26XXA8SGgzGoY9G
 5SIOqn0KAkov8Plr9prRgfZzXXi4meZrkw/iUdPHs+vY5gdNQTZiakfZPdradkPBZ75gVmMfQ+fG
 mzxismGJH8a23K/56wMcUloUA3OxUmqFqRJc0tai9nrTW5oqwHvx/QQNkfGv28p3VR+OPlF3U=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Rong Tao <rtoax@foxmail.com>
To: andrii@kernel.org,
	eddyz87@gmail.com
Date: Wed,  4 Jun 2025 13:53:22 +0800
X-OQ-MSGID: <20250604055324.222850-1-rtoax@foxmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Cc: Yonghong Song <yonghong.song@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>,
 open list <linux-kernel@vger.kernel.org>, Song Liu <song@kernel.org>,
 rongtao@cestc.cn,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 rtoax@foxmail.com, Shuah Khan <shuah@kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Juntong Deng <juntong.deng@outlook.com>, Mykola Lysenko <mykolal@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Amery Hung <ameryhung@gmail.com>,
 KP Singh <kpsingh@kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>, Oleg Nesterov <oleg@redhat.com>,
 Jiri Olsa <jolsa@kernel.org>,
 "open list:BPF \[SELFTESTS\] Test Runners & Infrastructure"
 <bpf@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>
Subject: [Linux-stm32] [PATCH bpf-next] selftests/bpf: Fix compile error of
	bin_attribute::read/write()
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

Since commit 97d06802d10a ("sysfs: constify bin_attribute argument of
bin_attribute::read/write()"), make bin_attribute parameter of
bin_attribute::read/write() const.

Signed-off-by: Rong Tao <rongtao@cestc.cn>
---
 tools/testing/selftests/bpf/test_kmods/bpf_testmod.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
index e6c248e3ae54..e9e918cdf31f 100644
--- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
+++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
@@ -385,7 +385,7 @@ int bpf_testmod_fentry_ok;
 
 noinline ssize_t
 bpf_testmod_test_read(struct file *file, struct kobject *kobj,
-		      struct bin_attribute *bin_attr,
+		      const struct bin_attribute *bin_attr,
 		      char *buf, loff_t off, size_t len)
 {
 	struct bpf_testmod_test_read_ctx ctx = {
@@ -465,7 +465,7 @@ ALLOW_ERROR_INJECTION(bpf_testmod_test_read, ERRNO);
 
 noinline ssize_t
 bpf_testmod_test_write(struct file *file, struct kobject *kobj,
-		      struct bin_attribute *bin_attr,
+		      const struct bin_attribute *bin_attr,
 		      char *buf, loff_t off, size_t len)
 {
 	struct bpf_testmod_test_write_ctx ctx = {
@@ -567,7 +567,7 @@ static void testmod_unregister_uprobe(void)
 
 static ssize_t
 bpf_testmod_uprobe_write(struct file *file, struct kobject *kobj,
-			 struct bin_attribute *bin_attr,
+			 const struct bin_attribute *bin_attr,
 			 char *buf, loff_t off, size_t len)
 {
 	unsigned long offset = 0;
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
