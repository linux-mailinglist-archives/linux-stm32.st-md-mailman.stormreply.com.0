Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3505585B7CA
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Feb 2024 10:41:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC09EC6B460;
	Tue, 20 Feb 2024 09:41:42 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1052BC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 03:51:19 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1dbd32cff0bso16522845ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 19:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1708401077; x=1709005877;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=md7RnHZfTkBhICmJ+OsuUTQkZUa+D/mBVSzgm1IZa1Q=;
 b=INTJepIucZcMU845pzFOE8GheswZ+7Z3DUFT8Bl+wrUxxbr0VImZdCKOeGfcwIr2hA
 /n9tMkMLYjD1pvsg/vvffLLvNiJQcHfVKYMvW87eUNtDgVulNSSntpNjHz9573qyeefq
 3Byj9n9d6xiBdP59PzmfDgtGDx8KGIKFe+mx0Zklfa0O0V6Bk8j9thsBPo88t66mkHHF
 EdFYSBp7sVBs1hMWXZhzwEBc5FscMctU9pn9u6iP6lHHQY2u8XGhTg8HGXJ1AUg4O8OG
 n4vUJzhXC+7UJvgribjK+syJfBfh4zQqe82xWb3Pn6/k1IhjqaSC8NWbCTtFkAcxqw2F
 9O+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708401077; x=1709005877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=md7RnHZfTkBhICmJ+OsuUTQkZUa+D/mBVSzgm1IZa1Q=;
 b=EhOSu7tkb3dh56AXvSwxOS5/l+oGgFRX+XTDN5NpGvsHEqu6XoL+Vqp2ds+Ko4bzPL
 UO1YvE4l7HfdjK2kTc8b3GiLUeSCvhbnTROhXoHRlr23Tw485PcusQjfgybv5R3pUFOO
 3VqMgD2trA3xU+KoAPfZfTRbOiWQn5nHn4Ug6dFGZqKCVvaHmMU/acjeArrV70qEMYXT
 JCA5If4VLx6c87hVD2N2LEg27DROX54r56wnlZzaWhJFdOEvH2CrMK3gYJlbrtw1trQ6
 i8MGnCP+sjCKI3fOfLwl4reQnLjP7c4MUFQ7N4Mwv39EigYJoyFk780qiqq6XVlJ3AlE
 LlSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDxUq1mO9k+S7h/6me/6lZ/MGHdZRMiwnyviXD5JGcyIxghhuy1ydkq5m4cY08CstndgRc+hPtA0/VYYLyjWwkohkCPmrV5aGNPiHT20sHjT8vSAS4sje+
X-Gm-Message-State: AOJu0YwVNsr8jKhYZc4I4LFFqloaklHXgm3HvaTzhrkgAHGnWq4hUtCW
 4nhbTMHbBOjpDX5xpIpGQMiOo4w+vByLzpcztwgQ5IHMgHJJb1QPbncXCRVNvZs=
X-Google-Smtp-Source: AGHT+IGuK0d/wvsxyi5goDhOvkumTvcva9JkJqLkAQRozGUCQwA/xKzy+ovx1pKNvGjfNt1NySoBBg==
X-Received: by 2002:a17:902:e886:b0:1dc:fb5:6f36 with SMTP id
 w6-20020a170902e88600b001dc0fb56f36mr2267217plg.32.1708401077579; 
 Mon, 19 Feb 2024 19:51:17 -0800 (PST)
Received: from localhost.localdomain ([43.129.25.208])
 by smtp.gmail.com with ESMTPSA id
 jz7-20020a170903430700b001d94678a76csm5131723plb.117.2024.02.19.19.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 19:51:17 -0800 (PST)
From: Menglong Dong <dongmenglong.8@bytedance.com>
To: andrii@kernel.org
Date: Tue, 20 Feb 2024 11:51:02 +0800
Message-Id: <20240220035105.34626-3-dongmenglong.8@bytedance.com>
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
Subject: [Linux-stm32] [PATCH bpf-next 2/5] bpf: tracing: support to attach
	program to multi hooks
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

In this commit, we add the support to allow attaching a tracing BPF
program to multi hooks.

