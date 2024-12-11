Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D829ED4F7
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Dec 2024 19:51:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B251FC7128A;
	Wed, 11 Dec 2024 18:51:35 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D514AC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Dec 2024 18:51:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 75838A41853;
 Wed, 11 Dec 2024 18:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A09BC4CED2;
 Wed, 11 Dec 2024 18:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733943086;
 bh=G23ISlTQsn+UxkPYjZ6UcT2vsN4WM+vB1blxFeR4rFM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oL44R3UyDtM3kKMjGmZXNR0uu9fTbbCCZSF0FVmVdQxqBqqFmj4r8LyxEQ80W5hbn
 Qsg8ksZ+39vfiaJu4e+pkqQ4hs1ncsYNhmWnCnrkcUVmK0O2qAieuMyWDx0g1KPWJq
 j15sahN/jBsvU41Yqw6+wo+WMNB6rhz/x9Xg8EkkTry7gw16sYvzibCYUiZ6dXazep
 Ekp3e8BSStL7n4aZNeAMas5OvMCzVeNEvvcbGMkSc74n1iYChcgNAhndo0fnh3RfcR
 usCGXuGkykVxbzdsZ5SN/T6euInd2PrBH6BxzFK4t0csL21gNhdHyEo2J95t43ERcG
 HL34dzyMjKzFQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 11 Dec 2024 13:49:37 -0500
Message-ID: <20241211185028.3841047-21-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211185028.3841047-1-sashal@kernel.org>
References: <20241211185028.3841047-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.4
Cc: Sasha Levin <sashal@kernel.org>, mattbobrowski@google.com,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
 lulie@linux.alibaba.com, yangfeng@kylinos.cn,
 linux-stm32@st-md-mailman.stormreply.com, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, eddyz87@gmail.com, laoar.shao@gmail.com,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, mcoquelin.stm32@gmail.com,
 houtao1@huawei.com, cupertino.miranda@oracle.com, shuah@kernel.org,
 tao.lyu@epfl.ch, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 6.12 21/36] bpf: Zero index arg error
	string for dynptr and iter
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

From: Kumar Kartikeya Dwivedi <memxor@gmail.com>

[ Upstream commit bd74e238ae6944b462f57ce8752440a011ba4530 ]

Andrii spotted that process_dynptr_func's rejection of incorrect
argument register type will print an error string where argument numbers
are not zero-indexed, unlike elsewhere in the verifier.  Fix this by
subtracting 1 from regno. The same scenario exists for iterator
messages. Fix selftest error strings that match on the exact argument
number while we're at it to ensure clean bisection.

Suggested-by: Andrii Nakryiko <andrii@kernel.org>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Link: https://lore.kernel.org/r/20241203002235.3776418-1-memxor@gmail.com
Signed-off-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 kernel/bpf/verifier.c                         | 12 +++++-----
 .../testing/selftests/bpf/progs/dynptr_fail.c | 22 +++++++++----------
 .../selftests/bpf/progs/iters_state_safety.c  | 14 ++++++------
 .../selftests/bpf/progs/iters_testmod_seq.c   |  4 ++--
 .../bpf/progs/test_kfunc_dynptr_param.c       |  2 +-
 .../selftests/bpf/progs/verifier_bits_iter.c  |  4 ++--
 6 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 91317857ea3ee..436a83784b7d2 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -7903,7 +7903,7 @@ static int process_dynptr_func(struct bpf_verifier_env *env, int regno, int insn
 	if (reg->type != PTR_TO_STACK && reg->type != CONST_PTR_TO_DYNPTR) {
 		verbose(env,
 			"arg#%d expected pointer to stack or const struct bpf_dynptr\n",
-			regno);
+			regno - 1);
 		return -EINVAL;
 	}
 
@@ -7957,7 +7957,7 @@ static int process_dynptr_func(struct bpf_verifier_env *env, int regno, int insn
 		if (!is_dynptr_reg_valid_init(env, reg)) {
 			verbose(env,
 				"Expected an initialized dynptr as arg #%d\n",
-				regno);
+				regno - 1);
 			return -EINVAL;
 		}
 
@@ -7965,7 +7965,7 @@ static int process_dynptr_func(struct bpf_verifier_env *env, int regno, int insn
 		if (!is_dynptr_type_expected(env, reg, arg_type & ~MEM_RDONLY)) {
 			verbose(env,
 				"Expected a dynptr of type %s as arg #%d\n",
-				dynptr_type_str(arg_to_dynptr_type(arg_type)), regno);
+				dynptr_type_str(arg_to_dynptr_type(arg_type)), regno - 1);
 			return -EINVAL;
 		}
 
