Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E227CF22B8
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC905C7A852;
	Mon,  5 Jan 2026 07:16:28 +0000 (UTC)
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com
 [209.85.216.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFF93C0693F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Dec 2025 17:37:25 +0000 (UTC)
Received: by mail-pj1-f100.google.com with SMTP id
 98e67ed59e1d1-34ce100aec4so974486a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Dec 2025 09:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=purestorage.com; s=google2022; t=1767202644; x=1767807444;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=evGP5W8eaS0gGQmtryNYpPPxNCoy7QWmqYRyuLboZRo=;
 b=gFiiELxD9CDOs4dDAGV85OvPw3Hrb05qo2+i61DYP1buyzAOE/Ha5SQDsPAIqCrYs2
 U4OR1csZVTt0gGEEusZrVNYzpafdeqtTcuT6fGF/LqfagMuQXkN5JmgeA0ckGAIZNBPF
 Jmv8PiPgK3QzOJcq/koFIk3TumF1HyD+5hXtw534rn4G9hUQHvZABHrIfm71/pXfWD9D
 ZQxB3tQTRhG/L69s6lKkLZk9Lj1mwKyOF2TG/OYCnpGdSfBApkXqby+OQs2JqIKlzGdF
 aHeZUqZz4Nx7FDMVI5YDpmm0LGshI+Q+GU7jxzzX59Q1OkJkL9bnAFL35cVQgmiY+0Kb
 Nm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767202644; x=1767807444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=evGP5W8eaS0gGQmtryNYpPPxNCoy7QWmqYRyuLboZRo=;
 b=PylUNYu4W03frRRL9KIICZkgo6rZH8U+lOPwI/CIscaRPLN0bFWKaJgkDUWzNuGJ/t
 0qdMxweqEFWx8ZV9qiJSxeoxav1DJU7xJS4DP6GbXy6RJKJLF3weulWTLA+A+xPysM78
 7m7Z2FqENqaG59BppvXesPibGmZu4bsCkJfHyey2FSPZ5CNPwTwCQQXbVSAbKStzuosx
 eGCxiPIecveeFi0IKdbUjbo0CloisU1/MT0Nzsw7/TsUuJDAUjQkpItJPZqJ8SYzHEYD
 a6aHTksedekF8+9C2f+Qwni1XWczJ2imbvRCcUlypFj5Jmj37Nvg5RG5c+3QvTlvaKFi
 lAGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrFlqDTAqYuoUMjuD5f4wjWrRkyy0q76DzYbBLR66SyuVPia6PSUPEFo5aC7nlGdeKURvHKAskk3Xm8A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwQYwhYObBuHyEW0Nd7aYqjzqQ84kWJwHyq00Hh2B5MjJBYSrlP
 tmxHH82Zxpy/k+SWTytVmt4TLZGhc/F8yP8xlRM/INxrG4ROyPWSpTaFF26lNm81JPamC8rUS+0
 ktc049WUX8RQagg7qa/I7wZCTQbwvm5H3z8fQGgGuiinsSMvAuZs5
X-Gm-Gg: AY/fxX62KWgSjzO7FcZIlA/QrOhWLENPzqzGy2VuYXwG4sVOKvaT4AnMHu3wOIrfci7
 sME9f9r0XyhybQwUDdIlVS9bYAf6ltKWIEYtZiHPQJGAFfINBIcQbde2xftoAaH4CzrVlpDV7cG
 SITo0bJNsuo5i9YWrj1ec8I6FdzSjvD82mlCQ5NUaflJlL/be/TGzZpSZR9apyokvCYY5dXkCtM
 8CqpVh9d7GZvZ9d1IQwKgwvsnnQYJK1yO8TRJk+1YNotuRFz8dxLbBHw/tiLS+Krs8VZVRzFxff
 ho3Ux1e8ucfreZilTR2bhTI3V/2ayFh1aMm96VfxnYHdUWc+oqhbK+KRQrREqIv5gNDp38KJ1uw
 NT1n3VMNqk1ybcbRypLsCy4GeKqA=
X-Google-Smtp-Source: AGHT+IE23PFN99NQKL9O+zJCZJj+5szPasN7ULi0swfy4CNHFw+Olu7RghBbYFrAySDYSvrr9RuRB4qHunQX
X-Received: by 2002:a17:90b:3903:b0:341:88ba:c632 with SMTP id
 98e67ed59e1d1-34e91f702ccmr23041237a91.0.1767202644137; 
 Wed, 31 Dec 2025 09:37:24 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
 by smtp-relay.gmail.com with ESMTPS id
 41be03b00d2f7-c1e7b784812sm2287052a12.9.2025.12.31.09.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 09:37:24 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com
 (dev-csander.dev.purestorage.com [10.49.34.222])
 by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id C9BDA340681;
 Wed, 31 Dec 2025 10:37:22 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
 id C3D39E4234A; Wed, 31 Dec 2025 10:37:22 -0700 (MST)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Tejun Heo <tj@kernel.org>,
 David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
 Changwoo Min <changwoo@igalia.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 David Ahern <dsahern@kernel.org>, Jamal Hadi Salim <jhs@mojatatu.com>,
 Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 "D. Wythe" <alibuda@linux.alibaba.com>,
 Dust Li <dust.li@linux.alibaba.com>,
 Sidraya Jayagond <sidraya@linux.ibm.com>,
 Wenjia Zhang <wenjia@linux.ibm.com>,
 Mahanta Jambigi <mjambigi@linux.ibm.com>,
 Tony Lu <tonylu@linux.alibaba.com>, Wen Gu <guwen@linux.alibaba.com>,
 Shuah Khan <shuah@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 31 Dec 2025 10:36:33 -0700
Message-ID: <20251231173633.3981832-6-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251231173633.3981832-1-csander@purestorage.com>
References: <20251231173633.3981832-1-csander@purestorage.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 05 Jan 2026 07:16:22 +0000
Cc: linux-s390@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, Caleb Sander Mateos <csander@purestorage.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kselftest@vger.kernel.org, linux-input@vger.kernel.org,
 bpf@vger.kernel.org, sched-ext@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/5] selftests/bpf: make cfi_stubs globals
	const
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

