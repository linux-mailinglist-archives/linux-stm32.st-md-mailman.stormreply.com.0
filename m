Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C78F85B7CD
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Feb 2024 10:41:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12DA2C6C858;
	Tue, 20 Feb 2024 09:41:43 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0512EC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 03:51:37 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-3c03d6e5e56so5188418b6e.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 19:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1708401096; x=1709005896;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XIatRLdxp59gkCuXn1TM1+7Ffjtt7PxZsUax3x716A4=;
 b=YPKoKTds/U//WoFld6E+zO9iWNArTarmHTpNt07i5cB4untHKL9D7uWLgZxP+wQ+Ng
 GbwdOW0oJfYRJMwooQrf/wsUgMqQ/Gzs2EnRBErVgyOcXZQqNjBHWkJPZcI3UCWi8Bxq
 qQPy3OSeRGaHAQM6eICfKIiW9SaNEklzXubViEtwC400i1mKHT1ztVzGkDjept5Cknnd
 ZhQm43y22MhYb7EmOD9Q9TT3vBgCZDtqBHWriNu7bsh164YoOfrvGXBCQvqxs4rtq8Wn
 7zXLugT+hC+5kSYzVinX2323v+h6uZcCQh/vFQmk+T0WjdW+tmFmXRFuNkrQ42YKnvvW
 QeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708401096; x=1709005896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XIatRLdxp59gkCuXn1TM1+7Ffjtt7PxZsUax3x716A4=;
 b=OkKv8PpM8UPURrirtMGWbBhKef/ojH4waPqL8zsejm4EJu8xXUvLCPAcySHHgKNlbr
 R4q4UHGh6QWm8gUliCJicpCqJv2Br1I3L2iLSvNdblUGY5zy4SwMR7aVWFTaL7beyfPR
 s8Sah0SUnZ4+o3cpIO/SOxGK4Ve+2Br0/s6pLdjnSFwKojnGdlahVg7gp6fycIqKTysg
 DFI9xIpmpcKkhN7B9+g4Rz34FMYn9V4axE0/PI3Q0Vlc2tyqb2OLpT6vAaV5ddbkAsAd
 Aov8iA7MUXqEAVMp8xG2JxEmKOWpneDl8KJw4ZnJFtXEv2s1seYMQUlH5IXDimLao3er
 QgDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLfJjL9lbYN/i/nPKeh7BypvD0MGasB+4X7w1Ao5E+CQWgZQSIIBgotaSx9pJPc60ZwFoueO4+J6a34/77ey7PjQzQYWnl0Uhiy1lvRHetoS6bbf5W8/OH
X-Gm-Message-State: AOJu0YzJbu9eE/0sFIpkwVL4+zkXxSUCSRDmvKLv7V0SWqVlZ7c9R/SL
 +neZ77h5QDjqMI/7IXCgkVF5J87m6M+/ReqAnaARuelKSweAnbkGFY1naOcJ63c=
X-Google-Smtp-Source: AGHT+IGR3ZiUXeeQYK4PiqThY08Xd9MG8AmFv61MNQVpDP2MDd+C2I7YVN1xqhHQa/R/QyD8+ZbFGQ==
X-Received: by 2002:a05:6808:1646:b0:3c1:3427:fef3 with SMTP id
 az6-20020a056808164600b003c13427fef3mr18759661oib.48.1708401095822; 
 Mon, 19 Feb 2024 19:51:35 -0800 (PST)
Received: from localhost.localdomain ([43.129.25.208])
 by smtp.gmail.com with ESMTPSA id
 jz7-20020a170903430700b001d94678a76csm5131723plb.117.2024.02.19.19.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 19:51:35 -0800 (PST)
From: Menglong Dong <dongmenglong.8@bytedance.com>
To: andrii@kernel.org
Date: Tue, 20 Feb 2024 11:51:05 +0800
Message-Id: <20240220035105.34626-6-dongmenglong.8@bytedance.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220035105.34626-1-dongmenglong.8@bytedance.com>
References: <20240220035105.34626-1-dongmenglong.8@bytedance.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 20 Feb 2024 09:41:40 +0000
Cc: linux-kselftest@vger.kernel.org, davemarchevsky@fb.com, song@kernel.org,
 sdf@google.com, yonghong.song@linux.dev, thinker.li@gmail.com,
 shuah@kernel.org, linux-stm32@st-md-mailman.stormreply.com, mykolal@fb.com,
 dongmenglong.8@bytedance.com, daniel@iogearbox.net, john.fastabend@gmail.com,
 zhoufeng.zf@bytedance.com, mcoquelin.stm32@gmail.com, ast@kernel.org,
 dxu@dxuuu.xyz, kpsingh@kernel.org, linux-arm-kernel@lists.infradead.org,
 haoluo@google.com, linux-kernel@vger.kernel.org, eddyz87@gmail.com,
 jolsa@kernel.org, bpf@vger.kernel.org, martin.lau@linux.dev
