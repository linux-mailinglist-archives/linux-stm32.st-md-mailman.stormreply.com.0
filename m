Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34409877CD5
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Mar 2024 10:34:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED00BC6DD9C;
	Mon, 11 Mar 2024 09:34:30 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE4EBC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 09:34:29 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-5d8ddbac4fbso3533114a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 02:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1710149668; x=1710754468;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q244jOj8DhushyleU2bCeCOJVSr6CNZEpUiu8vv3bQA=;
 b=SWI+7gBcpuhUMsBhIr9gBwDeb9kRX+sgHX5J+cbsmNFXWV5D1hUa8gG0dcjIjwNPAU
 BsxhydVaYr81snYA6Jfdprm8lgyeySKvOkKa4T1JjvzAK3JIOJwAGokf880+MKvcVom/
 tWpB5psu7jUvtPZJNSpiG2hhrPKvcPmIcZIqhlCAZRKNsC5sa5lxyJHpiL3K8ZSnscbL
 mVBBSAOt4MrCVCMldUZrZZA3AC3xA6ZzSumHymUnGQ+C6LWmmzf02TWNzxsq7BsEtt79
 LIvDbaQoNJl7urmgA6OFmHAIg2ycVmKLpXPZZK5S9syflw3cDnerJjp/ivJ4uG2j8PRj
 YC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710149668; x=1710754468;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q244jOj8DhushyleU2bCeCOJVSr6CNZEpUiu8vv3bQA=;
 b=vGmEz2niY7vbWoNM0lybCiIr7Ufx5Hehxcy6cFMhlamt4CvD0RQebe2fot+yDhGs/W
 lSMhEW3iJXu9qiYxgg9E0NmcrvjwHDWbj0saaHfUnT5j6hHPj/MsB8l+HiiPKbmk9vKU
 ybUiIN5d8KAgEOOx6jRu9Kt/2DHWwUsDAKm7xq6eTQrTkDPilNHQbgSW204hACyOj9F/
 AAghYdA7nF8Mh8HQViuIw5H/yfpx1buiuyhDD7bC2e/tZDeSiAo39Kp43PVu7Vs2h774
 9MhLu3pFLsY2vwvj0qgdULpz0FEisgKV2rBWm6azx7d77mgl6UWotDs6lJW+KnT1YcD0
 aObQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH30v2H/GN03MoUdOnRXqlNfTPBWHlTpaT8jY2NAA36fkjO6ZFPW8lqPF1/FpZAO6HUEF6h9mLrYMgMrzmzpZ4fAskibm81w6OBKEYUwpU+ZVWm0KdXnFe
X-Gm-Message-State: AOJu0YzslS8jPO6bVd6tQ6NGOFKbGa6WjO0hOWbVCWXO8dzaY+zNvkl6
 IVqKISgd9S6IEcKIydMAWinIAYdC3pwFJnLJ405UCOVNsUChEOQ0lQODliHQ4io=
X-Google-Smtp-Source: AGHT+IElS3MTAJT6oKHCK2ojNj/jD5/lk4XV4NzHmUyXpO9L/Z2ncrXc9UjeUvKY0ZMwD8Lzv32+BQ==
X-Received: by 2002:a05:6a20:9f99:b0:1a1:7df5:ee5a with SMTP id
 mm25-20020a056a209f9900b001a17df5ee5amr9151303pzb.35.1710149668389; 
 Mon, 11 Mar 2024 02:34:28 -0700 (PDT)
Received: from localhost.localdomain ([43.129.25.208])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a170902f7c900b001dcad9cbf8bsm4253365plw.239.2024.03.11.02.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 02:34:27 -0700 (PDT)
From: Menglong Dong <dongmenglong.8@bytedance.com>
To: andrii@kernel.org
Date: Mon, 11 Mar 2024 17:35:17 +0800
Message-Id: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
X-Mailer: git-send-email 2.39.2
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
Subject: [Linux-stm32] [PATCH bpf-next v2 0/9] bpf: make tracing program
	support multi-link
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

In this series, we add the support to allow attaching a tracing BPF
program to multi hooks, which is similar to BPF_TRACE_KPROBE_MULTI.

