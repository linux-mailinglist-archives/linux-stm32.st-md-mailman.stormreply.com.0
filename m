Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D2EA99630
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Apr 2025 19:15:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3309FC71287;
	Wed, 23 Apr 2025 17:15:44 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EF3DCFAC44
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 17:15:43 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-acb615228a4so211160066b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 10:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745428543; x=1746033343;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IXqH3/APdtQJoO7o2nnXO+aSVxcwfTQhNjLKJExRtA4=;
 b=fySXMEKPLFq2FBqqg2RPHZHwAOJ1T9Oia6quf38eXnVASVec0lktTT2NZW1RP8otas
 r8EhnpnB22sRM5yU3DepaI9/MAKEH4nzsU6WPr+5q8PssU+VOYiO7IMpnvrJxRIj4o5z
 UDNnwWdmyTe2iR5jYS7FMyQVtlhAsMN+XwKgKs4hahDSOl9ndXC2Zs3FpcuZCPiFpJ6O
 lyZ8GaLqTL2kv5ViL7foMjUJrioFh6H9nhjsvovNhOzwc0ZfCG+J9IT634IFx4VYKKx5
 HBC4QILu51kL/mqohJKKVTO6yz72q7H2yidih9hqHzn/kZTVTUowyRD5hdBWD7FuHAox
 857Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745428543; x=1746033343;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IXqH3/APdtQJoO7o2nnXO+aSVxcwfTQhNjLKJExRtA4=;
 b=tiGHm1A5tXNIK2ncZzxUA1rByFkfsQxXr7x9nmr0wHSVUIaF3qDdoT63cNUwe72kZ+
 DjqbtpE8msQI9PxnQAbgPAiCn1/NXowIzD3db9ICzjaB/XYZ63gIaql3dsC+GHRDKZUZ
 JZQx0qUkJDSCS83a27+CRCSzy86arwe6vyPt+DIPP3Y0Q4kG78Q18RRhRMk3yrVTJuxG
 sdYpwVqhMspoOIMtAi3/SZSgn3reltdnNotLjfiGsH9A1lKGw322x42QRVWJn4R64O0Y
 8jY9gUCqpK4uXmlGEV1edrHS2WAGEQcRYY90ielDulKFKnXEEpfpxdM3Q4+06ZOtQDqM
 YGKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXcMKgaW0+Y4QbeEwr8r+qow5nnhJl/2NajCmuiy9hscbkxQq0UNP1v/1WlVLNFrYhODsZOWJKYn4eTA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyy0NAWlayr5mLR5FCgp9uH78Uv8Qtqp6d0LJYqiR+X2WBmD6DA
 meTlZCNDeLQOefB2KzkXbqHOUX+mYQEK7V7y3mswzCcS82xKTW3qjpp+97XJRUwy1d4HGxuljBL
 THskvTNk938Bijj6UcUMm1me+9Qs=
X-Gm-Gg: ASbGnct2XqMwIE4ER+UcevHde9CS03ADUrird9ZRxrVFTWOI7wR3JFksHG51UDXiKgB
 vfHwcInABZ7BiKgFIbls8qkturpvEA7FDMTUtPrFDPXfsXwaM2M2w6aJHm7ObMC929Sclb40KA/
 v66eE8zxp0YHMu82BMEnt/Hnmpvqrm8enqhNJqyg==
X-Google-Smtp-Source: AGHT+IENhXSbehQqfBW1svYcq0D4UIHBuJbvet0xcZ1l8BgXjBl9sSRbuFPUI4WEPm1PyA5ibhgYTL9d/lGV71q9Wms=
X-Received: by 2002:a17:906:942:b0:ac7:3441:79aa with SMTP id
 a640c23a62f3a-ace5459c3b0mr1838766b.13.1745428542340; Wed, 23 Apr 2025
 10:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
