Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DE878471D
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6006C6C829;
	Tue, 22 Aug 2023 16:25:19 +0000 (UTC)
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com
 [162.62.57.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 651CBC6B468
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 15:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1691680460;
 bh=8iX4AZvqF0mnbmZ/25iLnlbKxcbIj6Y1Oyzof9l4lsU=;
 h=From:To:Cc:Subject:Date;
 b=fuphHTWKng4RqyxAfBHSBPax83nwfYrrpe8gDShHdbWGkZsTFxTXOar+qQ+Tiixvc
 B8HPbKv0P1+Zwt6KGStL68dAPED4E6rxfrMTRPHu3/1XvmICsRhsAsBzRkBQb9dhur
 WnadxbWeDPTY+KnxaCwGBMdgl9iBViVokf5T+4oI=
Received: from rtoax.. ([124.126.137.199])
 by newxmesmtplogicsvrszb1-0.qq.com (NewEsmtp) with SMTP
 id 38E01EC2; Thu, 10 Aug 2023 23:14:14 +0800
X-QQ-mid: xmsmtpt1691680454tw3ysamxb
Message-ID: <tencent_AB461510B10CD484E0B2F62E3754165F2909@qq.com>
X-QQ-XMAILINFO: NY3HYYTs4gYS6V/gjwcwbhlmyR19kq+bHFP29CjlmP6NKnvDBD21JRAW78CNdo
 Cye91/d9ao2KNbOU8jZcKzqcGg4RI23zpXaMJN1lTXPuW34UjHYNBUPWx5VI1TocuqPAOWoL/Bqw
 3qtGFZMeQPvZ5CuQYMPYhvEnzqEmaWv1JcU+8jIjvcrNEH7/3QUJG2su4k+BzjqAHugg7I84NWjJ
 032N+1H46a+4KHRRD1/NczZ1JCzPv9LkaEdUxi2T2gotkIiBjFoGkih2fGMf6R2O+6OcJ9RgV4Ux
 J2YiKRI6/6qxBQo5OTNTJjrpRgSzQGDZN3ZAWnDn8YWKezvGP0YLfioej9itSYUh2jk5vVaetfpq
 ZURv7YET3rYMKe3fH9WfjbUp9Sx2s0Zg3skY5OWkppHVhByCtIYCTT97JxQiCvWeQ90bMlj+X4dO
 UdLOrS/h+GwKsBSkJwt4ZVxUVUaQuoaKiWj5K858L0wHOhy4t+J6kKVsTpU6vWnLIFUYFlxr4j3s
 CDggrRQXFA01R9j3Gsxm+/CD1beh7zhgdNTNVZBorHNoe8XmaYBC4qSiOPB+thUYGpkC1StRro40
 bTFe4ZaenuTcv3GNgxNuE3s1AWMejQ0I3Ap8D5tlt4cHyX24OWB12+RYDLfN1zdkuUtuk2f/XAhf
 5LTXd8msHDrrQxUwo5u2pMKnjTH5fycBoq2A/I9YeLNHnuOvpU1K64StMkDBmZsBmwg2LIP+skSy
 owbPNKQWIkaptKP+YvDOkP4zUMTokvz4a3b0LWt1Sshwlfm5yiP00cil+2wfwBSoYCiaQ3YqkvXl
 fj50l2ZjrsgRcWQ31AMGUILA9mWxOz7CpDvqwZjSiWYuTf/+NPqZ4qv1cffmF4akqrJKHEzW0jUL
 ql2eSpM7dPOkYIB8vFHx1pp6HOdOgZaHIVBzkKDk/EKQ60sCiqYgZbz9uQklUokUkXIWbu8C6+hN
 zIbZbPGCn7STUPcTmioECRk4fXBB6Xjcr+QV0TCrUlZWnrdmfzwNoS7TXSt7Z/xNKctW2wlMA=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Rong Tao <rtoax@foxmail.com>
To: ast@kernel.org
Date: Thu, 10 Aug 2023 23:14:04 +0800
X-OQ-MSGID: <20230810151412.85296-1-rtoax@foxmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:59 +0000
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Song Liu <song@kernel.org>,
 rongtao@cestc.cn, Yonghong Song <yonghong.song@linux.dev>,
 =?UTF-8?q?Daniel=20M=C3=BCller?= <deso@posteo.net>, rtoax@foxmail.com,
 Xu Kuohai <xukuohai@huawei.com>, Shuah Khan <shuah@kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Mykola Lysenko <mykolal@fb.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Manu Bretelle <chantr4@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ross Zwisler <zwisler@google.com>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 KP Singh <kpsingh@kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>, open list <linux-kernel@vger.kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>, Jiri Olsa <jolsa@kernel.org>,
 "open list:BPF \[GENERAL\] Safe Dynamic Programs and Tools"
 <bpf@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,
 Stanislav Fomichev <sdf@google.com>
Subject: [Linux-stm32] [PATCH bpf-next] selftests/bpf: trace_helpers.c:
	optimize kallsyms cache
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

Static ksyms often have problems because the number of symbols exceeds the
MAX_SYMS limit. Like changing the MAX_SYMS from 300000 to 400000 in
commit e76a014334a6("selftests/bpf: Bump and validate MAX_SYMS") solves
the problem somewhat, but it's not the perfect way.

This commit uses dynamic memory allocation, which completely solves the
problem caused by the limitation of the number of kallsyms.

Signed-off-by: Rong Tao <rongtao@cestc.cn>
---
 samples/bpf/offwaketime_user.c                |  1 +
 samples/bpf/sampleip_user.c                   |  1 +
 samples/bpf/spintest_user.c                   |  1 +
 samples/bpf/task_fd_query_user.c              |  1 +
 samples/bpf/trace_event_user.c                |  1 +
 .../selftests/bpf/prog_tests/bpf_cookie.c     |  1 +
 .../bpf/prog_tests/get_stack_raw_tp.c         |  1 +
 .../bpf/prog_tests/kprobe_multi_test.c        |  2 +
 .../prog_tests/kprobe_multi_testmod_test.c    |  2 +
 tools/testing/selftests/bpf/trace_helpers.c   | 74 ++++++++++++-------
 tools/testing/selftests/bpf/trace_helpers.h   |  1 +
 11 files changed, 60 insertions(+), 26 deletions(-)

diff --git a/samples/bpf/offwaketime_user.c b/samples/bpf/offwaketime_user.c
index b6eedcb98fb9..5e6934f2d932 100644
--- a/samples/bpf/offwaketime_user.c
+++ b/samples/bpf/offwaketime_user.c
@@ -149,5 +149,6 @@ int main(int argc, char **argv)
 		bpf_link__destroy(links[i]);
 
 	bpf_object__close(obj);
+	free_kallsyms();
 	return 0;
 }
