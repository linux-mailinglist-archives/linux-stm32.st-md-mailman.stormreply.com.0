Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CFA877CDC
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Mar 2024 10:34:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15A0DC6DD9C;
	Mon, 11 Mar 2024 09:34:46 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E90B5C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 09:34:44 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-6e676ea4e36so1807269b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 02:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1710149683; x=1710754483;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QjSWV41JlB3dq7HwIpKEF4e0TQa/o2d+dOhHoSuTF7U=;
 b=aA/kac4uram3VTrqaS1uBwvTw7LO6NYgD5yzVHc5OFnBn8sarlAe214lgKbCFfIoz8
 JtPgi9ULAOmaXCf+uG2FTMyZYCTtJeXiUFDFStfttRAn9blmVPwCZwYfzePcL9ZCE/T6
 jbYHS5Y29cqXKNneO9gtpfq2nCkOzxK7Kgd6G7tKCsv9KdspOsLaa6XegzI2LV5ZnRCe
 GTqPqpLa2GKXzN629DUmiAGRu5hsieyT0ZVkYwCsh6Nth13OpaAcl+A+IOY/kq0uc4+z
 zAWF3UBdVoLiIH/hxaWPvIvSnaj3dFOEPkpUGKzkOUOLSyz3ZsFJ3u8gIWiQblXE/sKJ
 5Nuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710149683; x=1710754483;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QjSWV41JlB3dq7HwIpKEF4e0TQa/o2d+dOhHoSuTF7U=;
 b=bFHrwNg1ke+T8CZwwYhTBSPYVnAvahbCIDiKc1RINlZe6asUvE1OX6uhMB0LDtZFAc
 dFzkMGLVJo2Tda/Al2wOONSji1mI5ZjxK+btgJ2RCVknZEqXBghmRRKVKpcgzda1ZzBC
 GGibZw6c+LQ+Ae2CXUOaTdQYJMpXF7ysCAGipCeQDHpJ9Iz5P+Skz5ehgwYwdhbas8Ph
 SScpfB37sK31qWNzm3x2ay2G6BQciTx4sIMwYuaTwt+6fKJw2PmKieNXQy5s9oiTnZ/J
 LD20DBNrWopEQ3e5tG54EFbvtJna+blnd7uYFERHeNox99qTpnRGGNkzzqeytJzxW2FP
 2vtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK6vHOYGR4Yr3mEH7oWq5vy9kj1bCiYbbfGtRC4YkhQxD62M3FrUf2GfGsmkNZXnOjsD91+VzerHL5xMuqVH1EB0TyXqAe358aeaC9f4gBSgbpdzAlG2DC
X-Gm-Message-State: AOJu0Yx9pklJUt3WA7YJIlFdtyp2RoPlfjB5gy39qzrUzDnp42LR8sfp
 X72zgqpZca5L8IdnKK42iJVdVMZp1MBjeHAYlhnqe+7BQgIBG8jYDUv839QaCho=
X-Google-Smtp-Source: AGHT+IFbj6YfcHBYvXMM2NWizkuYpniqg3bImjqE4WhHnt6u4m7Hz7unmoAwRceekSZcHEkG6VDAnw==
X-Received: by 2002:a05:6a20:438a:b0:1a1:431c:6696 with SMTP id
 i10-20020a056a20438a00b001a1431c6696mr4574882pzl.49.1710149683554; 
 Mon, 11 Mar 2024 02:34:43 -0700 (PDT)
Received: from localhost.localdomain ([43.129.25.208])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a170902f7c900b001dcad9cbf8bsm4253365plw.239.2024.03.11.02.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 02:34:43 -0700 (PDT)
From: Menglong Dong <dongmenglong.8@bytedance.com>
To: andrii@kernel.org
Date: Mon, 11 Mar 2024 17:35:19 +0800
Message-Id: <20240311093526.1010158-3-dongmenglong.8@bytedance.com>
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
Subject: [Linux-stm32] [PATCH bpf-next v2 2/9] bpf: refactor the
	modules_array to ptr_array
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

Refactor the struct modules_array to more general struct ptr_array, which
is used to store the pointers.

Meanwhiles, introduce the bpf_try_add_ptr(), which checks the existing of
the ptr before adding it to the array.

Seems it should be moved to another files in "lib", and I'm not sure where
to add it now, and let's move it to kernel/bpf/syscall.c for now.

Signed-off-by: Menglong Dong <dongmenglong.8@bytedance.com>
---
 include/linux/bpf.h      | 10 +++++++++
 kernel/bpf/syscall.c     | 37 +++++++++++++++++++++++++++++++
 kernel/trace/bpf_trace.c | 48 ++++++----------------------------------
 3 files changed, 54 insertions(+), 41 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 0f677fdcfcc7..997765cdf474 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -304,6 +304,16 @@ struct bpf_map {
 	s64 __percpu *elem_count;
 };
 
