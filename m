Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAxAMcf862lbTgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Apr 2026 01:29:11 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD6E4640AA
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Apr 2026 01:29:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C19C0C87EC6;
	Fri, 24 Apr 2026 23:29:10 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54F35C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2026 23:29:09 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43d64313c39so6492959f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2026 16:29:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777073348; cv=none;
 d=google.com; s=arc-20240605;
 b=dkKzctGO1M/oeI3Eg1heboU8KyQARl9WI36jkUkny/UzvdRkNvj1ZtGkUSy/0ZQ3Wl
 HYNBdkynirPVEjk/Njxx9LI8Sav0PA9+ywZS7ByMB4r6n2tZ7gMN3RXK4YWHv+OfRmv3
 I3qixi65S6w1QXFTyLZJtl1fSoDMxfaPL0F4uq1jLGwsxTC7YcjllFVzP2ZpBoZvFkL5
 ZKuN4lN8FFjPua8/zOoZ6iDCoWgVPVqsbGnQjPTmIlsLZ3kZ5LAwu7O82G8hDGwUO4fU
 LqumE5u+3rBoTSLRTlBrih3EPEsJFcDPoSY8X4MdJwhXDHY8lB/6Bnax0AOl6Cyjdium
 YtnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ahCy8rxOvixjX2FA5ApDynwuvYGvOS/2mqLtTRZIyI4=;
 fh=PQcl7yAjmTdKxJeOaWmZDbbdbacWGM45epStckHQFRg=;
 b=OhBajeLy3U0p0Mg6ck3eOeO9+0A4Y9c08DtBJOF+NPPELS5o8Wia4/xW53vjn9PrvV
 CSe6oayIfuXwBOTWjMY1PlihEXB5r7Wp4lV26LZjKNRpPXrha4rK0bZxrNJBWcZZ5ykN
 yrvQtS7ijErVmblEEz2dpRdNOTUCELRb1KxELYha0+jhTshkthZ12It06TowVFxA1I72
 07v2dE7UHtkZJ1c5Z8zJPF/O57byMYZEwlkBM5FwWMh4Nt349l0LHnthC0sO6a8V2qTR
 SBxhDqTGlLAm/XgIs/39XQB02MF3NOYsHZj8LUBwv8EyGy3OvDaUNtYiTEaJnSGz+EYk
 Uz+w==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777073348; x=1777678148;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ahCy8rxOvixjX2FA5ApDynwuvYGvOS/2mqLtTRZIyI4=;
 b=XpzIpe8Cho5T3X0unciIeda4C2giPH5XYgGUyHDhZkVlNO4MP1AtDhOe2Mp6YcjcRu
 IoZ46Y7VvcenxoB8cN01cfhlFKGZ0SoJAEUjzTalHwY/I61pnndg4ZOm5DKPbObVrTtn
 X07F2mu9rQlOPONkbYApi8Mn6Yw9jRH+uL732CAfZ64OdwxgjguoomwqL6U8KooZsoi0
 zw1VgUZWkHjWzk3my6r11Nt4UnZFipYiHdxSMlEfLDy9nmm/W3vuyxcU7v8cGKm6J0db
 mI0S7UhvrpJ85rMTscDfwCLtfq7Uw8WZzGCHbNcxO0XBmZpc4fZ+QbsLNgcFPzusQ6k8
 qNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777073348; x=1777678148;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ahCy8rxOvixjX2FA5ApDynwuvYGvOS/2mqLtTRZIyI4=;
 b=GlKf6bvOvaoZu3L0T7BczFjdSWwiY2Rz6450QIWstEmGv1SrS9VbtsUee3VOtbGl9J
 XvFiZDWg6O7NEstnImfZtsUpGYRaE15Hj9FFti87aQcRrvfmQtvkQSUu7oUeoYLxVWta
 OnaQla2AX2a8WIMOuD0bWVK9LAhdHpM9sF8ak1EFX17CYpiilyOCiWu6UbXjz7rnev/v
 e+Z15Yr9ncSL73HOoTcVOZXGB5sgwKEevs9lyp9ebpAtxbFdQY6za9QS/VILiMVVo69D
 rYjYgdMMgpms7uTFxZps/A5vk0Ob25V/elP7pawfV+49vVI4TKRaIhUGU8vyeIQako9g
 w7dw==
