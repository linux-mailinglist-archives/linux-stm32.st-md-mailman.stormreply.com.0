Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DF8CF22AF
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F7F4C7A84D;
	Mon,  5 Jan 2026 07:16:28 +0000 (UTC)
Received: from mail-yx1-f100.google.com (mail-yx1-f100.google.com
 [74.125.224.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCF00C8F278
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Dec 2025 17:37:24 +0000 (UTC)
Received: by mail-yx1-f100.google.com with SMTP id
 956f58d0204a3-6469e4b0ff6so552932d50.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Dec 2025 09:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=purestorage.com; s=google2022; t=1767202644; x=1767807444;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z65KNwFWdBB4vKMl4Q2RH4hcwYRlqC7hzCG8+fs8pqw=;
 b=FMuIKaXBnsKavFxXah+BwyHsopkEkGW2gpXe9XIGwN691kmZ+TUNXCtlbNSHqjzfFW
 RzkH7NuN9FZS/scdnyd2Yji4m/ZKdOolb+QxecoqO6gPCpwlgaokqPUqw071zPjL3ZGy
 YUC+aIOHP8t41OumD+uBxjZdAFywkSvqUPkd1Ex0Ic3Dd8h+EJ3pLQC6FiR9WlLmdaIE
 dA41q0y3nqVPXWbh3PonjZmF2RE10/Aispm7SZx1yZ7VxUkqUaHIh+hGnI99fSjfqaGw
 GSpL1wDlmCPE3HF/WFnQpx75UTVgeLk60TyhSFdWK0PUznnQgRIeQnXNOF7yNp/YK5eX
 pnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767202644; x=1767807444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z65KNwFWdBB4vKMl4Q2RH4hcwYRlqC7hzCG8+fs8pqw=;
 b=URnX7I+seWkVWdRd4f4CUuS5EMjg+DQqJvuM8AYBESB5Pf/kAXSPJwt1699od3E/LN
 GyTkLBwur+5KzsVL5PVcjKY/Ek96CgTIj4PRPLxzU8uJgUWZf83RMKwM5vzv+wqVwUUG
 H8N1MUjtvDIwVjbZ58k352SzUBX5MpnAW1mmlOgdGMrbDr1WlcPjU7InlCDXLnaGLBl1
 4FiXSVlRRZV3j21zP3wieRj0ZRscWSKYsZZ16o5EXUg96oao2TfH0jv3qDrt7W7DPWzh
 8ZuH5HHu+zudwJUOsEUlts1WfA98pZZEEf1iubu+uPiDKYGaSYV6wiRTIrDlDKwyQuTZ
 4ANQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJWvCJalmvZZYrzwdt8I0vxIGCqMg5zRGZWqsojdRCi681xQnTlY6n3SttiXjRPCdLBAZXfzg+VlYBow==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxEQcgbNNjqJuXdZ4b7NaGrlWC+Y2wsq4SYFMttBdcM5JlIE9YY
 I3Y67R3RSEK9j9CS7DvRp9QUEuAfCi1o+JqLLFzunL4Nc3vbQLI13ZWp5c3z/TVORHI1lPcsPMZ
 vKabAmXoEl9wTxxGddkIWazOMH0SVhC9+wFc8AGBIby1aNcrXdcZ2
X-Gm-Gg: AY/fxX7XX/CLJXUh66bdshOBxWKBzmKckrme5e2bOgVvIQq+8IvhhXWAjFBkYPT/qY+
 PC+gYEov2AJg98rUopGdpoZIN60oqDlJYd7aiW0vsK+OIJ1sxH8PwWmeNtFw7qJaHJEPjurghrB
 XXTgZpsnRFCAbKcVWKGrkewPiLXEpaytNdivCM+pujWTotPuLeBJzNESqUY5OzwSdaV4rfO32CY
 viXyYp0BnopdfQKKkeMN0/q2D8gAHzN9GW6qLuFruXtEJqzc0+OBJ2kVc0Olg//2leQaIdKpQf/
 VFbWkqhEoZ3nihcfqU2USHxRwEOHvijOsRs9imTzbI5CWN57Dbtm+72gbYV+3RNruoy9h8s51Wo
 Nxj7s7+B87FOj7u8fmKBCgfs6dUc=
X-Google-Smtp-Source: AGHT+IEBotP5m1Z5wYbNapmTCc4dT38K0CaYELN4ShRlN7De1XjUql9tbwl7WLX8LVNM50Lf/6OW51/NhCsQ
X-Received: by 2002:a05:690e:c43:b0:644:7b59:4217 with SMTP id
 956f58d0204a3-6466a87482amr25194896d50.1.1767202643755; 
 Wed, 31 Dec 2025 09:37:23 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
 by smtp-relay.gmail.com with ESMTPS id
 956f58d0204a3-6466a91dd41sm1876075d50.9.2025.12.31.09.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 09:37:23 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com
 (dev-csander.dev.purestorage.com [10.49.34.222])
 by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 291DA341C73;
 Wed, 31 Dec 2025 10:37:22 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
 id 22C62E4234A; Wed, 31 Dec 2025 10:37:22 -0700 (MST)
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
Date: Wed, 31 Dec 2025 10:36:31 -0700
Message-ID: <20251231173633.3981832-4-csander@purestorage.com>
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
Subject: [Linux-stm32] [PATCH 3/5] sched_ext: make __bpf_ops_sched_ext_ops
	const
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
declare the __bpf_ops_sched_ext_ops global variable it points to as
const. This allows the global variable to be placed in readonly memory.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 kernel/sched/ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 94164f2dec6d..af8250b64f47 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -5336,11 +5336,11 @@ static s32 sched_ext_ops__init(void) { return -EINVAL; }
 static void sched_ext_ops__exit(struct scx_exit_info *info) {}
 static void sched_ext_ops__dump(struct scx_dump_ctx *ctx) {}
 static void sched_ext_ops__dump_cpu(struct scx_dump_ctx *ctx, s32 cpu, bool idle) {}
 static void sched_ext_ops__dump_task(struct scx_dump_ctx *ctx, struct task_struct *p) {}
 
-static struct sched_ext_ops __bpf_ops_sched_ext_ops = {
+static const struct sched_ext_ops __bpf_ops_sched_ext_ops = {
 	.select_cpu		= sched_ext_ops__select_cpu,
 	.enqueue		= sched_ext_ops__enqueue,
 	.dequeue		= sched_ext_ops__dequeue,
 	.dispatch		= sched_ext_ops__dispatch,
 	.tick			= sched_ext_ops__tick,
-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