Subject: [Linux-stm32] [PATCH bpf-next 5/5] selftests/bpf: add test cases
	for multiple attach of tracing program
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

In this commit, we add the testcases for multiple attaching of tracing,
include FENTRY, FEXIT, MODIFY_RETURN.

Signed-off-by: Menglong Dong <dongmenglong.8@bytedance.com>
---
 .../selftests/bpf/bpf_testmod/bpf_testmod.c   |  49 ++++++
 .../bpf/prog_tests/tracing_multi_attach.c     | 155 ++++++++++++++++++
 .../selftests/bpf/progs/tracing_multi_test.c  |  72 ++++++++
 3 files changed, 276 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/tracing_multi_attach.c
 create mode 100644 tools/testing/selftests/bpf/progs/tracing_multi_test.c

diff --git a/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c b/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c
index 66787e99ba1b..237eeb7daa07 100644
--- a/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c
+++ b/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c
@@ -98,12 +98,61 @@ bpf_testmod_test_struct_arg_8(u64 a, void *b, short c, int d, void *e,
 	return bpf_testmod_test_struct_arg_result;
 }
 
+noinline int
+bpf_testmod_test_struct_arg_9(struct bpf_testmod_struct_arg_2 a,
+			      struct bpf_testmod_struct_arg_1 b) {
+	bpf_testmod_test_struct_arg_result = a.a + a.b  + b.a;
+	return bpf_testmod_test_struct_arg_result;
+}
+
+noinline int
+bpf_testmod_test_struct_arg_10(int a, struct bpf_testmod_struct_arg_2 b) {
+	bpf_testmod_test_struct_arg_result = a + b.a + b.b;
+	return bpf_testmod_test_struct_arg_result;
+}
+
+noinline struct bpf_testmod_struct_arg_2 *
+bpf_testmod_test_struct_arg_11(int a, struct bpf_testmod_struct_arg_2 b, int c) {
+	bpf_testmod_test_struct_arg_result = a + b.a + b.b + c;
+	return (void *)bpf_testmod_test_struct_arg_result;
+}
+
+noinline int
+bpf_testmod_test_struct_arg_12(int a, struct bpf_testmod_struct_arg_2 b, int *c) {
+	bpf_testmod_test_struct_arg_result = a + b.a + b.b + *c;
+	return bpf_testmod_test_struct_arg_result;
+}
+
 noinline int
 bpf_testmod_test_arg_ptr_to_struct(struct bpf_testmod_struct_arg_1 *a) {
 	bpf_testmod_test_struct_arg_result = a->a;
 	return bpf_testmod_test_struct_arg_result;
 }
 
