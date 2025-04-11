Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 709A1A8672A
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Apr 2025 22:32:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36FBEC78028;
	Fri, 11 Apr 2025 20:32:22 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2411BC78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Apr 2025 20:32:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 285C4439D4;
 Fri, 11 Apr 2025 20:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744403540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0Lf7W9bQWXXAkTM40dnJ+uKraq0dPHGV+hXAWhTfnE=;
 b=VpzGMXts8vgeVU0Ddi28PFbkrr/1n86d1hEvDDcle5wS5M0lcVaWSGqTxCtPLuPev9r/Tx
 E2ORWC9W6nXSL8Y18Wo/dJEmtwBjAQT0DAPcPgEC6ihScWncCoiKeKZ1H+y7Jr9SiVrTAY
 LhaDvIx9k7Fku99th6Vtjs4eoHgyeZleFXOszZbgeSoDGiHw52wkOusp3dz5Oo3lR+OpEC
 RUvZgfKfzXSwDwmgolZgjTWZtlIOvpsBZv8yzn9ma4AxcVQaiLEsbgi2imv8inV7yEU55Q
 HQX9Pzt0vzhuue/BtlfvqOoZumlBd3DBNUQfA4S7DnePLIztKZtYJrTopLvZHQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Date: Fri, 11 Apr 2025 22:32:10 +0200
MIME-Version: 1.0
Message-Id: <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddvjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhorucdlvgeurffhucfhohhunhgurghtihhonhdmuceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeljeektefffeevleegkeelhfethffgieegudevffejheelieeffeejtddujeegueenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplgduledvrdduieekrddurdduleejngdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtohepshgufhesfhhomhhitghhvghvrdhmvgdprhgtphhtthhopehmrghrthhinhdrlhgruheslhhinhhugidruggvvhdprhgtphhtthhopeiguhhkuhhohhgriheshhhurgifvghitghlohhuugdrtghomhdprhgtphhtthhopehjohhlshgrsehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmhihkohhlrghlsehfsgdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgtohhquhgvlhhinhdrshhtmhefvdesghhmrghilhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: linux-kselftest@vger.kernel.org,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, ebpf@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC bpf-next 1/4] bpf: add struct largest
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

