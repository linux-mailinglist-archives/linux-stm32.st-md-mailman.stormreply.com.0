Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 937B9877CE8
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Mar 2024 10:35:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58950C71281;
	Mon, 11 Mar 2024 09:35:24 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 216B7C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 09:35:23 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6e69655242cso514500b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 02:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1710149722; x=1710754522;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XgF85BcnRi6YfuBECKn9LdNVtsda3wFJUMkfKzYPaTg=;
 b=ivaR8RcdQ6vhYWf//uxkRSBlgoivJkMt+dr9N2uBv5UeXSp3ux38GMJbPD6f/TztDw
 yBqEMusYiU2SnrHQMXrG7QaEGZKJwcY8CcuS5I5S55rnQqM2/jate9kOgnegIOj/3oeK
 6f/5b4XduBTUzfeyexyYvIV9lErcOHjh0gtV+6ETAo0aaMZOdOZs5T00r+6r9Z/lhB2M
 tX7jhL4/XvTCHK0odXFGecqXP5OEevW0vHQ49KO7/VnTi10VkxcmsrXDj36XHRm92d3g
 j2CXdtawPriMc8WbR9PnO/Dt1Ck0eFTjPIVYcKm5mje/+hRxDzY42FLUlzNhn7VcG0Ga
 frPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710149722; x=1710754522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XgF85BcnRi6YfuBECKn9LdNVtsda3wFJUMkfKzYPaTg=;
 b=UJ9YhJaPMW4WmByV8aB2YZ6GS+bvA6aL6K+wtGxhFxearm1t/C/ih+IvWgwrc4+cYn
 4qpKtcBat8gcKeMWpvPAfsuGLhwL7WWSq1OsFYvNgQkjJMUHDtdNTNg9bB5nvQRMqZRq
 IiAvJ2VWmYNyBbptwAAke00Mk67NrcC4mpQVMcwgJ1keyGN8u4M4LjcogYee4VQcEZYb
 7labWYfwoR94nXrdf9jutnt5HLFsEjm/GPfFPGn6EFGlFE5Kf7KOkv/Wm4lCSP+8Hrc3
 +SlNrOHWD66s98P919ITX+8Dejo3ceIXNNcS6XE4hhWnCcnBSmGwzQ3pUu6BxY0QICpu
 RZSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoa+oXlhVoLSbly9BYTLSBpsiCXuWtNwHHHDqx3q9tOTqQdG8H7V+/MLxhT1WCp6v3rhmLYpmwpk63R+nNVzhZHjuEDRinsq8D/7bDd+Svbzz9C5daYA7e
X-Gm-Message-State: AOJu0YwrmMEXyZehC0n6Q6i/hI6hMIdMWwNyn0EGBhLGK1kj/XsqxG9p
 36sN5RlN3E2SU+aa09x3+fbnyNSQ0bzdtidsQZKjz3bzNcnIWcboRT9PWCeq4/s=
X-Google-Smtp-Source: AGHT+IFGOb1BTeFqqztsZqYiXrANUPvsqRtIr4BKGzv55kaAP5codanubKYDi1f1h+yfBwPdORvCXA==
X-Received: by 2002:a05:6a20:3944:b0:1a1:6c19:a175 with SMTP id
 r4-20020a056a20394400b001a16c19a175mr8143881pzg.8.1710149721824; 
 Mon, 11 Mar 2024 02:35:21 -0700 (PDT)
Received: from localhost.localdomain ([43.129.25.208])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a170902f7c900b001dcad9cbf8bsm4253365plw.239.2024.03.11.02.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 02:35:21 -0700 (PDT)
From: Menglong Dong <dongmenglong.8@bytedance.com>
To: andrii@kernel.org
Date: Mon, 11 Mar 2024 17:35:24 +0800
Message-Id: <20240311093526.1010158-8-dongmenglong.8@bytedance.com>
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
Subject: [Linux-stm32] [PATCH bpf-next v2 7/9] libbpf: don't free btf if
	program of multi-link tracing existing
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

By default, the kernel btf that we load during loading program will be
freed after the programs are loaded in bpf_object_load(). However, we
still need to use these btf for tracing of multi-link during attaching.
Therefore, we don't free the btfs until the bpf object is closed if any
bpf programs of the type multi-link tracing exist.

