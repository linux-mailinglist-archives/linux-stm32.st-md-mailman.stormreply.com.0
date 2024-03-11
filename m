Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DF3877CE4
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Mar 2024 10:35:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CBDEC71281;
	Mon, 11 Mar 2024 09:35:09 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFB3EC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 09:35:07 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1dd3bdb6e9eso24647595ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 02:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1710149706; x=1710754506;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nrO/qg8uwgz9YPMWghckYtP0xPd/PM4sF9e4mk1PfXk=;
 b=KlqP5G2tbPbBzPKyaxdcE3gGVFfVmfQawQqXQLEaiyQOnWFTOJkkp1406y1HKnvnoI
 chacUtfw3XwBPtLZduStUu0n+fQYiiz+15Q1ktzWrIHrQBlzQrNQ1O8SfQpOAMurhVdg
 w6ctho5bYx2wJY0gm4F3NPFJ6azTu2h6CGPg2NSynQJ47ct7hbs0u1+Uz3gpaAMAhSMj
 QUq4+x3W6lvBdGSkg1tAU2jk0R+R09AsvP+GtKh47q941rpvFfizr11zt1ffR74Bm+yV
 f72rYQZWwo5nhn59+0XhKcldOlmpSV6qjqQv8ObymOAwGtrdBLXWbhohWnVpel03LBxx
 UQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710149706; x=1710754506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nrO/qg8uwgz9YPMWghckYtP0xPd/PM4sF9e4mk1PfXk=;
 b=ktC70RBU/8FFKyb4JIaDzCm1Y0+CriAx5yMD7rndaBGwizkjs2LVeqkBsyGV4zdGay
 +09CivnXHJlPB/qgiDOUk6c5AUjPEsYJmeYkBhDwzUnbjzOsQtAKK+VB7n3QNq4rIwtT
 25e23AWDbhEjEXxMj/DDlcetpXLzTJzNYH6DmA5+tyEyHK+NKrDZik7NUuaLjrzmPczK
 zsE+HO6hdSZlB4+p+vryxqBOOmJfMbiTyKl9HhwwnF1gbBCn93GgEFDdtmeMGUo0yvD5
 gjOfhpmRSnt2H01VG34VQQx6s+dp7VGGU7w9NvbGS3lrcPPWB7iq28A8Fgy0q+UwLYqf
 X/Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFVst6MV8Y543UGsZnbNi2kNPU/4daeUFNZKrPpIxU+cKKbAFS72gbp0xjY8DHPmGf94pPe551G0ETFSczCiPqJArMs9z/RITusz/QDo9+IPUrT9gDKefD
X-Gm-Message-State: AOJu0YwjyCydms+Fy7LnSrP7LX09zChKfgh0bhlgC3gl0ur3hRnDa5Ml
 gxEHJ7El7eCK6dZwEjemRuyWvH/er9POiukL1BAewEObHSt6JRBppr8ui8tRe8M=
X-Google-Smtp-Source: AGHT+IGdSAmTRkYfDKtyWphJJzXlBtH2IoijdRXhZZCIJP7eVn99sHsdiqYvOsYl4WPd5euBmexj4g==
X-Received: by 2002:a17:902:bcc6:b0:1dc:f803:85b3 with SMTP id
 o6-20020a170902bcc600b001dcf80385b3mr4689221pls.43.1710149706575; 
 Mon, 11 Mar 2024 02:35:06 -0700 (PDT)
Received: from localhost.localdomain ([43.129.25.208])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a170902f7c900b001dcad9cbf8bsm4253365plw.239.2024.03.11.02.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 02:35:06 -0700 (PDT)
From: Menglong Dong <dongmenglong.8@bytedance.com>
To: andrii@kernel.org
Date: Mon, 11 Mar 2024 17:35:22 +0800
Message-Id: <20240311093526.1010158-6-dongmenglong.8@bytedance.com>
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
Subject: [Linux-stm32] [PATCH bpf-next v2 5/9] bpf: verifier: add btf to the
	function args of bpf_check_attach_target
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

Add target btf to the function args of bpf_check_attach_target(), then
the caller can specify the btf to check.