SW4gb3JkZXIgdG8gcHJvcGVybHkgSklUIHRoZSB0cmFtcG9saW5lcyBuZWVkZWQgdG8gYXR0YWNo
IEJQRiBwcm9ncmFtcwp0byBmdW5jdGlvbnMsIHNvbWUgYXJjaGl0ZWN0dXJlcyBsaWtlIEFSTTY0
IG5lZWQgdG8ga25vdyBhYm91dCB0aGUKYWxpZ25tZW50IG5lZWRlZCBmb3IgdGhlIGZ1bmN0aW9u
IGFyZ3VtZW50cy4gU3VjaCBhbGlnbm1lbnQgY2FuCmdlbmVyYWxseSBiZSBkZWR1Y2VkIGZyb20g
dGhlIGFyZ3VtZW50IHNpemUsIGJ1dCB0aGF0J3Mgbm90IGNvbXBsZXRlbHkKdHJ1ZSBmb3IgY29t
cG9zaXRlIHR5cGVzLiBJbiB0aGUgc3BlY2lmaWMgY2FzZSBvZiBBUk02NCwgdGhlIEFBUENTNjQg
QUJJCmRlZmluZXMgdGhhdCBhIGNvbXBvc2l0ZSB0eXBlIHdoaWNoIG5lZWRzIHRvIGJlIHBhc3Nl
ZCB0aHJvdWdoIHN0YWNrCm11c3QgYmUgYWxpZ25lZCBvbiB0aGUgbWF4aW11bSBiZXR3ZWVuIDgg
YW5kIHRoZSBsYXJnZXN0IGFsaWdubWVudApjb25zdHJhaW50IG9mIGl0cyBmaXJzdC1sZXZlbCBt
ZW1iZXJzLiBTbyB0aGUgSklUIGNvbXBpbGVyIG5lZWRzIG1vcmUKaW5mb3JtYXRpb24gYWJvdXQg
dGhlIGFyZ3VtZW50cyB0byBtYWtlIHN1cmUgdG8gZ2VuZXJhdGUgY29kZSB0aGF0CnJlc3BlY3Rz
IHRob3NlIGFsaWdubWVudCBjb25zdHJhaW50cy4KCkZvciBzdHJ1Y3QgYXJndW1lbnRzLCBhZGQg
aW5mb3JtYXRpb24gYWJvdXQgdGhlIHNpemUgb2YgdGhlIGxhcmdlc3QKZmlyc3QtbGV2ZWwgbWVt
YmVyIGluIHRoZSBzdHJ1Y3QgYnRmX2Z1bmNfbW9kZWwgdG8gYWxsb3cgdGhlIEpJVApjb21waWxl
ciB0byBndWVzcyB0aGUgbmVlZGVkIGFsaWdubWVudC4gVGhlIGluZm9ybWF0aW9uIGlzIHF1aXRl
CnNwZWNpZmljLCBidXQgaXQgYWxsb3dzIHRvIGtlZXAgYXJjaC1zcGVjaWZpYyBjb25jZXJucyAo
aWU6IGd1ZXNzaW5nIHRoZQpmaW5hbCBuZWVkZWQgYWxpZ25tZW50IGZvciBhbiBhcmd1bWVudCkg
aXNvbGF0ZWQgaW4gZWFjaCBKSVQgY29tcGlsZXIuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90
aG9yw6kgKGVCUEYgRm91bmRhdGlvbikgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0K
IGluY2x1ZGUvbGludXgvYnBmLmggfCAgMSArCiBrZXJuZWwvYnBmL2J0Zi5jICAgIHwgMjUgKysr
KysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9icGYuaCBiL2luY2x1ZGUvbGludXgvYnBmLmgK
aW5kZXggM2YwY2M4OWMwNjIyY2IxYTA5Nzk5OWFmYjc4YzE3MTAyNTkzYjZiYi4uOGIzNGRjZjYw
YTBjZTA5MjI4ZmY3NjFiOTYyYWI2N2I2YTNlMjI2MyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51
eC9icGYuaAorKysgYi9pbmNsdWRlL2xpbnV4L2JwZi5oCkBAIC0xMTA2LDYgKzExMDYsNyBAQCBz
dHJ1Y3QgYnRmX2Z1bmNfbW9kZWwgewogCXU4IG5yX2FyZ3M7CiAJdTggYXJnX3NpemVbTUFYX0JQ
Rl9GVU5DX0FSR1NdOwogCXU4IGFyZ19mbGFnc1tNQVhfQlBGX0ZVTkNfQVJHU107CisJdTggYXJn
X2xhcmdlc3RfbWVtYmVyX3NpemVbTUFYX0JQRl9GVU5DX0FSR1NdOwogfTsKIAogLyogUmVzdG9y
ZSBhcmd1bWVudHMgYmVmb3JlIHJldHVybmluZyBmcm9tIHRyYW1wb2xpbmUgdG8gbGV0IG9yaWdp
bmFsIGZ1bmN0aW9uCmRpZmYgLS1naXQgYS9rZXJuZWwvYnBmL2J0Zi5jIGIva2VybmVsL2JwZi9i
dGYuYwppbmRleCAxNmJhMzZmMzRkZmFiNzUzMWJhYmY1NzUzY2FiOWYzNjhjZGRlZmEzLi41ZDQw
OTExZWM5MDIxMDA4NmE2MTc1ZDU2OWFiYjZlNTJkNzVhZDE3IDEwMDY0NAotLS0gYS9rZXJuZWwv
YnBmL2J0Zi5jCisrKyBiL2tlcm5lbC9icGYvYnRmLmMKQEAgLTczMTgsNiArNzMxOCwyOSBAQCBz
dGF0aWMgaW50IF9fZ2V0X3R5cGVfc2l6ZShzdHJ1Y3QgYnRmICpidGYsIHUzMiBidGZfaWQsCiAJ
cmV0dXJuIC1FSU5WQUw7CiB9CiAKK3N0YXRpYyB1OCBfX2dldF9sYXJnZXN0X21lbWJlcl9zaXpl
KHN0cnVjdCBidGYgKmJ0ZiwgY29uc3Qgc3RydWN0IGJ0Zl90eXBlICp0KQoreworCWNvbnN0IHN0
cnVjdCBidGZfbWVtYmVyICptZW1iZXI7CisJY29uc3Qgc3RydWN0IGJ0Zl90eXBlICptdHlwZTsK
Kwl1OCBsYXJnZXN0X21lbWJlcl9zaXplID0gMDsKKwlpbnQgaTsKKworCWlmICghX19idGZfdHlw
ZV9pc19zdHJ1Y3QodCkpCisJCXJldHVybiBsYXJnZXN0X21lbWJlcl9zaXplOworCisJZm9yX2Vh
Y2hfbWVtYmVyKGksIHQsIG1lbWJlcikgeworCQltdHlwZSA9IGJ0Zl90eXBlX2J5X2lkKGJ0Ziwg
bWVtYmVyLT50eXBlKTsKKwkJd2hpbGUgKG10eXBlICYmIGJ0Zl90eXBlX2lzX21vZGlmaWVyKG10
eXBlKSkKKwkJCW10eXBlID0gYnRmX3R5cGVfYnlfaWQoYnRmLCBtdHlwZS0+dHlwZSk7CisJCWlm
ICghbXR5cGUpCisJCQlyZXR1cm4gLUVJTlZBTDsKKwkJaWYgKG10eXBlLT5zaXplID4gbGFyZ2Vz
dF9tZW1iZXJfc2l6ZSkKKwkJCWxhcmdlc3RfbWVtYmVyX3NpemUgPSBtdHlwZS0+c2l6ZTsKKwl9
CisKKwlyZXR1cm4gbGFyZ2VzdF9tZW1iZXJfc2l6ZTsKK30KKwogc3RhdGljIHU4IF9fZ2V0X3R5
cGVfZm1vZGVsX2ZsYWdzKGNvbnN0IHN0cnVjdCBidGZfdHlwZSAqdCkKIHsKIAl1OCBmbGFncyA9
IDA7CkBAIC03Mzk2LDYgKzc0MTksOCBAQCBpbnQgYnRmX2Rpc3RpbGxfZnVuY19wcm90byhzdHJ1
Y3QgYnBmX3ZlcmlmaWVyX2xvZyAqbG9nLAogCQl9CiAJCW0tPmFyZ19zaXplW2ldID0gcmV0Owog
CQltLT5hcmdfZmxhZ3NbaV0gPSBfX2dldF90eXBlX2Ztb2RlbF9mbGFncyh0KTsKKwkJbS0+YXJn
X2xhcmdlc3RfbWVtYmVyX3NpemVbaV0gPQorCQkJX19nZXRfbGFyZ2VzdF9tZW1iZXJfc2l6ZShi
dGYsIHQpOwogCX0KIAltLT5ucl9hcmdzID0gbmFyZ3M7CiAJcmV0dXJuIDA7CgotLSAKMi40OS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