In the commit 4a1e7c0c63e0 ("bpf: Support attaching freplace programs to
multiple attach points"), the freplace BPF program is made to support
attach to multiple attach points. And in this commit, we extend it to
fentry/fexit/raw_tp/...

The use case is obvious. For now, we have to create a BPF program for each
kernel function, for which we want to trace, even through all the program
have the same (or similar logic). This can consume extra memory, and make
the program loading slow if we have plenty of kernel function to trace.
The KPROBE_MULTI maybe a alternative, but it can't what TRACING do. For
example, the kretprobe can't obtain the function args, but the FEXIT can.

Now, we need to hold the reference for the target btf and kernel module
in the bpf link, as a program can have multiple target. Therefore, we
introduce the attach_btf and mod field to the struct bpf_tracing_link.
During the attach, we will check the target is compatible with the
program, which means that the function args that the program accessed
in the target function prototype should be the same as the origin target.

Signed-off-by: Menglong Dong <dongmenglong.8@bytedance.com>
---
 include/linux/bpf.h      |   2 +
 include/uapi/linux/bpf.h |   1 +
 kernel/bpf/syscall.c     | 117 +++++++++++++++++++++++++++++++--------
 3 files changed, 98 insertions(+), 22 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 0225b8dbdd9d..cf8f2df9afb9 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1606,6 +1606,8 @@ struct bpf_tracing_link {
 	enum bpf_attach_type attach_type;
 	struct bpf_trampoline *trampoline;
 	struct bpf_prog *tgt_prog;
+	struct btf *attach_btf;
+	struct module *mod;
 };
 
 struct bpf_link_primer {
diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index d96708380e52..0ded10a85bfe 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -1668,6 +1668,7 @@ union bpf_attr {
 		union {
 			__u32	target_fd;	/* target object to attach to or ... */
 			__u32	target_ifindex; /* target ifindex */
+			__u32	target_btf_obj_fd;
 		};
 		__u32		attach_type;	/* attach type */
 		__u32		flags;		/* extra flags */
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index b2750b79ac80..3b432fcd5bdb 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -3178,6 +3178,9 @@ static void bpf_tracing_link_dealloc(struct bpf_link *link)
 	struct bpf_tracing_link *tr_link =
 		container_of(link, struct bpf_tracing_link, link.link);
 
+
+	btf_put(tr_link->attach_btf);
+	module_put(tr_link->mod);
 	kfree(tr_link);
 }
 
@@ -3220,6 +3223,35 @@ static const struct bpf_link_ops bpf_tracing_link_lops = {
 	.fill_link_info = bpf_tracing_link_fill_link_info,
 };
 
+static int bpf_tracing_check_multi(struct bpf_prog *prog,
+				   struct bpf_prog *tgt_prog,
+				   struct btf *btf2,
+				   const struct btf_type *t2)
+{
+	struct btf *btf1 = prog->aux->attach_btf;
+	const struct btf_type *t1;
+
+	/* this case is already valided in bpf_check_attach_target() */
+	if (prog->type == BPF_PROG_TYPE_EXT)
+		return 0;
+
+	/* For now, noly support multi attach for kernel function attach
+	 * point.
+	 */
+	if (!btf1)
+		return -EOPNOTSUPP;
+
+	btf2 = btf2 ?: tgt_prog->aux->btf;
+	t1 = prog->aux->attach_func_proto;
+
+	/* the target is the same as the origin one, this is a re-attach */
+	if (t1 == t2)
+		return 0;
+
+	return btf_check_func_part_match(btf1, t1, btf2, t2,
+					 prog->aux->accessed_args);
+}
+
 static int bpf_tracing_prog_attach(struct bpf_prog *prog,
 				   int tgt_prog_fd,
 				   u32 btf_id,
@@ -3228,7 +3260,9 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
 	struct bpf_link_primer link_primer;
 	struct bpf_prog *tgt_prog = NULL;
 	struct bpf_trampoline *tr = NULL;
+	struct btf *attach_btf = NULL;
 	struct bpf_tracing_link *link;
+	struct module *mod = NULL;
 	u64 key = 0;
 	int err;
 
@@ -3258,31 +3292,50 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
 		goto out_put_prog;
 	}
 
-	if (!!tgt_prog_fd != !!btf_id) {
-		err = -EINVAL;
-		goto out_put_prog;
-	}
-
 	if (tgt_prog_fd) {
-		/*
-		 * For now we only allow new targets for BPF_PROG_TYPE_EXT. If this
-		 * part would be changed to implement the same for
-		 * BPF_PROG_TYPE_TRACING, do not forget to update the way how
-		 * attach_tracing_prog flag is set.
-		 */
-		if (prog->type != BPF_PROG_TYPE_EXT) {
+		if (!btf_id) {
 			err = -EINVAL;
 			goto out_put_prog;
 		}
-
 		tgt_prog = bpf_prog_get(tgt_prog_fd);
 		if (IS_ERR(tgt_prog)) {
-			err = PTR_ERR(tgt_prog);
 			tgt_prog = NULL;
-			goto out_put_prog;
+			/* tgt_prog_fd is the fd of the kernel module BTF */
+			attach_btf = btf_get_by_fd(tgt_prog_fd);
+			if (IS_ERR(attach_btf)) {
+				attach_btf = NULL;
+				err = -EINVAL;
+				goto out_put_prog;
+			}
+			if (!btf_is_kernel(attach_btf)) {
+				btf_put(attach_btf);
+				err = -EOPNOTSUPP;
+				goto out_put_prog;
+			}
+		} else if (prog->type == BPF_PROG_TYPE_TRACING &&
+			   tgt_prog->type == BPF_PROG_TYPE_TRACING) {
+			prog->aux->attach_tracing_prog = true;
 		}
-
-		key = bpf_trampoline_compute_key(tgt_prog, NULL, btf_id);
+		key = bpf_trampoline_compute_key(tgt_prog, attach_btf,
+						 btf_id);
+	} else if (btf_id) {
+		attach_btf = bpf_get_btf_vmlinux();
+		if (IS_ERR(attach_btf)) {
+			attach_btf = NULL;
+			err = PTR_ERR(attach_btf);
+			goto out_unlock;
+		}
+		if (!attach_btf) {
+			err = -EINVAL;
+			goto out_unlock;
+		}
+		btf_get(attach_btf);
+		key = bpf_trampoline_compute_key(NULL, attach_btf, btf_id);
+	} else {
+		attach_btf = prog->aux->attach_btf;
+		/* get the reference of the btf for bpf link */
+		if (attach_btf)
+			btf_get(attach_btf);
 	}
 
 	link = kzalloc(sizeof(*link), GFP_USER);
@@ -3319,7 +3372,7 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
 	 *   are NULL, then program was already attached and user did not provide
 	 *   tgt_prog_fd so we have no way to find out or create trampoline
 	 */
-	if (!prog->aux->dst_trampoline && !tgt_prog) {
+	if (!prog->aux->dst_trampoline && !tgt_prog && !btf_id) {
 		/*
 		 * Allow re-attach for TRACING and LSM programs. If it's
 		 * currently linked, bpf_trampoline_link_prog will fail.
@@ -3346,17 +3399,27 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
 		 * different from the destination specified at load time, we
 		 * need a new trampoline and a check for compatibility
 		 */
+		struct btf *origin_btf = prog->aux->attach_btf;
 		struct bpf_attach_target_info tgt_info = {};
 
+		/* use the new attach_btf to check the target */
+		prog->aux->attach_btf = attach_btf;
 		err = bpf_check_attach_target(NULL, prog, tgt_prog, btf_id,
 					      &tgt_info);
+		prog->aux->attach_btf = origin_btf;
 		if (err)
 			goto out_unlock;
 
-		if (tgt_info.tgt_mod) {
-			module_put(prog->aux->mod);
-			prog->aux->mod = tgt_info.tgt_mod;
-		}
+		mod = tgt_info.tgt_mod;
+		/* the new target and the previous target are in the same
+		 * module, release the reference once.
+		 */
+		if (mod && mod == prog->aux->mod)
+			module_put(mod);
+		err = bpf_tracing_check_multi(prog, tgt_prog, attach_btf,
+					      tgt_info.tgt_type);
+		if (err)
+			goto out_unlock;
 
 		tr = bpf_trampoline_get(key, &tgt_info);
 		if (!tr) {
@@ -3373,6 +3436,7 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
 		 */
 		tr = prog->aux->dst_trampoline;
 		tgt_prog = prog->aux->dst_prog;
+		mod = prog->aux->mod;
 	}
 
 	err = bpf_link_prime(&link->link.link, &link_primer);
@@ -3388,6 +3452,8 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
 
 	link->tgt_prog = tgt_prog;
 	link->trampoline = tr;
+	link->attach_btf = attach_btf;
+	link->mod = mod;
 
 	/* Always clear the trampoline and target prog from prog->aux to make
 	 * sure the original attach destination is not kept alive after a
@@ -3400,20 +3466,27 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
 	if (prog->aux->dst_trampoline && tr != prog->aux->dst_trampoline)
 		/* we allocated a new trampoline, so free the old one */
 		bpf_trampoline_put(prog->aux->dst_trampoline);
+	if (prog->aux->mod && mod != prog->aux->mod)
+		/* the mod in prog is not used anywhere, move it to link */
+		module_put(prog->aux->mod);
 
 	prog->aux->dst_prog = NULL;
 	prog->aux->dst_trampoline = NULL;
+	prog->aux->mod = NULL;
 	mutex_unlock(&prog->aux->dst_mutex);
 
 	return bpf_link_settle(&link_primer);
 out_unlock:
 	if (tr && tr != prog->aux->dst_trampoline)
 		bpf_trampoline_put(tr);
+	if (mod && mod != prog->aux->mod)
+		module_put(mod);
 	mutex_unlock(&prog->aux->dst_mutex);
 	kfree(link);
 out_put_prog:
 	if (tgt_prog_fd && tgt_prog)
 		bpf_prog_put(tgt_prog);
+	btf_put(attach_btf);
 	return err;
 }
 
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
