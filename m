Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4814685B7CC
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Feb 2024 10:41:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0814FC6C841;
	Tue, 20 Feb 2024 09:41:43 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 218C8C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 03:51:31 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id
 d9443c01a7336-1dbf1fe91fcso13800825ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 19:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1708401090; x=1709005890;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Snh1k6Nld5+bv3WZ3l7dPau1Zu+9Ra2XDZxa5NzBZqk=;
 b=LDe3WkLWEg2mqxlHHCHcft2VY/utedeCh3pexxlAm6LgAAPVQAZHVHde+tlYAQincU
 06bygxwCGwYjjbJUgrzoNsUFtFOCJAnfYnQOqBn9OSr5KFm34ZBTcTja7U0RHWfDlKNx
 pOmgF4+6zUL0lCUMG5XdmBZnnTXfWXrNSfL8lqclAhIJygIYbz7Tjh53wGg+Hzd72Y64
 epAyxozEjPpVx9aMGldwW72Kwq4ttLYGZiSYYusdTSRLFPn0lsQB3KJDP7Axm6E/ZvvH
 Yu9NbU+MMS8uGzBW6eRDdcera8ckTNRRSzYCjmcYU2UEg+4AuGK8UWy6Hx/Wzsb4VRh7
 4+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708401090; x=1709005890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Snh1k6Nld5+bv3WZ3l7dPau1Zu+9Ra2XDZxa5NzBZqk=;
 b=xEEg6jbCg3UOTgQwqL4rDRl2wNLTUSU1IRzKmCH5r1AAA9mNV2SK6PIY74/6yVvX0A
 bSq4AuaFu76nUnOzTS5OPq/Wr8tKEiFb5TTvQPtd/k42C1RDJ8TIgibS6LHTRfHZQTF9
 zwTYg+Oydga1/ISLu4iq1aZQBkfupTP6Nsh+DhoRg252DY3TQkFHsPLSyzhL29lwwpHB
 5kFz2IYX7dVTo44vl4/BgQQ6wYo7cUCrY/oMF1HP042R2LaCiTjbeDEAW4JUxy5JJ3E7
 PMfGtJiTq5WqxYGZcWMAwoF/05+9+dixj5RhdUYoffP7tBtot0tJwsxhNSu4oUpwNpA8
 8nFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy2B4dmuLhexguUASeb5cyxSOrvUGNQcwRSrL0ON68t5bMkPhxl6nowOvmHbFIxUez4Kne4/rV9sOnDJ+P0/SRzo31fNaJ85U3zCV0HoJTKyJ7LUoaSPSy
X-Gm-Message-State: AOJu0YyjJOznILodzvwOxvi9Lcy4tKpKa8bPfovEj3L6l57gZh9JVP08
 Vs/jTG/puMoPZF6xSj6Y6MrL8XHWAiF6XeIbO7KdEKE+Q+PXTgGovHTRR44ErAY=
X-Google-Smtp-Source: AGHT+IE50Pp+2/Wa8GXXWTQqvcE4yzBnlnYNnnShgb/W714yZn0SAXzbdPgA3nC1n82GoyzcKq2MiQ==
X-Received: by 2002:a17:902:6806:b0:1db:cbff:df15 with SMTP id
 h6-20020a170902680600b001dbcbffdf15mr7399748plk.9.1708401089700; 
 Mon, 19 Feb 2024 19:51:29 -0800 (PST)
Received: from localhost.localdomain ([43.129.25.208])
 by smtp.gmail.com with ESMTPSA id
 jz7-20020a170903430700b001d94678a76csm5131723plb.117.2024.02.19.19.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 19:51:29 -0800 (PST)
From: Menglong Dong <dongmenglong.8@bytedance.com>
To: andrii@kernel.org
Date: Tue, 20 Feb 2024 11:51:04 +0800
Message-Id: <20240220035105.34626-5-dongmenglong.8@bytedance.com>
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
Subject: [Linux-stm32] [PATCH bpf-next 4/5] libbpf: add the function
	libbpf_find_kernel_btf_id()
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

Add new function libbpf_find_kernel_btf_id() to find the btf type id of
the kernel, including vmlinux and modules.

