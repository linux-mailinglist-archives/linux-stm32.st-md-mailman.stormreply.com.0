Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A788A88D03
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Apr 2025 22:27:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05140C7803D;
	Mon, 14 Apr 2025 20:27:43 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1719FC7803B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Apr 2025 20:27:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C4EB94384E;
 Mon, 14 Apr 2025 20:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744662460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qjMFJPpRCPOvsPjgp/zlZf5TXQQY8q9e/fZxYLwtj0c=;
 b=N4HnxsbeyxlL0cI2fjrgbDYOY26mtPrjrWBL3s4rpcNcFbKrZ5oML+muF9dSwIf+R31jOO
 KNd1PzJKTjjfbLK6hep9vPg39UlV0zZF1BKJF267ZKn2J1xoru9QbkUvAEvvzknyjloLJP
 whWw08ja2cuoNe2+omAHJq+d4WWMJz7eKipWxuppjlyBY8Jo9C/UgNEqJDTHPvWP/vWHdm
 5/xJrI+nUBg1sp6a6dvPhPruhokRRYG2wFB5FSR7rUVrXYzQ/nSXIftSCXTb8e6TiR1Qh1
 dpKt+psmNo3zzf34HIghYQmvKiizqjkVg33fTgTDXfhAAH/Cfhn3QN9AUiqQCA==
Mime-Version: 1.0
Date: Mon, 14 Apr 2025 22:27:38 +0200
Message-Id: <D96N84S9OJFA.1L2ME0ASNZH9K@bootlin.com>
To: "Jiri Olsa" <olsajiri@gmail.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <Z_zryQkfmrSXYN4k@krava>
In-Reply-To: <Z_zryQkfmrSXYN4k@krava>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdduheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvfevuffhofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekgfffhfehhfefgeekhfffudfhheekveffleeuhfelgfefueevhedvkeduhfehveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdelpdhrtghpthhtohepohhlshgrjhhirhhisehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghstheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghlsehiohhgvggrrhgsohigrdhnvghtpdhrtghpthhtohepjhhohhhnrdhfrghsthgrsggvnhgusehgmhgrihhlrdgto
 hhmpdhrtghpthhtoheprghnughrihhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrthhinhdrlhgruheslhhinhhugidruggvvhdprhgtphhtthhopegvugguhiiikeejsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhonhhgsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah
 Khan <shuah@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Mykola Lysenko <mykolal@fb.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Will Deacon <will@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Florent Revest <revest@chromium.org>, Puranjay Mohan <puranjay@kernel.org>,
 ebpf@linuxfoundation.org, Xu Kuohai <xukuohai@huaweicloud.com>,
 Alexei Starovoitov <ast@kernel.org>, KP Singh <kpsingh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Hao Luo <haoluo@google.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eduard Zingerman <eddyz87@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, bpf@vger.kernel.org,
 Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [Linux-stm32] [PATCH RFC bpf-next 1/4] bpf: add struct largest
 member size in func model
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

SGVsbG8gSmlyaSwKCk9uIE1vbiBBcHIgMTQsIDIwMjUgYXQgMTowNCBQTSBDRVNULCBKaXJpIE9s
c2Egd3JvdGU6Cj4gT24gRnJpLCBBcHIgMTEsIDIwMjUgYXQgMTA6MzI6MTBQTSArMDIwMCwgQWxl
eGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24pIHdyb3RlOgoKWy4uLl0KCj4+ICsJZm9yX2Vh
Y2hfbWVtYmVyKGksIHQsIG1lbWJlcikgewo+PiArCQltdHlwZSA9IGJ0Zl90eXBlX2J5X2lkKGJ0
ZiwgbWVtYmVyLT50eXBlKTsKPj4gKwkJd2hpbGUgKG10eXBlICYmIGJ0Zl90eXBlX2lzX21vZGlm
aWVyKG10eXBlKSkKPj4gKwkJCW10eXBlID0gYnRmX3R5cGVfYnlfaWQoYnRmLCBtdHlwZS0+dHlw
ZSk7Cj4+ICsJCWlmICghbXR5cGUpCj4+ICsJCQlyZXR1cm4gLUVJTlZBTDsKPgo+IHNob3VsZCB3
ZSB1c2UgX19nZXRfdHlwZV9zaXplIGZvciBtZW1iZXItPnR5cGUgaW5zdGVhZCA/CgpBaCwgeWVz
LCB0aGFua3MgZm9yIHRoZSBoaW50LCB0aGF0IHdpbGwgYWxsb3cgdG8gZ2V0IHJpZCBvZiB0aGUg
bWFudWFsCm1vZGlmaWVycyBza2lwLgoKQWxleGlzCj4gamlya2EKCi0tIApBbGV4aXMgTG90aG9y
w6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczov
L2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
