Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EADAD8582
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 10:26:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37DEBC36B31;
	Fri, 13 Jun 2025 08:26:46 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1A42C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 08:26:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B142A41C06;
 Fri, 13 Jun 2025 08:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1749803203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oy7cnpuIfUbxnBIHzSxSzs3wF3pN160eEFEtn1XrHHA=;
 b=BnJGbMk/e7fYDOccAaKbhkPl6Zkb+CJk54xIzM7oGJ/68LdgKmC814rIU32t6tdn2RLttv
 x15WZiOubSuud24F243NbAQNPG2k3Dui7U5bdWbzo6Lo7AjeJ+KSplTU5N9Z/cTjXj0Rr9
 AtxWE42xFJSR7fqyJtvD37GTtg2rovAwTR+VAfdN1C4ZXMlk7rhOwNdTxFQnBalxqPz9tm
 e/OD8ENjC+yzoBhzLvEBBNcwIj7ZN9YK2gi89xBilq+iVetQOvwYaFKA3l+J6erZ08hSMo
 zVQuK+p9cI9MOofvRUYJC5RnI8Wf/o3bDNy4BjM6rT5BKMfG/sqEM22GLR1tVQ==
Mime-Version: 1.0
Date: Fri, 13 Jun 2025 10:26:37 +0200
Message-Id: <DAL9GRMH74F4.2IV0HN0NGU65X@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Peter Zijlstra" <peterz@infradead.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com>
 <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com>
 <20250613081150.GJ2273038@noisy.programming.kicks-ass.net>
In-Reply-To: <20250613081150.GJ2273038@noisy.programming.kicks-ass.net>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeegiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdfftdejhefhieelvefhgeffvddulefhfeegleegkefgffejgeffjeeigfdtveeinecuffhomhgrihhnpehlihhnuhigsggrshgvrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehkedprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrshhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvthdprhgtphhtthhopegrnhgurhhiihesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhtihhnrdhlrghusehlihhnuhigrdguvghvpdhrtghpthhtohepvgguugihiiekjeesghhmrghilhdrtghomhdprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephihonhhghhhonhhgrdhsohhngheslhhinhhugidruggvvh
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Alexei Starovoitov <ast@kernel.org>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, Menglong Dong <imagedong@tencent.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-stm32@st-md-mailman.stormreply.com, Ingo Molnar <mingo@redhat.com>,
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>,
 linux-arm-kernel@lists.infradead.org,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, Mykola
 Lysenko <mykolal@fb.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 ebpf@linuxfoundation.org, Albert Ou <aou@eecs.berkeley.edu>,
 Puranjay Mohan <puranjay@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, KP Singh <kpsingh@kernel.org>, Borislav
 Petkov <bp@alien8.de>, Pu Lehui <pulehui@huawei.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas
 Gleixner <tglx@linutronix.de>, Hari
 Bathini <hbathini@linux.ibm.com>, Hao Luo <haoluo@google.com>,
 linux-kselftest@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
 Stanislav Fomichev <sdf@fomichev.me>, David Ahern <dsahern@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Eduard Zingerman <eddyz87@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>,
 Jiri Olsa <jolsa@kernel.org>, netdev@vger.kernel.org, bpf@vger.kernel.org,
 Martin
 KaFai Lau <martin.lau@linux.dev>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH bpf 2/7] bpf/x86: prevent trampoline
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

