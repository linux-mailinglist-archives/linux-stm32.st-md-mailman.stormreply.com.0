Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DF1ADA271
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Jun 2025 17:44:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE031C36B2C;
	Sun, 15 Jun 2025 15:44:36 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E67C4C36B18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Jun 2025 15:44:35 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3a53359dea5so2437507f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Jun 2025 08:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750002275; x=1750607075;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q24V+OwPQTKaIgjR+NjdUiOeSoG4NNmYTDA2NhEIjAI=;
 b=BdVLFzB93xTjkD6AS4hVf8r/eTSaO/cOXOvqlv3l9m6/q894mlJj1lO7hnxRAb7HMn
 Ffjqd/x7mjPC/d+3rJWxq0IhxYVc7qLz4YFe8WufJADtDQTa5lt+OjT/9Ga9ebiNKSZa
 tbTTULMmUsEtbm7eaE9tIOEDnrmffogpd3BZ7bVwAsq0Cp7gpf/lssDKne9IRJ3xo5PK
 WhT0kr3s4pm1eO+z63Z+C1FLSrEO2bL6rzl6lHfhK7ZRHURfuO9TUO3NXxpism/U99g0
 PoF8bDVwQsRm7v/CcT+SmcI1qGSfn6uOitpj1w5jDYGbdR6Htk2XzoVS0NqmufhwNhqu
 /hkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750002275; x=1750607075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q24V+OwPQTKaIgjR+NjdUiOeSoG4NNmYTDA2NhEIjAI=;
 b=KHK+M4YHwq+R+9ZwC4Z+VCeKS7xtCDB4oi8RZ6QPP3+iMKSXRs/AXayaPKcXXa/pne
 MOLS2HI74MVTG3/LlKVAwGhDHKIfOdzjQg1P15HCabwzGy+D3Uk3JE38qHEELN2v2/pa
 9ju/SBwYz+mlaBlUuxn1ISre8EiFS1lftmunII2TH+TTTeQ/uM5UFQsQ8AcG6H1bC3zl
 rohynliWBPexbHpXdNa750wh/VU/ynX3PPUAFOjNoU48MxXoJONKM6xTr81ay370GIDe
 bsS2B61ULP6Lnf4D2n1ZmwBChi1UEUJcXFUD2nUuNEE4a2hmv+5CrVxSMWd1z/hyOTts
 9t4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjMQkC2HcqY1wKAz9S6G8lzmp97rrWHak13vFHrHKd/nFoNGMyzB+uA/u0tGXmSljntzQ5wvXb3qEghw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx099rVkbTR2+CVi4clIyIqpQ1oaRkazks32+//NZX/7bA27c0H
 KWTSM8F6mfUsgit8YZ7G9hO1XEY40f3xOF1m6nWY5ZWWrY6evt9Y9WEGbpCdojzh3JN9TVPSrme
 F1AweShqSO9/n1YZ1fVTaHGXOJ3uACEw=
X-Gm-Gg: ASbGnctnmaooxHjty/L60XopI+3kpF6sgXdTXKzzYeqifKdoGSQPGooisW7Pm6P0Wcg
 zmDT+vkF0YnoVHzqpy4zVyUQbHO2Tu4iJWpN30GnXg8kUIApQodWBrPrLc5NuMMvNtG6z0d4i4Q
 o/DywQzq7vqGtNWicCija4hJ6tDfuPjOdPVcSa/ijPjgJP0oJgakIGfg==