Signed-off-by: Menglong Dong <dongmenglong.8@bytedance.com>
---
 include/linux/bpf_verifier.h | 1 +
 kernel/bpf/syscall.c         | 6 ++++--
 kernel/bpf/trampoline.c      | 1 +
 kernel/bpf/verifier.c        | 8 +++++---
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
index 4b0f6600e499..6cb20efcfac3 100644
--- a/include/linux/bpf_verifier.h
+++ b/include/linux/bpf_verifier.h
@@ -811,6 +811,7 @@ static inline void bpf_trampoline_unpack_key(u64 key, u32 *obj_id, u32 *btf_id)
 int bpf_check_attach_target(struct bpf_verifier_log *log,
 			    const struct bpf_prog *prog,
 			    const struct bpf_prog *tgt_prog,
+			    struct btf *btf,
 			    u32 btf_id,
 			    struct bpf_attach_target_info *tgt_info);
 void bpf_free_kfunc_btf_tab(struct bpf_kfunc_btf_tab *tab);
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index d1cd645ef9ac..6128c3131141 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -3401,9 +3401,11 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
 		 * need a new trampoline and a check for compatibility
 		 */
 		struct bpf_attach_target_info tgt_info = {};
+		struct btf *btf;
 
-		err = bpf_check_attach_target(NULL, prog, tgt_prog, btf_id,
-					      &tgt_info);
+		btf = tgt_prog ? tgt_prog->aux->btf : prog->aux->attach_btf;
+		err = bpf_check_attach_target(NULL, prog, tgt_prog, btf,
+					      btf_id, &tgt_info);
 		if (err)
 			goto out_unlock;
 
diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
index 2167aa3fe583..b00d53af8fcb 100644
--- a/kernel/bpf/trampoline.c
+++ b/kernel/bpf/trampoline.c
@@ -747,6 +747,7 @@ int bpf_trampoline_link_cgroup_shim(struct bpf_prog *prog,
 	int err;
 
 	err = bpf_check_attach_target(NULL, prog, NULL,
+				      prog->aux->attach_btf,
 				      prog->aux->attach_btf_id,
 				      &tgt_info);
 	if (err)
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index bf084c693507..4493ecc23597 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -20613,6 +20613,7 @@ static int check_non_sleepable_error_inject(u32 btf_id)
 int bpf_check_attach_target(struct bpf_verifier_log *log,
 			    const struct bpf_prog *prog,
 			    const struct bpf_prog *tgt_prog,
+			    struct btf *btf,
 			    u32 btf_id,
 			    struct bpf_attach_target_info *tgt_info)
 {
@@ -20623,7 +20624,6 @@ int bpf_check_attach_target(struct bpf_verifier_log *log,
 	const struct btf_type *t;
 	bool conservative = true;
 	const char *tname;
-	struct btf *btf;
 	long addr = 0;
 	struct module *mod = NULL;
 
@@ -20631,7 +20631,6 @@ int bpf_check_attach_target(struct bpf_verifier_log *log,
 		bpf_log(log, "Tracing programs must provide btf_id\n");
 		return -EINVAL;
 	}
-	btf = tgt_prog ? tgt_prog->aux->btf : prog->aux->attach_btf;
 	if (!btf) {
 		bpf_log(log,
 			"FENTRY/FEXIT program can only be attached to another program annotated with BTF\n");
@@ -20940,6 +20939,7 @@ static int check_attach_btf_id(struct bpf_verifier_env *env)
 	struct bpf_attach_target_info tgt_info = {};
 	u32 btf_id = prog->aux->attach_btf_id;
 	struct bpf_trampoline *tr;
+	struct btf *btf;
 	int ret;
 	u64 key;
 
@@ -20964,7 +20964,9 @@ static int check_attach_btf_id(struct bpf_verifier_env *env)
 	    prog->type != BPF_PROG_TYPE_EXT)
 		return 0;
 
-	ret = bpf_check_attach_target(&env->log, prog, tgt_prog, btf_id, &tgt_info);
+	btf = tgt_prog ? tgt_prog->aux->btf : prog->aux->attach_btf;
+	ret = bpf_check_attach_target(&env->log, prog, tgt_prog, btf,
+				      btf_id, &tgt_info);
 	if (ret)
 		return ret;
 
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