diff --git a/samples/bpf/sampleip_user.c b/samples/bpf/sampleip_user.c
index 9283f47844fb..548ca1e9fcac 100644
--- a/samples/bpf/sampleip_user.c
+++ b/samples/bpf/sampleip_user.c
@@ -230,5 +230,6 @@ int main(int argc, char **argv)
 
 	free(links);
 	bpf_object__close(obj);
+	free_kallsyms();
 	return error;
 }
diff --git a/samples/bpf/spintest_user.c b/samples/bpf/spintest_user.c
index aadac14f748a..895a64afaf78 100644
--- a/samples/bpf/spintest_user.c
+++ b/samples/bpf/spintest_user.c
@@ -88,5 +88,6 @@ int main(int ac, char **argv)
 		bpf_link__destroy(links[j]);
 
 	bpf_object__close(obj);
+	free_kallsyms();
 	return 0;
 }
diff --git a/samples/bpf/task_fd_query_user.c b/samples/bpf/task_fd_query_user.c
index 1e61f2180470..3eb9477541fb 100644
--- a/samples/bpf/task_fd_query_user.c
+++ b/samples/bpf/task_fd_query_user.c
@@ -419,5 +419,6 @@ int main(int argc, char **argv)
 		bpf_link__destroy(links[i]);
 
 	bpf_object__close(obj);