X-Forwarded-Encrypted: i=1;
 AFNElJ82U2Z5dwtBftpmXCFBN01yfH3NbRv+bL4UBuPWMtAX7A/W9MBhCtgfc11NjNHeFMq+ILJg7qBu1hFkcg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyCzORy9Iv+/Gmktb5I+M48MLUaxaVD9mpZ2WaRW3IVJpBnSTS2
 K+aYcBgvPHE2jPhgF2SkkhYOd2oGHI2XDplRsK6Mn3wz+MYAchUFqo+zoPLEDOafq0hjLbwNSvh
 MZKKJB6dww2xqBKc2OUopQnFyv4JTyGk=
X-Gm-Gg: AeBDieuKhM9o3zRTd5GiCL9qzWwxDpZwE1kncOUG4kCORbUdEcyuMy1mRqLrZh0Spjs
 YsZiuikLiMvpwo/rCS78NGU+l67EMItGIFKrFgmAsERrL6Y/1ddbx7hNFyJX2G5gEtzqxkvUHVJ
 kS/4VG48OP68rrXYmENdyu84VQkOGGI6JYobCz5kU3RetRMLZcffOa79WG+DdBpjKG8ofP1Ud2c
 Mmc8L3dLviQcSQe2lAQWV9qotAwLqPJ9QDL+AQhdS93SjTW/MoPS2aNv264rw13/1NX2eSKrgNz
 lxLB9sRzcNlGWh7IG+CHbVaYAL7ZRA5nxuE1XIS87S0MBQtvJEQBM8hMYMbqY0Pz0K5aI8cABAB
 uCVWqV8T1qa0xDWK7orN1gwZXnkVpwhQTg6GP
X-Received: by 2002:a05:6000:2c0b:b0:439:beb9:5a96 with SMTP id
 ffacd0b85a97d-43fe3dfbff5mr53034945f8f.31.1777073348360; Fri, 24 Apr 2026
 16:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <71fb19ff-6dde-43f4-a0e9-5c8cf2ba4ed4@linux.dev>
In-Reply-To: <71fb19ff-6dde-43f4-a0e9-5c8cf2ba4ed4@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 24 Apr 2026 16:28:56 -0700
X-Gm-Features: AQROBzB_ndIthouIQciueRLu_dMM7bcPcCRP_ecesud5fA9xG1Ica2sIBP2K-bI
Message-ID: <CAADnVQ+ytaX5oq_1TjKC66dnjd1-yh3yjmPrP-kEg5wEvX643g@mail.gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Song Liu <song@kernel.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, "H. Peter Anvin" <hpa@zytor.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan <shuah@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Xu Kuohai <xukuohai@huawei.com>,
 Daniel Borkmann <daniel@iogearbox.net>, X86 ML <x86@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, ebpf@linuxfoundation.org,
 Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>, bpf <bpf@vger.kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, Network Development <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC bpf-next 0/8] bpf: add support for
 KASAN checks in JITed programs
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
X-Rspamd-Queue-Id: 6CD6E4640AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:ihor.solodrai@linux.dev,m:thomas.petazzoni@bootlin.com,m:dave.hansen@linux.intel.com,m:song@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:yonghong.song@linux.dev,m:hpa@zytor.com,m:vincenzo.frascino@arm.com,m:shuah@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:xukuohai@huawei.com,m:daniel@iogearbox.net,m:x86@kernel.org,m:john.fastabend@gmail.com,m:andrii@kernel.org,m:kasan-dev@googlegroups.com,m:mingo@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:bastien.curutchet@bootlin.com,m:mcoquelin.stm32@gmail.com,m:ebpf@linuxfoundation.org,m:ast@kernel.org,m:bp@alien8.de,m:alexis.lothore@bootlin.com,m:bpf@vger.kernel.org,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:netdev@vger.kernel.org,m:dsahern@kernel.org,m:linux-kernel@vger.kernel.org,m:eddyz87@gmail.com,m:tglx@kernel.org,m:jolsa@kernel.org,m:akpm@linux-foundation.org,m:martin.lau@linux.dev,m:davem@davemloft.net,m:memxor@gmail.com,
 m:ryabininaa@gmail.com,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[alexeistarovoitov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,linux.intel.com,kernel.org,gmail.com,google.com,linux.dev,zytor.com,arm.com,st-md-mailman.stormreply.com,huawei.com,iogearbox.net,googlegroups.com,redhat.com,lists.infradead.org,linuxfoundation.org,alien8.de,vger.kernel.org,kvack.org,linux-foundation.org,davemloft.net];
	NEURAL_HAM(-0.00)[-0.991];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[alexeistarovoitov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,mail.gmail.com:mid,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]