X-Google-Smtp-Source: AGHT+IEVMqrf36wFDwIu+Qav+T1hxhMtiOfYIpsqMlJITLohO7pPVX7dQmL5OFhL7NsYv2qBiULo8wqoJRikRf0wek4=
X-Received: by 2002:a05:6000:718:b0:3a5:3b63:58f0 with SMTP id
 ffacd0b85a97d-3a57237178dmr4884718f8f.18.1750002274959; Sun, 15 Jun 2025
 08:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com>
 <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com>
 <20250613081150.GJ2273038@noisy.programming.kicks-ass.net>
 <DAL9GRMH74F4.2IV0HN0NGU65X@bootlin.com>
 <20250613083232.GL2273038@noisy.programming.kicks-ass.net>
 <DALA5WYA04OG.1283TZDOVLBPS@bootlin.com>
 <CAADnVQ+sj9XhscN9PdmTzjVa7Eif21noAUH3y1K6x5bWcL-5pg@mail.gmail.com>
 <DAN5THWRO6KS.XXZ00IOTQZH9@bootlin.com>
In-Reply-To: <DAN5THWRO6KS.XXZ00IOTQZH9@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 15 Jun 2025 08:44:23 -0700
X-Gm-Features: AX0GCFum0GptEjJNe1zyPyz2oALA4PaNl_E8ueRtmTM4_c9kw_4GcQiqb2A1p90
Message-ID: <CAADnVQJPQNC5VaybR_GZry5YZhNcJmWSSouuTSsU1XKhDfXYwQ@mail.gmail.com>
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Alexei Starovoitov <ast@kernel.org>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Shuah Khan <shuah@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Menglong Dong <imagedong@tencent.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Michael Ellerman <mpe@ellerman.id.au>, X86 ML <x86@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-stm32@st-md-mailman.stormreply.com, Ingo Molnar <mingo@redhat.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Mykola Lysenko <mykolal@fb.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, ebpf@linuxfoundation.org,
 Albert Ou <aou@eecs.berkeley.edu>, Puranjay Mohan <puranjay@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Pu Lehui <pulehui@huawei.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Hari Bathini <hbathini@linux.ibm.com>, Hao Luo <haoluo@google.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Stanislav Fomichev <sdf@fomichev.me>,
 David Ahern <dsahern@kernel.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>,
 dwarves <dwarves@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>,
 Jiri Olsa <jolsa@kernel.org>, Network Development <netdev@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>
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