+	free_kallsyms();
 	return err;
 }
diff --git a/samples/bpf/trace_event_user.c b/samples/bpf/trace_event_user.c
index 9664749bf618..a8b9343126fa 100644
--- a/samples/bpf/trace_event_user.c
+++ b/samples/bpf/trace_event_user.c
@@ -348,5 +348,6 @@ int main(int argc, char **argv)
 
 cleanup:
 	bpf_object__close(obj);
+	free_kallsyms();
 	err_exit(error);
 }
diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
index 26b2d1bffdfd..4786396e554b 100644
--- a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
+++ b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
@@ -170,6 +170,7 @@ static void kprobe_multi_link_api_subtest(void)
 cleanup:
 	close(link1_fd);
 	close(link2_fd);
+	free_kallsyms();
 	kprobe_multi__destroy(skel);
 }
 
diff --git a/tools/testing/selftests/bpf/prog_tests/get_stack_raw_tp.c b/tools/testing/selftests/bpf/prog_tests/get_stack_raw_tp.c
index 858e0575f502..4e1c564746e1 100644
--- a/tools/testing/selftests/bpf/prog_tests/get_stack_raw_tp.c
+++ b/tools/testing/selftests/bpf/prog_tests/get_stack_raw_tp.c
@@ -146,4 +146,5 @@ void test_get_stack_raw_tp(void)
 	bpf_link__destroy(link);
 	perf_buffer__free(pb);
 	bpf_object__close(obj);
+	free_kallsyms();
 }
diff --git a/tools/testing/selftests/bpf/prog_tests/kprobe_multi_test.c b/tools/testing/selftests/bpf/prog_tests/kprobe_multi_test.c
index 2173c4bb555e..d6c0b5f2f887 100644
--- a/tools/testing/selftests/bpf/prog_tests/kprobe_multi_test.c
+++ b/tools/testing/selftests/bpf/prog_tests/kprobe_multi_test.c
@@ -488,4 +488,6 @@ void test_kprobe_multi_test(void)
 		test_attach_api_syms();
 	if (test__start_subtest("attach_api_fails"))
 		test_attach_api_fails();
+
+	free_kallsyms();
 }
diff --git a/tools/testing/selftests/bpf/prog_tests/kprobe_multi_testmod_test.c b/tools/testing/selftests/bpf/prog_tests/kprobe_multi_testmod_test.c
index 1fbe7e4ac00a..c25f262832b7 100644
--- a/tools/testing/selftests/bpf/prog_tests/kprobe_multi_testmod_test.c
+++ b/tools/testing/selftests/bpf/prog_tests/kprobe_multi_testmod_test.c
@@ -86,4 +86,6 @@ void serial_test_kprobe_multi_testmod_test(void)
 		test_testmod_attach_api_syms();
 	if (test__start_subtest("testmod_attach_api_addrs"))
 		test_testmod_attach_api_addrs();
+
+	free_kallsyms();
 }
diff --git a/tools/testing/selftests/bpf/trace_helpers.c b/tools/testing/selftests/bpf/trace_helpers.c
index f83d9f65c65b..08986f70836b 100644
--- a/tools/testing/selftests/bpf/trace_helpers.c
+++ b/tools/testing/selftests/bpf/trace_helpers.c
@@ -18,9 +18,32 @@
 #define TRACEFS_PIPE	"/sys/kernel/tracing/trace_pipe"
 #define DEBUGFS_PIPE	"/sys/kernel/debug/tracing/trace_pipe"
 
