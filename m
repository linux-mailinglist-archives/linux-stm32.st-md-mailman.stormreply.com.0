Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A82885B7C9
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Feb 2024 10:41:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC82BC6B460;
	Tue, 20 Feb 2024 09:41:40 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9A80C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 03:51:12 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-5d8b519e438so4739443a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 19:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1708401071; x=1709005871;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WHXPVUB1nr0Sthgk6cohE38ljuRgW7sUP/a10lgKv7E=;
 b=fB3WddDdypK9ec/vTzQbpZL+bhvJyIa8BLH1pno+weqH3/Wynk3rUR22MN4j6lM7eD
 kjQtGySTDtcCZxPDcokUAPPb2JVjSeYTRqmouP0fAgNCOPnQHSDmyoLa2FM+4PfG30np
 +3SBJ2/YwniUK/xmCGuzMlRbRQIRNB6wngKZRgdgCvAICByTwfjbRRq0PTIWJGYcknQO
 HOoOOfATPvm6zllxq8AwiT3fHVI3wVTBeEXF9r6O+Y+tHzCM+rY3TlyGGbaMUBjQtlMD
 ube46zv04/IqM/kYGfaQOxbQqIij+OG2AgNbzAbHZfvitZg2FaKAbOmYQtBaiuteev6W
 c9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708401071; x=1709005871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WHXPVUB1nr0Sthgk6cohE38ljuRgW7sUP/a10lgKv7E=;
 b=rxgY4micS8pM1isCmYAYRdTh+Ar4/5OxG5mnt18IfBIynbbWzZ/41YAQY5U7+u6PmX
 PYqWDb0EbxgsabDu7RuxsXcfnuiv859K4alltfqIvVMR9JtNKcKdwagXV0OgajUZQF19
 NncjBRIpx8y5OCJyPMZYUDUsBvwvMDyzdwKT/nYkLwG5GCWdSfJw1pWMD/bgVq+41lW7
 6e3u+cIH4bfgrerqjxzE4d8Hh5I5U73X9338/uhhDmX/LdyPRzqa3Ne5vytjJWuzqCH6
 oGyNbMmffURQ79wjnFgJWmdJXDGFJ4oXgEpdUJezKuGwafJTFWWeMQW0brlQWtYFxJlA
 gEiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+ROV76jz3H0DmQV+YHmW6ci8c4SIdUGLW1lYS853FVsAI4/c+XXUnRaBaXf5bDTDjFESSGQ54Zi02huby9auu2kju08ij8KReWjqyybcdvCEfykQRlbs9
X-Gm-Message-State: AOJu0Yznu5h7hREeSAqTk2YTMzdOh8YMrn/VoJSTaiK+0LZLJi4Bv087
 VXQqeNnEHk1If+NMWpmseVdFtyuWRAEYvr5fCiIFUXrHRv0492MeHfrv9/Sc4bw=
X-Google-Smtp-Source: AGHT+IGeBfzA8FmCoaAXcu5vb3lemy5d1ibyBHJoQ+3L0JF9gidLlGX8eVqpkabuA9fCIJVy1Z3Z2w==
X-Received: by 2002:a05:6a20:6f88:b0:19a:47f2:5766 with SMTP id
 gv8-20020a056a206f8800b0019a47f25766mr13853615pzb.56.1708401071235; 
 Mon, 19 Feb 2024 19:51:11 -0800 (PST)
Received: from localhost.localdomain ([43.129.25.208])
 by smtp.gmail.com with ESMTPSA id
 jz7-20020a170903430700b001d94678a76csm5131723plb.117.2024.02.19.19.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 19:51:11 -0800 (PST)
From: Menglong Dong <dongmenglong.8@bytedance.com>
To: andrii@kernel.org
Date: Tue, 20 Feb 2024 11:51:01 +0800
Message-Id: <20240220035105.34626-2-dongmenglong.8@bytedance.com>
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
Subject: [Linux-stm32] [PATCH bpf-next 1/5] bpf: tracing: add support to
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
 kernel/bpf/btf.c    | 121 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index c7aa99b44dbd..0225b8dbdd9d 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1464,6 +1464,7 @@ struct bpf_prog_aux {
 	const struct btf_type *attach_func_proto;
 	/* function name for valid attach_btf_id */
 	const char *attach_func_name;
+	u64 accessed_args;
 	struct bpf_prog **func;
 	void *jit_data; /* JIT specific data. arch dependent */
 	struct bpf_jit_poke_descriptor *poke_tab;
@@ -2566,6 +2567,9 @@ struct bpf_reg_state;
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
index 6ff0bd1a91d5..3a6931402fe4 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -6203,6 +6203,9 @@ bool btf_ctx_access(int off, int size, enum bpf_access_type type,
 		/* skip first 'void *__data' argument in btf_trace_##name typedef */
 		args++;
 		nr_args--;
+		prog->aux->accessed_args |= (1 << (arg + 1));
+	} else {
+		prog->aux->accessed_args |= (1 << arg);
 	}
 
 	if (arg > nr_args) {
@@ -7010,6 +7013,124 @@ int btf_check_type_match(struct bpf_verifier_log *log, const struct bpf_prog *pr
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
+static int get_ctx_arg_idx_aligned(struct btf *btf, const struct btf_type *t,
+				   int off)
+{
+	const struct btf_param *args;
+	u32 offset = 0, nr_args;
+	int i;
+
+	nr_args = btf_type_vlen(t);
+	args = (const struct btf_param *)(t + 1);
+	for (i = 0; i < nr_args; i++) {
+		if (offset == off)
+			return i;
+
+		t = btf_type_skip_modifiers(btf, args[i].type, NULL);
+		offset += btf_type_is_ptr(t) ? 8 : roundup(t->size, 8);
+		if (offset > off)
+			return -1;
+	}
+	return -1;
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
+			t2_index = get_ctx_arg_idx_aligned(btf2, func2,
+							   offset);
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
