Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F77AD8447
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 09:37:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DE80C36B31;
	Fri, 13 Jun 2025 07:37:45 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E139BC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 07:37:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5C3D4451B;
 Fri, 13 Jun 2025 07:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1749800263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eeLleyfYulrm7/2JkDlmDKQ+W0qM+PQ6c1Xd/a6HciU=;
 b=PbUsx0iacezWvrE6A20Xyl+42FRd0/58MVH7JIf9elFbkDG3eJJOpPGahhO/fOwo06e7Gb
 v1In1Q/JhMx10WL0FVaMQLv8yM7qi6hl4gjHJBEBAadUl1AlxaXU/7UanahRe8NY82lPHT
 RIaBdWnX4B0AsjT9RnzYiuAtLL1q9vrkkVxg0R0brkQ9Wd4kPpfHCimyNG1cFEFCLp+eo+
 aZJ1YSyI68DwRMuA/gSfC4kdCpB5pK58wK19PUAQ6eYzrFh0n+serqJ33z6xPgAI6tCkyK
 jpHHzO+7YONhWsDauoIHYDC0ETlCR6ocSRSRHBCtmX/Qt7CSafBTpS9Q9PAfjQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Date: Fri, 13 Jun 2025 09:37:14 +0200
MIME-Version: 1.0
Message-Id: <20250613-deny_trampoline_structs_on_stack-v1-5-5be9211768c3@bootlin.com>
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
Subject: [Linux-stm32] [PATCH bpf 5/7] bpf/powerpc64: use define for max
 regs count used for arguments
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

cG93ZXJwYyBhbGxvd3MgdXNpbmcgdXAgdG8gOCByZWdpc3RlcnMgdG8gcGFzcyBhcmd1bWVudHMg
YmV0d2VlbiBmdW5jdGlvbgpjYWxscy4gVGhpcyB2YWx1ZSBpcyBoYXJkY29kZWQgaW4gbXVsdGlw
bGUgcGxhY2VzLCB1c2UgYSBkZWZpbmUgZm9yIHRoaXMKdmFsdWUuCgpTaWduZWQtb2ZmLWJ5OiBB
bGV4aXMgTG90aG9yw6kgKGVCUEYgRm91bmRhdGlvbikgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4u
Y29tPgotLS0KIGFyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wLmMgfCAxMCArKysrKysrLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2FyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wLmMgYi9hcmNoL3Bvd2VycGMvbmV0
L2JwZl9qaXRfY29tcC5jCmluZGV4IGMwNjg0NzMzZTlkNmFjNzliNGNmNjUzYmYxYjlhZDQwZWIz
ZTFhY2EuLmQzMTM5MjBhNDJjMjMxMGM2YjVkZWFiNmQ4MmUxM2FmNDljOGVjYjEgMTAwNjQ0Ci0t
LSBhL2FyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wLmMKKysrIGIvYXJjaC9wb3dlcnBjL25l
dC9icGZfaml0X2NvbXAuYwpAQCAtMjIsNiArMjIsOCBAQAogCiAjaW5jbHVkZSAiYnBmX2ppdC5o
IgogCisjZGVmaW5lIE1BWF9SRUdTX0ZPUl9BUkdTCTgKKwogLyogVGhlc2Ugb2Zmc2V0cyBhcmUg
ZnJvbSBicGYgcHJvZyBlbmQgYW5kIHN0YXkgdGhlIHNhbWUgYWNyb3NzIHByb2dzICovCiBzdGF0
aWMgaW50IGJwZl9qaXRfb29sX3N0dWIsIGJwZl9qaXRfbG9uZ19icmFuY2hfc3R1YjsKIApAQCAt
NjEzLDcgKzYxNSw3IEBAIHN0YXRpYyB2b2lkIGJwZl90cmFtcG9saW5lX3NhdmVfYXJncyh1MzIg
KmltYWdlLCBzdHJ1Y3QgY29kZWdlbl9jb250ZXh0ICpjdHgsIGluCiAJcGFyYW1fc2F2ZV9hcmVh
X29mZnNldCArPSBTVEFDS19GUkFNRV9NSU5fU0laRTsgLyogcGFyYW0gc2F2ZSBhcmVhIGlzIHBh
c3QgZnJhbWUgaGVhZGVyICovCiAKIAlmb3IgKGludCBpID0gMDsgaSA8IG5yX3JlZ3M7IGkrKykg
ewotCQlpZiAoaSA8IDgpIHsKKwkJaWYgKGkgPCBNQVhfUkVHU19GT1JfQVJHUykgewogCQkJRU1J
VChQUENfUkFXX1NUTChfUjMgKyBpLCBfUjEsIHJlZ3Nfb2ZmICsgaSAqIFNaTCkpOwogCQl9IGVs
c2UgewogCQkJRU1JVChQUENfUkFXX0xMKF9SMywgX1IxLCBwYXJhbV9zYXZlX2FyZWFfb2Zmc2V0
ICsgaSAqIFNaTCkpOwpAQCAtNjI2LDcgKzYyOCw3IEBAIHN0YXRpYyB2b2lkIGJwZl90cmFtcG9s
aW5lX3NhdmVfYXJncyh1MzIgKmltYWdlLCBzdHJ1Y3QgY29kZWdlbl9jb250ZXh0ICpjdHgsIGlu
CiBzdGF0aWMgdm9pZCBicGZfdHJhbXBvbGluZV9yZXN0b3JlX2FyZ3NfcmVncyh1MzIgKmltYWdl
LCBzdHJ1Y3QgY29kZWdlbl9jb250ZXh0ICpjdHgsCiAJCQkJCSAgICAgaW50IG5yX3JlZ3MsIGlu
dCByZWdzX29mZikKIHsKLQlmb3IgKGludCBpID0gMDsgaSA8IG5yX3JlZ3MgJiYgaSA8IDg7IGkr
KykKKwlmb3IgKGludCBpID0gMDsgaSA8IG5yX3JlZ3MgJiYgaSA8IE1BWF9SRUdTX0ZPUl9BUkdT
OyBpKyspCiAJCUVNSVQoUFBDX1JBV19MTChfUjMgKyBpLCBfUjEsIHJlZ3Nfb2ZmICsgaSAqIFNa
TCkpOwogfQogCkBAIC03MjUsNyArNzI3LDkgQEAgc3RhdGljIGludCBfX2FyY2hfcHJlcGFyZV9i
cGZfdHJhbXBvbGluZShzdHJ1Y3QgYnBmX3RyYW1wX2ltYWdlICppbSwgdm9pZCAqcndfaW0KIAkg
KgogCSAqIFJlc2VydmUgc3BhY2UgZm9yIGF0IGxlYXN0IDggcmVnaXN0ZXJzIGZvciBub3cuIFRo
aXMgY2FuIGJlIG9wdGltaXplZCBsYXRlci4KIAkgKi8KLQlicGZfZnJhbWVfc2l6ZSArPSAobnJf
cmVncyA+IDggPyBucl9yZWdzIDogOCkgKiBTWkw7CisJYnBmX2ZyYW1lX3NpemUgKz0KKwkJKG5y
X3JlZ3MgPiBNQVhfUkVHU19GT1JfQVJHUyA/IG5yX3JlZ3MgOiBNQVhfUkVHU19GT1JfQVJHUykg
KgorCQlTWkw7CiAKIAkvKiBSb29tIGZvciBzdHJ1Y3QgYnBmX3RyYW1wX3J1bl9jdHggKi8KIAly
dW5fY3R4X29mZiA9IGJwZl9mcmFtZV9zaXplOwoKLS0gCjIuNDkuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