@@ -8029,7 +8029,7 @@ static int process_iter_arg(struct bpf_verifier_env *env, int regno, int insn_id
 	 */
 	btf_id = btf_check_iter_arg(meta->btf, meta->func_proto, regno - 1);
 	if (btf_id < 0) {
-		verbose(env, "expected valid iter pointer as arg #%d\n", regno);
+		verbose(env, "expected valid iter pointer as arg #%d\n", regno - 1);
 		return -EINVAL;
 	}
 	t = btf_type_by_id(meta->btf, btf_id);
@@ -8039,7 +8039,7 @@ static int process_iter_arg(struct bpf_verifier_env *env, int regno, int insn_id
 		/* bpf_iter_<type>_new() expects pointer to uninit iter state */
 		if (!is_iter_reg_valid_uninit(env, reg, nr_slots)) {
 			verbose(env, "expected uninitialized iter_%s as arg #%d\n",
-				iter_type_str(meta->btf, btf_id), regno);
+				iter_type_str(meta->btf, btf_id), regno - 1);
 			return -EINVAL;
 		}
 
@@ -8063,7 +8063,7 @@ static int process_iter_arg(struct bpf_verifier_env *env, int regno, int insn_id
 			break;
 		case -EINVAL:
 			verbose(env, "expected an initialized iter_%s as arg #%d\n",
-				iter_type_str(meta->btf, btf_id), regno);
+				iter_type_str(meta->btf, btf_id), regno - 1);
 			return err;
 		case -EPROTO:
 			verbose(env, "expected an RCU CS when using %s\n", meta->func_name);
diff --git a/tools/testing/selftests/bpf/progs/dynptr_fail.c b/tools/testing/selftests/bpf/progs/dynptr_fail.c
index 8f36c9de75915..dfd817d0348c4 100644
--- a/tools/testing/selftests/bpf/progs/dynptr_fail.c
+++ b/tools/testing/selftests/bpf/progs/dynptr_fail.c
@@ -149,7 +149,7 @@ int ringbuf_release_uninit_dynptr(void *ctx)
 
 /* A dynptr can't be used after it has been invalidated */
 SEC("?raw_tp")
-__failure __msg("Expected an initialized dynptr as arg #3")
+__failure __msg("Expected an initialized dynptr as arg #2")
 int use_after_invalid(void *ctx)
 {
 	struct bpf_dynptr ptr;
@@ -428,7 +428,7 @@ int invalid_helper2(void *ctx)
 
 /* A bpf_dynptr is invalidated if it's been written into */
 SEC("?raw_tp")
-__failure __msg("Expected an initialized dynptr as arg #1")
+__failure __msg("Expected an initialized dynptr as arg #0")
 int invalid_write1(void *ctx)
 {
 	struct bpf_dynptr ptr;
@@ -1407,7 +1407,7 @@ int invalid_slice_rdwr_rdonly(struct __sk_buff *skb)
 
 /* bpf_dynptr_adjust can only be called on initialized dynptrs */
 SEC("?raw_tp")
-__failure __msg("Expected an initialized dynptr as arg #1")
+__failure __msg("Expected an initialized dynptr as arg #0")
 int dynptr_adjust_invalid(void *ctx)
 {
 	struct bpf_dynptr ptr = {};
@@ -1420,7 +1420,7 @@ int dynptr_adjust_invalid(void *ctx)
 
 /* bpf_dynptr_is_null can only be called on initialized dynptrs */
 SEC("?raw_tp")
-__failure __msg("Expected an initialized dynptr as arg #1")
+__failure __msg("Expected an initialized dynptr as arg #0")
 int dynptr_is_null_invalid(void *ctx)
 {
 	struct bpf_dynptr ptr = {};
@@ -1433,7 +1433,7 @@ int dynptr_is_null_invalid(void *ctx)
 
 /* bpf_dynptr_is_rdonly can only be called on initialized dynptrs */
 SEC("?raw_tp")
-__failure __msg("Expected an initialized dynptr as arg #1")
+__failure __msg("Expected an initialized dynptr as arg #0")
 int dynptr_is_rdonly_invalid(void *ctx)
 {
 	struct bpf_dynptr ptr = {};
@@ -1446,7 +1446,7 @@ int dynptr_is_rdonly_invalid(void *ctx)
 
 /* bpf_dynptr_size can only be called on initialized dynptrs */
 SEC("?raw_tp")
-__failure __msg("Expected an initialized dynptr as arg #1")
+__failure __msg("Expected an initialized dynptr as arg #0")
 int dynptr_size_invalid(void *ctx)
 {
 	struct bpf_dynptr ptr = {};
@@ -1459,7 +1459,7 @@ int dynptr_size_invalid(void *ctx)
 
 /* Only initialized dynptrs can be cloned */
 SEC("?raw_tp")
-__failure __msg("Expected an initialized dynptr as arg #1")
+__failure __msg("Expected an initialized dynptr as arg #0")
 int clone_invalid1(void *ctx)
 {
 	struct bpf_dynptr ptr1 = {};
@@ -1493,7 +1493,7 @@ int clone_invalid2(struct xdp_md *xdp)
 
 /* Invalidating a dynptr should invalidate its clones */
 SEC("?raw_tp")
-__failure __msg("Expected an initialized dynptr as arg #3")
+__failure __msg("Expected an initialized dynptr as arg #2")
 int clone_invalidate1(void *ctx)
 {
 	struct bpf_dynptr clone;
@@ -1514,7 +1514,7 @@ int clone_invalidate1(void *ctx)
 
 /* Invalidating a dynptr should invalidate its parent */
 SEC("?raw_tp")
-__failure __msg("Expected an initialized dynptr as arg #3")
+__failure __msg("Expected an initialized dynptr as arg #2")
 int clone_invalidate2(void *ctx)
 {
 	struct bpf_dynptr ptr;
@@ -1535,7 +1535,7 @@ int clone_invalidate2(void *ctx)
 
 /* Invalidating a dynptr should invalidate its siblings */
 SEC("?raw_tp")
-__failure __msg("Expected an initialized dynptr as arg #3")
+__failure __msg("Expected an initialized dynptr as arg #2")
 int clone_invalidate3(void *ctx)
 {
 	struct bpf_dynptr ptr;
@@ -1723,7 +1723,7 @@ __noinline long global_call_bpf_dynptr(const struct bpf_dynptr *dynptr)
 }
 
 SEC("?raw_tp")
-__failure __msg("arg#1 expected pointer to stack or const struct bpf_dynptr")
+__failure __msg("arg#0 expected pointer to stack or const struct bpf_dynptr")
 int test_dynptr_reg_type(void *ctx)
 {
 	struct task_struct *current = NULL;
diff --git a/tools/testing/selftests/bpf/progs/iters_state_safety.c b/tools/testing/selftests/bpf/progs/iters_state_safety.c
index d47e59aba6de3..f41257eadbb25 100644
--- a/tools/testing/selftests/bpf/progs/iters_state_safety.c
+++ b/tools/testing/selftests/bpf/progs/iters_state_safety.c
@@ -73,7 +73,7 @@ int create_and_forget_to_destroy_fail(void *ctx)
 }
 
 SEC("?raw_tp")
-__failure __msg("expected an initialized iter_num as arg #1")
+__failure __msg("expected an initialized iter_num as arg #0")
 int destroy_without_creating_fail(void *ctx)
 {
 	/* init with zeros to stop verifier complaining about uninit stack */
@@ -91,7 +91,7 @@ int destroy_without_creating_fail(void *ctx)
 }
 
 SEC("?raw_tp")
-__failure __msg("expected an initialized iter_num as arg #1")
+__failure __msg("expected an initialized iter_num as arg #0")
 int compromise_iter_w_direct_write_fail(void *ctx)
 {
 	struct bpf_iter_num iter;
@@ -143,7 +143,7 @@ int compromise_iter_w_direct_write_and_skip_destroy_fail(void *ctx)
 }
 
 SEC("?raw_tp")
-__failure __msg("expected an initialized iter_num as arg #1")
+__failure __msg("expected an initialized iter_num as arg #0")
 int compromise_iter_w_helper_write_fail(void *ctx)
 {
 	struct bpf_iter_num iter;
@@ -230,7 +230,7 @@ int valid_stack_reuse(void *ctx)
 }
 
 SEC("?raw_tp")
-__failure __msg("expected uninitialized iter_num as arg #1")
+__failure __msg("expected uninitialized iter_num as arg #0")
 int double_create_fail(void *ctx)
 {
 	struct bpf_iter_num iter;
@@ -258,7 +258,7 @@ int double_create_fail(void *ctx)
 }
 
 SEC("?raw_tp")
-__failure __msg("expected an initialized iter_num as arg #1")
+__failure __msg("expected an initialized iter_num as arg #0")
 int double_destroy_fail(void *ctx)
 {
 	struct bpf_iter_num iter;
@@ -284,7 +284,7 @@ int double_destroy_fail(void *ctx)
 }
 
 SEC("?raw_tp")
-__failure __msg("expected an initialized iter_num as arg #1")
+__failure __msg("expected an initialized iter_num as arg #0")
 int next_without_new_fail(void *ctx)
 {
 	struct bpf_iter_num iter;
@@ -305,7 +305,7 @@ int next_without_new_fail(void *ctx)
 }
 
 SEC("?raw_tp")
-__failure __msg("expected an initialized iter_num as arg #1")
+__failure __msg("expected an initialized iter_num as arg #0")
 int next_after_destroy_fail(void *ctx)
 {
 	struct bpf_iter_num iter;
diff --git a/tools/testing/selftests/bpf/progs/iters_testmod_seq.c b/tools/testing/selftests/bpf/progs/iters_testmod_seq.c
index 4a176e6aede89..6543d5b6e0a97 100644
--- a/tools/testing/selftests/bpf/progs/iters_testmod_seq.c
+++ b/tools/testing/selftests/bpf/progs/iters_testmod_seq.c
@@ -79,7 +79,7 @@ int testmod_seq_truncated(const void *ctx)
 
 SEC("?raw_tp")
 __failure
-__msg("expected an initialized iter_testmod_seq as arg #2")
+__msg("expected an initialized iter_testmod_seq as arg #1")
 int testmod_seq_getter_before_bad(const void *ctx)
 {
 	struct bpf_iter_testmod_seq it;
@@ -89,7 +89,7 @@ int testmod_seq_getter_before_bad(const void *ctx)
 
 SEC("?raw_tp")
 __failure
-__msg("expected an initialized iter_testmod_seq as arg #2")
+__msg("expected an initialized iter_testmod_seq as arg #1")
 int testmod_seq_getter_after_bad(const void *ctx)
 {
 	struct bpf_iter_testmod_seq it;
diff --git a/tools/testing/selftests/bpf/progs/test_kfunc_dynptr_param.c b/tools/testing/selftests/bpf/progs/test_kfunc_dynptr_param.c
index e68667aec6a65..cd4d752bd089c 100644
--- a/tools/testing/selftests/bpf/progs/test_kfunc_dynptr_param.c
+++ b/tools/testing/selftests/bpf/progs/test_kfunc_dynptr_param.c
@@ -45,7 +45,7 @@ int BPF_PROG(not_valid_dynptr, int cmd, union bpf_attr *attr, unsigned int size)
 }
 
 SEC("?lsm.s/bpf")
-__failure __msg("arg#1 expected pointer to stack or const struct bpf_dynptr")
+__failure __msg("arg#0 expected pointer to stack or const struct bpf_dynptr")
 int BPF_PROG(not_ptr_to_stack, int cmd, union bpf_attr *attr, unsigned int size)
 {
 	unsigned long val = 0;
diff --git a/tools/testing/selftests/bpf/progs/verifier_bits_iter.c b/tools/testing/selftests/bpf/progs/verifier_bits_iter.c
index 7c881bca9af5c..497febf5c578d 100644
--- a/tools/testing/selftests/bpf/progs/verifier_bits_iter.c
+++ b/tools/testing/selftests/bpf/progs/verifier_bits_iter.c
@@ -32,7 +32,7 @@ int BPF_PROG(no_destroy, struct bpf_iter_meta *meta, struct cgroup *cgrp)
 
 SEC("iter/cgroup")
 __description("uninitialized iter in ->next()")
-__failure __msg("expected an initialized iter_bits as arg #1")
+__failure __msg("expected an initialized iter_bits as arg #0")
 int BPF_PROG(next_uninit, struct bpf_iter_meta *meta, struct cgroup *cgrp)
 {
 	struct bpf_iter_bits *it = NULL;
@@ -43,7 +43,7 @@ int BPF_PROG(next_uninit, struct bpf_iter_meta *meta, struct cgroup *cgrp)
 
 SEC("iter/cgroup")
 __description("uninitialized iter in ->destroy()")
-__failure __msg("expected an initialized iter_bits as arg #1")
+__failure __msg("expected an initialized iter_bits as arg #0")
 int BPF_PROG(destroy_uninit, struct bpf_iter_meta *meta, struct cgroup *cgrp)
 {
 	struct bpf_iter_bits it = {};
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