+noinline int
+bpf_testmod_test_arg_ptr_1(struct bpf_testmod_struct_arg_1 *a) {
+	bpf_testmod_test_struct_arg_result = a->a;
+	return bpf_testmod_test_struct_arg_result;
+}
+
+noinline int
+bpf_testmod_test_arg_ptr_2(struct bpf_testmod_struct_arg_2 *a) {
+	bpf_testmod_test_struct_arg_result = a->a + a->b;
+	return bpf_testmod_test_struct_arg_result;
+}
+
+noinline int
+bpf_testmod_test_arg_ptr_3(int a, struct bpf_testmod_struct_arg_2 *b) {
+	bpf_testmod_test_struct_arg_result = a + b->a + b->b;
+	return bpf_testmod_test_struct_arg_result;
+}
+
+noinline int
+bpf_testmod_test_arg_ptr_4(struct bpf_testmod_struct_arg_2 *a, int b) {
+	bpf_testmod_test_struct_arg_result = a->a + a->b + b;
+	return bpf_testmod_test_struct_arg_result;
+}
+
 __bpf_kfunc void
 bpf_testmod_test_mod_kfunc(int i)
 {
diff --git a/tools/testing/selftests/bpf/prog_tests/tracing_multi_attach.c b/tools/testing/selftests/bpf/prog_tests/tracing_multi_attach.c
new file mode 100644
index 000000000000..6162d41cca9e
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/tracing_multi_attach.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2024 Bytedance. */
+
+#include <test_progs.h>
+#include "tracing_multi_test.skel.h"
+
+struct test_item {
+	char *prog;
+	char *target;
+	int attach_type;
+	bool success;
+	int link_fd;
+};
+
+static struct test_item test_items[] = {
+	{
+		.prog = "fentry_test1", .target = "bpf_testmod_test_struct_arg_9",
+		.attach_type = BPF_TRACE_FENTRY, .success = true,
+	},
+	{
+		.prog = "fentry_test1", .target = "bpf_testmod_test_struct_arg_1",
+		.attach_type = BPF_TRACE_FENTRY, .success = false,
+	},
+	{
+		.prog = "fentry_test1", .target = "bpf_testmod_test_struct_arg_2",
+		.attach_type = BPF_TRACE_FENTRY, .success = false,
+	},
+	{
+		.prog = "fentry_test1", .target = "bpf_testmod_test_arg_ptr_2",
+		.attach_type = BPF_TRACE_FENTRY, .success = false,
+	},
+	{
+		.prog = "fentry_test2", .target = "bpf_testmod_test_struct_arg_2",
+		.attach_type = BPF_TRACE_FENTRY, .success = false,
+	},
+	{
+		.prog = "fentry_test2", .target = "bpf_testmod_test_struct_arg_10",
+		.attach_type = BPF_TRACE_FENTRY, .success = true,
+	},
+	{
+		.prog = "fentry_test2", .target = "bpf_testmod_test_struct_arg_9",
+		.attach_type = BPF_TRACE_FENTRY, .success = false,
+	},
+	{
+		.prog = "fentry_test2", .target = "bpf_testmod_test_arg_ptr_3",
+		.attach_type = BPF_TRACE_FENTRY, .success = false,
+	},
+	{
+		.prog = "fentry_test3", .target = "bpf_testmod_test_arg_ptr_3",
+		.attach_type = BPF_TRACE_FENTRY, .success = false,
+	},
+	{
+		.prog = "fentry_test3", .target = "bpf_testmod_test_arg_ptr_4",
+		.attach_type = BPF_TRACE_FENTRY, .success = true,
+	},
+	{
+		.prog = "fentry_test4", .target = "bpf_testmod_test_struct_arg_4",
+		.attach_type = BPF_TRACE_FENTRY, .success = true,
+	},
+	{
+		.prog = "fentry_test4", .target = "bpf_testmod_test_struct_arg_2",
+		.attach_type = BPF_TRACE_FENTRY, .success = true,
+	},
+	{
+		.prog = "fentry_test4", .target = "bpf_testmod_test_struct_arg_12",
+		.attach_type = BPF_TRACE_FENTRY, .success = false,
+	},
+	{
+		.prog = "fexit_test1", .target = "bpf_testmod_test_struct_arg_2",
+		.attach_type = BPF_TRACE_FEXIT, .success = true,
+	},
+	{
+		.prog = "fexit_test1", .target = "bpf_testmod_test_struct_arg_3",
+		.attach_type = BPF_TRACE_FEXIT, .success = true,
+	},
+	{
+		.prog = "fexit_test1", .target = "bpf_testmod_test_struct_arg_4",
+		.attach_type = BPF_TRACE_FEXIT, .success = false,
+	},
+	{
+		.prog = "fexit_test2", .target = "bpf_testmod_test_struct_arg_10",
+		.attach_type = BPF_TRACE_FEXIT, .success = false,
+	},
+	{
+		.prog = "fexit_test2", .target = "bpf_testmod_test_struct_arg_11",
+		.attach_type = BPF_TRACE_FEXIT, .success = false,
+	},
+	{
+		.prog = "fexit_test2", .target = "bpf_testmod_test_struct_arg_12",
+		.attach_type = BPF_TRACE_FEXIT, .success = true,
+	},
+	{
+		.prog = "fmod_ret_test1", .target = "bpf_modify_return_test2",
+		.attach_type = BPF_MODIFY_RETURN, .success = true,
+	},
+};
+
+static int do_test_item(struct tracing_multi_test *skel, struct test_item *item)
+{
+	LIBBPF_OPTS(bpf_link_create_opts, link_opts);
+	struct bpf_program *prog;
+	int err, btf_fd = 0, btf_type_id;
+
+	err = libbpf_find_kernel_btf_id(item->target, item->attach_type,
+					&btf_fd, &btf_type_id);
+	if (!ASSERT_OK(err, "find_vmlinux_btf_id"))
+		return -1;
+
+	link_opts.target_btf_id = btf_type_id;
+	prog = bpf_object__find_program_by_name(skel->obj, item->prog);
+	if (!ASSERT_OK_PTR(prog, "find_program_by_name"))
+		return -1;
+
+	err = bpf_link_create(bpf_program__fd(prog), btf_fd, item->attach_type,
+			      &link_opts);
+	item->link_fd = err;
+	if (item->success) {
+		if (!ASSERT_GE(err, 0, "link_create"))
+			return -1;
+	} else {
+		if (!ASSERT_LT(err, 0, "link_create"))
+			return -1;
+	}
+
+	return 0;
+}
+
+void test_tracing_multi_attach(void)
+{
+	struct tracing_multi_test *skel;
+	int i = 0, err, fd;
+
+	skel = tracing_multi_test__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "tracing_multi_test__open_and_load"))
+		return;
+
+	err = tracing_multi_test__attach(skel);
+	if (!ASSERT_OK(err, "tracing_multi_test__attach"))
+		goto destroy_skel;
+
+	for (; i < ARRAY_SIZE(test_items); i++) {
+		if (do_test_item(skel, &test_items[i]))
+			break;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(test_items); i++) {
+		fd = test_items[i].link_fd;
+		if (fd >= 0)
+			close(fd);
+	}
+
+	tracing_multi_test__detach(skel);
+destroy_skel:
+	tracing_multi_test__destroy(skel);
+}
diff --git a/tools/testing/selftests/bpf/progs/tracing_multi_test.c b/tools/testing/selftests/bpf/progs/tracing_multi_test.c
new file mode 100644
index 000000000000..f1ca8b64ed16
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/tracing_multi_test.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2024 ByteDance */
+#include <linux/bpf.h>
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_tracing.h>
+
+char _license[] SEC("license") = "GPL";
+
+struct bpf_testmod_struct_arg_1 {
+	int a;
+};
+struct bpf_testmod_struct_arg_2 {
+	long a;
+	long b;
+};
+
+__u64 fentry_test1_result = 0;
+SEC("fentry/bpf_testmod_test_struct_arg_1")
+int BPF_PROG2(fentry_test1, struct bpf_testmod_struct_arg_2, a)
+{
+	fentry_test1_result = a.a + a.b;
+	return 0;
+}
+
+__u64 fentry_test2_result = 0;
+SEC("fentry/bpf_testmod_test_struct_arg_2")
+int BPF_PROG2(fentry_test2, int, a, struct bpf_testmod_struct_arg_2, b)
+{
+	fentry_test2_result = a + b.a + b.b;
+	return 0;
+}
+
+__u64 fentry_test3_result = 0;
+SEC("fentry/bpf_testmod_test_arg_ptr_2")
+int BPF_PROG(fentry_test3, struct bpf_testmod_struct_arg_2 *a)
+{
+	fentry_test3_result = a->a + a->b;
+	return 0;
+}
+
+__u64 fentry_test4_result = 0;
+SEC("fentry/bpf_testmod_test_struct_arg_1")
+int BPF_PROG2(fentry_test4, struct bpf_testmod_struct_arg_2, a, int, b,
+	      int, c)
+{
+	fentry_test3_result = c;
+	return 0;
+}
+
+__u64 fexit_test1_result = 0;
+SEC("fexit/bpf_testmod_test_struct_arg_1")
+int BPF_PROG2(fexit_test1, struct bpf_testmod_struct_arg_2, a, int, b,
+	      int, c, int, retval)
+{
+	fexit_test1_result = retval;
+	return 0;
+}
+
+__u64 fexit_test2_result = 0;
+SEC("fexit/bpf_testmod_test_struct_arg_2")
+int BPF_PROG2(fexit_test2, int, a, struct bpf_testmod_struct_arg_2, b,
+	      int, c, int, retval)
+{
+	fexit_test2_result = a + b.a + b.b + retval;
+	return 0;
+}
+
+SEC("fmod_ret/bpf_modify_return_test")
+int BPF_PROG(fmod_ret_test1, int a, int *b)
+{
+	return 0;
+}
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