+struct ptr_array {
+	void **ptrs;
+	int cnt;
+	int cap;
+};
+
+int bpf_add_ptr(struct ptr_array *arr, void *ptr);
+bool bpf_has_ptr(struct ptr_array *arr, struct module *mod);
+int bpf_try_add_ptr(struct ptr_array *arr, void *ptr);
+
 static inline const char *btf_field_type_name(enum btf_field_type type)
 {
 	switch (type) {
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index f63f4da4db5e..4f230fd1f8e4 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -479,6 +479,43 @@ static void bpf_map_release_memcg(struct bpf_map *map)
 }
 #endif
 
+int bpf_add_ptr(struct ptr_array *arr, void *ptr)
+{
+	void **ptrs;
+
+	if (arr->cnt == arr->cap) {
+		arr->cap = max(16, arr->cap * 3 / 2);
+		ptrs = krealloc_array(arr->ptrs, arr->cap, sizeof(*ptrs), GFP_KERNEL);
+		if (!ptrs)
+			return -ENOMEM;
+		arr->ptrs = ptrs;
+	}
+
+	arr->ptrs[arr->cnt] = ptr;
+	arr->cnt++;
+	return 0;
+}
+
+bool bpf_has_ptr(struct ptr_array *arr, struct module *mod)
+{
+	int i;
+
+	for (i = arr->cnt - 1; i >= 0; i--) {
+		if (arr->ptrs[i] == mod)
+			return true;
+	}
+	return false;
+}
+
+int bpf_try_add_ptr(struct ptr_array *arr, void *ptr)
+{
+	if (bpf_has_ptr(arr, ptr))
+		return -EEXIST;
+	if (bpf_add_ptr(arr, ptr))
+		return -ENOMEM;
+	return 0;
+}
+
 static int btf_field_cmp(const void *a, const void *b)
 {
 	const struct btf_field *f1 = a, *f2 = b;
diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
index 241ddf5e3895..791e97a3f8e3 100644
--- a/kernel/trace/bpf_trace.c
+++ b/kernel/trace/bpf_trace.c
@@ -2873,43 +2873,9 @@ static void symbols_swap_r(void *a, void *b, int size, const void *priv)
 	}
 }
 
-struct modules_array {
-	struct module **mods;
-	int mods_cnt;
-	int mods_cap;
-};
-
-static int add_module(struct modules_array *arr, struct module *mod)
-{
-	struct module **mods;
-
-	if (arr->mods_cnt == arr->mods_cap) {
-		arr->mods_cap = max(16, arr->mods_cap * 3 / 2);
-		mods = krealloc_array(arr->mods, arr->mods_cap, sizeof(*mods), GFP_KERNEL);
-		if (!mods)
-			return -ENOMEM;
-		arr->mods = mods;
-	}
-
-	arr->mods[arr->mods_cnt] = mod;
-	arr->mods_cnt++;
-	return 0;
-}
-
-static bool has_module(struct modules_array *arr, struct module *mod)
-{
-	int i;
-
-	for (i = arr->mods_cnt - 1; i >= 0; i--) {
-		if (arr->mods[i] == mod)
-			return true;
-	}
-	return false;
-}
-
 static int get_modules_for_addrs(struct module ***mods, unsigned long *addrs, u32 addrs_cnt)
 {
-	struct modules_array arr = {};
+	struct ptr_array arr = {};
 	u32 i, err = 0;
 
 	for (i = 0; i < addrs_cnt; i++) {
@@ -2918,7 +2884,7 @@ static int get_modules_for_addrs(struct module ***mods, unsigned long *addrs, u3
 		preempt_disable();
 		mod = __module_address(addrs[i]);
 		/* Either no module or we it's already stored  */
-		if (!mod || has_module(&arr, mod)) {
+		if (!mod || bpf_has_ptr(&arr, mod)) {
 			preempt_enable();
 			continue;
 		}
@@ -2927,7 +2893,7 @@ static int get_modules_for_addrs(struct module ***mods, unsigned long *addrs, u3
 		preempt_enable();
 		if (err)
 			break;
-		err = add_module(&arr, mod);
+		err = bpf_add_ptr(&arr, mod);
 		if (err) {
 			module_put(mod);
 			break;
@@ -2936,14 +2902,14 @@ static int get_modules_for_addrs(struct module ***mods, unsigned long *addrs, u3
 
 	/* We return either err < 0 in case of error, ... */
 	if (err) {
-		kprobe_multi_put_modules(arr.mods, arr.mods_cnt);
-		kfree(arr.mods);
+		kprobe_multi_put_modules((struct module **)arr.ptrs, arr.cnt);
+		kfree(arr.ptrs);
 		return err;
 	}
 
 	/* or number of modules found if everything is ok. */
-	*mods = arr.mods;
-	return arr.mods_cnt;
+	*mods = (struct module **)arr.ptrs;
+	return arr.cnt;
 }
 
 static int addrs_check_error_injection_list(unsigned long *addrs, u32 cnt)
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