SGkgUGV0ZXIsCgpPbiBGcmkgSnVuIDEzLCAyMDI1IGF0IDEwOjExIEFNIENFU1QsIFBldGVyIFpp
amxzdHJhIHdyb3RlOgo+IE9uIEZyaSwgSnVuIDEzLCAyMDI1IGF0IDA5OjM3OjExQU0gKzAyMDAs
IEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKSB3cm90ZToKPj4gV2hlbiB0aGUgdGFy
Z2V0IGZ1bmN0aW9uIHJlY2VpdmVzIG1vcmUgYXJndW1lbnRzIHRoYW4gYXZhaWxhYmxlCj4+IHJl
Z2lzdGVycywgdGhlIGFkZGl0aW9uYWwgYXJndW1lbnRzIGFyZSBwYXNzZWQgb24gc3RhY2ssIGFu
ZCBzbyB0aGUKPj4gZ2VuZXJhdGVkIHRyYW1wb2xpbmUgbmVlZHMgdG8gcmVhZCB0aG9zZSB0byBw
cmVwYXJlIHRoZSBicGYgY29udGV4dCwKPj4gYnV0IGFsc28gdG8gcHJlcGFyZSB0aGUgdGFyZ2V0
IGZ1bmN0aW9uIHN0YWNrIHdoZW4gaXQgaXMgaW4gY2hhcmdlIG9mCj4+IGNhbGxpbmcgaXQuIFRo
aXMgd29ya3Mgd2VsbCBmb3Igc2NhbGFyIHR5cGVzLCBidXQgaWYgdGhlIHZhbHVlIGlzIGEKPj4g
c3RydWN0LCB3ZSBjYW4gbm90IGtub3cgZm9yIHN1cmUgdGhlIGV4YWN0IHN0cnVjdCBsb2NhdGlv
biwgYXMgaXQgbWF5Cj4+IGhhdmUgYmVlbiBwYWNrZWQgb3IgbWFudWFsbHkgYWxpZ25lZCB0byBh
IGdyZWF0ZXIgdmFsdWUuCj4KPiBodHRwczovL3JlZnNwZWNzLmxpbnV4YmFzZS5vcmcvZWxmL3g4
Nl82NC1hYmktMC45OS5wZGYKPgo+IEhhcyBmYWlybHkgY2xlYXIgcnVsZXMgb24gaG93IGFyZ3Vt
ZW50cyBhcmUgZW5jb2RlZC4gQnJvYWRseSBzcGVha2luZwo+IGZvciB0aGUga2VybmVsLCBpZiB0
aGUgc3RydWN0dXJlIGV4Y2VlZHMgMiByZWdpc3RlcnMgaW4gc2l6ZSwgaXQgaXMKPiBwYXNzZWQg
YXMgYSByZWZlcmVuY2UsIG90aGVyd2lzZSBpdCBpcyBwYXNzZWQgYXMgdHdvIHJlZ2lzdGVycy4K
Ck1heWJlIG15IGNvbW1pdCB3b3JkaW5nIGlzIG5vdCBwcmVjaXNlIGVub3VnaCwgYnV0IGluZGVl
ZCwgdGhlcmUncyBub3QKZG91YnQgYWJvdXQgd2hldGhlciB0aGUgc3RydWN0IHZhbHVlIGlzIHBh
c3NlZCBvbiB0aGUgc3RhY2sgb3IgdGhyb3VnaCBhCnJlZ2lzdGVyL2EgcGFpciBvZiByZWdpc3Rl
cnMuIFRoZSBkb3VidCBpcyByYXRoZXIgYWJvdXQgdGhlIHN0cnVjdCBsb2NhdGlvbgp3aGVuIGl0
IGlzIHBhc3NlZCBfYnkgdmFsdWVfIGFuZCBfb24gdGhlIHN0YWNrXzogdGhlIEFCSSBpbmRlZWQg
Y2xlYXJseQpzdGF0ZXMgdGhhdCAiU3RydWN0dXJlcyBhbmQgdW5pb25zIGFzc3VtZSB0aGUgYWxp
Z25tZW50IG9mIHRoZWlyIG1vc3QKc3RyaWN0bHkgYWxpZ25lZCBjb21wb25lbnQiIChwLjEzKSwg
YnV0IHRoaXMgcnVsZSBpcyAic2lsZW50bHkgYnJva2VuIiB3aGVuCmEgc3RydWN0IGhhcyBhbiBf
X2F0dHJpYnV0ZV9fKChwYWNrZWQpKSBvciBhbmQgX19hdHRyaWJ1dGVfXygoYWxpZ25lZChYKSkp
LAphbmQgQUZBSUNUIHRoaXMgY2FzZSBjYW4gbm90IGJlIGRldGVjdGVkIGF0IHJ1bnRpbWUgd2l0
aCBjdXJyZW50IEJURiBpbmZvLgoKLS0gCkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