In the 1st patch, we add the support to record index of the accessed
function args of the target for tracing program. Meanwhile, we add the
function btf_check_func_part_match() to compare the accessed function args
of two function prototype. This function will be used in the next commit.

In the 2nd patch, we refactor the struct modules_array to ptr_array, as
we need similar function to hold the target btf, target program and kernel
modules that we reference to in the following commit.

In the 3rd patch, we introduce the struct bpf_tramp_link_conn to be the
bridge between bpf_link and trampoline, as the releation between bpf_link
and trampoline is not one-to-one anymore.

In the 4th patch, we add the struct bpf_tramp_multi_link and
bpf_trampoline_multi_{link,unlink}_prog for multi-link of trampoline.

In the 5th patch, we add target btf to the function args of
bpf_check_attach_target(), then the caller can specify the btf to check.

The 6th patch is the main part to add multi-link supporting for tracing.
For now, only the following attach type is supported:

  BPF_TRACE_FENTRY_MULTI
  BPF_TRACE_FEXIT_MULTI
  BPF_MODIFY_RETURN_MULTI

The attach type of BPF_TRACE_RAW_TP has different link type, so we skip
this part in this series for now.

In the 7th and 8th patches, we add multi-link supporting of tracing to
libbpf. Note that we don't free btfs that we load after the bpf programs
are loaded into the kernel now if any programs of type tracing multi-link
existing, as we need to lookup the btf types during attaching.

In the 9th patch, we add the testcases for this series.

Changes since v1:
- According to the advice of Alexei, introduce multi-link for tracing
  instead of attaching a tracing program to multiple trampolines with
  creating multi instance of bpf_link.

Menglong Dong (9):
  bpf: tracing: add support to record and check the accessed args
  bpf: refactor the modules_array to ptr_array
  bpf: trampoline: introduce struct bpf_tramp_link_conn
  bpf: trampoline: introduce bpf_tramp_multi_link
  bpf: verifier: add btf to the function args of bpf_check_attach_target
  bpf: tracing: add multi-link support
  libbpf: don't free btf if program of multi-link tracing existing
  libbpf: add support for the multi-link of tracing
  selftests/bpf: add testcases for multi-link of tracing

 arch/arm64/net/bpf_jit_comp.c                 |   4 +-
 arch/riscv/net/bpf_jit_comp64.c               |   4 +-
 arch/s390/net/bpf_jit_comp.c                  |   4 +-
 arch/x86/net/bpf_jit_comp.c                   |   4 +-
 include/linux/bpf.h                           |  51 ++-
 include/linux/bpf_verifier.h                  |   1 +
 include/uapi/linux/bpf.h                      |  10 +
 kernel/bpf/bpf_struct_ops.c                   |   2 +-
 kernel/bpf/btf.c                              | 113 ++++-
 kernel/bpf/syscall.c                          | 425 +++++++++++++++++-
 kernel/bpf/trampoline.c                       |  97 +++-
 kernel/bpf/verifier.c                         |  24 +-
 kernel/trace/bpf_trace.c                      |  48 +-
 net/bpf/test_run.c                            |   3 +
 net/core/bpf_sk_storage.c                     |   2 +
 tools/bpf/bpftool/common.c                    |   3 +
 tools/include/uapi/linux/bpf.h                |  10 +
 tools/lib/bpf/bpf.c                           |  10 +
 tools/lib/bpf/bpf.h                           |   6 +
 tools/lib/bpf/libbpf.c                        | 215 ++++++++-
 tools/lib/bpf/libbpf.h                        |  16 +
 tools/lib/bpf/libbpf.map                      |   2 +
 .../selftests/bpf/bpf_testmod/bpf_testmod.c   |  49 ++
 .../bpf/prog_tests/tracing_multi_link.c       | 153 +++++++
 .../selftests/bpf/progs/tracing_multi_test.c  | 209 +++++++++
 25 files changed, 1366 insertions(+), 99 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/tracing_multi_link.c
 create mode 100644 tools/testing/selftests/bpf/progs/tracing_multi_test.c

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
