Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 317A5AD8442
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 09:37:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9671C36B31;
	Fri, 13 Jun 2025 07:37:35 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A059C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 07:37:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09B4044504;
 Fri, 13 Jun 2025 07:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1749800254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MnHGDvZzrjKVg91VYE4fUbD95rOheLuWrUC1SCUNvho=;
 b=hjz+up3owp19jC1PLRYly2+dyctAQgkbxpKo1hqYq1HETrfATLqzq1SfruQePM9/7t5pLa
 0zTgV4Mt+jHNfjm41uNZRq3n71py93L9O+7KZhUPST/iQHmzyaGpfn7MSZ8OgZbCmciiE7
 GxM/QOW8RLxX86eh4eiqAagDX+1Yh47rRt5h5IfedzZXFQZhW4NYI7kCZJcYIItqps3uLX
 BZnHjMANkEjvI0mf6/VMLdo44AkZvBkC/epgTg/TqottCOybUirzxNFNynKpbkqAqLHbRi
 dv/ae9NbgtJ9xY7jGbo/ojuHvNaSLl6MZIZ/7dtwKDtTbHVzpUbjlkT5KrLJbQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Date: Fri, 13 Jun 2025 09:37:11 +0200
MIME-Version: 1.0
Message-Id: <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrroculdgvuefrhfcuhfhouhhnuggrthhiohhnmdcuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleejkeetffefveelgeeklefhtefhgfeigeduveffjeehleeifeefjedtudejgeeunecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopegludelvddrudeikedruddrudeljegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehkedprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghgohhruggvvghvsehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtthhopehlihhnuhigq
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
Subject: [Linux-stm32] [PATCH bpf 2/7] bpf/x86: prevent trampoline
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
ZSB0byBwcmVwYXJlIHRoZSBicGYgY29udGV4dCwKYnV0IGFsc28gdG8gcHJlcGFyZSB0aGUgdGFy
Z2V0IGZ1bmN0aW9uIHN0YWNrIHdoZW4gaXQgaXMgaW4gY2hhcmdlIG9mCmNhbGxpbmcgaXQuIFRo
aXMgd29ya3Mgd2VsbCBmb3Igc2NhbGFyIHR5cGVzLCBidXQgaWYgdGhlIHZhbHVlIGlzIGEKc3Ry
dWN0LCB3ZSBjYW4gbm90IGtub3cgZm9yIHN1cmUgdGhlIGV4YWN0IHN0cnVjdCBsb2NhdGlvbiwg
YXMgaXQgbWF5CmhhdmUgYmVlbiBwYWNrZWQgb3IgbWFudWFsbHkgYWxpZ25lZCB0byBhIGdyZWF0
ZXIgdmFsdWUuCgpQcmV2ZW50IHdyb25nIHJlYWRpbmdzIGJ5IHJlZnVzaW5nIHRyYW1wb2xpbmUg
YXR0YWNobWVudCBpZiB0aGUgdGFyZ2V0CmZ1bmN0aW9uIHJlY2VpdmVzIGEgc3RydWN0IG9uIHN0
YWNrLiBXaGlsZSBhdCBpdCwgbW92ZSB0aGUgbWF4IGJwZiBhcmdzCmNoZWNrIGluIHRoZSBuZXcg
ZnVuY3Rpb24uCgpGaXhlczogNDczZTMxNTBlMzBhICgiYnBmLCB4ODY6IGFsbG93IGZ1bmN0aW9u
IGFyZ3VtZW50cyB1cCB0byAxMiBmb3IgVFJBQ0lORyIpClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBM
b3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0t
LQogYXJjaC94ODYvbmV0L2JwZl9qaXRfY29tcC5jIHwgMzYgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9uZXQvYnBmX2ppdF9jb21wLmMgYi9hcmNo
L3g4Ni9uZXQvYnBmX2ppdF9jb21wLmMKaW5kZXggOTY4OTgzNGRlMWJiMWE5MGZkYzI4MTU2ZTBl
MmE1NmFjMGZmMjA3Ni4uMTIwZTA1YTk3ODY3OWMwNDY2MzFjYzk0ZDk0MjgwMGMzMDUxYWQwYSAx
MDA2NDQKLS0tIGEvYXJjaC94ODYvbmV0L2JwZl9qaXRfY29tcC5jCisrKyBiL2FyY2gveDg2L25l
dC9icGZfaml0X2NvbXAuYwpAQCAtMzAwMSw2ICszMDAxLDI5IEBAIHN0YXRpYyBpbnQgaW52b2tl
X2JwZl9tb2RfcmV0KGNvbnN0IHN0cnVjdCBidGZfZnVuY19tb2RlbCAqbSwgdTggKipwcHJvZywK
IAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCB2YWxpZGF0ZV9hcmdzKGNvbnN0IHN0cnVjdCBi
dGZfZnVuY19tb2RlbCAqbSkKK3sKKwlpbnQgaSwgYXJnX3JlZ3MgPSAwLCBucl9yZWdzID0gMDsK
KworCWZvciAoaSA9IDA7IGkgPCBtaW5fdChpbnQsIG0tPm5yX2FyZ3MsIE1BWF9CUEZfRlVOQ19B
UkdTKTsgaSsrKSB7CisJCWFyZ19yZWdzID0gKG0tPmFyZ19zaXplW2ldICsgNykgLyA4OworCisJ
CWlmIChucl9yZWdzICsgYXJnX3JlZ3MgPiBNQVhfUkVHU19GT1JfQVJHUyAmJgorCQkgICAgbS0+
YXJnX2ZsYWdzW2ldICYgQlRGX0ZNT0RFTF9TVFJVQ1RfQVJHKQorCQkJcmV0dXJuIC1FTk9UU1VQ
UDsKKwkJbnJfcmVncyArPSBhcmdfcmVnczsKKwl9CisKKwkvKiB4ODYtNjQgc3VwcG9ydHMgdXAg
dG8gTUFYX0JQRl9GVU5DX0FSR1MgYXJndW1lbnRzLiAxLTYKKwkgKiBhcmUgcGFzc2VkIHRocm91
Z2ggcmVncywgdGhlIHJlbWFpbnMgYXJlIHRocm91Z2ggc3RhY2suCisJICovCisJaWYgKG5yX3Jl
Z3MgPiBNQVhfQlBGX0ZVTkNfQVJHUykKKwkJcmV0dXJuIC1FTk9UU1VQUDsKKworCisJcmV0dXJu
IDA7Cit9CisKIC8qIG1vdiByYXgsIHF3b3JkIHB0ciBbcmJwIC0gcm91bmRlZF9zdGFja19kZXB0
aCAtIDhdICovCiAjZGVmaW5lIExPQURfVFJBTVBfVEFJTF9DQUxMX0NOVF9QVFIoc3RhY2spCVwK
IAlfX0xPQURfVENDX1BUUigtcm91bmRfdXAoc3RhY2ssIDgpIC0gOCkKQEAgLTMwODksMTggKzMx
MTIsMTkgQEAgc3RhdGljIGludCBfX2FyY2hfcHJlcGFyZV9icGZfdHJhbXBvbGluZShzdHJ1Y3Qg
YnBmX3RyYW1wX2ltYWdlICppbSwgdm9pZCAqcndfaW0KIAlXQVJOX09OX09OQ0UoKGZsYWdzICYg
QlBGX1RSQU1QX0ZfSU5ESVJFQ1QpICYmCiAJCSAgICAgKGZsYWdzICYgfihCUEZfVFJBTVBfRl9J
TkRJUkVDVCB8IEJQRl9UUkFNUF9GX1JFVF9GRU5UUllfUkVUKSkpOwogCisJLyogbWFrZSBzdXJl
IHRoYXQgYW55IGFyZ3VtZW50IGNhbiBiZSBsb2NhdGVkIGFuZCBwcm9jZXNzZWQgYnkgdGhlCisJ
ICogdHJhbXBvbGluZQorCSAqLworCXJldCA9IHZhbGlkYXRlX2FyZ3MobSk7CisJaWYgKHJldCkK
KwkJcmV0dXJuIHJldDsKKwogCS8qIGV4dHJhIHJlZ2lzdGVycyBmb3Igc3RydWN0IGFyZ3VtZW50
cyAqLwogCWZvciAoaSA9IDA7IGkgPCBtLT5ucl9hcmdzOyBpKyspIHsKIAkJaWYgKG0tPmFyZ19m
bGFnc1tpXSAmIEJURl9GTU9ERUxfU1RSVUNUX0FSRykKIAkJCW5yX3JlZ3MgKz0gKG0tPmFyZ19z
aXplW2ldICsgNykgLyA4IC0gMTsKIAl9CiAKLQkvKiB4ODYtNjQgc3VwcG9ydHMgdXAgdG8gTUFY
X0JQRl9GVU5DX0FSR1MgYXJndW1lbnRzLiAxLTYKLQkgKiBhcmUgcGFzc2VkIHRocm91Z2ggcmVn
cywgdGhlIHJlbWFpbnMgYXJlIHRocm91Z2ggc3RhY2suCi0JICovCi0JaWYgKG5yX3JlZ3MgPiBN
QVhfQlBGX0ZVTkNfQVJHUykKLQkJcmV0dXJuIC1FTk9UU1VQUDsKLQogCS8qIEdlbmVyYXRlZCB0
cmFtcG9saW5lIHN0YWNrIGxheW91dDoKIAkgKgogCSAqIFJCUCArIDggICAgICAgICBbIHJldHVy
biBhZGRyZXNzICBdCgotLSAKMi40OS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
