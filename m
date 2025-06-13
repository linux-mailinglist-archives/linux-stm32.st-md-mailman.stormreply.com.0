Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ED6AD983F
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Jun 2025 00:36:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA6F2C36B3D;
	Fri, 13 Jun 2025 22:36:10 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FC84C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 22:36:09 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so31204455e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 15:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749854169; x=1750458969;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZDhN0PQzQ9wgEHlw7OXTzGjuQH3XOnQA5xq1WBIqnek=;
 b=fT2mi8oHG93I3zspw8qUDUaJAOVdgXyo1zdmxwzWTy6eU/zAThkvp02xflKgqs7us+
 AqW2sxkDS8uZ823XSx0nbX2H0gdNWEK/5nzoijD3N9rosW9Ooyzn/6bjFtGQY+3kfdXJ
 bFCeTYlT0iji9Yx2BXi89eMjZJaas8yWUC+aTPSwsr3clNdbTF9EQnY7V+WfPH2icqWx
 e0G4u//GrkCec6DM0iGP2c1HsrI8dxohPFeQCqYLPX3VcRKYMWXcrS9yxDBUN0Vv030s
 asqSpxcxiI8Sj3N5BzvvsFoTTqPCR60hwBAkKtLEWG8DPrSk7YjqCnfFOb0wd2zchCpQ
 5/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749854169; x=1750458969;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZDhN0PQzQ9wgEHlw7OXTzGjuQH3XOnQA5xq1WBIqnek=;
 b=YMiixSDkmzVS4Z4Xi1XxU1AQ1Py0AuemxAkWWyK+pduCJlx6Gw7Acgj4T3HYzD73nd
 hM9Jx5m5Fx/yfT8bd2+GsqvScQcFZjO7Z2hZcBfpqDfNPKkFNpD6biehOyj7esM53VAf
 DCbIvKgIXW4QRUnDYMe0pIlp5hf2A/aZfp43gE1JXGAcGAnFJDnWtbH/bLJB1ZtHjb0b
 nCQJdWLgMtrvZwYKDIKok58SYxiOOaokw6Q2fcRefW95vPxmj4rznQUdONex9/0K0yNQ
 JMbxtdn263MP4LI653YgcfCeBjZPt5bZfavwx1ZsVBu57qBT0ae1RVDo04qsinY4o49D
 Tumg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkSee1LzBNBvR0yEAsSIRcJpNtl7NnfcR1x9Ca0I0/JoSf7w4hVg3rbLX8NRA1Sw4o6RwBVb/4Ay12DA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywq7gVqmztjtPameXtopxi/zBMpoLqzYcKRUjkeS7ZOrK5G6A4K
 yErqxyGe47SQou99U3bmuKvvuAKiO+wPJvwJah//T4PZ4W43XPK8n6yI7FlBJ/Y8YZcxin9GH9N
 LYBLJ4dEL/6ELFJbQvOltCM2ITEA+CNo=
X-Gm-Gg: ASbGncv3mH7freFpa5OL5EOoQilZh52g+5rqV82g+NKDo956yduD9c20A/LGH4qHVL9
 sijFAjq/9BWocQ65bFJJKfyHPJ6cnt2ktNVnD/xKEZ+Huxc8tWmPWQ/7sOCaMk6uedMJAkCKupS
 g792PkL42trIMCsr686BH2XaJ2G76KQ7yWSrpX/iMpLcOwDIW4gBrbVs5euW+wU71HHBA0mzMr
X-Google-Smtp-Source: AGHT+IGvAZU4d5tXw0nhgWlSwGRKFbuaQhR8GZiHa22TV57O0MRl7T0f9v9YaYzOJredMJW3TgBMxueem5pPB3YsBNg=
X-Received: by 2002:a05:6000:40dd:b0:3a5:2694:d75f with SMTP id
 ffacd0b85a97d-3a572e895fbmr1535518f8f.52.1749854168416; Fri, 13 Jun 2025
 15:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com>
 <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com>
 <20250613081150.GJ2273038@noisy.programming.kicks-ass.net>
 <DAL9GRMH74F4.2IV0HN0NGU65X@bootlin.com>
 <20250613083232.GL2273038@noisy.programming.kicks-ass.net>
 <DALA5WYA04OG.1283TZDOVLBPS@bootlin.com>
