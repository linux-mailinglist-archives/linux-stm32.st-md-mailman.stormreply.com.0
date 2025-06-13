Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21414AD8440
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 09:37:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB615C36B31;
	Fri, 13 Jun 2025 07:37:32 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CBD5C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 07:37:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CCC6B44506;
 Fri, 13 Jun 2025 07:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1749800250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rWrXudQ87v1aByOGhl67T4UU7KUM5mT6FEm5oZqhcLg=;
 b=cAFx4niwDDsyQFKGdmMcGf11CvIpcE6i60PNTLVL6XAEHr8QsvAnUtPgghd0BMq2R+ppDC
 FFai5U507SCN+pyoN6wuDoWlTMOjSSoP4TnpNxYiC+w0QbX1ZUzPQlhl134JonesXJvjFx
 OWDw6aSbLFZe7FDXXsBj2S+b7DQHMXAKYwDHAWLiIwLUr5ryMSKFEAsH//6LX4WvBNf7+B
 RTSk1TpiSwF389Xnh71A9SzYutIAanBG+/eJ2O3NS8i6MD2qG3qY8IPYR+kJcbwUdA/tQF
 SzpnBSDBVvIxVqUtGLlQS7VmjGVpj6a1tNP17AMJbhSHMVv02WVX06WVxtBTDQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Date: Fri, 13 Jun 2025 09:37:10 +0200
MIME-Version: 1.0
Message-Id: <20250613-deny_trampoline_structs_on_stack-v1-1-5be9211768c3@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrroculdgvuefrhfcuhfhouhhnuggrthhiohhnmdcuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleejkeetffefveelgeeklefhtefhgfeigeduveffjeehleeifeefjedtudejgeeunecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopegludelvddrudeikedruddrudeljegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehkedprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghgohhruggvvghvsehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtthhopehlihhnuhigq
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
Subject: [Linux-stm32] [PATCH bpf 1/7] bpf/x86: use define for max regs
 count used for arguments
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

