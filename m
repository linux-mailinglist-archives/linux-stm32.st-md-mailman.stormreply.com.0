Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D1C877CE1
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Mar 2024 10:35:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3217AC71281;
	Mon, 11 Mar 2024 09:35:02 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DB58C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 09:35:00 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-6e5b1c6daa3so2487335b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 02:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1710149699; x=1710754499;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQHWXqakG53bwp/DHGcig31BilBtYFxqqjfUWdtPR6g=;
 b=AWceMFBvB5HmBoZIU9s3kikIdzbv+JiCNVGpBRr0Q1rlRwDaMs9/40L8KakLil/vJj
 GH64dpoANVzXj85W+tOHgxCzU9ijMGJQOmE/66HpVICy04q5hZKlBWHZj06+i2FhVf5H
 iOwdvgBBhhW3MsBmh/r+0sgV6Xtai2M6umI+mMOR2VG99QOXYVsGYJhuIua/0bcQLqCH
 SHfAzQPkVexwf4RSW0nBU1N0sgSjp+/PH/+DlhlvL/1nO/4S+kHYMcJGWiseumr6AWon
 1jyUagZE0MTWRSbGIQH1yE+vUccVRBgjZIOPQ0ZdZs4Iybyss4FLS5rQf1BU4ssECZbD
 T9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710149699; x=1710754499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mQHWXqakG53bwp/DHGcig31BilBtYFxqqjfUWdtPR6g=;
 b=GJ3zOZuwJXtqa8B5aeGMNX8tgKVIOa2mJov6hbBdTg0wWFqUQGI83zqyH4jXX5qz9s
 +lsWwmxIAMrQKB/JwAIvjoBryyGjR8UGdcmKuMDxRUQDhPAjN1kKk9Yk9sTGi4kHX8K3
 RtwvZyJRZlGcCH731JCoSaBW+NbR0SN4/ibzL5A8kkxOWIwqpNuCS0w1T2xYVScbD9LE
 8Nj54ALqhFaCy0DaYj5QwH+FYVLmItxaFEpPdlKpE5x3t1BnpixnUV1mQisByqxf7duP
 oVjptE4ssbU/bAyHrxT0jhl/Z/xI17WMuLXymgjBzU5JNOZhp6ZM1/t1IM60haddYFRv
 rOXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsS1rILvVslSN4QXh+EXKfVu/2KptqbbkTZx2RdLp1FOzvkJJFTmJrB2X0cMOohlyxli8VvINmJKmpBOC/shw87rdQIfXqDHrJcSoHqfogIR6mhZkqR88D
X-Gm-Message-State: AOJu0YyRxkQ52QLQh7TQ5N/nmuC7J/HIlQ0fQ8cfpkV01EkvSr5h9+lS
 vW2EECxGdXksExTQuJWWb4dOtg4TvLykwtQUiqjk1RNYo60o7PbkMHzgJsLLVm0=
X-Google-Smtp-Source: AGHT+IHwrlcPzEPWwJhB9wbDVFgwEUaTXK8PIDDimv1XZruHWD6zTTqAqef2QwBY7Qc+7bmyEVvx+w==
X-Received: by 2002:a05:6a20:6f8f:b0:1a3:1d7e:342b with SMTP id
 gv15-20020a056a206f8f00b001a31d7e342bmr631985pzb.48.1710149698990; 
 Mon, 11 Mar 2024 02:34:58 -0700 (PDT)
Received: from localhost.localdomain ([43.129.25.208])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a170902f7c900b001dcad9cbf8bsm4253365plw.239.2024.03.11.02.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 02:34:58 -0700 (PDT)
From: Menglong Dong <dongmenglong.8@bytedance.com>
To: andrii@kernel.org
Date: Mon, 11 Mar 2024 17:35:21 +0800
Message-Id: <20240311093526.1010158-5-dongmenglong.8@bytedance.com>
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
Subject: [Linux-stm32] [PATCH bpf-next v2 4/9] bpf: trampoline: introduce
	bpf_tramp_multi_link
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

