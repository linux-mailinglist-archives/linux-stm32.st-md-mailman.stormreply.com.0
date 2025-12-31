Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0209DCF22B5
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD020C7A850;
	Mon,  5 Jan 2026 07:16:28 +0000 (UTC)
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com
 [209.85.214.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C0D2C57A52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Dec 2025 17:37:25 +0000 (UTC)
Received: by mail-pl1-f226.google.com with SMTP id
 d9443c01a7336-2a2bff5f774so25910015ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Dec 2025 09:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=purestorage.com; s=google2022; t=1767202643; x=1767807443;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CPtJoM4BdsW1AWCT74nIdjccEavCkJ/nIFp8Za4jgwE=;
 b=ZKfAiWISNm3vnhCan9f5nzPMJuQPVKg92xlDdNmyZ/qtc3jSlY0MeqB0lxKAJr0Vzc
 xn6yFnG2s4yHskDcpMTxNCr8vLi+8tEt/WxouFw2ilpeH4p8mvCDziPgx+A8TeW6FNEH
 0F1J/CUKL68JarNlw2S7yzQGe9tO9+z+UsgQoDrQ0/xO/R0E6yeOfPJD3TEoIgv1lIM4
 fwKhUjkXm5wY9GLnn5Sn1JZDy9sWxJ71iMgeSEBY6a/Lzew9tQI/Am7B2wH6ZsXPl32N
 C3k3XFsnm58l4QlRO0Cm0GjInyktIfe0BV4eapO+Q2QiRQ82dOPSWD1o2KoLwSmOLXg4
 1p1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767202643; x=1767807443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CPtJoM4BdsW1AWCT74nIdjccEavCkJ/nIFp8Za4jgwE=;
 b=UlkhcJD6fKQL+AIrSAnf46Ohk+iIbICUZeEpDl2xb5MUE6txaX78TSt5uWu0RPmhh+
 NtRPhjcqoB5/IBJaL0kRBgAs7bXRLXuqIigeLpTPFXCfd+Fed0ckKE1u/ddvWt5WwzLv
 6kyWCmgyrB1KckoJ2Q1mXRA/KTFvRJzVbqkApc50HGq2BoRmeOFsNv5IMp487k1oDupY
 9D9EzBExb6DD0XZPrBFM+A6Bdgupufw7Zl4NPYgK4RHc6SMqPnH5xqx/wEeORJGnDfA8
 RNz40Hjk8dZ4I6hLES0Zi8AUbliUqKHdxqs4UKnfGtIKvj5YonV1tcR42ppFds+SQgtD
 lXLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH30VtwiDb+N6+LdKMEIoZ15gbu1bNyLhql650kZS3z8dOSr2UNsefeF0k6pNJK/0P9VM8coRiw0zivA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyTFo4Epwn3pZYeJaWFsYXMYVHi0q9QH8T6LPxx+SDAmyMAVuKj
 MGGlx/tV+f0my3TeyOQ8jZ0YCWNHG3mShSq3TowSay3VR7bu/qGGVVIILVIHRuGHXQeb4ny9YTR
 FgbyqsJffnvNC4v+2azKjJmgzn+M6F/hHAB5Z/Iz+nTuAwgFt3jP8
X-Gm-Gg: AY/fxX4TP8bp/rhTdKYjZMoS4S6tqyBOuirRcl7tzeIGXz0meRhGoKHy33ecpCrLKXT
 0KXuvo4PKZfjXuGzsVXZGatwSzAu6pfBm/GNnhzTZYPeeWXeqBkAWN6Y75YfPu72B9ay0QTXKa1
 TSdl2eVL8Ut73QgIih8jc/JGho8V3Ts5Ryx4LDsZLjUGRQSeJ6Kp5Zf4Gc1fAwlEBX8b17Dp3LF
 p9jzafqKxnrBd2BHVZ/1zCn+UPQA1Uk6heYuNQW03kAfp/cHQE2ZjJTvr2dduZ943Rzxn4KyBGU
 IM5QCAddIuvvwk+HIfrhr8cJdeEnvIWKA2AFqLWboLuyd5/IF6EuscYJ+tlZOJnIVZCk1dr9vTz
 sEgOxeUrke9CjlVqfXoLgn3MW1hQ=
X-Google-Smtp-Source: AGHT+IE/GKsBsuibLffcNY4jnMOysc9JCkTPS2IwqBtEufH6X/186Szw2JKOD3dV6u7dyuha2hnOZCCfweaH
X-Received: by 2002:a17:903:41cb:b0:295:745a:800a with SMTP id
 d9443c01a7336-2a2f2204346mr260754775ad.2.1767202643449; 
 Wed, 31 Dec 2025 09:37:23 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
 by smtp-relay.gmail.com with ESMTPS id
 d9443c01a7336-2a2f3d06e23sm40792255ad.35.2025.12.31.09.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 09:37:23 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com
 (dev-csander.dev.purestorage.com [10.49.34.222])
 by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id CA55C340879;
 Wed, 31 Dec 2025 10:37:21 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
 id C307BE4234A; Wed, 31 Dec 2025 10:37:21 -0700 (MST)
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
Date: Wed, 31 Dec 2025 10:36:30 -0700
Message-ID: <20251231173633.3981832-3-csander@purestorage.com>
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
Subject: [Linux-stm32] [PATCH 2/5] HID: bpf: make __bpf_hid_bpf_ops const
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
declare the __bpf_hid_bpf_ops global variable it points to as const.
This allows the global variable to be placed in readonly memory.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 drivers/hid/bpf/hid_bpf_struct_ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/bpf/hid_bpf_struct_ops.c b/drivers/hid/bpf/hid_bpf_struct_ops.c
index 702c22fae136..30ddcf78e0ea 100644
--- a/drivers/hid/bpf/hid_bpf_struct_ops.c
+++ b/drivers/hid/bpf/hid_bpf_struct_ops.c
@@ -286,11 +286,11 @@ static int __hid_bpf_hw_request(struct hid_bpf_ctx *ctx, unsigned char reportnum
 static int __hid_bpf_hw_output_report(struct hid_bpf_ctx *ctx, u64 source)
 {
 	return 0;
 }
 
-static struct hid_bpf_ops __bpf_hid_bpf_ops = {
+static const struct hid_bpf_ops __bpf_hid_bpf_ops = {
 	.hid_device_event = __hid_bpf_device_event,
 	.hid_rdesc_fixup = __hid_bpf_rdesc_fixup,
 	.hid_hw_request = __hid_bpf_hw_request,
 	.hid_hw_output_report = __hid_bpf_hw_output_report,
 };
-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