In-Reply-To: <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 23 Apr 2025 10:15:20 -0700
X-Gm-Features: ATxdqUE91QmVoMb8-9fNRcAVpV6sKAYDYDexZM632tte0cXJZXh3_ehQWPpgTAs
Message-ID: <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Mykola Lysenko <mykolal@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Will Deacon <will@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Florent Revest <revest@chromium.org>, Puranjay Mohan <puranjay@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, ebpf@linuxfoundation.org,
 Xu Kuohai <xukuohai@huaweicloud.com>, Alexei Starovoitov <ast@kernel.org>,
 KP Singh <kpsingh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Hao Luo <haoluo@google.com>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eduard Zingerman <eddyz87@gmail.com>,
 Jiri Olsa <jolsa@kernel.org>, bpf@vger.kernel.org,
 Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [Linux-stm32] [PATCH RFC bpf-next 1/4] bpf: add struct largest
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

T24gVGh1LCBBcHIgMTcsIDIwMjUgYXQgMTI6MTTigK9BTSBBbGV4aXMgTG90aG9yw6kKPGFsZXhp
cy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIEFuZHJpaSwKPgo+IE9uIFdlZCBB
cHIgMTYsIDIwMjUgYXQgMTE6MjQgUE0gQ0VTVCwgQW5kcmlpIE5ha3J5aWtvIHdyb3RlOgo+ID4g
T24gRnJpLCBBcHIgMTEsIDIwMjUgYXQgMTozMuKAr1BNIEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBG
b3VuZGF0aW9uKQo+ID4gPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Pgo+
ID4+IEluIG9yZGVyIHRvIHByb3Blcmx5IEpJVCB0aGUgdHJhbXBvbGluZXMgbmVlZGVkIHRvIGF0
dGFjaCBCUEYgcHJvZ3JhbXMKPiA+PiB0byBmdW5jdGlvbnMsIHNvbWUgYXJjaGl0ZWN0dXJlcyBs
aWtlIEFSTTY0IG5lZWQgdG8ga25vdyBhYm91dCB0aGUKPiA+PiBhbGlnbm1lbnQgbmVlZGVkIGZv
ciB0aGUgZnVuY3Rpb24gYXJndW1lbnRzLiBTdWNoIGFsaWdubWVudCBjYW4KPiA+PiBnZW5lcmFs
bHkgYmUgZGVkdWNlZCBmcm9tIHRoZSBhcmd1bWVudCBzaXplLCBidXQgdGhhdCdzIG5vdCBjb21w
bGV0ZWx5Cj4gPj4gdHJ1ZSBmb3IgY29tcG9zaXRlIHR5cGVzLiBJbiB0aGUgc3BlY2lmaWMgY2Fz
ZSBvZiBBUk02NCwgdGhlIEFBUENTNjQgQUJJCj4gPj4gZGVmaW5lcyB0aGF0IGEgY29tcG9zaXRl
IHR5cGUgd2hpY2ggbmVlZHMgdG8gYmUgcGFzc2VkIHRocm91Z2ggc3RhY2sKPiA+PiBtdXN0IGJl
IGFsaWduZWQgb24gdGhlIG1heGltdW0gYmV0d2VlbiA4IGFuZCB0aGUgbGFyZ2VzdCBhbGlnbm1l
bnQKPiA+PiBjb25zdHJhaW50IG9mIGl0cyBmaXJzdC1sZXZlbCBtZW1iZXJzLiBTbyB0aGUgSklU
IGNvbXBpbGVyIG5lZWRzIG1vcmUKPiA+PiBpbmZvcm1hdGlvbiBhYm91dCB0aGUgYXJndW1lbnRz
IHRvIG1ha2Ugc3VyZSB0byBnZW5lcmF0ZSBjb2RlIHRoYXQKPiA+PiByZXNwZWN0cyB0aG9zZSBh
bGlnbm1lbnQgY29uc3RyYWludHMuCj4gPj4KPiA+PiBGb3Igc3RydWN0IGFyZ3VtZW50cywgYWRk
IGluZm9ybWF0aW9uIGFib3V0IHRoZSBzaXplIG9mIHRoZSBsYXJnZXN0Cj4gPj4gZmlyc3QtbGV2
ZWwgbWVtYmVyIGluIHRoZSBzdHJ1Y3QgYnRmX2Z1bmNfbW9kZWwgdG8gYWxsb3cgdGhlIEpJVAo+
ID4+IGNvbXBpbGVyIHRvIGd1ZXNzIHRoZSBuZWVkZWQgYWxpZ25tZW50LiBUaGUgaW5mb3JtYXRp
b24gaXMgcXVpdGUKPiA+Cj4gPiBJIG1pZ2h0IGJlIG1pc3Npbmcgc29tZXRoaW5nLCBidXQgaG93
IGNhbiB0aGUgKnNpemUqIG9mIHRoZSBmaWVsZCBiZQo+ID4gdXNlZCB0byBjYWxjdWxhdGUgdGhh
dCBhcmd1bWVudCdzICphbGlnbm1lbnQqPyBpLmUuLCBJIGRvbid0Cj4gPiB1bmRlcnN0YW5kIHdo
eSBhcmdfbGFyZ2VzdF9tZW1iZXJfc2l6ZSBuZWVkcyB0byBiZSBjYWxjdWxhdGVkIGluc3RlYWQK
PiA+IG9mIGFyZ19sYXJnZXN0X21lbWJlcl9hbGlnbm1lbnQuLi4KPgo+IEluZGVlZCBJIGluaXRp
YWxseSBjaGVja2VkIHdoZXRoZXIgSSBjb3VsZCByZXR1cm4gZGlyZWN0bHkgc29tZSBhbGlnbm1l
bnQKPiBpbmZvIGZyb20gYnRmLCBidXQgaXQgdGhlbiBpbnZvbHZlcyB0aGUgYWxpZ25tZW50IGNv
bXB1dGF0aW9uIGluIHRoZSBidGYKPiBtb2R1bGUuIFNpbmNlIHRoZXJlIGNvdWxkIGJlIG1pbm9y
IGRpZmZlcmVuY2VzIGJldHdlZW4gYXJjaGl0ZWN0dXJlcyBhYm91dAo+IGFsaWdubWVudCByZXF1
aXJlbWVudHMsIEkgdGhvdWdoIGl0IHdvdWxkIGJlIGJldHRlciB0byBpbiBmYWN0IGtlZXAgYWxp
Z25tZW50Cj4gY29tcHV0YXRpb24gb3V0IG9mIHRoZSBidGYgbW9kdWxlLiBGb3IgZXhhbXBsZSwg
SSBzZWUgdGhhdCAxMjggYml0cyB2YWx1ZXMKPiBhcmUgYWxpZ25lZCBvbiAxNiBieXRlcyBvbiBB
Uk02NCwgd2hpbGUgYmVpbmcgYWxpZ25lZCBvbiA4IGJ5dGVzIG9uIFMzOTAuCj4KPiBBbmQgc2lu
Y2UgZm9yIEFSTTY0LCBhbGwgbmVlZGVkIGFsaWdubWVudHMgYXJlIHNvbWVob3cgZGVyaXZlZCBm
cm9tIHNpemUKPiAoaXQgaXMgZWl0aGVyIGRpcmVjdGx5IHNpemUgZm9yIGZ1bmRhbWVudGFsIHR5
cGVzLCBvciBhbGlnbm1lbnQgb2YgdGhlCj4gbGFyZ2VzdCBtZW1iZXIgZm9yIHN0cnVjdHMsIHdo
aWNoIGlzIHRoZW4gc2l6ZSBvZiBsYXJnZXN0IG1lbWJlciksCj4gcmV0dXJuaW5nIHRoZSBzaXpl
IHNlZW1zIHRvIGJlIGVub3VnaCB0byBhbGxvdyB0aGUgSklUIHNpZGUgdG8gY29tcHV0ZQo+IGFs
aWdubWVudHMuCgpJZiB5b3UgbWVhbiB0aGUgc2l6ZSBvZiAicHJpbWl0aXZlIiBmaWVsZCBhbmQv
b3IgYXJyYXkgZWxlbWVudAooYXBwbGllZCByZWN1cnNpdmVseSBmb3IgYWxsIGVtYmVkZGVkIHN0
cnVjdHMvdW5pb25zKSB0aGVuIHllcywgdGhhdCdzCmNsb3NlIGVub3VnaC4gQnV0IHNheWluZyBq
dXN0ICJsYXJnZXN0IHN0cnVjdCBtZW1iZXIiIGlzIHdyb25nLApiZWNhdXNlIGZvcgoKc3RydWN0
IGJsYWggewogICAgc3RydWN0IHsKICAgICAgICBpbnQgd2hhdGV2ZXJbMTI4XTsKICAgIH0gaGV5
YTsKfTsKCgpibGFoLmhleWEgaGFzIGEgbGFyZ2Ugc2l6ZSwgYnV0IGFsaWdubWVudCBpcyBzdGls
bCBqdXN0IDQgYnl0ZXMuCgpJJ2Qgc3VnZ2VzdCBsb29raW5nIGF0IGJ0Zl9fYWxpZ25fb2YoKSBp
biBsaWJicGYgKHRvb2xzL2xpYi9icGYvYnRmLmMpCnRvIHNlZSBob3cgd2UgY2FsY3VsYXRlIGFs
aWdubWVudCB0aGVyZS4gSXQgc2VlbXMgdG8gd29yayBkZWNlbnRseQplbm91Z2guIEl0IHdvbid0
IGNvdmVyIGFueSBhcmNoLXNwZWNpZmljIGV4dHJhIHJ1bGVzIGxpa2UgZG91YmxlCm5lZWRpbmcg
MTYtYnl0ZSBhbGlnbm1lbnQgKEkgdmFndWVseSByZW1lbWJlciBzb21ldGhpbmcgbGlrZSB0aGF0
IGZvcgpzb21lIGFyY2hpdGVjdHVyZXMsIGJ1dCBJIG1pZ2h0IGJlIG1pc3JlbWVtYmVyaW5nKSwg
b3IgYW55dGhpbmcKc2ltaWxhci4gSXQgYWxzbyB3b24ndCBkZXRlY3QgKEkgZG9uJ3QgdGhpbmsg
aXQncyBwb3NzaWJsZSB3aXRob3V0CkRXQVJGKSBhcnRpZmljaWFsbHkgaW5jcmVhc2VkIGFsaWdu
bWVudCB3aXRoIGF0dHJpYnV0ZSgoYWxpZ25lZChOKSkpLgoKPgo+ID4+IHNwZWNpZmljLCBidXQg
aXQgYWxsb3dzIHRvIGtlZXAgYXJjaC1zcGVjaWZpYyBjb25jZXJucyAoaWU6IGd1ZXNzaW5nIHRo
ZQo+ID4+IGZpbmFsIG5lZWRlZCBhbGlnbm1lbnQgZm9yIGFuIGFyZ3VtZW50KSBpc29sYXRlZCBp
biBlYWNoIEpJVCBjb21waWxlci4KPiA+Cj4gPiBjb3VsZG4ndCBhbGwgdGhpcyBpbmZvcm1hdGlv
biBiZSBjYWxjdWxhdGVkIGluIHRoZSBKSVQgY29tcGlsZXIgKGlmCj4gPiBKSVQgbmVlZHMgdGhh
dCkgZnJvbSBCVEY/Cj4KPiBGcm9tIHdoYXQgSSB1bmRlcnN0YW5kLCB0aGUgSklUIGNvbXBpbGVy
IGRvZXMgbm90IGhhdmUgYWNjZXNzIHRvIEJURiBpbmZvLAo+IG9ubHkgYSBzdWJzdHJhY3QgZnJv
bSBpdCwgYXJyYW5nZWQgaW4gYSBzdHJ1Y3QgYnRmX2Z1bmNfbW9kZWwgPyBUaGlzCj4gc3RydWN0
IGJ0Zl9mdW5jX21vZGVsIGFscmVhZHkgaGFzIHNpemUgaW5mbyBmb3Igc3RhbmRhcmQgdHlwZXMs
IGJ1dCBmb3IKPiBzdHJ1Y3RzIHdlIG5lZWQgc29tZSBhZGRpdGlvbmFsIGluZm8gYWJvdXQgdGhl
IG1lbWJlcnMsIGhlbmNlIHRoaXMKPiBhcmdfbGFyZ2VzdF9tZW1iZXJfYWxpZ25tZW50IGFkZGl0
aW9uIGluIGJ0Zl9mdW5jX21vZGVsLgo+Cj4gVGhhbmtzLAo+Cj4gQWxleGlzCj4KPiAtLQo+IEFs
ZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5l
ZXJpbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
