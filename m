Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E297FCF22B2
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF22CC7A834;
	Mon,  5 Jan 2026 07:16:28 +0000 (UTC)
Received: from mail-yx1-f100.google.com (mail-yx1-f100.google.com
 [74.125.224.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0ED10C8F279
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Dec 2025 17:37:25 +0000 (UTC)
Received: by mail-yx1-f100.google.com with SMTP id
 956f58d0204a3-6446c1b327aso1562277d50.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Dec 2025 09:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=purestorage.com; s=google2022; t=1767202644; x=1767807444;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mnMrXoOdHpUw8dswWZLzwCvPJsKuA+x+IPeEnhc/WiU=;
 b=Er9TiNWsuvmoI294+ZhAv/sEStNQDw1o25VPiUwUxefNAQTJgVxoPZBkqVWJWqRqQG
 8V59iai5AF+AZ9tcOIx2+xEmlzqGValDq6VC5G7OqOeZfz1CV94OUw68PW66UtsZK4li
 of6ndIBnpVPa4fje/7quPKHAh+QG2YhXlKPXHNbv1c1pzc/4f7dJl2e3SiMSVJOpEr1E
 5L2GyQAUa4RouHd9jta0R8+S4Za0IS7aCEJ1Y7OrETMJhRdx1u0wP/f7DmTcMWxE+xwB
 /4gkVbhA0eD4+NPEKBBUfI1OsnKJxrxwyMB4wnzpB2Q0fly9JX/I8ntB6f+fExI5NXWG
 k3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767202644; x=1767807444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mnMrXoOdHpUw8dswWZLzwCvPJsKuA+x+IPeEnhc/WiU=;
 b=ntZo0cfU/Oj7DvOQ3CPpvdBzyLf7EGmTcFh0VzSRwoy/q6h1sF3LrcWFTUYPfTlQOT
 v20yN5NSfpFP0Iq8tcKY4VB1VBxoWSE1ecnZcVLmk7kGf8Gbxrvi+A7cSHEs6qUtBYDr
 ggfHzqe2i5dT1p6oD1HxVCjGjEL3H37+Ni9Wx0fajRotNeDIPT9/KxmkX5ecSorKh178
 DMlYsCu+AOr07c4rmQNWvvvuH6IWPvajipVGP7CM+UixP3bqKFzmr3gdTCSaGggWCbdc
 xUAdneeFhp5cHOOcsEt6TFt9T8NdCV5UlgJFheCdEU7FlKiL/k15jK4DqVvWmGRMYRbb
 M1sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxhSk2cJ7N3IzdD0hkyT2XAmT0bHVTh/FDqVHeb4aUaoPBtJCpIDlJKcms2RRpWE0s8gUE0VD+P712lQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw5q62fy4xCyIpZOzg/s3qFU5WP9PW0axdgrdcsemeOcFxlJaHJ
 3tVgNajDjfwBp1NjaZP+677FDs38SpsbAU3XTZTNjNj53H/1jor7vFvm4IRjQEJen9uAg0bphNn
 4PoQoPzIPdcH7IODgetN2Q+kLUctMhL2YG9PY+Majb9pPHGkbBvC4
X-Gm-Gg: AY/fxX47v+CHtvgMcaHXFJ8PdHQrFjEo8YyQSzP4infwNFbegI1cg7IQJFuWCwtumea
 lux8l/N8rbroMg0g9U+fEOa+72g0eRpn6wsjJ6JvpbbmWV/PkddyfmWd/D7bn0yc/L6Clc8C4TV
 1vYByg/Df3/ghw6BnWJn3RLw7pU/+fbCvtF4Ab0jol8Lasau0VByKgbigO+FTKG2yJx18FInV9w
 baSyD+LqjVgPlGK6x7nssIFbtcNpGozbD1RMFVZlEDC4q6t9X2+739derIPZthi9UIqVqD+b23w
 Nu5FK8APwU1VEzqW579hNjZrD7AJ1ovGu2AFcxAYyBOy+OLTa2qjWlM3KEYrwB2rYSE+dM/WhPN
 AEA1jQr1LW8r8kC20Xo89upazXvs=
X-Google-Smtp-Source: AGHT+IFzNZ9/B42ZZcWKGBbfHMMt1MITs0v7q3q/4nZwuxereT20JgdLMhgZVahogWsIsE+x/yAB+mtzvoKa
X-Received: by 2002:a05:690e:144e:b0:644:49be:4b8e with SMTP id
 956f58d0204a3-6466a7b2ee5mr25783568d50.0.1767202643860; 
 Wed, 31 Dec 2025 09:37:23 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
 by smtp-relay.gmail.com with ESMTPS id
 00721157ae682-78fb4520077sm17026207b3.26.2025.12.31.09.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 09:37:23 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com
 (dev-csander.dev.purestorage.com [10.49.34.222])
 by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 740E834223B;
 Wed, 31 Dec 2025 10:37:22 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
 id 6E501E4234A; Wed, 31 Dec 2025 10:37:22 -0700 (MST)
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
Date: Wed, 31 Dec 2025 10:36:32 -0700
Message-ID: <20251231173633.3981832-5-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251231173633.3981832-1-csander@purestorage.com>
References: <20251231173633.3981832-1-csander@purestorage.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 05 Jan 2026 07:16:22 +0000
Cc: linux-s390@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, Caleb Sander Mateos <csander@purestorage.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kselftest@vger.kernel.org, linux-input@vger.kernel.org,
 bpf@vger.kernel.org, sched-ext@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/5] net: make cfi_stubs globals const
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

Now that struct bpf_struct_ops's cfi_stubs field is a const pointer,
declare the __bpf_bpf_dummy_ops, __bpf_ops_tcp_congestion_ops,
__bpf_ops_qdisc_ops, and __smc_bpf_hs_ctrl global variables it points to
as const. This allows the global variables to be placed in readonly
memory.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 net/bpf/bpf_dummy_struct_ops.c | 2 +-
 net/ipv4/bpf_tcp_ca.c          | 2 +-
 net/sched/bpf_qdisc.c          | 2 +-
 net/smc/smc_hs_bpf.c           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/bpf/bpf_dummy_struct_ops.c b/net/bpf/bpf_dummy_struct_ops.c
index 812457819b5a..198152dbce9a 100644
--- a/net/bpf/bpf_dummy_struct_ops.c
+++ b/net/bpf/bpf_dummy_struct_ops.c
@@ -296,11 +296,11 @@ static int bpf_dummy_test_2(struct bpf_dummy_ops_state *cb, int a1, unsigned sho
 static int bpf_dummy_test_sleepable(struct bpf_dummy_ops_state *cb)
 {
 	return 0;
 }
 
-static struct bpf_dummy_ops __bpf_bpf_dummy_ops = {
+static const struct bpf_dummy_ops __bpf_bpf_dummy_ops = {
 	.test_1 = bpf_dummy_ops__test_1,
 	.test_2 = bpf_dummy_test_2,
 	.test_sleepable = bpf_dummy_test_sleepable,
 };
 
diff --git a/net/ipv4/bpf_tcp_ca.c b/net/ipv4/bpf_tcp_ca.c
index e01492234b0b..bd2ce4ff1762 100644
--- a/net/ipv4/bpf_tcp_ca.c
+++ b/net/ipv4/bpf_tcp_ca.c
@@ -306,11 +306,11 @@ static void __bpf_tcp_ca_init(struct sock *sk)
 
 static void __bpf_tcp_ca_release(struct sock *sk)
 {
 }
 
-static struct tcp_congestion_ops __bpf_ops_tcp_congestion_ops = {
+static const struct tcp_congestion_ops __bpf_ops_tcp_congestion_ops = {
 	.ssthresh = bpf_tcp_ca_ssthresh,
 	.cong_avoid = bpf_tcp_ca_cong_avoid,
 	.set_state = bpf_tcp_ca_set_state,
 	.cwnd_event = bpf_tcp_ca_cwnd_event,
 	.in_ack_event = bpf_tcp_ca_in_ack_event,
diff --git a/net/sched/bpf_qdisc.c b/net/sched/bpf_qdisc.c
index adcb618a2bfc..8f9a6440f113 100644
--- a/net/sched/bpf_qdisc.c
+++ b/net/sched/bpf_qdisc.c
@@ -427,11 +427,11 @@ static void Qdisc_ops__reset(struct Qdisc *sch)
 
 static void Qdisc_ops__destroy(struct Qdisc *sch)
 {
 }
 
-static struct Qdisc_ops __bpf_ops_qdisc_ops = {
+static const struct Qdisc_ops __bpf_ops_qdisc_ops = {
 	.enqueue = Qdisc_ops__enqueue,
 	.dequeue = Qdisc_ops__dequeue,
 	.init = Qdisc_ops__init,
 	.reset = Qdisc_ops__reset,
 	.destroy = Qdisc_ops__destroy,
diff --git a/net/smc/smc_hs_bpf.c b/net/smc/smc_hs_bpf.c
index 063d23d85850..5c562e2a15be 100644
--- a/net/smc/smc_hs_bpf.c
+++ b/net/smc/smc_hs_bpf.c
@@ -60,11 +60,11 @@ static int __smc_bpf_stub_set_tcp_option_cond(const struct tcp_sock *tp,
 					      struct inet_request_sock *ireq)
 {
 	return 1;
 }
 
-static struct smc_hs_ctrl __smc_bpf_hs_ctrl = {
+static const struct smc_hs_ctrl __smc_bpf_hs_ctrl = {
 	.syn_option	= __smc_bpf_stub_set_tcp_option,
 	.synack_option	= __smc_bpf_stub_set_tcp_option_cond,
 };
 
 static int smc_bpf_hs_ctrl_init(struct btf *btf) { return 0; }
-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
