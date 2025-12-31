Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BE4CF22AC
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90407C7A84B;
	Mon,  5 Jan 2026 07:16:28 +0000 (UTC)
Received: from mail-qv1-f98.google.com (mail-qv1-f98.google.com
 [209.85.219.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15DB2C0693F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Dec 2025 17:37:24 +0000 (UTC)
Received: by mail-qv1-f98.google.com with SMTP id
 6a1803df08f44-88a279996f2so2981906d6.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Dec 2025 09:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=purestorage.com; s=google2022; t=1767202643; x=1767807443;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f/dTXIrnjBfrtWAAe53M4yTIg6PHJwwBbAiaJAY560g=;
 b=YJn82AZmljsCyduQDO6aN6I6N9IOWXPRo8C9ZLznUK4I/fYexNZBbGL4qOUJEDzvNB
 1IHLUkfpLqmrh9BLB7nBFz1Utwk0I6udk5N7vUlFrqD8hTovOV/4PdFqQMvpfwGtDgGl
 OBpwq+B++9D9bHMs4+UJFdebQrzWsOEi0qFip7pbUFOHyrM4vKOQ4rw3pP467CdhDRI6
 TZdds2T6WxdZdX8q+/5qKSOrB2+pnwFdKwnnDi912Ttw7ajplQUdXvj71q8B5VRRu5vi
 TLSfBWWHB00ZN54tSizPkO64jMlD+hJDsp5gJmkUW00Yn9ds+Y80bUT4vWI+f78WvvRD
 2J9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767202643; x=1767807443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f/dTXIrnjBfrtWAAe53M4yTIg6PHJwwBbAiaJAY560g=;
 b=nPmt9pwnsNWqAM/Yd1H4H7Mz8PKu8nyI3i1JaKQXsjUavrvk5lmKgtDhIT8rFgvyQC
 MrHwpg6W5lpV6CkqHCF/1CA1W7u8/BLdWd9KaUy272Nw3HAr3q7crYOJ3HzmR+RxyANM
 EpIQQI+9iJju7+6bCwDQYvS7+fRJqy/kaElK6e8JyetNogObjX5ZWcGLRDJY9V25/rqd
 vKdRk8uABoNlNMk5uqBT9JhCe7UL6xQOP2vJmB3oMzWiukcU8+krHMzKZYAbDrvXOVy6
 7W7zkvCz4U37W/VBrrLLjncx/uKcCr/I3bpw6lNi5LALJiqrUaIO2+bAKJ34gjhlEN1o
 fxuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMTjomP5NlRgDmIO1nCCpLYvzB+Q5jiBscGr2G3PxN6IKVLGfDNigmSOElElIg7xojwP7Nq8xsHZBB4g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwBI8Vmq4zACl+L2HNv6OFyHHCrPMFnevthl5E5BeXr4WISO25C
 cyt9aCbmSy20wWM3uahoVYp5AKfjL7L6UWDNu/MSHLSN/RObtWYVJlf/jEX54ay/ztzFVutNRT/
 UEpO3+Ft3wyDfGi1TCjkt3TgoPgvy7gjLdptec5RwbJ2AkWbopsRm
X-Gm-Gg: AY/fxX4Tixp3bvKlp9A7OLkbpI2UhJL6ISfk0ErQLTbMmrqNHnkdKV3kT3eUcR8u58n
 jtAIkk5OXlPi1NRSjKkpfLEqdhhfkTZub9mOr+hoeN0LYED01hYi5iIBMXFuKenC6Z5/4aSLdYF
 Lij56NNEaF6XHZoSJTjsq2/tfxV0jl2H5a/sXB4byCboCxH+27kgb+kBgVaUArcv63QzUsa/OM/
 MMIXLsUGvEoJYljICTSmWYSeg9yZqM+TTpmfTyY8zODg10hPLiGFhnmMeHhqh9jNq8cHna1G5wZ
 bwzGvibVpCMJoohjuxY7OcapuTH/zrwXr+SQs2JRe48TxAEI4l+c8pYF+RgR/PLhJ39o0svqhD9
 OhSbqbSiFyrmoGzTgiFiuSS+qFxM=
X-Google-Smtp-Source: AGHT+IHhyLBBXdXcd64qGHugWh4ro8d1kIl6EG91zJbqyh2VkRbg817M9jTIKM+RDJhLufZ09WLY086diwiw
X-Received: by 2002:a05:6214:20ab:b0:880:4f69:e598 with SMTP id
 6a1803df08f44-88d83797c53mr454639896d6.4.1767202642910; 
 Wed, 31 Dec 2025 09:37:22 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
 by smtp-relay.gmail.com with ESMTPS id
 6a1803df08f44-88d954a7bf3sm49818006d6.11.2025.12.31.09.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 09:37:22 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com
 (dev-csander.dev.purestorage.com [10.49.34.222])
 by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 79E2D3406EF;
 Wed, 31 Dec 2025 10:37:21 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
 id 71A47E4234A; Wed, 31 Dec 2025 10:37:21 -0700 (MST)
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
Date: Wed, 31 Dec 2025 10:36:29 -0700
Message-ID: <20251231173633.3981832-2-csander@purestorage.com>
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
Subject: [Linux-stm32] [PATCH 1/5] bpf: use const pointer for struct_ops
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
point to readonly global memory. Change the void ** casts of cfi_stubs
to void * const * accordingly.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 include/linux/bpf.h         | 2 +-
 kernel/bpf/bpf_struct_ops.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 4e7d72dfbcd4..d74189ea1066 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1977,11 +1977,11 @@ struct bpf_struct_ops {
 			   void *kdata, const void *udata);
 	int (*reg)(void *kdata, struct bpf_link *link);
 	void (*unreg)(void *kdata, struct bpf_link *link);
 	int (*update)(void *kdata, void *old_kdata, struct bpf_link *link);
 	int (*validate)(void *kdata);
-	void *cfi_stubs;
+	void const *cfi_stubs;
 	struct module *owner;
 	const char *name;
 	struct btf_func_model func_models[BPF_STRUCT_OPS_MAX_NR_MEMBERS];
 };
 
diff --git a/kernel/bpf/bpf_struct_ops.c b/kernel/bpf/bpf_struct_ops.c
index c43346cb3d76..42cfc3e0bc68 100644
--- a/kernel/bpf/bpf_struct_ops.c
+++ b/kernel/bpf/bpf_struct_ops.c
@@ -321,11 +321,11 @@ static bool is_module_member(const struct btf *btf, u32 id)
 	return !strcmp(btf_name_by_offset(btf, t->name_off), "module");
 }
 
 int bpf_struct_ops_supported(const struct bpf_struct_ops *st_ops, u32 moff)
 {
-	void *func_ptr = *(void **)(st_ops->cfi_stubs + moff);
+	void *func_ptr = *(void * const *)(st_ops->cfi_stubs + moff);
 
 	return func_ptr ? 0 : -ENOTSUPP;
 }
 
 int bpf_struct_ops_desc_init(struct bpf_struct_ops_desc *st_ops_desc,
@@ -444,11 +444,11 @@ int bpf_struct_ops_desc_init(struct bpf_struct_ops_desc *st_ops_desc,
 				mname, st_ops->name);
 			err = -EINVAL;
 			goto errout;
 		}
 
-		stub_func_addr = *(void **)(st_ops->cfi_stubs + moff);
+		stub_func_addr = *(void * const *)(st_ops->cfi_stubs + moff);
 		err = prepare_arg_info(btf, st_ops->name, mname,
 				       func_proto, stub_func_addr,
 				       arg_info + i);
 		if (err)
 			goto errout;
@@ -833,11 +833,11 @@ static long bpf_struct_ops_map_update_elem(struct bpf_map *map, void *key,
 		*pksym++ = ksym;
 
 		trampoline_start = image_off;
 		err = bpf_struct_ops_prepare_trampoline(tlinks, link,
 						&st_ops->func_models[i],
-						*(void **)(st_ops->cfi_stubs + moff),
+						*(void * const *)(st_ops->cfi_stubs + moff),
 						&image, &image_off,
 						st_map->image_pages_cnt < MAX_TRAMP_IMAGE_PAGES);
 		if (err)
 			goto reset_unlock;
 
-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
