Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8E685B7CB
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Feb 2024 10:41:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00894C6B47E;
	Tue, 20 Feb 2024 09:41:43 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 899ACC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 03:51:25 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1dba94f9201so30657665ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 19:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1708401084; x=1709005884;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uAc3ZPxMOkJPGWpWg+vGXamMVExiMG/0L8fGFtmgr8k=;
 b=XsmMtee9p9KyuyotcfnTxgOXsPyzGH+wnW4K9XzrRKPlDusYen94OKafItiWwPaMKX
 OHMGKM+tW7Mx2vZ/NYyTFyWXiHTeKJZxlBvEVbxPQoyt2YNjPv4aHjybs3fzUfl4AiXd
 krjsT/O4AtLm8h9SBAojnSm9Z9UxzJyc8KBp9t4B65yI5CHoehJJuDY0u52huwYQvu0b
 HNj/VCYD8aPtrLZsHkXN6nSEm+L/QTfNy8uzJR5uxiX9JJCetEF71PjVLTTniOTdvqyD
 VP/q/t0R28H50GQkPQt6fItePpFUNaUtvMcgmzFmsgMxoSIo98D8DSSEEslsnNnHbesX
 vhRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708401084; x=1709005884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uAc3ZPxMOkJPGWpWg+vGXamMVExiMG/0L8fGFtmgr8k=;
 b=p7GBV8qChZoAPe/joY+hk5uzFeNVqT9wJKOp+QhACbrLq7FlHXg6FnJnOUndvOldjy
 GvceEcT6j5kU4fE3kgD6qbj+txhI1vAvA71BWudsO0RrEQ+zkso3hdpitq1ERBpAEllM
 cgXI1HQpVhWsNpMWUq1aaPyjdlSTZ9l1UI3NmIxO+dBmRznRQx4eUo7B2Qwn4IaxH/1T
 d00ADZ2a5eaH0Nq05Uk3Qo3xWRcEm4ohwTyFHbAIn0EXrRcFXHWNY/XzmSxlngTGZcIq
 oZvexEeeK9kQiQ/8FqxVL0A33DVk3kYj0BUykqO3ctF5kr5LUrG4Y8ySPZjBC8E7bt0T
 KmpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXELZ3Twd0sGebYZxe6Nsvr9Xja3KZAxQ1N/lIUCEl9v+OuuzcyL7T6mGrc6Gjh40KxjBdTApQTy5khJ+NQZRNFjz8L2n0ZJYB0+HkFI50womWozyPJB1ez
X-Gm-Message-State: AOJu0YxWv+BbL0q0FkIrw4BrduBjWKZLimHfvyvVrio9sCvTGCght5Pw
 hYgwaNn0/0n6b4rTVw+ZyvzHLnNzVrZg6QlqVNXwxjnzjjs6pBPOGP/7mg2B5dY=
X-Google-Smtp-Source: AGHT+IHQpCxkiwyqn6Zm1Fes4enjMkFx89FgEyyFQDO3dIDdg+gKRtfhqWsxDi1vxYhI5FVDAqsFHw==
X-Received: by 2002:a17:902:e744:b0:1d9:c367:201b with SMTP id
 p4-20020a170902e74400b001d9c367201bmr18728920plf.29.1708401084154; 
 Mon, 19 Feb 2024 19:51:24 -0800 (PST)
Received: from localhost.localdomain ([43.129.25.208])
 by smtp.gmail.com with ESMTPSA id
 jz7-20020a170903430700b001d94678a76csm5131723plb.117.2024.02.19.19.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 19:51:23 -0800 (PST)
From: Menglong Dong <dongmenglong.8@bytedance.com>
To: andrii@kernel.org
Date: Tue, 20 Feb 2024 11:51:03 +0800
Message-Id: <20240220035105.34626-4-dongmenglong.8@bytedance.com>
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
Subject: [Linux-stm32] [PATCH bpf-next 3/5] libbpf: allow to set coookie
	when target_btf_id is set in bpf_link_create
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

As now we support to attach the tracing program to multiple target, we can
set the bpf cookie even if the target btf id is offered in
bpf_link_create().

Signed-off-by: Menglong Dong <dongmenglong.8@bytedance.com>
---
 tools/lib/bpf/bpf.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/tools/lib/bpf/bpf.c b/tools/lib/bpf/bpf.c
index 97ec005c3c47..0ca7c8375b40 100644
--- a/tools/lib/bpf/bpf.c
+++ b/tools/lib/bpf/bpf.c
@@ -737,23 +737,15 @@ int bpf_link_create(int prog_fd, int target_fd,
 	target_btf_id = OPTS_GET(opts, target_btf_id, 0);
 
 	/* validate we don't have unexpected combinations of non-zero fields */
-	if (iter_info_len || target_btf_id) {
-		if (iter_info_len && target_btf_id)
-			return libbpf_err(-EINVAL);
-		if (!OPTS_ZEROED(opts, target_btf_id))
-			return libbpf_err(-EINVAL);
-	}
+	if (iter_info_len && target_btf_id)
+		return libbpf_err(-EINVAL);
 
 	memset(&attr, 0, attr_sz);
 	attr.link_create.prog_fd = prog_fd;
 	attr.link_create.target_fd = target_fd;
 	attr.link_create.attach_type = attach_type;
 	attr.link_create.flags = OPTS_GET(opts, flags, 0);
-
-	if (target_btf_id) {
-		attr.link_create.target_btf_id = target_btf_id;
-		goto proceed;
-	}
+	attr.link_create.target_btf_id = target_btf_id;
 
 	switch (attach_type) {
 	case BPF_TRACE_ITER:
@@ -834,11 +826,10 @@ int bpf_link_create(int prog_fd, int target_fd,
 			return libbpf_err(-EINVAL);
 		break;
 	default:
-		if (!OPTS_ZEROED(opts, flags))
+		if (!target_btf_id && !OPTS_ZEROED(opts, flags))
 			return libbpf_err(-EINVAL);
 		break;
 	}
-proceed:
 	fd = sys_bpf_fd(BPF_LINK_CREATE, &attr, attr_sz);
 	if (fd >= 0)
 		return fd;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
