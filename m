Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB7CCF22AB
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78A41C7A849;
	Mon,  5 Jan 2026 07:16:28 +0000 (UTC)
Received: from mail-ej1-f98.google.com (mail-ej1-f98.google.com
 [209.85.218.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 824B8C0693F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Dec 2025 17:37:23 +0000 (UTC)
Received: by mail-ej1-f98.google.com with SMTP id
 a640c23a62f3a-b769a872550so155207766b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Dec 2025 09:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=purestorage.com; s=google2022; t=1767202643; x=1767807443;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xVlyjcKAentrmX30QVvO0mBVKIkrp0xM35G2rMEV4pU=;
 b=VAXqdnsrGKFXShUmgMQfWTt2FVWWg5/GnrAGZfd1ecRSOuoOte11KRQuLZO0pJyggD
 DRU4+hJYPPCwVjFoNCRq7wAVl7xKgIksBM4oy9URBIH7bolTAUOEJlShVtcBoT62eguP
 0UzGKvwhceqppE7CgW3MKpHaDLZIE5iYLJgSaEFmZSyUR/XqUCAX3092ksXOcvZrGtl5
 lEx8wit/I7nOVx6t7tELIUpbPvf8lHmu2T7zbFqT2DBeLZLH1H62C4lidygwVGlKjXfQ
 6zKbISBGh/8vHruXywy8aMcgmrcT9YzqVe87u6GxwC0qNHSQwYVe/qyWiP9lMFOpSqw8
 1w5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767202643; x=1767807443;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xVlyjcKAentrmX30QVvO0mBVKIkrp0xM35G2rMEV4pU=;
 b=Js/Nz7gN6FYFIhoBVR9ds7grmMYUIMDUw+WcqU37UdOhhPKeRjiViaeMCGEnd4jP0h
 QU51MJdv1RFpMmDX5m0+50JxMVEaDGTeNYfbwNQ0S1A48zhIDhc+ZcSjy/cIld6/fPNm
 on8qRGN4jvAYxOpkNYPbBFiyL3hbtKzfkuzGKK11cCaaktwOai1TcbBgqq4NcyW6014B
 6bJJWDjc+JkrT7CJmbHbEKXbqXbghc8szumb2k3TPEcOsVpVf0rRWKOPWhOk+7lR5SUk
 5BYBjEiaghU6n4+OqIxAJ2uSPbky8PN8jpCD3UQgutZEga81icvoVojmeeq1ErbAKMHq
 Nfqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoMVpriYkJRvsVI0i4s3Lsntv8h75Beg8TwSyTAxIWP2bg6W+ev17e57q6Py/tpJluXWnL0gb0tycwXg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyYEDofWwI8K3D6mhQOv/OhjKU4nZZGkR8ONd9pIz22sJJxa2OU
 Uik4S0jyk3KOY5agot9/++MUNCMSzGhxjYh/u+FzED9bbYqirgM22KM/0Se6V1UpnpXOq71GSRA
 GChZLuxa/KOQrRmkGOKJ0wCeAP1YvHuWYfc8o
X-Gm-Gg: AY/fxX7/yA0mxZDPFGSisiIPoA/WbevUYhYZqCV/RPtzOeHOfla1yobKL35mAZpyRLm
 ApS36+BlPmh7ZHT27Nj3t8t039hKh2QCVmx5QYVcBL9xKVAVZWiKmBuiu54Vt/vE6a05y2kB9Bt
 eK3Dpb3mNzsD5OtszFdgN4Hm25AjvAGQ94ELwY7LwbVhJybL5z55BqIZwk0jj4aL5ZoDS+qXeRU
 h768w9zlqsz8P6PHbJ4KU6orZe+gv6x6aYAiCEwRXC+w/DtmGZSJa4EYRtYC95fitbqZbA+FNrU
 6+L0xIieP5m36xtgGTArsOfNMgSjGURFJ5dyost4NSCuuR/n8qpq17rEJp9Hs1ptZ+U85v6e2hB
 QTI1ve4yTE50YqxoZHaB/kg3+fjgKdSnAJSmPN7c6kQ==
X-Google-Smtp-Source: AGHT+IH0qj0xP8nn7XEk82bp25VPsAtCCWhbeDKuoNLXsuuLL96JLtHTE0PopXu8vpZIgfLz0+onnd2+/ts6
X-Received: by 2002:a17:906:9fc7:b0:b76:d7ce:b017 with SMTP id
 a640c23a62f3a-b80371858abmr2253623166b.4.1767202642561; 
 Wed, 31 Dec 2025 09:37:22 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-b831340b988sm264434466b.60.2025.12.31.09.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 09:37:22 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com
 (dev-csander.dev.purestorage.com [10.49.34.222])
 by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 2F956340185;
 Wed, 31 Dec 2025 10:37:21 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
 id 1CE0EE4234A; Wed, 31 Dec 2025 10:37:21 -0700 (MST)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Tejun Heo <tj@kernel.org>,
 David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
 Changwoo Min <changwoo@igalia.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 David Ahern <dsahern@kernel.org>, Jamal Hadi Salim <jhs@mojatatu.com>,
 Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 "D. Wythe" <alibuda@linux.alibaba.com>,
 Dust Li <dust.li@linux.alibaba.com>,
 Sidraya Jayagond <sidraya@linux.ibm.com>,
 Wenjia Zhang <wenjia@linux.ibm.com>,
 Mahanta Jambigi <mjambigi@linux.ibm.com>,
 Tony Lu <tonylu@linux.alibaba.com>, Wen Gu <guwen@linux.alibaba.com>,
 Shuah Khan <shuah@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 31 Dec 2025 10:36:28 -0700
Message-ID: <20251231173633.3981832-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 05 Jan 2026 07:16:22 +0000
Cc: linux-s390@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, Caleb Sander Mateos <csander@purestorage.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kselftest@vger.kernel.org, linux-input@vger.kernel.org,
 bpf@vger.kernel.org, sched-ext@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/5] bpf: use const pointer for struct_ops
	cfi_stubs
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

struct bpf_struct_ops's cfi_stubs field is used as a readonly pointer
but has type void *. Change its type to void const * to allow it to
point to readonly global memory. Update the struct_ops implementations
to declare their cfi_stubs global variables as const.

Caleb Sander Mateos (5):
  bpf: use const pointer for struct_ops cfi_stubs
  HID: bpf: make __bpf_hid_bpf_ops const
  sched_ext: make __bpf_ops_sched_ext_ops const
  net: make cfi_stubs globals const
  selftests/bpf: make cfi_stubs globals const

 drivers/hid/bpf/hid_bpf_struct_ops.c                   |  2 +-
 include/linux/bpf.h                                    |  2 +-
 kernel/bpf/bpf_struct_ops.c                            |  6 +++---
 kernel/sched/ext.c                                     |  2 +-
 net/bpf/bpf_dummy_struct_ops.c                         |  2 +-
 net/ipv4/bpf_tcp_ca.c                                  |  2 +-
 net/sched/bpf_qdisc.c                                  |  2 +-
 net/smc/smc_hs_bpf.c                                   |  2 +-
 .../testing/selftests/bpf/test_kmods/bpf_test_no_cfi.c |  2 +-
 tools/testing/selftests/bpf/test_kmods/bpf_testmod.c   | 10 +++++-----
 10 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
