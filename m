Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B2E877CD6
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Mar 2024 10:34:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A73BC6DD9C;
	Mon, 11 Mar 2024 09:34:39 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76C6DC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 09:34:37 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-6e4d48a5823so2007318b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 02:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1710149676; x=1710754476;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1DNwS3vzNHKnmJ9gtI+mTH5qdekBkGxgiUpqVAYV/P4=;
 b=W8gEf9mhSVElr5XHS2ShBpS6L5YhCck98P2KRX7mYYjjADQXje48AcgMVL/eT9cod0
 Pgcp8g7tS6ZEye1UX8oozbf4rk50ufCQZtj3cLf6EI4LZP+2Ycd2UmSwK2vyEBqSGc/+
 4R+2cmypnlKrFAySFVnkOdhQY3ZbkbvNQna/v6mcz+KkEWZSrnueUJyJ1u3N4nJwAnME
 8YCdlN3rwkV53SR8dq637nk3RzjKKTCzY22yZ9u5X+o/Eb7BqmI4LlTzm2DDARkh/TZK
 XZC1JVsHSGST5TenHfbcn/wdyp1asSzUTN6qhuqa2YQ0C0328A9+CRzljwpIWxksaQkB
 jICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710149676; x=1710754476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1DNwS3vzNHKnmJ9gtI+mTH5qdekBkGxgiUpqVAYV/P4=;
 b=GrxMJSbKEB3E84BQJOPSjMdDf+fvLcHtuABXqg3rV9p2RpQWty/ZOiEn3K41G7qp5t
 SaPQAlqnBBBRf3otEKX7YiEr8pCAFLGzM7YCbvzl8W+o8l8aPFSlInJTSLetA9xDiufQ
 FWTaAF/QAySfuCVHbPIY2rBgaS56IrhTYE66wv9S61PCJOXERNICPkXIf6V0SBb+rM+V
 qgBz7q83QLZ1o5GXhXSF8ZQv8/zywSz7x4iks+ReymVKLgYfllUxtjqgFrwtsP0j170k
 BM5T9FxCVPoQlGkYwtD9+JQ4kO6o/8v+F7HwhSZYFFEEgCRISjYhJRLg3cTcXxe+a8JR
 fKrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA9UBbl+4neZW17xYBUsw3vXcZ9OqNvVQ0ypQkjLanjk2xDX3qn34v3LJXaz5/vy9MAx77yZ48HU7WwtZ3fVQXJFaqbcXo/KcXPjlSWNOhJyWrOL3XGdY/
X-Gm-Message-State: AOJu0YxgPiSniICZz9+UfDJ/Gc7tkvw83ebtWQ1Z4eYontEEbucc82ta
 XY+iacDygxGOAFVRp2DQLL4W28/0Bboh262aw1DRZlH2ZSFu0Qgf7j+D+YCs8Q8=
X-Google-Smtp-Source: AGHT+IHp6WfuUeDSjQx2cauv1mQ/eMbX3s4chl5kJVOY3tZJvKu5JYf89lzfYO6yWTa1+IHjqNIpUg==
X-Received: by 2002:a05:6a21:7890:b0:1a1:6cf5:5bf1 with SMTP id
 bf16-20020a056a21789000b001a16cf55bf1mr3944233pzc.12.1710149676017; 
 Mon, 11 Mar 2024 02:34:36 -0700 (PDT)
Received: from localhost.localdomain ([43.129.25.208])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a170902f7c900b001dcad9cbf8bsm4253365plw.239.2024.03.11.02.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 02:34:35 -0700 (PDT)
From: Menglong Dong <dongmenglong.8@bytedance.com>
To: andrii@kernel.org
Date: Mon, 11 Mar 2024 17:35:18 +0800
Message-Id: <20240311093526.1010158-2-dongmenglong.8@bytedance.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
MIME-Version: 1.0
Cc: linux-kselftest@vger.kernel.org, dave.hansen@linux.intel.com,
 ast@kernel.org, song@kernel.org, sdf@google.com, yonghong.song@linux.dev,
 agordeev@linux.ibm.com, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, Menglong Dong <dongmenglong.8@bytedance.com>,
 daniel@iogearbox.net, x86@kernel.org, john.fastabend@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, quentin@isovalent.com,
 borntraeger@linux.ibm.com, linux-trace-kernel@vger.kernel.org,
 rostedt@goodmis.org, kpsingh@kernel.org, mathieu.desnoyers@efficios.com,
 linux-arm-kernel@lists.infradead.org, haoluo@google.com,
 netdev@vger.kernel.org, dsahern@kernel.org, linux-kernel@vger.kernel.org,
 eddyz87@gmail.com, svens@linux.ibm.com, jolsa@kernel.org, bpf@vger.kernel.org,
 martin.lau@linux.dev, davem@davemloft.net
