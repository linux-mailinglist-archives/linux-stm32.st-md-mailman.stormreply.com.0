Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 145E285B7C8
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Feb 2024 10:41:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2723C6A61D;
	Tue, 20 Feb 2024 09:41:40 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3771CC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 03:51:07 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1d73066880eso48155685ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 19:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1708401065; x=1709005865;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8UkmNgftH857w2sqifeOqAr+iNHF37XOde+wq8ViDZE=;
 b=JF2Q5hlOu3nBHL4hMj6fuu21q1p33BR7wdnUEWfWmnpBpEkZc+3jkoigS630Zfo8PK
 psc3YTulUwsoPDEL8t8Otxh+QdXI3evuVS+Kku1PZBJTczSMvJ/mdXXNz9W4S+P8qP/2
 pwTZ92eLbVAiMP0MBZJ5lJtQncEIslZemgefcnTSZ7NSlFClcTJ2vU/ex4IuHKfuHnPR
 SqseAasma9S1Z2szSdyXrfcIiveW8POQur4jsYjUsl2P5XCA+SnUmFbeYP/PS8ZEpAYb
 nULitENUkafbtn7ptfP/DxtxlW81zalK6uUVYuqthZWA3TASg86vLYeiB04HNfTBMSFf
 E4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708401065; x=1709005865;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8UkmNgftH857w2sqifeOqAr+iNHF37XOde+wq8ViDZE=;
 b=qabDyVw0WZASrqscaPj6kWmhM7+7ULZmt6tiOVsAu1o7Doo5b3vLlUBrTUn+acM0iV
 jmaaehjL5zc1ZSyEm667nRhWPWTCYczkfy2IgHAdNeDSiqcRX+2TCI+sEnapkAbKetBV
 POtW6qBbeWja1MfdExZN4H44novySYgE80Lvuzf2rsTlN+ylADKwRZPNLdQrmO2gIQcM
 0g3RnG6RlaHj7xApUH7PhPLJbgQJr0c9+7SGMao74kZDvm3NMMJiQznqGeeUtDfT1wZ0
 +8KYeE7TexWMPaa//f9zc9f1OBx/8tTH5bno6Mo+9x+1c3P+dyAzjcS4cWES0yS0wk0K
 nCsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVda5JgVIgpIGGiNvlRHUKlDGwYs6ChY7rRAnQ/apYSx/Ki9133qzz+W8pfcJs8eOhMnILYczJORXEoU16cPRi7M49ZTFpbniTCn0x8Cy+heEHn3tkzruXq
X-Gm-Message-State: AOJu0YzAtYQ3lCqzN17Q+Zo/9UhrEREn7MHhTm/rR6UHhJyCA4vkelMX
 KNApBBKf+6AVsSKqo791789KS2F+yF2C+ejy8c7a1+gnCeAz9FGtWWraHh294dQ=
X-Google-Smtp-Source: AGHT+IFahjx8Wl0J1qpYL1S67NT7dQm8quAfM53FT6LDzNXvorRUNHjgFtfIKe9Dezhf1ddJbvtSYw==
X-Received: by 2002:a17:903:1104:b0:1db:37b1:b1a3 with SMTP id
 n4-20020a170903110400b001db37b1b1a3mr16490922plh.17.1708401065669; 
 Mon, 19 Feb 2024 19:51:05 -0800 (PST)
Received: from localhost.localdomain ([43.129.25.208])
 by smtp.gmail.com with ESMTPSA id
 jz7-20020a170903430700b001d94678a76csm5131723plb.117.2024.02.19.19.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 19:51:05 -0800 (PST)
From: Menglong Dong <dongmenglong.8@bytedance.com>
To: andrii@kernel.org
Date: Tue, 20 Feb 2024 11:51:00 +0800
Message-Id: <20240220035105.34626-1-dongmenglong.8@bytedance.com>
X-Mailer: git-send-email 2.39.2
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
Subject: [Linux-stm32] [PATCH bpf-next 0/5] bpf: make tracing program
	support multi-attach
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

For now, the BPF program of type BPF_PROG_TYPE_TRACING is not allowed to
be attached to multiple hooks, and we have to create a BPF program for
each kernel function, for which we want to trace, even through all the
program have the same (or similar) logic. This can consume extra memory,
and make the program loading slow if we have plenty of kernel function to
trace.

In the commit 4a1e7c0c63e0 ("bpf: Support attaching freplace programs to
multiple attach points"), the freplace BPF program is made to support
attach to multiple attach points. And in this series, we extend it to
fentry/fexit/raw_tp/...

In the 1st patch, we add the support to record index of the accessed
function args of the target for tracing program. Meanwhile, we add the
function btf_check_func_part_match() to compare the accessed function args
of two function prototype. This function will be used in the next commit.

In the 2nd patch, we do some adjust to bpf_tracing_prog_attach() to make
it support multiple attaching.

In the 3rd patch, we allow to set bpf cookie in bpf_link_create() even if
target_btf_id is set, as we are allowed to attach the tracing program to
new target.

In the 4th patch, we introduce the function libbpf_find_kernel_btf_id() to
libbpf to find the btf type id of the kernel function, and this function
will be used in the next commit.

In the 5th patch, we add the testcases for this series.

Menglong Dong (5):
  bpf: tracing: add support to record and check the accessed args
  bpf: tracing: support to attach program to multi hooks
  libbpf: allow to set coookie when target_btf_id is set in
    bpf_link_create
  libbpf: add the function libbpf_find_kernel_btf_id()
  selftests/bpf: add test cases for multiple attach of tracing program

 include/linux/bpf.h                           |   6 +
 include/uapi/linux/bpf.h                      |   1 +
 kernel/bpf/btf.c                              | 121 ++++++++++++++
 kernel/bpf/syscall.c                          | 118 +++++++++++---
 tools/lib/bpf/bpf.c                           |  17 +-
 tools/lib/bpf/libbpf.c                        |  83 ++++++++++
 tools/lib/bpf/libbpf.h                        |   3 +
 tools/lib/bpf/libbpf.map                      |   1 +
 .../selftests/bpf/bpf_testmod/bpf_testmod.c   |  49 ++++++
 .../bpf/prog_tests/tracing_multi_attach.c     | 153 ++++++++++++++++++
 .../selftests/bpf/progs/tracing_multi_test.c  |  66 ++++++++
 11 files changed, 583 insertions(+), 35 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/tracing_multi_attach.c
 create mode 100644 tools/testing/selftests/bpf/progs/tracing_multi_test.c

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
