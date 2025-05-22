Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7854BAC0992
	for <lists+linux-stm32@lfdr.de>; Thu, 22 May 2025 12:15:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B2C8C7A825;
	Thu, 22 May 2025 10:15:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E8D0C78F98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 May 2025 10:15:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 35A5D1FCF1;
 Thu, 22 May 2025 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1747908910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AHN+uDsSXaJTkD0laSVsn0A5Nrq0eTHXt3UKaa7Mqnc=;
 b=gOTCFH5fXnKEP4oBEUAtjcxqaAlhgjfxp68u2sn+IGlpTCSm8qzOg7tH0jQGY2YKZquLA9
 HuXYO2Z978NtYwWJBo9upcedORcppYHHAWJKMlEleLYNmzvob6pQ5l5Bk4SJOE3QgulYEQ
 wxGpN3DCPCgpk0e6Vj2XktvptKVBpWa44xf+Aru6Pa+bB+zxSapvacERK/5k2VdOutlTYi
 aOmR4qTVEL8DKG+sBAbOmf5TQ8iu3qQTviTifZb+jGwUbgGyV6CsLpCiyV9ZhRCPZjLhqL
 /zphSjB5sGRlVL/dtL1EOJm8xCWM8gfLZzu/osmCOfyFZhdk6EE5kBjckKtE7w==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Date: Thu, 22 May 2025 12:14:41 +0200
MIME-Version: 1.0
Message-Id: <20250522-many_args_arm64-v2-2-d6afdb9cf819@bootlin.com>
References: <20250522-many_args_arm64-v2-0-d6afdb9cf819@bootlin.com>
In-Reply-To: <20250522-many_args_arm64-v2-0-d6afdb9cf819@bootlin.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 Xu Kuohai <xukuohai@huaweicloud.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Florent Revest <revest@chromium.org>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehieelucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhorucdlvgeurffhucfhohhunhgurghtihhonhdmuceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeljeektefffeevleegkeelhfethffgieegudevffejheelieeffeejtddujeegueenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvudgnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopehlihhnuhigqdhkshgvlhhfthgvshhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggrshhtihgvnhdrtghurhhuthgthhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehshhhurghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeiguhhkuhhoh
 hgriheshhhurgifvghitghlohhuugdrtghomhdprhgtphhtthhopehjohhlshgrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkphhsihhnghhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvsghpfheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: linux-kselftest@vger.kernel.org,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, ebpf@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH bpf-next v2 2/2] selftests/bpf: enable
 many-args tests for arm64
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Tm93IHRoYXQgc3VwcG9ydCBmb3IgdXAgdG8gMTIgYXJncyBpcyBlbmFibGVkIGZvciB0cmFjaW5n
IHByb2dyYW1zIG9uCkFSTTY0LCBlbmFibGUgdGhlIGV4aXN0aW5nIHRlc3RzIGZvciB0aGlzIGZl
YXR1cmUgb24gdGhpcyBhcmNoaXRlY3R1cmUuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9y
w6kgKGVCUEYgRm91bmRhdGlvbikgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0KQ2hh
bmdlcyBpbiB2MjoKLSBrZWVwIHRyYWNpbmcgc3RydWN0IHRlc3RzIGRpc2FibGVkLCBhcyBzdHJ1
Y3RzIHBhc3NlZCBvbiBzdGFjayBhcmUgbm90CiAgaGFuZGxlZCBieSB0aGUgbmV3IHJldmlzaW9u
Ci0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL0RFTllMSVNULmFhcmNoNjQgfCAyIC0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9icGYvREVOWUxJU1QuYWFyY2g2NCBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2JwZi9ERU5ZTElTVC5hYXJjaDY0CmluZGV4IDZkOGZlZGEyN2NlOWRlMDdkNzdkNmUzODQ2
NjYwODI5MjNlM2RjNzYuLjEyZTk5YzAyNzdhOGNiZjllNjNlOGY2ZDNhMTA4YzhhMTIwODQwN2Ig
MTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9ERU5ZTElTVC5hYXJjaDY0
CisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9ERU5ZTElTVC5hYXJjaDY0CkBAIC0x
LDMgKzEgQEAKLWZlbnRyeV90ZXN0L2ZlbnRyeV9tYW55X2FyZ3MgICAgICAgICAgICAgICAgICAg
ICAjIGZlbnRyeV9tYW55X2FyZ3M6RkFJTDpmZW50cnlfbWFueV9hcmdzX2F0dGFjaCB1bmV4cGVj
dGVkIGVycm9yOiAtNTI0Ci1mZXhpdF90ZXN0L2ZleGl0X21hbnlfYXJncyAgICAgICAgICAgICAg
ICAgICAgICAgIyBmZXhpdF9tYW55X2FyZ3M6RkFJTDpmZXhpdF9tYW55X2FyZ3NfYXR0YWNoIHVu
ZXhwZWN0ZWQgZXJyb3I6IC01MjQKIHRyYWNpbmdfc3RydWN0L3N0cnVjdF9tYW55X2FyZ3MgICAg
ICAgICAgICAgICAgICAjIHN0cnVjdF9tYW55X2FyZ3M6RkFJTDp0cmFjaW5nX3N0cnVjdF9tYW55
X2FyZ3NfX2F0dGFjaCB1bmV4cGVjdGVkIGVycm9yOiAtNTI0CgotLSAKMi40OS4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