-#define MAX_SYMS 400000
-static struct ksym syms[MAX_SYMS];
-static int sym_cnt;
+static struct {
+	struct ksym *syms;
+	unsigned int sym_cnt;
+} ksyms = {
+	.syms = NULL,
+	.sym_cnt = 0,
+};
+
+static int ksyms__add_symbol(const char *name, unsigned long addr)
+{
+	void *tmp;
+	unsigned int cnt = ksyms.sym_cnt;
+
+	cnt++;
+	tmp = realloc(ksyms.syms, sizeof(struct ksym) * cnt);
+	if (!tmp)
+		return -ENOMEM;
+
+	ksyms.sym_cnt = cnt;
+	ksyms.syms = tmp;
+
+	ksyms.syms[ksyms.sym_cnt - 1].addr = addr;
+	ksyms.syms[ksyms.sym_cnt - 1].name = strdup(name);
+
+	return 0;
+}
 
 static int ksym_cmp(const void *p1, const void *p2)
 {
@@ -33,9 +56,6 @@ int load_kallsyms_refresh(void)
 	char func[256], buf[256];
 	char symbol;
 	void *addr;
-	int i = 0;
-
-	sym_cnt = 0;
 
 	f = fopen("/proc/kallsyms", "r");
 	if (!f)
@@ -46,16 +66,10 @@ int load_kallsyms_refresh(void)
 			break;
 		if (!addr)
 			continue;
-		if (i >= MAX_SYMS)
-			return -EFBIG;
-
-		syms[i].addr = (long) addr;
-		syms[i].name = strdup(func);
-		i++;
+		ksyms__add_symbol(func, (unsigned long)addr);
 	}
 	fclose(f);
-	sym_cnt = i;
-	qsort(syms, sym_cnt, sizeof(struct ksym), ksym_cmp);
+	qsort(ksyms.syms, ksyms.sym_cnt, sizeof(struct ksym), ksym_cmp);
 	return 0;
 }
 
@@ -65,48 +79,56 @@ int load_kallsyms(void)
 	 * This is called/used from multiplace places,
 	 * load symbols just once.
 	 */
-	if (sym_cnt)
+	if (ksyms.sym_cnt)
 		return 0;
 	return load_kallsyms_refresh();
 }
 
+void free_kallsyms(void)
+{
+	if (!ksyms.sym_cnt)
+		return;
+	free(ksyms.syms);
+	ksyms.sym_cnt = 0;
+}
+
 struct ksym *ksym_search(long key)
 {
-	int start = 0, end = sym_cnt;
+	int start = 0, end = ksyms.sym_cnt;
 	int result;
 
 	/* kallsyms not loaded. return NULL */
-	if (sym_cnt <= 0)
+	if (ksyms.sym_cnt <= 0)
 		return NULL;
 
 	while (start < end) {
 		size_t mid = start + (end - start) / 2;
 
-		result = key - syms[mid].addr;
+		result = key - ksyms.syms[mid].addr;
 		if (result < 0)
 			end = mid;
 		else if (result > 0)
 			start = mid + 1;
 		else
-			return &syms[mid];
+			return &ksyms.syms[mid];
 	}
 
-	if (start >= 1 && syms[start - 1].addr < key &&
-	    key < syms[start].addr)
+	if (start >= 1 && ksyms.syms[start - 1].addr < key &&
+	    key < ksyms.syms[start].addr)
 		/* valid ksym */
-		return &syms[start - 1];
+		return &ksyms.syms[start - 1];
 
 	/* out of range. return _stext */
-	return &syms[0];
+	return &ksyms.syms[0];
 }
 
 long ksym_get_addr(const char *name)
 {
 	int i;
 
-	for (i = 0; i < sym_cnt; i++) {
-		if (strcmp(syms[i].name, name) == 0)
-			return syms[i].addr;
+	for (i = 0; i < ksyms.sym_cnt; i++) {
+		if (strcmp(ksyms.syms[i].name, name) == 0)
+			return ksyms.syms[i].addr;
 	}
 
 	return 0;
diff --git a/tools/testing/selftests/bpf/trace_helpers.h b/tools/testing/selftests/bpf/trace_helpers.h
index 876f3e711df6..d0d2bc4066c3 100644
--- a/tools/testing/selftests/bpf/trace_helpers.h
+++ b/tools/testing/selftests/bpf/trace_helpers.h
@@ -14,6 +14,7 @@ struct ksym {
 
 int load_kallsyms(void);
 int load_kallsyms_refresh(void);
+void free_kallsyms(void);
 
 struct ksym *ksym_search(long key);
 long ksym_get_addr(const char *name);
-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
