Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEEFAD8444
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 09:37:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F401C36B3C;
	Fri, 13 Jun 2025 07:37:41 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC1EBC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 07:37:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 88A9C44516;
 Fri, 13 Jun 2025 07:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1749800260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AE8ksX7Iai+R1M5VXIrdzL2o9dpfxU46gR1hgNGIp3g=;
 b=kvD2hrpD62fIseyftMWMe0jHM9CAcsYLN8R7Xc6MonWGBLp7j1sio+s3HcvX7iPfzC/8h8
 getABYjlm0kibtX6MId+UBJ9HmyRY30O6f5FyYUYWuUd8PDdov6JURNzzP4S+uSdsJSv4q
 XEb+KK+3h6voonmJL7D85NyAtp25lNiRQMRalDJ3kPboHbjNLpH55lSoe5q2znNNkOnL81
 8DtdUSstHOPVtwdZHqSvS3c5RAY9y45B+vRcTVgadBsa9GwE1sAcrWV87jhqCt7RWiB26X
 LiMUIN4BZaGLJ52spVpVwWII1yY7zWXf+/2MwJYIcUGxuNPNiZ1HJdUWRRohqg==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Date: Fri, 13 Jun 2025 09:37:13 +0200
MIME-Version: 1.0
Message-Id: <20250613-deny_trampoline_structs_on_stack-v1-4-5be9211768c3@bootlin.com>
References: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com>
In-Reply-To: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Menglong Dong <imagedong@tencent.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrroculdgvuefrhfcuhfhouhhnuggrthhiohhnmdcuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleejkeetffefveelgeeklefhtefhgfeigeduveffjeehleeifeefjedtudejgeeunecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopegludelvddrudeikedruddrudeljegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehkedprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghgohhruggvvghvsehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtthhopehlihhnuhigq
 dhkshgvlhhfthgvshhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhtmhefvdesshhtqdhmugdqmhgrihhlmhgrnhdrshhtohhrmhhrvghplhihrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepmhihkhholhgrlhesfhgsrdgtohhmpdhrtghpthhtohepshhvvghnsheslhhinhhugidrihgsmhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 ebpf@linuxfoundation.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH bpf 4/7] bpf/s390: prevent trampoline
 attachment when args location on stack is uncertain
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