eDg2IGFsbG93cyB1c2luZyB1cCB0byA2IHJlZ2lzdGVycyB0byBwYXNzIGFyZ3VtZW50cyBiZXR3
ZWVuIGZ1bmN0aW9uCmNhbGxzLiBUaGlzIHZhbHVlIGlzIGhhcmRjb2RlZCBpbiBtdWx0aXBsZSBw
bGFjZXMsIHVzZSBhIGRlZmluZSBmb3IgdGhpcwp2YWx1ZS4KClNpZ25lZC1vZmYtYnk6IEFsZXhp
cyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+
Ci0tLQogYXJjaC94ODYvbmV0L2JwZl9qaXRfY29tcC5jIHwgMTQgKysrKysrKystLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvYXJjaC94ODYvbmV0L2JwZl9qaXRfY29tcC5jIGIvYXJjaC94ODYvbmV0L2JwZl9qaXRfY29t
cC5jCmluZGV4IDE1NjcyY2I5MjZmYzE4MTdmOTdkMmNkMWM1NWQxNTc1ODAzZjY5NTguLjk2ODk4
MzRkZTFiYjFhOTBmZGMyODE1NmUwZTJhNTZhYzBmZjIwNzYgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2
L25ldC9icGZfaml0X2NvbXAuYworKysgYi9hcmNoL3g4Ni9uZXQvYnBmX2ppdF9jb21wLmMKQEAg
LTYxLDYgKzYxLDggQEAgc3RhdGljIHU4ICplbWl0X2NvZGUodTggKnB0ciwgdTMyIGJ5dGVzLCB1
bnNpZ25lZCBpbnQgbGVuKQogI2RlZmluZSBFTUlUX0VOREJSX1BPSVNPTigpCiAjZW5kaWYKIAor
I2RlZmluZSBNQVhfUkVHU19GT1JfQVJHUwk2CisKIHN0YXRpYyBib29sIGlzX2ltbTgoaW50IHZh
bHVlKQogewogCXJldHVybiB2YWx1ZSA8PSAxMjcgJiYgdmFsdWUgPj0gLTEyODsKQEAgLTI3MTAs
MTAgKzI3MTIsMTAgQEAgc3RhdGljIGludCBnZXRfbnJfdXNlZF9yZWdzKGNvbnN0IHN0cnVjdCBi
dGZfZnVuY19tb2RlbCAqbSkKIAogCWZvciAoaSA9IDA7IGkgPCBtaW5fdChpbnQsIG0tPm5yX2Fy
Z3MsIE1BWF9CUEZfRlVOQ19BUkdTKTsgaSsrKSB7CiAJCWFyZ19yZWdzID0gKG0tPmFyZ19zaXpl
W2ldICsgNykgLyA4OwotCQlpZiAobnJfdXNlZF9yZWdzICsgYXJnX3JlZ3MgPD0gNikKKwkJaWYg
KG5yX3VzZWRfcmVncyArIGFyZ19yZWdzIDw9IE1BWF9SRUdTX0ZPUl9BUkdTKQogCQkJbnJfdXNl
ZF9yZWdzICs9IGFyZ19yZWdzOwogCi0JCWlmIChucl91c2VkX3JlZ3MgPj0gNikKKwkJaWYgKG5y
X3VzZWRfcmVncyA+PSBNQVhfUkVHU19GT1JfQVJHUykKIAkJCWJyZWFrOwogCX0KIApAQCAtMjc1
MSw3ICsyNzUzLDcgQEAgc3RhdGljIHZvaWQgc2F2ZV9hcmdzKGNvbnN0IHN0cnVjdCBidGZfZnVu
Y19tb2RlbCAqbSwgdTggKipwcm9nLAogCQkgKiB0aGUgYXJnMS01LGFyZzcgd2lsbCBiZSBwYXNz
ZWQgYnkgcmVncywgYW5kIGFyZzYgd2lsbAogCQkgKiBieSBzdGFjay4KIAkJICovCi0JCWlmIChu
cl9yZWdzICsgYXJnX3JlZ3MgPiA2KSB7CisJCWlmIChucl9yZWdzICsgYXJnX3JlZ3MgPiBNQVhf
UkVHU19GT1JfQVJHUykgewogCQkJLyogY29weSBmdW5jdGlvbiBhcmd1bWVudHMgZnJvbSBvcmln
aW4gc3RhY2sgZnJhbWUKIAkJCSAqIGludG8gY3VycmVudCBzdGFjayBmcmFtZS4KIAkJCSAqCkBA
IC0yODExLDcgKzI4MTMsNyBAQCBzdGF0aWMgdm9pZCByZXN0b3JlX3JlZ3MoY29uc3Qgc3RydWN0
IGJ0Zl9mdW5jX21vZGVsICptLCB1OCAqKnByb2csCiAJICovCiAJZm9yIChpID0gMDsgaSA8IG1p
bl90KGludCwgbS0+bnJfYXJncywgTUFYX0JQRl9GVU5DX0FSR1MpOyBpKyspIHsKIAkJYXJnX3Jl
Z3MgPSAobS0+YXJnX3NpemVbaV0gKyA3KSAvIDg7Ci0JCWlmIChucl9yZWdzICsgYXJnX3JlZ3Mg
PD0gNikgeworCQlpZiAobnJfcmVncyArIGFyZ19yZWdzIDw9IE1BWF9SRUdTX0ZPUl9BUkdTKSB7
CiAJCQlmb3IgKGogPSAwOyBqIDwgYXJnX3JlZ3M7IGorKykgewogCQkJCWVtaXRfbGR4KHByb2cs
IEJQRl9EVywKIAkJCQkJIG5yX3JlZ3MgPT0gNSA/IFg4Nl9SRUdfUjkgOiBCUEZfUkVHXzEgKyBu
cl9yZWdzLApAQCAtMjgyNCw3ICsyODI2LDcgQEAgc3RhdGljIHZvaWQgcmVzdG9yZV9yZWdzKGNv
bnN0IHN0cnVjdCBidGZfZnVuY19tb2RlbCAqbSwgdTggKipwcm9nLAogCQkJc3RhY2tfc2l6ZSAt
PSA4ICogYXJnX3JlZ3M7CiAJCX0KIAotCQlpZiAobnJfcmVncyA+PSA2KQorCQlpZiAobnJfcmVn
cyA+PSBNQVhfUkVHU19GT1JfQVJHUykKIAkJCWJyZWFrOwogCX0KIH0KQEAgLTMxNDksNyArMzE1
MSw3IEBAIHN0YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVfYnBmX3RyYW1wb2xpbmUoc3RydWN0IGJw
Zl90cmFtcF9pbWFnZSAqaW0sIHZvaWQgKnJ3X2ltCiAJc3RhY2tfc2l6ZSArPSAoc2l6ZW9mKHN0
cnVjdCBicGZfdHJhbXBfcnVuX2N0eCkgKyA3KSAmIH4weDc7CiAJcnVuX2N0eF9vZmYgPSBzdGFj
a19zaXplOwogCi0JaWYgKG5yX3JlZ3MgPiA2ICYmIChmbGFncyAmIEJQRl9UUkFNUF9GX0NBTExf
T1JJRykpIHsKKwlpZiAobnJfcmVncyA+IE1BWF9SRUdTX0ZPUl9BUkdTICYmIChmbGFncyAmIEJQ
Rl9UUkFNUF9GX0NBTExfT1JJRykpIHsKIAkJLyogdGhlIHNwYWNlIHRoYXQgdXNlZCB0byBwYXNz
IGFyZ3VtZW50cyBvbi1zdGFjayAqLwogCQlzdGFja19zaXplICs9IChucl9yZWdzIC0gZ2V0X25y
X3VzZWRfcmVncyhtKSkgKiA4OwogCQkvKiBtYWtlIHN1cmUgdGhlIHN0YWNrIHBvaW50ZXIgaXMg
MTYtYnl0ZSBhbGlnbmVkIGlmIHdlCgotLSAKMi40OS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
