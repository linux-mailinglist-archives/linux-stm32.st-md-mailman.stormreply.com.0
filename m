Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD97CA8672D
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Apr 2025 22:32:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 764ABC78F67;
	Fri, 11 Apr 2025 20:32:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC3E9C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Apr 2025 20:32:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E33A439F7;
 Fri, 11 Apr 2025 20:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744403545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ubuKm8CEtpcOaMisxU9dLcEBpCyqH9xv+s9t40knzhQ=;
 b=bUWKuQ0Ec7Enbe5JweK3jfBowxndLsuHmjklLcqXu/lZEHUjGcp7upJ6wZH1C1BqVyxaJA
 1VPtBdBvfNwDNGMbavInD66RnojP+d3tiYiz4rQ/rfU7+VjZCw7t0z4SUf0A2dl28VsMlW
 bKj/3cl9+WRGD/o2iarX2ut3XCzdcFnNdWIrZ7cNtjwotm+sgGc4nMAXVrcPbFQxXRc+wq
 3/JAjqYxwxUE538Z89Y7ex+mSgfcx6hT0KxhkGBmLX4q+0rUNkmyzzrUWRkwJj21wBet18
 ubu/5mUcIQ4t8Azcc6pWFR+X6dBQMewHzeMmXAsJ0vTxWwv33GBClEG/GXJQRg==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Date: Fri, 11 Apr 2025 22:32:13 +0200
MIME-Version: 1.0
Message-Id: <20250411-many_args_arm64-v1-4-0a32fe72339e@bootlin.com>
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
In-Reply-To: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddvjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhorucdlvgeurffhucfhohhunhgurghtihhonhdmuceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeljeektefffeevleegkeelhfethffgieegudevffejheelieeffeejtddujeegueenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplgduledvrdduieekrddurdduleejngdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtohepshgufhesfhhomhhitghhvghvrdhmvgdprhgtphhtthhopehmrghrthhinhdrlhgruheslhhinhhugidruggvvhdprhgtphhtthhopeiguhhkuhhohhgriheshhhurgifvghitghlohhuugdrtghomhdprhgtphhtthhopehjohhlshgrsehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmhihkohhlrghlsehfsgdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgtohhquhgvlhhinhdrshhtmhefvdesghhmrghilhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: linux-kselftest@vger.kernel.org,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, ebpf@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC bpf-next 4/4] bpf/selftests: enable
 tracing tests for ARM64
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

VGhlIGZlbnRyeV9tYW55X2FyZ3MsIGZleGl0X21hbnlfYXJncyBhbmQgc3RydWN0X21hbnlfYXJn
cyB0ZXN0cyB3ZXJlCmRpc2FibGVkIG9uIEFSTTY0IGR1ZSB0byB0aGUgbGFjayBvZiBtYW55IGFy
Z3Mgc3VwcG9ydC4KCldpdGggdGhlIHByZXZpb3VzIGNvbW1pdHMgYnJpbmdpbmcgaW4gdGhpcyBt
aXNzaW5nIHN1cHBvcnQsIGRyb3AgdGhlCmxhc3QgZGVuaWVkIHRlc3RzLgoKU2lnbmVkLW9mZi1i
eTogQWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24pIDxhbGV4aXMubG90aG9yZUBib290
bGluLmNvbT4KLS0tCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvREVOWUxJU1QuYWFyY2g2
NCB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvREVOWUxJU1QuYWFyY2g2NCBiL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2JwZi9ERU5ZTElTVC5hYXJjaDY0CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCA2ZDhmZWRhMjdjZTlkZTA3ZDc3ZDZlMzg0NjY2MDgyOTIzZTNkYzc2Li4wMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwCi0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2JwZi9ERU5ZTElTVC5hYXJjaDY0CisrKyAvZGV2L251bGwKQEAgLTEsMyArMCwwIEBA
Ci1mZW50cnlfdGVzdC9mZW50cnlfbWFueV9hcmdzICAgICAgICAgICAgICAgICAgICAgIyBmZW50
cnlfbWFueV9hcmdzOkZBSUw6ZmVudHJ5X21hbnlfYXJnc19hdHRhY2ggdW5leHBlY3RlZCBlcnJv
cjogLTUyNAotZmV4aXRfdGVzdC9mZXhpdF9tYW55X2FyZ3MgICAgICAgICAgICAgICAgICAgICAg
ICMgZmV4aXRfbWFueV9hcmdzOkZBSUw6ZmV4aXRfbWFueV9hcmdzX2F0dGFjaCB1bmV4cGVjdGVk
IGVycm9yOiAtNTI0Ci10cmFjaW5nX3N0cnVjdC9zdHJ1Y3RfbWFueV9hcmdzICAgICAgICAgICAg
ICAgICAgIyBzdHJ1Y3RfbWFueV9hcmdzOkZBSUw6dHJhY2luZ19zdHJ1Y3RfbWFueV9hcmdzX19h
dHRhY2ggdW5leHBlY3RlZCBlcnJvcjogLTUyNAoKLS0gCjIuNDkuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