V2hlbiB0aGUgdGFyZ2V0IGZ1bmN0aW9uIHJlY2VpdmVzIG1vcmUgYXJndW1lbnRzIHRoYW4gYXZh
aWxhYmxlCnJlZ2lzdGVycywgdGhlIGFkZGl0aW9uYWwgYXJndW1lbnRzIGFyZSBwYXNzZWQgb24g
c3RhY2ssIGFuZCBzbyB0aGUKZ2VuZXJhdGVkIHRyYW1wb2xpbmUgbmVlZHMgdG8gcmVhZCB0aG9z
ZSB0byBwcmVwYXJlIHRoZSBicGYgY29udGV4dCwgYnV0CmFsc28gdG8gcHJlcGFyZSB0aGUgdGFy
Z2V0IGZ1bmN0aW9uIHN0YWNrIHdoZW4gaXQgaXMgaW4gY2hhcmdlIG9mCmNhbGxpbmcgaXQuIFRo
aXMgd29ya3Mgd2VsbCBmb3Igc2NhbGFyIHR5cGVzLCBidXQgaWYgdGhlIHZhbHVlIGlzIGEKc3Ry
dWN0LCB3ZSBjYW4gbm90IGtub3cgZm9yIHN1cmUgdGhlIGV4YWN0IHN0cnVjdCBsb2NhdGlvbiwg
YXMgaXQgbWF5CmhhdmUgYmVlbiBwYWNrZWQgb3IgbWFudWFsbHkgYWxpZ25lZCB0byBhIGdyZWF0
ZXIgdmFsdWUuCgpQcmV2ZW50IHdyb25nIHJlYWRpbmdzIGJ5IHJlZnVzaW5nIHRyYW1wb2xpbmUg
YXR0YWNobWVudCBpZiB0aGUgdGFyZ2V0CmZ1bmN0aW9uIHJlY2VpdmVzIGEgc3RydWN0IG9uIHN0
YWNrLiBXaGlsZSBkb2luZyBzbywgbW92ZSB0aGUgZXhpc3RpbmcKY2hlY2sgKGVuc3VyaW5nIHRo
YXQgdGhlIG51bWJlciBvZiBhcmdzIHBhc3NlZCBvbiBzdGFjayBpcyBub3QgaGlnaGVyCnRoYW4g
TUFYX05SX1NUQUNLX0FSR1MpIGludG8gdGhlIG5ld2x5IGNyZWF0ZWQgY2hlY2sgZnVuY3Rpb24u
CgpGaXhlczogNTI4ZWIyY2I4N2JjICgiczM5MC9icGY6IEltcGxlbWVudCBhcmNoX3ByZXBhcmVf
YnBmX3RyYW1wb2xpbmUoKSIpClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBG
b3VuZGF0aW9uKSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0tLQogYXJjaC9zMzkwL25l
dC9icGZfaml0X2NvbXAuYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC9zMzkwL25ldC9icGZfaml0X2NvbXAuYyBiL2FyY2gvczM5MC9uZXQvYnBmX2pp
dF9jb21wLmMKaW5kZXggYzdmODMxM2JhNDQ5NzE2YThmMThlYWZkZWI2Yzc3ZWQzYjIzZjUyZS4u
YjQ0MWZlYjIwZTk5M2Y1NGNjMGU5YTM5YzY3YTcyNmY0YjYxZDlmMiAxMDA2NDQKLS0tIGEvYXJj
aC9zMzkwL25ldC9icGZfaml0X2NvbXAuYworKysgYi9hcmNoL3MzOTAvbmV0L2JwZl9qaXRfY29t
cC5jCkBAIC0yNTY2LDYgKzI1NjYsMjcgQEAgc3RhdGljIGludCBhbGxvY19zdGFjayhzdHJ1Y3Qg
YnBmX3RyYW1wX2ppdCAqdGppdCwgc2l6ZV90IHNpemUpCiAvKiAtbWZlbnRyeSBnZW5lcmF0ZXMg
YSA2LWJ5dGUgbm9wIG9uIHMzOTB4LiAqLwogI2RlZmluZSBTMzkwWF9QQVRDSF9TSVpFIDYKIAor
c3RhdGljIGludCB2YWxpZGF0ZV9hcmdzKGNvbnN0IHN0cnVjdCBidGZfZnVuY19tb2RlbCAqbSkK
K3sKKwlpbnQgaSA9IDAsIG5yX3JlZ19hcmdzLCBucl9zdGFja19hcmdzOworCisJbnJfcmVnX2Fy
Z3MgPSBtaW5fdChpbnQsIG0tPm5yX2FyZ3MsIE1BWF9OUl9SRUdfQVJHUyk7CisJbnJfc3RhY2tf
YXJncyA9IG0tPm5yX2FyZ3MgLSBucl9yZWdfYXJnczsKKworCWlmIChucl9zdGFja19hcmdzID09
IDApCisJCXJldHVybiAwOworCisJLyogU3VwcG9ydCBhcyBtYW55IHN0YWNrIGFyZ3VtZW50cyBh
cyAibXZjIiBpbnN0cnVjdGlvbiBjYW4gaGFuZGxlLiAqLworCWlmIChucl9zdGFja19hcmdzID4g
TUFYX05SX1NUQUNLX0FSR1MpCisJCXJldHVybiAtRU5PVFNVUFA7CisKKwlmb3IgKGkgPSBucl9y
ZWdfYXJnczsgaSA8IG0tPm5yX2FyZ3M7IGkrKykKKwkJaWYgKG0tPmFyZ19mbGFnc1tpXSAmIEJU
Rl9GTU9ERUxfU1RSVUNUX0FSRykKKwkJCXJldHVybiAtRU5PVFNVUFA7CisKKwlyZXR1cm4gMDsK
K30KKwogc3RhdGljIGludCBfX2FyY2hfcHJlcGFyZV9icGZfdHJhbXBvbGluZShzdHJ1Y3QgYnBm
X3RyYW1wX2ltYWdlICppbSwKIAkJCQkJIHN0cnVjdCBicGZfdHJhbXBfaml0ICp0aml0LAogCQkJ
CQkgY29uc3Qgc3RydWN0IGJ0Zl9mdW5jX21vZGVsICptLApAQCAtMjU3OSwxMyArMjYwMCwxNyBA
QCBzdGF0aWMgaW50IF9fYXJjaF9wcmVwYXJlX2JwZl90cmFtcG9saW5lKHN0cnVjdCBicGZfdHJh
bXBfaW1hZ2UgKmltLAogCWludCBucl9icGZfYXJncywgbnJfcmVnX2FyZ3MsIG5yX3N0YWNrX2Fy
Z3M7CiAJc3RydWN0IGJwZl9qaXQgKmppdCA9ICZ0aml0LT5jb21tb247CiAJaW50IGFyZywgYnBm
X2FyZ19vZmY7Ci0JaW50IGksIGo7CisJaW50IGksIGosIHJldDsKKworCS8qIG1ha2Ugc3VyZSB0
aGF0IGFueSBhcmd1bWVudCBjYW4gYmUgbG9jYXRlZCBhbmQgcHJvY2Vzc2VkIGJ5IHRoZQorCSAq
IHRyYW1wb2xpbmUKKwkgKi8KKwlyZXQgPSB2YWxpZGF0ZV9hcmdzKG0pOworCWlmIChyZXQpCisJ
CXJldHVybiByZXQ7CiAKLQkvKiBTdXBwb3J0IGFzIG1hbnkgc3RhY2sgYXJndW1lbnRzIGFzICJt
dmMiIGluc3RydWN0aW9uIGNhbiBoYW5kbGUuICovCiAJbnJfcmVnX2FyZ3MgPSBtaW5fdChpbnQs
IG0tPm5yX2FyZ3MsIE1BWF9OUl9SRUdfQVJHUyk7CiAJbnJfc3RhY2tfYXJncyA9IG0tPm5yX2Fy
Z3MgLSBucl9yZWdfYXJnczsKLQlpZiAobnJfc3RhY2tfYXJncyA+IE1BWF9OUl9TVEFDS19BUkdT
KQotCQlyZXR1cm4gLUVOT1RTVVBQOwogCiAJLyogUmV0dXJuIHRvICVyMTQgaW4gdGhlIHN0cnVj
dF9vcHMgY2FzZS4gKi8KIAlpZiAoZmxhZ3MgJiBCUEZfVFJBTVBfRl9JTkRJUkVDVCkKCi0tIAoy
LjQ5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