T24gU3VuLCBKdW4gMTUsIDIwMjUgYXQgNzowMOKAr0FNIEFsZXhpcyBMb3Rob3LDqQo8YWxleGlz
LmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gU2F0IEp1biAxNCwgMjAyNSBhdCAx
MjozNSBBTSBDRVNULCBBbGV4ZWkgU3Rhcm92b2l0b3Ygd3JvdGU6Cj4gPiBPbiBGcmksIEp1biAx
MywgMjAyNSBhdCAxOjU54oCvQU0gQWxleGlzIExvdGhvcsOpCj4gPiA8YWxleGlzLmxvdGhvcmVA
Ym9vdGxpbi5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gRnJpIEp1biAxMywgMjAyNSBhdCAxMDoz
MiBBTSBDRVNULCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPiA+PiA+IE9uIEZyaSwgSnVuIDEzLCAy
MDI1IGF0IDEwOjI2OjM3QU0gKzAyMDAsIEFsZXhpcyBMb3Rob3LDqSB3cm90ZToKPgo+IFsuLi5d
Cj4KPiA+PiBJZiBJIG5lZWQgdG8gcmVzcGluLCBJJ2xsIHJld3JpdGUgdGhlIGNvbW1pdCBtZXNz
YWdlIHRvIGluY2x1ZGUgdGhlIGRldGFpbHMKPiA+PiBhYm92ZS4KPiA+Cj4gPiBObyBuZWVkIHRv
IHJlc3Bpbi4gVGhlIGNvdmVyIGxldHRlciBpcyBxdWl0ZSBkZXRhaWxlZCBhbHJlYWR5Lgo+ID4K
PiA+IEJ1dCBsb29raW5nIGF0IHRoZSBwYXRjaCBhbmQgdGhpcyB0aHJlYWQgSSB0aGluayB3ZSBu
ZWVkIHRvIGFncmVlCj4gPiBvbiB0aGUgbG9uZyB0ZXJtIGFwcHJvYWNoIHRvIEJURiwgc2luY2Ug
cGVvcGxlIGFzc3VtZSB0aGF0Cj4gPiBpdCdzIGEgbW9yZSBjb21wYWN0IGR3YXJmIGFuZCBhbnkg
bWlzc2luZyBpbmZvcm1hdGlvbgo+ID4gc2hvdWxkIGJlIGFkZGVkIHRvIGl0Lgo+ID4gTGlrZSBp
biB0aGlzIGNhc2Ugc3BlY2lhbCBhbGlnbm1lbnQgY2FzZSBhbmQgcGFja2VkIGF0dHJpYnV0ZXMK
PiA+IGFyZSBub3QgZXhwcmVzc2VkIGluIEJURiBhbmQgSSBiZWxpZXZlIHRoZXkgc2hvdWxkIG5v
dCBiZS4KPiA+IEJURiBpcyBub3QgYSBkZWJ1ZyBmb3JtYXQgYW5kIG5vdCBhIHN1YnN0aXR1dGUg
Zm9yIGR3YXJmLgo+ID4gVGhlcmUgaXMgbm8gZ29hbCB0byBleHByZXNzIGV2ZXJ5dGhpbmcgcG9z
c2libGUgaW4gQy4KPiA+IEl0J3MgbWluaW1hbCwgYmVjYXVzZSBCVEYgaXMgX3ByYWN0aWNhbF8g
ZGVzY3JpcHRpb24gb2YKPiA+IHR5cGVzIGFuZCBkYXRhIHByZXNlbnQgaW4gdGhlIGtlcm5lbC4K
PiA+IEkgZG9uJ3QgdGhpbmsgdGhlIHNwZWNpYWwgY2FzZSBvZiBwYWNraW5nIGFuZCBhbGlnbm1l
bnQgZXhpc3RzCj4gPiBpbiB0aGUga2VybmVsIHRvZGF5LCBzbyB0aGUgY3VycmVudCBmb3JtYXQg
aXMgc3VmZmljaWVudC4KPiA+IEl0IGRvZXNuJ3QgbWlzcyBhbnl0aGluZy4KPiA+IEkgdGhpbmsg
d2UgbWFkZSBhcm02NCBKSVQgdW5uZWNlc3NhcnkgcmVzdHJpY3RpdmUgYW5kIG5vdyBjb25zaWRl
cmluZwo+ID4gdG8gbWFrZSBhbGwgb3RoZXIgSklUcyByZXN0cmljdGl2ZSB0b28gZm9yIGh5cG90
aGV0aWNhbCBjYXNlCj4gPiBvZiBzb21lIGZ1dHVyZSBrZXJuZWwgZnVuY3Rpb25zLgo+ID4gSSBm
ZWVsIHdlJ3JlIGdvaW5nIGluIHRoZSB3cm9uZyBkaXJlY3Rpb24uCj4gPiBJbnN0ZWFkIHdlIHNo
b3VsZCB0ZWFjaCBwYWhvbGUgdG8gc2FuaXRpemUgQlRGIHdoZXJlIGZ1bmN0aW9ucwo+ID4gYXJl
IHVzaW5nIHRoaXMgZmFuY3kgYWxpZ25tZW50IGFuZCBwYWNrZWQgc3RydWN0cy4KPiA+IHBhaG9s
ZSBjYW4gc2VlIGl0IGluIGR3YXJmIGFuZCBjYW4gc2tpcCBlbWl0dGluZyBCVEYgZm9yIHN1Y2gK
PiA+IGZ1bmN0aW9ucy4gVGhlbiB0aGUga2VybmVsIEpJVHMgb24gYWxsIGFyY2hpdGVjdHVyZXMg
d29uJ3QgZXZlbgo+ID4gc2VlIHN1Y2ggY2FzZXMuCj4gPgo+ID4gVGhlIGlzc3VlIHdhcyBpbml0
aWFsbHkgZGlzY292ZXJlZCBieSBhIHNlbGZ0ZXN0Ogo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYnBmLzIwMjUwNDExLW1hbnlfYXJnc19hcm02NC12MS0zLTBhMzJmZTcyMzM5ZUBib290bGlu
LmNvbS8KPiA+IHRoYXQgYXR0ZW1wdGVkIHRvIHN1cHBvcnQgdGhlc2UgdHdvIHR5cGVzOgo+ID4g
K3N0cnVjdCBicGZfdGVzdG1vZF9zdHJ1Y3RfYXJnXzQgewo+ID4gKyBfX3U2NCBhOwo+ID4gKyBf
X3U2NCBiOwo+ID4gK307Cj4gPiArCj4gPiArc3RydWN0IGJwZl90ZXN0bW9kX3N0cnVjdF9hcmdf
NSB7Cj4gPiArIF9faW50MTI4IGE7Cj4gPiArfTsKPiA+Cj4gPiBUaGUgZm9ybWVyIGlzIHByZXNl
bnQgaW4gdGhlIGtlcm5lbC4gSXQncyBtb3JlIG9yIGxlc3Mgc29ja3B0cl90LAo+ID4gYW5kIHBl
b3BsZSB3YW50IHRvIGFjY2VzcyBpdCBmb3Igb2JzZXJ2YWJpbGl0eSBpbiB0cmFjaW5nLgo+ID4g
VGhlIGxhdHRlciBkb2Vzbid0IGV4aXN0IGluIHRoZSBrZXJuZWwgYW5kIHdlIGNhbm5vdCByZXBy
ZXNlbnQKPiA+IGl0IHByb3Blcmx5IGluIEJURiB3aXRob3V0IGxvc2luZyBhbGlnbm1lbnQuCj4g
Pgo+ID4gU28gSSB0aGluayB3ZSBzaG91bGQgZ28gYmFjayB0byB0aGF0IHNlcmllczoKPiA+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi8yMDI1MDQxMS1tYW55X2FyZ3NfYXJtNjQtdjEtMC0w
YTMyZmU3MjMzOWVAYm9vdGxpbi5jb20vCj4gPgo+ID4gcmVtb3ZlIF9faW50MTI4IHNlbGZ0ZXN0
LCBidXQgYWxzbyB0ZWFjaCBwYWhvbGUKPiA+IHRvIHJlY29nbml6ZSB0eXBlcyB0aGF0IGNhbm5v
dCBiZSByZXByZXNlbnRlZCBpbiBCVEYgYW5kCj4gPiBkb24ndCBlbWl0IHRoZW0gZWl0aGVyIGlu
dG8gdm1saW51eCBvciBpbiBrZXJuZWwgbW9kdWxlCj4gPiAobGlrZSBpbiB0aGlzIGNhc2UgaXQg
d2FzIGJwZl90ZXN0bW9kLmtvKQo+ID4gSSB0aGluayB0aGF0IHdvdWxkIGJlIGEgYmV0dGVyIHBh
dGggZm9yd2FyZCBhbGlnbmVkCj4gPiB3aXRoIHRoZSBsb25nIHRlcm0gZ29hbCBvZiBCVEYuCj4g
Pgo+ID4gQW5kIGJlZm9yZSBwZW9wbGUgYXNrLi4uIHBhaG9sZSBpcyBhIHRydXN0ZWQgY29tcG9u
ZW50IG9mIHRoZSBidWlsZAo+ID4gc3lzdGVtLiBXZSB0cnVzdCBpdCBqdXN0IGFzIHdlIHRydXN0
IGdjYywgY2xhbmcsIGxpbmtlciwgb2JqdG9vbC4KPgo+IFNvIGlmIEkgdW5kZXJzdGFuZCBjb3Jy
ZWN0bHkgeW91ciBwb2ludCwgaXQgd291bGQgYmUgYmV0dGVyIHRvIGp1c3QgbW92ZSBvdXQKPiB0
aG9zZSBjb25zdHJhaW50cyBmcm9tIHRoZSBKSVQgY29tcGlsZXJzLCBhbmQganVzdCBub3QgcmVw
cmVzZW50IHRob3NlIHNwZWNpYWwKPiBjYXNlcyBpbiBCVEYsIHNvIHRoYXQgaXQgYmVjb21lcyBp
bXBvc3NpYmxlIHRvIGhvb2sgcHJvZ3JhbXMgb24gdGhvc2UgZnVuY3Rpb25zLAo+IHNpbmNlIHRo
ZXkgYXJlIG5vdCBldmVudCBwcmVzZW50IGluIEJURiBpbmZvLgo+IEFuZCBzbzoKPiAtIGNhbmNl
bCB0aGlzIHNlcmllcwo+IC0gcmV2ZXJ0IHRoZSBzbWFsbCBBUk02NCBjaGVjayBhYm91dCBzdHJ1
Y3QgcGFzc2VkIG9uIHN0YWNrCj4gLSB1cGRhdGUgcGFob2xlIHRvIG1ha2Ugc3VyZSB0aGF0IGl0
IGRvZXMgbm90IGVuY29kZSBpbmZvIGFib3V0IHRoaXMgc3BlY2lmaWMKPiAgIGtpbmQgb2YgZnVu
Y3Rpb25zLgoKeWVzCgo+IEkgc3RpbGwgZXhwZWN0IHNvbWUgY2hhbGxlbmdlcyB3aXRoIHRoaXMu
IEFGQUlVIHBhaG9sZSB1c2VzIERXQVJGIHRvIGdlbmVyYXRlCj4gQlRGLCBhbmQgZGlzY3Vzc2lv
bnMgaW4gWzFdIGhpZ2hsaWdodGVkIHRoZSBmYWN0IHRoYXQgdGhlIGF0dHJpYnV0ZXMgYWx0ZXJp
bmcKPiB0aGUgc3RydWN0cyBhbGlnbm1lbnQgYXJlIG5vdCByZWxpYWJseSBlbmNvZGVkIGluIERX
QVJGLiBNYXliZSBwYWhvbGUgY2FuCj4gImd1ZXNzIiBpZiBhIHN0cnVjdCBoYXMgYmVlbiBhbHRl
cmVkLCBieSBkb2luZyBzb21ldGhpbmcgbGlrZQo+IGJ0Zl9pc19zdHJ1Y3RfcGFja2VkIGluIGxp
YmJwZiA/IEFzIEFuZHJpaSBtZW50aW9uZWQgaW4gWzJdLCBpdCBtYXkgbm90IGJlCj4gYWJsZSB0
byBjb3ZlciBhbGwgY2FzZXMsIGJ1dCB0aGF0IGNvdWxkICBiZSBhIHN0YXJ0LiBJZiB0aGF0J3Mg
aW5kZWVkIHRoZQo+IGRlc2lyZWQgZGlyZWN0aW9uLCBJIGNhbiB0YWtlIGEgZnVydGhlciBsb29r
IGF0IHRoaXMuCgpzbyBiZSBpdC4gSWYgc3l6Ym90IHdhcyB0YXVnaHQgdG8gZnV6eiBkd2FyZiBJ
J20gc3VyZSBpdCB3b3VsZApoYXZlIGV4cG9zZWQgaHVuZHJlZHMgb2YgYnVncyBpbiB0aGUgZm9y
bWF0IGl0c2VsZiBhbmQgY29tcGlsZXJzLApidXQgc2luY2Ugc3VjaCBjb252b2x1dGVkIGNvbnN0
cnVjdHMgYXJlIG5vdCBwcmVzZW50IGluIHRoZSBrZXJuZWwKc291cmNlIGNvZGUgaXQncyBub3Qg
YSBjb25jZXJuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