T24gRnJpLCBBcHIgMjQsIDIwMjYgYXQgNDoxMOKAr1BNIElob3IgU29sb2RyYWkgPGlob3Iuc29s
b2RyYWlAbGludXguZGV2PiB3cm90ZToKPgo+IEkgd29uZGVyIGlmIGl0J3MgZmVhc2libGUgdG8g
aW1wbGVtZW50IEtBU0FOIHN1cHBvcnQgb24gdGhlIHZlcmlmaWVyCj4gc2lkZSBpbiBwb3N0LXZl
cmlmaWNhdGlvbiBmaXh1cHMuIEFJIHNsb3AgZm9yIGlsbHVzdHJhdGlvbjoKPgo+ICAgOzsgT3Jp
Z2luYWwgKDEgQlBGIGluc24pOgo+ICAgZHN0ID0gKih1NjQgKikoc3JjICsgb2ZmKSAgICAgICAg
ICAgOyBCUEZfTERYIHwgQlBGX01FTSB8IEJQRl9EVwo+Cj4gICA7OyBSZXdyaXRlICh+NyBCUEYg
aW5zbnMpOgo+ICAgcl90bXAxID0gc3JjICAgICAgICAgICAgICAgICAgICAgICAgIDsgQlBGX01P
VjY0X1JFRwo+ICAgcl90bXAxICs9IG9mZiAgICAgICAgICAgICAgICAgICAgICAgIDsgQlBGX0FM
VTY0IHwgQlBGX0FERCB8IEsgICAoZnVsbCBhZGRyZXNzKQo+ICAgcl90bXAyID0gcl90bXAxICAg
ICAgICAgICAgICAgICAgICAgIDsgY29weQo+ICAgcl90bXAyID4+PSAzICAgICAgICAgICAgICAg
ICAgICAgICAgIDsgS0FTQU5fU0hBRE9XX1NDQUxFX1NISUZUCj4gICByX3RtcDIgKz0gS0FTQU5f
U0hBRE9XX09GRlNFVCAgICAgICAgOyBzaGFkb3cgYWRkcmVzcwo+ICAgcl90bXAzID0gKih1OCAq
KShyX3RtcDIgKyAwKSAgICAgICAgIDsgQlBGX0xEWCB8IEJQRl9CICAgKGxvYWQgc2hhZG93IGJ5
dGUpCj4gICBpZiByX3RtcDMgIT0gMCBnb3RvICsyICAgICAgICAgICAgICAgOyBCUEZfSk5FIHwg
UEMrMgo+ICAgZHN0ID0gKih1NjQgKikoc3JjICsgb2ZmKSAgICAgICAgICAgIDsgb3JpZ2luYWwg
YWNjZXNzIChmYXN0IHBhdGgpCj4gICBnb3RvICsxICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgOyBza2lwIHNsb3dwYXRoCj4gICBjYWxsIF9fYXNhbl9yZXBvcnRfbG9hZDggICAgICAgICAg
ICAgOyBCUEYga2Z1bmMKPiAgIGRzdCA9ICoodTY0ICopKHNyYyArIG9mZikgICAgICAgICAgICA7
IHJldHJ5IHRoZSBhY2Nlc3MgYWZ0ZXIgcmVwb3J0IChub24tZmF0YWwpCj4KPiBBIHNvcnQgb2Yg
aW5saW5lIGthc2FuIGRpcmVjdGx5IGluIEJQRi4KPgo+IFRoZXJlIGFyZSBwbGVudHkgb2YgaXNz
dWVzIHdpdGggaXQ6IGluc3RydWN0aW9uIGxpbWl0LCBleHBvc2luZyBhc2FuCj4gQVBJIGFzIGtm
dW5jcywgZXRjLiBPbiB0aGUgZmxpcCBzaWRlIHdlIGdldCBjcm9zcy1hcmNoIHN1cHBvcnQgb3V0
IG9mCj4gdGhlIGJveCB3aXRoIG5vIG9yIG1pbmluYWwgSklUIGNoYW5nZXMuCj4KPiBIb25lc3Rs
eSBJJ20gbm90IGV4Y2l0ZWQgYWJvdXQgdGhpcyBhcHByb2FjaCwgYnV0IGN1cmlvdXMgaWYgYW55
b25lCj4gdGhvdWdodCBhYm91dCB0aGlzLCBvciBtYXliZSBpdCB3YXMgYWxyZWFkeSBkaXNjdXNz
ZWQ/CgpXZSBkaXNjdXNzZWQgdGhpcy4KSXQgd29uJ3Qgd29yayBiZWNhdXNlIHdlIGRvbid0IGhh
dmUgdGhhdCBtYW55IHRlbXAgcmVnaXN0ZXJzIGZvciBvbmNlCmFuZCBzZWNvbmQgaXQgaGFzIHRv
IHByZXNlcnZlIGFsbCAoYm90aCBjYWxsZWUgYW5kIGNhbGxlciBzYXZlZCByZWdzKS4KVGhpcyBp
cyBhcmNoIHNwZWNpZmljLgoKU2Vjb25kLCB3ZSBkbyBub3Qgd2FudCBvdGhlciBhcmNocy4gVGhp
cyBmZWF0dXJlIGlzIHg4Ni02NCBvbmx5LgpJdCdzIGJlaW5nIGFkZGVkIHRvIGZpbmQgX3Zlcmlm
aWVyXyBidWdzLiBUbyBkbyB0aGF0IG9uZSBhcmNoIGlzIGVub3VnaC4KCj4KPiA+IC0gbm90IGFs
bCBtZW1vcnkgYWNjZXNzaW5nIEJQRiBpbnN0cnVjdGlvbnMgYXJlIGJlaW5nIGluc3RydW1lbnRl
ZDoKPiA+ICAgLSBpdCBmb2N1c2VzIG9uIFNUWC9MRFggaW5zdHJ1Y3Rpb25zCj4gPiAgIC0gaXQg
ZGlzY2FyZHMgaW5zdHJ1Y3Rpb25zIGFjY2Vzc2luZyBCUEYgcHJvZ3JhbSBzdGFjayAoYWxyZWFk
eQo+ID4gICAgIG1vbml0b3JlZCBieSBwYWdlIGd1YXJkcykKPiA+ICAgLSBpdCBkaXNjYXJkcyBw
b3NzaWJseSBmYXVsdGluZyBpbnN0cnVjdGlvbnMsIGxpa2UgQlBGX1BST0JFX01FTSBvcgo+ID4g
ICAgIEJQRl9QUk9CRV9BVE9NSUMgaW5zbnMKPiA+Cj4gPiBUaGUgc2VyaWVzIGlzIG1hcmtlZCBh
bmQgc2VudCBhcyBSRkM6Cj4gPiAtIHRvIGFsbG93IGNvbGxlY3RpbmcgZmVlZGJhY2sgZWFybHkg
YW5kIG1ha2Ugc3VyZSB0aGF0IGl0IGdvZXMgaW50byB0aGUKPiA+ICAgcmlnaHQgZGlyZWN0aW9u
Cj4gPiAtIGJlY2F1c2UgaXQgZGVwZW5kcyBvbiBYdSdzIHdvcmsgdG8gcGFzcyBkYXRhIGJldHdl
ZW4gdGhlIHZlcmlmaWVyIGFuZAo+ID4gICBKSVQgY29tcGlsZXJzLiBUaGlzIHdvcmsgaXMgbm90
IG1lcmdlZCB5ZXQsIHNlZSBbMl0uIEkgaGF2ZSBiZWVuCj4gPiAgIHRyYWNraW5nIHRoZSB2YXJp
b3VzIHJldmlzaW9ucyBoZSBzZW50IG9uIHRoZSBNTCBhbmQgYmFzZWQgbXkgbG9jYWwKPiA+ICAg
YnJhbmNoIG9uIGhpcyB3b3JrCj4gPiAtIGJlY2F1c2UgdGVzdHMgYnJvdWdodCBieSB0aGlzIHNl
cmllcyBjdXJyZW50bHkgY2FuJ3QgcnVuIG9uIEJQRiBDSToKPiA+ICAgdGhleSBleHBlY3Qga2Fz
YW4gbXVsdGlzaG90IHRvIGJlIGVuYWJsZWQsIG90aGVyd2lzZSB0aGUgZmlyc3QgdGVzdAo+ID4g
ICB3aWxsIG1ha2UgYWxsIG90aGVyIGthc2FuLXJlbGF0ZWQgdGVzdHMgZmFpbC4KPgo+IEFGQUlD
VCB0aGlzIGNhbiBiZSB0cml2aWFsbHkgZml4ZWQgb24gQlBGIENJIHNpZGUsIHdlIGp1c3QgbmVl
ZCB0byBzZXQKPiBrYXNhbl9tdWx0aV9zaG90IGZvciB0aGUgVk1zIHJ1bm5pbmcgdGhlIHRlc3Rz
LiBJIHdpbGwgZG8gdGhhdCwgeW91cgo+IG5leHQgcmV2aXNpb24gZG9lc24ndCBoYXZlIHRvIGJl
IGFuZCBSRkMuCgorMQoKPiA+IC0gYmVjYXVzZSBzb21lIGNhc2VzIGxpa2UgYXRvbWljIGxvYWRz
L3N0b3JlcyBhcmUgbm90IGluc3RydW1lbnRlZCB5ZXQKPiA+ICAgKGFuZCBhcmUgc3RpbGwgbWFr
aW5nIG1lIHNjcmF0Y2ggbXkgaGVhZCkKPiA+IC0gYmVjYXVzZSBpdCB3aWxsIGhvcGVmdWxseSBw
cm92aWRlIGEgZ29vZCBiYXNpcyB0byBkaXNjdXNzIHRoZSB0b3BpYyBhdAo+ID4gICBMU0ZNTUJQ
RiAoc2VlIFszXSkKPgo+IEFwcGFyZW50bHksIEtBU0FOIHJlcG9ydGluZyByb3V0aW5lIHRha2Vz
IGEgbG9jayBbMV06Cj4KPiAgICBfX2FzYW5fbG9hZCgpCj4gICAgICAtPiBjaGVja19yZWdpb25f
aW5saW5lKCkKPiAgICAgICAgIC0+IGthc2FuX3JlcG9ydCgpCj4gICAgICAgICAgICAtPiBzdGFy
dF9yZXBvcnQoKQo+ICAgICAgICAgICAgICAtPiByYXdfc3Bpbl9sb2NrX2lycXNhdmUoJnJlcG9y
dF9sb2NrLCAqZmxhZ3MpOwo+Cj4gQlBGIHByb2dyYW1zIGNhbiBydW4gaW4gTk1JIGNvbnRleHQs
IGFuZCBzbyBpdCBhcHBlYXJzIHRvIGJlIHBvc3NpYmxlCj4gdG8gZ2V0IGFuIHVuZmxhZ2dlZCAo
YmVjYXVzZSBvZiBsb2NrZGVwX29mZigpIGluIHN0YXJ0X3JlcG9ydCkKPiBkZWFkbG9jaywgaWYg
YW4gTk1JIGZpcmVzIG9uIGEgQ1BVIGFscmVhZHkgaG9sZGluZyByZXBvcnRfbG9jay4KPiBBbHRo
b3VnaCBJIGd1ZXNzIHlvdSdkIG5lZWQgdHdvIEtBU0FOIGJ1Z3MgdG8gaGFwcGVuCj4gc2ltdWx0
YW5lb3VzbHkgZm9yIHRoYXQgdG8gb2NjdXI/Li4uIEEgcmFyZSBldmVudCwgSSB3b3VsZCBob3Bl
Lgo+Cj4gSXQgY291bGQgYmUgYWRkcmVzc2VkIHdpdGggZWl0aGVyIGluX25taSgpIGNoZWNrIGF0
IHJ1bnRpbWUsIG9yCj4gZm9yYmlkZGluZyBrYXNhbiBmb3IgTk1JLXJ1bm5hYmxlIEJQRiBwcm9n
cmFtIHR5cGVzLgoKV2UgZG9uJ3QgbmVlZCB0aGF0LiBJZiB0aGlzIGJwZiBLQVNBTiBmaW5kcyBh
IGJ1ZywgaXQgbWVhbnMgdGhhdAppdCBmb3VuZCBhIHZlcmlmaWVyIGJ1Zy4gQWxsIHRoaW5ncyBh
cmUgb3V0IG9mIHRoZSB3aW5kb3cuCmthc2FuX3JlcG9ydCgpIHNwbGF0IGNhbiBqdXN0IGFzIHdl
bGwgYmUgdGhlIGxhc3QgdGhpbmcgdGhhdCB1c2VycyB3aWxsIHNlZS4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