Signed-off-by: Menglong Dong <dongmenglong.8@bytedance.com>
---
 tools/lib/bpf/libbpf.c   | 83 ++++++++++++++++++++++++++++++++++++++++
 tools/lib/bpf/libbpf.h   |  3 ++
 tools/lib/bpf/libbpf.map |  1 +
 3 files changed, 87 insertions(+)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 01f407591a92..44e34007de8c 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -9500,6 +9500,89 @@ int libbpf_find_vmlinux_btf_id(const char *name,
 	return libbpf_err(err);
 }
 
+int libbpf_find_kernel_btf_id(const char *name,
+			      enum bpf_attach_type attach_type,
+			      int *btf_obj_fd, int *btf_type_id)
+{
+	struct btf *btf, *vmlinux_btf;
+	struct bpf_btf_info info;
+	__u32 btf_id = 0, len;
+	char btf_name[64];
+	int err, fd;
+
+	vmlinux_btf = btf__load_vmlinux_btf();
+	err = libbpf_get_error(vmlinux_btf);
+	if (err)
+		return libbpf_err(err);
+
+	err = find_attach_btf_id(vmlinux_btf, name, attach_type);
+	if (err > 0) {
+		*btf_type_id = err;
+		*btf_obj_fd = 0;
+		err = 0;
+		goto out;
+	}
+
+	/* kernel too old to support module BTFs */
+	if (!feat_supported(NULL, FEAT_MODULE_BTF)) {
+		err = -EOPNOTSUPP;
+		goto out;
+	}
+
+	while (true) {
+		err = bpf_btf_get_next_id(btf_id, &btf_id);
+		if (err) {
+			err = -errno;
+			goto out;
+		}
+
+		fd = bpf_btf_get_fd_by_id(btf_id);
+		if (fd < 0) {
+			if (errno == ENOENT)
+				continue;
+			err = -errno;
+			goto out;
+		}
+
+		len = sizeof(info);
+		memset(&info, 0, sizeof(info));
+		info.name = ptr_to_u64(btf_name);
+		info.name_len = sizeof(btf_name);
+
+		err = bpf_btf_get_info_by_fd(fd, &info, &len);
+		if (err) {
+			err = -errno;
+			goto fd_out;
+		}
+
+		if (!info.kernel_btf || strcmp(btf_name, "vmlinux") == 0) {
+			close(fd);
+			continue;
+		}
+
+		btf = btf_get_from_fd(fd, vmlinux_btf);
+		err = libbpf_get_error(btf);
+		if (err)
+			goto fd_out;
+
+		err = find_attach_btf_id(btf, name, attach_type);
+		if (err > 0) {
+			*btf_type_id = err;
+			*btf_obj_fd = fd;
+			err = 0;
+			break;
+		}
+		close(fd);
+		continue;
+fd_out:
+		close(fd);
+		break;
+	}
+out:
+	btf__free(vmlinux_btf);
+	return err;
+}
+
 static int libbpf_find_prog_btf_id(const char *name, __u32 attach_prog_fd)
 {
 	struct bpf_prog_info info;
diff --git a/tools/lib/bpf/libbpf.h b/tools/lib/bpf/libbpf.h
index 5723cbbfcc41..ca151bbec833 100644
--- a/tools/lib/bpf/libbpf.h
+++ b/tools/lib/bpf/libbpf.h
@@ -306,6 +306,9 @@ LIBBPF_API int libbpf_attach_type_by_name(const char *name,
 					  enum bpf_attach_type *attach_type);
 LIBBPF_API int libbpf_find_vmlinux_btf_id(const char *name,
 					  enum bpf_attach_type attach_type);
+LIBBPF_API int libbpf_find_kernel_btf_id(const char *name,
+					 enum bpf_attach_type attach_type,
+					 int *btf_obj_fd, int *btf_type_id);
 
 /* Accessors of bpf_program */
 struct bpf_program;
diff --git a/tools/lib/bpf/libbpf.map b/tools/lib/bpf/libbpf.map
index 86804fd90dd1..73c60f47b4bb 100644
--- a/tools/lib/bpf/libbpf.map
+++ b/tools/lib/bpf/libbpf.map
@@ -413,4 +413,5 @@ LIBBPF_1.4.0 {
 		bpf_token_create;
 		btf__new_split;
 		btf_ext__raw_data;
+		libbpf_find_kernel_btf_id;
 } LIBBPF_1.3.0;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
