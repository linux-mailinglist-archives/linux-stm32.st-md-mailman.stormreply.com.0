Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2B1AD8623
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 10:59:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41EADC36B31;
	Fri, 13 Jun 2025 08:59:37 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CAE5C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 08:59:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DEFE42E7E;
 Fri, 13 Jun 2025 08:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1749805174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SUCUXJtX/FQ0n2RuIYjo9mN42TY+/sRw81vNJDMJO0A=;
 b=odU2qoVOJqtmWsv4zb4lepGDdwIrGFVx1azJXmapyDqL96WcBHU3wmTN7q7dQPmyKFqCHI
 rAqafMySpH/EFaSvZ1mPA8XPB64itYMWMRjLI+y9JhypSBAVbn7uBWi7ZcMRo/IBOnvwbQ
 5esOyHBXJvmN2G+ljk317R7i3D4fcRlCkLEQ6ICe/sb+aRuObTcakshd3/wdZEUJ2LrUgk
 5TMr9mGozxkHTrm+MRwSTF64qE4g2cgcgr48VeDhBLpdVtT0mS0PBL7DckMWmv65tfLxtu
 MspFh3LUUD6IifvG5Ga5z6d3PYGcXoafBp+C4hw7u5Y8qm4JyGJ0DAuSLAMGzw==
Mime-Version: 1.0
Date: Fri, 13 Jun 2025 10:59:28 +0200
Message-Id: <DALA5WYA04OG.1283TZDOVLBPS@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Peter Zijlstra" <peterz@infradead.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com>
 <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com>
 <20250613081150.GJ2273038@noisy.programming.kicks-ass.net>
 <DAL9GRMH74F4.2IV0HN0NGU65X@bootlin.com>
 <20250613083232.GL2273038@noisy.programming.kicks-ass.net>
In-Reply-To: <20250613083232.GL2273038@noisy.programming.kicks-ass.net>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleekheeihfefheevhfdtgeeuleekheffffffuedvkeekkeduvdeugeeugfeiueeknecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehkedprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrshhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvthdprhgtphhtthhopegrnhgurhhiiheskhgvrhhnvghlrdhorhhgpdhrtghpt
 hhtohepmhgrrhhtihhnrdhlrghusehlihhnuhigrdguvghvpdhrtghpthhtohepvgguugihiiekjeesghhmrghilhdrtghomhdprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephihonhhghhhonhhgrdhsohhngheslhhinhhugidruggvvh
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

T24gRnJpIEp1biAxMywgMjAyNSBhdCAxMDozMiBBTSBDRVNULCBQZXRlciBaaWpsc3RyYSB3cm90
ZToKPiBPbiBGcmksIEp1biAxMywgMjAyNSBhdCAxMDoyNjozN0FNICswMjAwLCBBbGV4aXMgTG90
aG9yw6kgd3JvdGU6Cj4+IEhpIFBldGVyLAo+PiAKPj4gT24gRnJpIEp1biAxMywgMjAyNSBhdCAx
MDoxMSBBTSBDRVNULCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPj4gPiBPbiBGcmksIEp1biAxMywg
MjAyNSBhdCAwOTozNzoxMUFNICswMjAwLCBBbGV4aXMgTG90aG9yw6kgKGVCUEYgRm91bmRhdGlv
bikgd3JvdGU6CgpbLi4uXQoKPj4gTWF5YmUgbXkgY29tbWl0IHdvcmRpbmcgaXMgbm90IHByZWNp
c2UgZW5vdWdoLCBidXQgaW5kZWVkLCB0aGVyZSdzIG5vdAo+PiBkb3VidCBhYm91dCB3aGV0aGVy
IHRoZSBzdHJ1Y3QgdmFsdWUgaXMgcGFzc2VkIG9uIHRoZSBzdGFjayBvciB0aHJvdWdoIGEKPj4g
cmVnaXN0ZXIvYSBwYWlyIG9mIHJlZ2lzdGVycy4gVGhlIGRvdWJ0IGlzIHJhdGhlciBhYm91dCB0
aGUgc3RydWN0IGxvY2F0aW9uCj4+IHdoZW4gaXQgaXMgcGFzc2VkIF9ieSB2YWx1ZV8gYW5kIF9v
biB0aGUgc3RhY2tfOiB0aGUgQUJJIGluZGVlZCBjbGVhcmx5Cj4+IHN0YXRlcyB0aGF0ICJTdHJ1
Y3R1cmVzIGFuZCB1bmlvbnMgYXNzdW1lIHRoZSBhbGlnbm1lbnQgb2YgdGhlaXIgbW9zdAo+PiBz
dHJpY3RseSBhbGlnbmVkIGNvbXBvbmVudCIgKHAuMTMpLCBidXQgdGhpcyBydWxlIGlzICJzaWxl
bnRseSBicm9rZW4iIHdoZW4KPj4gYSBzdHJ1Y3QgaGFzIGFuIF9fYXR0cmlidXRlX18oKHBhY2tl
ZCkpIG9yIGFuZCBfX2F0dHJpYnV0ZV9fKChhbGlnbmVkKFgpKSksCj4+IGFuZCBBRkFJQ1QgdGhp
cyBjYXNlIGNhbiBub3QgYmUgZGV0ZWN0ZWQgYXQgcnVudGltZSB3aXRoIGN1cnJlbnQgQlRGIGlu
Zm8uCj4KPiBBaCwgb2theS4gU28gaXQgaXMgYSBmYWlsdXJlIG9mIEJURi4gVGhhdCB3YXMgaW5k
ZWVkIG5vdCBjbGVhci4KCklmIEkgbmVlZCB0byByZXNwaW4sIEknbGwgcmV3cml0ZSB0aGUgY29t
bWl0IG1lc3NhZ2UgdG8gaW5jbHVkZSB0aGUgZGV0YWlscwphYm92ZS4KCkFsZXhpcwoKCgoKLS0g
CkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