In-Reply-To: <DALA5WYA04OG.1283TZDOVLBPS@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 13 Jun 2025 15:35:57 -0700
X-Gm-Features: AX0GCFvxnM-s8AungljiWEt_LCtzKmPe0DGMu2VqQrNsxFmjrZ6Pec_NoZEOn-E
Message-ID: <CAADnVQ+sj9XhscN9PdmTzjVa7Eif21noAUH3y1K6x5bWcL-5pg@mail.gmail.com>
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
 LKML <linux-kernel@vger.kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
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

T24gRnJpLCBKdW4gMTMsIDIwMjUgYXQgMTo1OeKAr0FNIEFsZXhpcyBMb3Rob3LDqQo8YWxleGlz
LmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gRnJpIEp1biAxMywgMjAyNSBhdCAx
MDozMiBBTSBDRVNULCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPiA+IE9uIEZyaSwgSnVuIDEzLCAy
MDI1IGF0IDEwOjI2OjM3QU0gKzAyMDAsIEFsZXhpcyBMb3Rob3LDqSB3cm90ZToKPiA+PiBIaSBQ
ZXRlciwKPiA+Pgo+ID4+IE9uIEZyaSBKdW4gMTMsIDIwMjUgYXQgMTA6MTEgQU0gQ0VTVCwgUGV0
ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gPj4gPiBPbiBGcmksIEp1biAxMywgMjAyNSBhdCAwOTozNzox
MUFNICswMjAwLCBBbGV4aXMgTG90aG9yw6kgKGVCUEYgRm91bmRhdGlvbikgd3JvdGU6Cj4KPiBb
Li4uXQo+Cj4gPj4gTWF5YmUgbXkgY29tbWl0IHdvcmRpbmcgaXMgbm90IHByZWNpc2UgZW5vdWdo
LCBidXQgaW5kZWVkLCB0aGVyZSdzIG5vdAo+ID4+IGRvdWJ0IGFib3V0IHdoZXRoZXIgdGhlIHN0
cnVjdCB2YWx1ZSBpcyBwYXNzZWQgb24gdGhlIHN0YWNrIG9yIHRocm91Z2ggYQo+ID4+IHJlZ2lz
dGVyL2EgcGFpciBvZiByZWdpc3RlcnMuIFRoZSBkb3VidCBpcyByYXRoZXIgYWJvdXQgdGhlIHN0
cnVjdCBsb2NhdGlvbgo+ID4+IHdoZW4gaXQgaXMgcGFzc2VkIF9ieSB2YWx1ZV8gYW5kIF9vbiB0
aGUgc3RhY2tfOiB0aGUgQUJJIGluZGVlZCBjbGVhcmx5Cj4gPj4gc3RhdGVzIHRoYXQgIlN0cnVj
dHVyZXMgYW5kIHVuaW9ucyBhc3N1bWUgdGhlIGFsaWdubWVudCBvZiB0aGVpciBtb3N0Cj4gPj4g
c3RyaWN0bHkgYWxpZ25lZCBjb21wb25lbnQiIChwLjEzKSwgYnV0IHRoaXMgcnVsZSBpcyAic2ls
ZW50bHkgYnJva2VuIiB3aGVuCj4gPj4gYSBzdHJ1Y3QgaGFzIGFuIF9fYXR0cmlidXRlX18oKHBh
Y2tlZCkpIG9yIGFuZCBfX2F0dHJpYnV0ZV9fKChhbGlnbmVkKFgpKSksCj4gPj4gYW5kIEFGQUlD
VCB0aGlzIGNhc2UgY2FuIG5vdCBiZSBkZXRlY3RlZCBhdCBydW50aW1lIHdpdGggY3VycmVudCBC
VEYgaW5mby4KPiA+Cj4gPiBBaCwgb2theS4gU28gaXQgaXMgYSBmYWlsdXJlIG9mIEJURi4gVGhh
dCB3YXMgaW5kZWVkIG5vdCBjbGVhci4KPgo+IElmIEkgbmVlZCB0byByZXNwaW4sIEknbGwgcmV3
cml0ZSB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gaW5jbHVkZSB0aGUgZGV0YWlscwo+IGFib3ZlLgoK
Tm8gbmVlZCB0byByZXNwaW4uIFRoZSBjb3ZlciBsZXR0ZXIgaXMgcXVpdGUgZGV0YWlsZWQgYWxy
ZWFkeS4KCkJ1dCBsb29raW5nIGF0IHRoZSBwYXRjaCBhbmQgdGhpcyB0aHJlYWQgSSB0aGluayB3
ZSBuZWVkIHRvIGFncmVlCm9uIHRoZSBsb25nIHRlcm0gYXBwcm9hY2ggdG8gQlRGLCBzaW5jZSBw
ZW9wbGUgYXNzdW1lIHRoYXQKaXQncyBhIG1vcmUgY29tcGFjdCBkd2FyZiBhbmQgYW55IG1pc3Np
bmcgaW5mb3JtYXRpb24Kc2hvdWxkIGJlIGFkZGVkIHRvIGl0LgpMaWtlIGluIHRoaXMgY2FzZSBz
cGVjaWFsIGFsaWdubWVudCBjYXNlIGFuZCBwYWNrZWQgYXR0cmlidXRlcwphcmUgbm90IGV4cHJl
c3NlZCBpbiBCVEYgYW5kIEkgYmVsaWV2ZSB0aGV5IHNob3VsZCBub3QgYmUuCkJURiBpcyBub3Qg
YSBkZWJ1ZyBmb3JtYXQgYW5kIG5vdCBhIHN1YnN0aXR1dGUgZm9yIGR3YXJmLgpUaGVyZSBpcyBu
byBnb2FsIHRvIGV4cHJlc3MgZXZlcnl0aGluZyBwb3NzaWJsZSBpbiBDLgpJdCdzIG1pbmltYWws
IGJlY2F1c2UgQlRGIGlzIF9wcmFjdGljYWxfIGRlc2NyaXB0aW9uIG9mCnR5cGVzIGFuZCBkYXRh
IHByZXNlbnQgaW4gdGhlIGtlcm5lbC4KSSBkb24ndCB0aGluayB0aGUgc3BlY2lhbCBjYXNlIG9m
IHBhY2tpbmcgYW5kIGFsaWdubWVudCBleGlzdHMKaW4gdGhlIGtlcm5lbCB0b2RheSwgc28gdGhl
IGN1cnJlbnQgZm9ybWF0IGlzIHN1ZmZpY2llbnQuCkl0IGRvZXNuJ3QgbWlzcyBhbnl0aGluZy4K
SSB0aGluayB3ZSBtYWRlIGFybTY0IEpJVCB1bm5lY2Vzc2FyeSByZXN0cmljdGl2ZSBhbmQgbm93
IGNvbnNpZGVyaW5nCnRvIG1ha2UgYWxsIG90aGVyIEpJVHMgcmVzdHJpY3RpdmUgdG9vIGZvciBo
eXBvdGhldGljYWwgY2FzZQpvZiBzb21lIGZ1dHVyZSBrZXJuZWwgZnVuY3Rpb25zLgpJIGZlZWwg
d2UncmUgZ29pbmcgaW4gdGhlIHdyb25nIGRpcmVjdGlvbi4KSW5zdGVhZCB3ZSBzaG91bGQgdGVh
Y2ggcGFob2xlIHRvIHNhbml0aXplIEJURiB3aGVyZSBmdW5jdGlvbnMKYXJlIHVzaW5nIHRoaXMg
ZmFuY3kgYWxpZ25tZW50IGFuZCBwYWNrZWQgc3RydWN0cy4KcGFob2xlIGNhbiBzZWUgaXQgaW4g
ZHdhcmYgYW5kIGNhbiBza2lwIGVtaXR0aW5nIEJURiBmb3Igc3VjaApmdW5jdGlvbnMuIFRoZW4g
dGhlIGtlcm5lbCBKSVRzIG9uIGFsbCBhcmNoaXRlY3R1cmVzIHdvbid0IGV2ZW4Kc2VlIHN1Y2gg
Y2FzZXMuCgpUaGUgaXNzdWUgd2FzIGluaXRpYWxseSBkaXNjb3ZlcmVkIGJ5IGEgc2VsZnRlc3Q6
Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi8yMDI1MDQxMS1tYW55X2FyZ3NfYXJtNjQtdjEt
My0wYTMyZmU3MjMzOWVAYm9vdGxpbi5jb20vCnRoYXQgYXR0ZW1wdGVkIHRvIHN1cHBvcnQgdGhl
c2UgdHdvIHR5cGVzOgorc3RydWN0IGJwZl90ZXN0bW9kX3N0cnVjdF9hcmdfNCB7CisgX191NjQg
YTsKKyBfX3U2NCBiOworfTsKKworc3RydWN0IGJwZl90ZXN0bW9kX3N0cnVjdF9hcmdfNSB7Cisg
X19pbnQxMjggYTsKK307CgpUaGUgZm9ybWVyIGlzIHByZXNlbnQgaW4gdGhlIGtlcm5lbC4gSXQn
cyBtb3JlIG9yIGxlc3Mgc29ja3B0cl90LAphbmQgcGVvcGxlIHdhbnQgdG8gYWNjZXNzIGl0IGZv
ciBvYnNlcnZhYmlsaXR5IGluIHRyYWNpbmcuClRoZSBsYXR0ZXIgZG9lc24ndCBleGlzdCBpbiB0
aGUga2VybmVsIGFuZCB3ZSBjYW5ub3QgcmVwcmVzZW50Cml0IHByb3Blcmx5IGluIEJURiB3aXRo
b3V0IGxvc2luZyBhbGlnbm1lbnQuCgpTbyBJIHRoaW5rIHdlIHNob3VsZCBnbyBiYWNrIHRvIHRo
YXQgc2VyaWVzOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvMjAyNTA0MTEtbWFueV9hcmdz
X2FybTY0LXYxLTAtMGEzMmZlNzIzMzllQGJvb3RsaW4uY29tLwoKcmVtb3ZlIF9faW50MTI4IHNl
bGZ0ZXN0LCBidXQgYWxzbyB0ZWFjaCBwYWhvbGUKdG8gcmVjb2duaXplIHR5cGVzIHRoYXQgY2Fu
bm90IGJlIHJlcHJlc2VudGVkIGluIEJURiBhbmQKZG9uJ3QgZW1pdCB0aGVtIGVpdGhlciBpbnRv
IHZtbGludXggb3IgaW4ga2VybmVsIG1vZHVsZQoobGlrZSBpbiB0aGlzIGNhc2UgaXQgd2FzIGJw
Zl90ZXN0bW9kLmtvKQpJIHRoaW5rIHRoYXQgd291bGQgYmUgYSBiZXR0ZXIgcGF0aCBmb3J3YXJk
IGFsaWduZWQKd2l0aCB0aGUgbG9uZyB0ZXJtIGdvYWwgb2YgQlRGLgoKQW5kIGJlZm9yZSBwZW9w
bGUgYXNrLi4uIHBhaG9sZSBpcyBhIHRydXN0ZWQgY29tcG9uZW50IG9mIHRoZSBidWlsZApzeXN0
ZW0uIFdlIHRydXN0IGl0IGp1c3QgYXMgd2UgdHJ1c3QgZ2NjLCBjbGFuZywgbGlua2VyLCBvYmp0
b29sLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