Subject: [Linux-stm32] [PATCH bpf-next v2 1/9] bpf: tracing: add support to
	record and check the accessed args
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

In this commit, we add the 'accessed_args' field to struct bpf_prog_aux,
which is used to record the accessed index of the function args in
btf_ctx_access().

Meanwhile, we add the function btf_check_func_part_match() to compare the
accessed function args of two function prototype. This function will be
used in the following commit.

Signed-off-by: Menglong Dong <dongmenglong.8@bytedance.com>
---
 include/linux/bpf.h |   4 ++
 kernel/bpf/btf.c    | 108 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 2 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 95e07673cdc1..0f677fdcfcc7 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1461,6 +1461,7 @@ struct bpf_prog_aux {
 	const struct btf_type *attach_func_proto;
 	/* function name for valid attach_btf_id */
 	const char *attach_func_name;
+	u64 accessed_args;
 	struct bpf_prog **func;
 	void *jit_data; /* JIT specific data. arch dependent */
 	struct bpf_jit_poke_descriptor *poke_tab;
@@ -2565,6 +2566,9 @@ struct bpf_reg_state;
 int btf_prepare_func_args(struct bpf_verifier_env *env, int subprog);
 int btf_check_type_match(struct bpf_verifier_log *log, const struct bpf_prog *prog,
 			 struct btf *btf, const struct btf_type *t);
+int btf_check_func_part_match(struct btf *btf1, const struct btf_type *t1,
+			      struct btf *btf2, const struct btf_type *t2,
+			      u64 func_args);
 const char *btf_find_decl_tag_value(const struct btf *btf, const struct btf_type *pt,
 				    int comp_idx, const char *tag_key);
 int btf_find_next_decl_tag(const struct btf *btf, const struct btf_type *pt,
diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index 170d017e8e4a..c2a0299d4358 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -6125,19 +6125,24 @@ static bool is_int_ptr(struct btf *btf, const struct btf_type *t)
 }
 
 static u32 get_ctx_arg_idx(struct btf *btf, const struct btf_type *func_proto,
-			   int off)
+			   int off, int *aligned_idx)
 {
 	const struct btf_param *args;
 	const struct btf_type *t;
 	u32 offset = 0, nr_args;
 	int i;
 
+	if (aligned_idx)
+		*aligned_idx = -ENOENT;
+
 	if (!func_proto)
 		return off / 8;
 
 	nr_args = btf_type_vlen(func_proto);
 	args = (const struct btf_param *)(func_proto + 1);
 	for (i = 0; i < nr_args; i++) {
+		if (aligned_idx && offset == off)
+			*aligned_idx = i;
 		t = btf_type_skip_modifiers(btf, args[i].type, NULL);
 		offset += btf_type_is_ptr(t) ? 8 : roundup(t->size, 8);
 		if (off < offset)
@@ -6207,7 +6212,7 @@ bool btf_ctx_access(int off, int size, enum bpf_access_type type,
 			tname, off);
 		return false;
 	}
-	arg = get_ctx_arg_idx(btf, t, off);
+	arg = get_ctx_arg_idx(btf, t, off, NULL);
 	args = (const struct btf_param *)(t + 1);
 	/* if (t == NULL) Fall back to default BPF prog with
 	 * MAX_BPF_FUNC_REG_ARGS u64 arguments.
@@ -6217,6 +6222,9 @@ bool btf_ctx_access(int off, int size, enum bpf_access_type type,
 		/* skip first 'void *__data' argument in btf_trace_##name typedef */
 		args++;
 		nr_args--;
+		prog->aux->accessed_args |= (1 << (arg + 1));
+	} else {
+		prog->aux->accessed_args |= (1 << arg);
 	}
 
 	if (arg > nr_args) {
@@ -7024,6 +7032,102 @@ int btf_check_type_match(struct bpf_verifier_log *log, const struct bpf_prog *pr
 	return btf_check_func_type_match(log, btf1, t1, btf2, t2);
 }
 
+static u32 get_ctx_arg_total_size(struct btf *btf, const struct btf_type *t)
+{
+	const struct btf_param *args;
+	u32 size = 0, nr_args;
+	int i;
+
+	nr_args = btf_type_vlen(t);
+	args = (const struct btf_param *)(t + 1);
+	for (i = 0; i < nr_args; i++) {
+		t = btf_type_skip_modifiers(btf, args[i].type, NULL);
+		size += btf_type_is_ptr(t) ? 8 : roundup(t->size, 8);
+	}
+
+	return size;
+}
+
+/* This function is similar to btf_check_func_type_match(), except that it
+ * only compare some function args of the function prototype t1 and t2.
+ */
+int btf_check_func_part_match(struct btf *btf1, const struct btf_type *func1,
+			      struct btf *btf2, const struct btf_type *func2,
+			      u64 func_args)
+{
+	const struct btf_param *args1, *args2;
+	u32 nargs1, i, offset = 0;
+	const char *s1, *s2;
+
+	if (!btf_type_is_func_proto(func1) || !btf_type_is_func_proto(func2))
+		return -EINVAL;
+
+	args1 = (const struct btf_param *)(func1 + 1);
+	args2 = (const struct btf_param *)(func2 + 1);
+	nargs1 = btf_type_vlen(func1);
+
+	for (i = 0; i <= nargs1; i++) {
+		const struct btf_type *t1, *t2;
+
+		if (!(func_args & (1 << i)))
+			goto next;
+
+		if (i < nargs1) {
+			int t2_index;
+
+			/* get the index of the arg corresponding to args1[i]
+			 * by the offset.
+			 */
+			get_ctx_arg_idx(btf2, func2, offset, &t2_index);
+			if (t2_index < 0)
+				return -EINVAL;
+
+			t1 = btf_type_skip_modifiers(btf1, args1[i].type, NULL);
+			t2 = btf_type_skip_modifiers(btf2, args2[t2_index].type,
+						     NULL);
+		} else {
+			/* i == nargs1, this is the index of return value of t1 */
+			if (get_ctx_arg_total_size(btf1, func1) !=
+			    get_ctx_arg_total_size(btf2, func2))
+				return -EINVAL;
+
+			/* check the return type of t1 and t2 */
+			t1 = btf_type_skip_modifiers(btf1, func1->type, NULL);
+			t2 = btf_type_skip_modifiers(btf2, func2->type, NULL);
+		}
+
+		if (t1->info != t2->info ||
+		    (btf_type_has_size(t1) && t1->size != t2->size))
+			return -EINVAL;
+		if (btf_type_is_int(t1) || btf_is_any_enum(t1))
+			goto next;
+
+		if (btf_type_is_struct(t1))
+			goto on_struct;
+
+		if (!btf_type_is_ptr(t1))
+			return -EINVAL;
+
+		t1 = btf_type_skip_modifiers(btf1, t1->type, NULL);
+		t2 = btf_type_skip_modifiers(btf2, t2->type, NULL);
+		if (!btf_type_is_struct(t1) || !btf_type_is_struct(t2))
+			return -EINVAL;
+
+on_struct:
+		s1 = btf_name_by_offset(btf1, t1->name_off);
+		s2 = btf_name_by_offset(btf2, t2->name_off);
+		if (strcmp(s1, s2))
+			return -EINVAL;
+next:
+		if (i < nargs1) {
+			t1 = btf_type_skip_modifiers(btf1, args1[i].type, NULL);
+			offset += btf_type_is_ptr(t1) ? 8 : roundup(t1->size, 8);
+		}
+	}
+
+	return 0;
+}
+
 static bool btf_is_dynptr_ptr(const struct btf *btf, const struct btf_type *t)
 {
 	const char *name;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