Introduce the struct bpf_tramp_multi_link, which is used to attach
a bpf_link to multi trampoline. Meanwhile, introduce corresponding
function bpf_trampoline_multi_{link,unlink}_prog.

Signed-off-by: Menglong Dong <dongmenglong.8@bytedance.com>
---
 include/linux/bpf.h     | 14 ++++++++++++
 kernel/bpf/trampoline.c | 47 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 2b5cd6100fc4..4e8f17d9f022 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -57,6 +57,7 @@ struct user_namespace;
 struct super_block;
 struct inode;
 struct bpf_tramp_link;
+struct bpf_tramp_multi_link;
 
 extern struct idr btf_idr;
 extern spinlock_t btf_idr_lock;
@@ -1282,6 +1283,8 @@ struct bpf_trampoline *bpf_trampoline_get(u64 key,
 					  struct bpf_attach_target_info *tgt_info);
 void bpf_trampoline_put(struct bpf_trampoline *tr);
 int arch_prepare_bpf_dispatcher(void *image, void *buf, s64 *funcs, int num_funcs);
+int bpf_trampoline_multi_link_prog(struct bpf_tramp_multi_link *link);
+int bpf_trampoline_multi_unlink_prog(struct bpf_tramp_multi_link *link);
 
 /*
  * When the architecture supports STATIC_CALL replace the bpf_dispatcher_fn
@@ -1614,6 +1617,17 @@ struct bpf_shim_tramp_link {
 	struct bpf_trampoline *trampoline;
 };
 
+struct bpf_tramp_multi_link_entry {
+	struct bpf_trampoline *trampoline;
+	struct bpf_tramp_link_conn conn;
+};
+
+struct bpf_tramp_multi_link {
+	struct bpf_link link;
+	u32 cnt;
+	struct bpf_tramp_multi_link_entry *entries;
+};
+
 struct bpf_tracing_link {
 	struct bpf_tramp_link link;
 	enum bpf_attach_type attach_type;
diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
index cf9b84f785f3..2167aa3fe583 100644
--- a/kernel/bpf/trampoline.c
+++ b/kernel/bpf/trampoline.c
@@ -607,6 +607,53 @@ int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link, struct bpf_trampolin
 	return err;
 }
 
+static int __bpf_trampoline_multi_unlink_prog(struct bpf_tramp_multi_link *link,
+					      u32 cnt)
+{
+	struct bpf_tramp_multi_link_entry *entry;
+	struct bpf_trampoline *tr;
+	int err = 0, i;
+
+	for (i = 0; i < cnt; i++) {
+		entry = &link->entries[i];
+		tr = entry->trampoline;
+		mutex_lock(&tr->mutex);
+		err = __bpf_trampoline_unlink_prog(&entry->conn,
+						   entry->trampoline);
+		mutex_unlock(&tr->mutex);
+		if (err)
+			break;
+	}
+	return err;
+}
+
+int bpf_trampoline_multi_unlink_prog(struct bpf_tramp_multi_link *link)
+{
+	return __bpf_trampoline_multi_unlink_prog(link, link->cnt);
+}
+
+int bpf_trampoline_multi_link_prog(struct bpf_tramp_multi_link *link)
+{
+	struct bpf_tramp_multi_link_entry *entry;
+	struct bpf_trampoline *tr;
+	int err = 0, i;
+
+	for (i = 0; i < link->cnt; i++) {
+		entry = &link->entries[i];
+		tr = entry->trampoline;
+		mutex_lock(&tr->mutex);
+		err = __bpf_trampoline_link_prog(&entry->conn, tr);
+		mutex_unlock(&tr->mutex);
+		if (err)
+			goto unlink;
+	}
+
+	return 0;
+unlink:
+	__bpf_trampoline_multi_unlink_prog(link, i);
+	return err;
+}
+
 #if defined(CONFIG_CGROUP_BPF) && defined(CONFIG_BPF_LSM)
 static void bpf_shim_tramp_link_release(struct bpf_link *link)
 {
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