Now that struct bpf_struct_ops's cfi_stubs field is a const pointer,
declare the __test_no_cif_ops, __bpf_testmod_ops*, st_ops_cfi_stubs, and
multi_st_ops_cfi_stubs global variables it points to as const. This
tests that BPF struct_ops implementations are allowed to declare
cfi_stubs global variables as const.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 .../testing/selftests/bpf/test_kmods/bpf_test_no_cfi.c |  2 +-
 tools/testing/selftests/bpf/test_kmods/bpf_testmod.c   | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_test_no_cfi.c b/tools/testing/selftests/bpf/test_kmods/bpf_test_no_cfi.c
index 948eb3962732..1d76912f1a45 100644
--- a/tools/testing/selftests/bpf/test_kmods/bpf_test_no_cfi.c
+++ b/tools/testing/selftests/bpf/test_kmods/bpf_test_no_cfi.c
@@ -39,11 +39,11 @@ static void bpf_test_no_cfi_ops__fn_1(void)
 
 static void bpf_test_no_cfi_ops__fn_2(void)
 {
 }
 
-static struct bpf_test_no_cfi_ops __test_no_cif_ops = {
+static const struct bpf_test_no_cfi_ops __test_no_cif_ops = {
 	.fn_1 = bpf_test_no_cfi_ops__fn_1,
 	.fn_2 = bpf_test_no_cfi_ops__fn_2,
 };
 
 static struct bpf_struct_ops test_no_cif_ops = {
diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
index 90c4b1a51de6..5e460b1dbdb6 100644
--- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
+++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
@@ -295,11 +295,11 @@ static int bpf_testmod_test_3(void)
 static int bpf_testmod_test_4(void)
 {
 	return 0;
 }
 
-static struct bpf_testmod_ops3 __bpf_testmod_ops3 = {
+static const struct bpf_testmod_ops3 __bpf_testmod_ops3 = {
 	.test_1 = bpf_testmod_test_3,
 	.test_2 = bpf_testmod_test_4,
 };
 
 static void bpf_testmod_test_struct_ops3(void)
@@ -1273,11 +1273,11 @@ bpf_testmod_ops__test_return_ref_kptr(int dummy, struct task_struct *task__ref,
 				      struct cgroup *cgrp)
 {
 	return NULL;
 }
 
-static struct bpf_testmod_ops __bpf_testmod_ops = {
+static const struct bpf_testmod_ops __bpf_testmod_ops = {
 	.test_1 = bpf_testmod_test_1,
 	.test_2 = bpf_testmod_test_2,
 	.test_maybe_null = bpf_testmod_ops__test_maybe_null,
 	.test_refcounted = bpf_testmod_ops__test_refcounted,
 	.test_return_ref_kptr = bpf_testmod_ops__test_return_ref_kptr,
@@ -1300,11 +1300,11 @@ static int bpf_dummy_reg2(void *kdata, struct bpf_link *link)
 
 	ops->test_1();
 	return 0;
 }
 
-static struct bpf_testmod_ops2 __bpf_testmod_ops2 = {
+static const struct bpf_testmod_ops2 __bpf_testmod_ops2 = {
 	.test_1 = bpf_testmod_test_1,
 };
 
 struct bpf_struct_ops bpf_testmod_ops2 = {
 	.verifier_ops = &bpf_testmod_verifier_ops,
@@ -1547,11 +1547,11 @@ static const struct bpf_verifier_ops st_ops_verifier_ops = {
 	.gen_prologue = st_ops_gen_prologue,
 	.gen_epilogue = st_ops_gen_epilogue,
 	.get_func_proto = bpf_base_func_proto,
 };
 
-static struct bpf_testmod_st_ops st_ops_cfi_stubs = {
+static const struct bpf_testmod_st_ops st_ops_cfi_stubs = {
 	.test_prologue = bpf_test_mod_st_ops__test_prologue,
 	.test_epilogue = bpf_test_mod_st_ops__test_epilogue,
 	.test_pro_epilogue = bpf_test_mod_st_ops__test_pro_epilogue,
 };
 
@@ -1715,11 +1715,11 @@ static void multi_st_ops_unreg(void *kdata, struct bpf_link *link)
 static int bpf_testmod_multi_st_ops__test_1(struct st_ops_args *args)
 {
 	return 0;
 }
 
-static struct bpf_testmod_multi_st_ops multi_st_ops_cfi_stubs = {
+static const struct bpf_testmod_multi_st_ops multi_st_ops_cfi_stubs = {
 	.test_1 = bpf_testmod_multi_st_ops__test_1,
 };
 
 struct bpf_struct_ops testmod_multi_st_ops = {
 	.verifier_ops = &bpf_testmod_verifier_ops,
-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