Meanwhile, introduce the new api bpf_object__free_btf() to manually free
the btfs after attaching.

Signed-off-by: Menglong Dong <dongmenglong.8@bytedance.com>
---
 tools/lib/bpf/libbpf.c   | 47 ++++++++++++++++++++++++++++++----------
 tools/lib/bpf/libbpf.h   |  2 ++
 tools/lib/bpf/libbpf.map |  1 +
 3 files changed, 38 insertions(+), 12 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 567ad367e7aa..fd5428494a7e 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -8267,6 +8267,39 @@ static int bpf_object_prepare_struct_ops(struct bpf_object *obj)
 	return 0;
 }
 
+void bpf_object__free_btfs(struct bpf_object *obj)
+{
+	int i;
+
+	/* clean up module BTFs */
+	for (i = 0; i < obj->btf_module_cnt; i++) {
+		close(obj->btf_modules[i].fd);
+		btf__free(obj->btf_modules[i].btf);
+		free(obj->btf_modules[i].name);
+	}
+	free(obj->btf_modules);
+	obj->btf_modules = NULL;
+	obj->btf_module_cnt = 0;
+
+	/* clean up vmlinux BTF */
+	btf__free(obj->btf_vmlinux);
+	obj->btf_vmlinux = NULL;
+}
+
+static void bpf_object_early_free_btf(struct bpf_object *obj)
+{
+	struct bpf_program *prog;
+
+	bpf_object__for_each_program(prog, obj) {
+		if (prog->expected_attach_type == BPF_TRACE_FENTRY_MULTI ||
+		    prog->expected_attach_type == BPF_TRACE_FEXIT_MULTI ||
+		    prog->expected_attach_type == BPF_MODIFY_RETURN_MULTI)
+			return;
+	}
+
+	bpf_object__free_btfs(obj);
+}
+
 static int bpf_object_load(struct bpf_object *obj, int extra_log_level, const char *target_btf_path)
 {
 	int err, i;
@@ -8307,18 +8340,7 @@ static int bpf_object_load(struct bpf_object *obj, int extra_log_level, const ch
 	/* clean up fd_array */
 	zfree(&obj->fd_array);
 
-	/* clean up module BTFs */
-	for (i = 0; i < obj->btf_module_cnt; i++) {
-		close(obj->btf_modules[i].fd);
-		btf__free(obj->btf_modules[i].btf);
-		free(obj->btf_modules[i].name);
-	}
-	free(obj->btf_modules);
-
-	/* clean up vmlinux BTF */
-	btf__free(obj->btf_vmlinux);
-	obj->btf_vmlinux = NULL;
-
+	bpf_object_early_free_btf(obj);
 	obj->loaded = true; /* doesn't matter if successfully or not */
 
 	if (err)
@@ -8791,6 +8813,7 @@ void bpf_object__close(struct bpf_object *obj)
 	usdt_manager_free(obj->usdt_man);
 	obj->usdt_man = NULL;
 
+	bpf_object__free_btfs(obj);
 	bpf_gen__free(obj->gen_loader);
 	bpf_object__elf_finish(obj);
 	bpf_object_unload(obj);
diff --git a/tools/lib/bpf/libbpf.h b/tools/lib/bpf/libbpf.h
index 5723cbbfcc41..c41a909ea4c1 100644
--- a/tools/lib/bpf/libbpf.h
+++ b/tools/lib/bpf/libbpf.h
@@ -299,6 +299,8 @@ LIBBPF_API struct bpf_program *
 bpf_object__find_program_by_name(const struct bpf_object *obj,
 				 const char *name);
 
+LIBBPF_API void bpf_object__free_btfs(struct bpf_object *obj);
+
 LIBBPF_API int
 libbpf_prog_type_by_name(const char *name, enum bpf_prog_type *prog_type,
 			 enum bpf_attach_type *expected_attach_type);
diff --git a/tools/lib/bpf/libbpf.map b/tools/lib/bpf/libbpf.map
index 86804fd90dd1..57642b78917f 100644
--- a/tools/lib/bpf/libbpf.map
+++ b/tools/lib/bpf/libbpf.map
@@ -413,4 +413,5 @@ LIBBPF_1.4.0 {
 		bpf_token_create;
 		btf__new_split;
 		btf_ext__raw_data;
+		bpf_object__free_btfs;
 } LIBBPF_1.3.0;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
