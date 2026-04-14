Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA7yFXxR3mlIqQkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Apr 2026 16:38:52 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D46523FB5FB
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Apr 2026 16:38:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D6A9C8F292;
	Tue, 14 Apr 2026 14:38:51 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AF9FC8F286
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2026 14:38:50 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-43d73352cf2so2159564f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2026 07:38:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776177530; cv=none;
 d=google.com; s=arc-20240605;
 b=B6gJNvG6KppjxvVteibHopX5wsp8UaTTUAdDSVr4KvNcKFpNA+O24OVNXTkP9qfD/8
 szv11QwUtb/OfMMUC3Dr6XhQDMCpc1WawGEAK5cLLjjLh8Bu+BsZ397C1sNP+C5U2rPe
 T+Gwvqegzrr0moDIzXyuKUFYIU+hG6TtPoxGZ0uAsis6R8bZMTmuqj+t3Umyx2K9Ox7s
 ai/uwN2bG0HKhvevxDhvoINsZT3QPfUSjRuBjI+SEi4dVfIHr/aFW5GBUnT+3pISjGER
 oFrIktXZi9PpK6wxMJmJ2qLNYxBBq/9ojctRO8O3plYePPXRc1zoXHdsQmIKxBM63HsJ
 8pBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=t3FcHIl3IgssSn4hNhLSe6L719nynY/t+2SO5yRqP3Y=;
 fh=EUd+kRkbspIHhTOVmzvUcjS7Kn+BmC1HDwB2VAuB/3A=;
 b=Ve3W0+jFZb1RKze/lNJ+fe7Vm8KqJdPTr53/2EJohvnVGxZUf32/inb9FBHzEZ1EOq
 X0z1MRyJ7cMEJm/0EnvoR2jZHR8/Q9jtYAI8WJ8CCfhwJ3/XjzmK6I8iIw+/c0kghp5/
 j7IqEdK+y7EyM2ok3u7WNfTea//V8R6332dixO6Zxk2zIYtDTezyvWtYSxoquy0WyWnV
 BF8XAJVA+TWtaHFiYkAli008cQAb6109HeB/GV7dFY8tX2vA6cvUhgIhehAJKK6TVtaI
 6HUxmYlDbARsBOEFNZ21DxP9fFM+AS1VIAQbKPeiW/HMV4mFSakYIBXD+0M8wJJ3pyKl
 6FBA==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776177530; x=1776782330;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t3FcHIl3IgssSn4hNhLSe6L719nynY/t+2SO5yRqP3Y=;
 b=XBsV1sxC3lIVoD0SMOO3AbwIsFHfxIOuhhlOozEVkxC6kT/d0CyswuIxHeiAFjyD1J
 WNk5dNo3cQzNu3ClayDhEiKmJWxm2NTF3ugQ8TrRCDctIW9pFYC2mUC4jH8AVyvms0XC
 MFj6OHFYCakaOnGbsk4ZARLX48E+/4m/ekKHYdovaIB9lCy74tOLJU0TVfYO6+LkzIor
 Me3J3mvkichh8pE3N5D7wPYVqX8KKwm+xq5ZgiZGbT99FlyKqAAH+un91NaoqUgNTVQU
 dikpuupzlfjtrAN8ZKgm8gFvzuo2Ng2jW8ybQWPzN/A0+N60/JyR5oPMX3xRDj4yYK6k
 sc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776177530; x=1776782330;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=t3FcHIl3IgssSn4hNhLSe6L719nynY/t+2SO5yRqP3Y=;
 b=KYYDIejSbUGm+CWcUOuNaskRAfEaeWtgVHa4cBtZplIeJWCQaZJByZi1W0odQqCxL5
 YlpVM8b0l8zdEoD6ye+woOiXLWZkHT6rsPAuXk+Xl6t9ChzmzQbOCvMUPTqHDA3ZEP1Z
 8FjHdhkpyTFwi6Kmh4/8rrpo9P7yl4XqSwDK0x49QxtJDHWBK8Azh1YdmtjMqL/HBjGP
 v7EuQ8zdhPv1tgQiKmVT/W3KK6GGcPq9JsGCyT5oSFPE39hd/4IJoRpIBU55/qLmAmqB
 2sDH3W/Re4zeEV06uuWKF/Q0FsZtELwb3ggRE63B9BEjHWRn5lff9RYWAnpKvKFfb+3J
 AdWQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+STMDR41tZewJ7zkYpOykTzbNyD7KLaBqAyCG6vSXHqzrF7F4437pxDwykWLKT9kpNu6tO54nhiP3/OA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxPBLSOChMFXhZxoJZGIT/ICILhiIJ8dZgAEs/r7NtTFyXVq4pR
 x2QMKBaF4G478u72qpNzPN/bDU+ifSEgDQFv1+q9IyOw931NIgVkbH3fgm2iiecIwJrZEXNAtLr
 lYw7v6+cFffQzlrNG6HEbwDwYLGdJ5BQ=
X-Gm-Gg: AeBDietIss0yfa5j24Yv6l/3WdxZEKnp5sd1PN0qqzHGS2Z208bsMt4fH2yFC/3Kci2
 q9bwaBy9JOZQ37pB/TwbaHjdXYp3IcQRA6oRQGd/M7uLC3Uwfcbhu+wo6wmMXg3w+vdSkxE6U8l
 6ZAahLCi6/tRwvYMwduPVZ1DCITz7lfS1lxCU62py5VxGpw46etJHZ4okPMm4TNqBTHZ9if5t9O
 o3Ti3UJjVnkuV6H827YquBuyxEZUAiEZ6iUVOk3YYSkxKRrpCGbc2HOZbt5+v86x38v2gBlSHdE
 samBWinlUB7ZGYLk5eJwv3El1cxqgpgo0+Ocj5A5muvVmOdoL2A2sLAB+pd2Jh5bTWWFlLtnERg
 E3aiDFs0/u52z+Dg/rsIlV9oAOA==
X-Received: by 2002:a5d:5d85:0:b0:43d:73de:abd2 with SMTP id
 ffacd0b85a97d-43d73dead51mr14691281f8f.26.1776177529609; Tue, 14 Apr 2026
 07:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-3-1a5831230821@bootlin.com>
 <CA+fCnZf-o8tiv_tX9YB5eBUGx17OpztKZsEB6Awjw3WAqBAiUw@mail.gmail.com>
 <DHSWSSYRPUVC.2W3G3OU27L3HG@bootlin.com>
In-Reply-To: <DHSWSSYRPUVC.2W3G3OU27L3HG@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 14 Apr 2026 07:38:38 -0700
X-Gm-Features: AQROBzAAc3g7dGJeHc3HZECQFqFuOBrJ_YiWzr60z_aqmL-sqKG6l_qunoKkETU
Message-ID: <CAADnVQLj=UosnsC-4V2+mN92Fe0-kW++U+m-O9c93kk6BwiXgw@mail.gmail.com>
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
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
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf <bpf@vger.kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, Network Development <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH RFC bpf-next 3/8] bpf: add BPF_JIT_KASAN
 for KASAN instrumentation of JITed programs
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
	FORGED_RECIPIENTS(0.00)[m:alexis.lothore@bootlin.com,m:thomas.petazzoni@bootlin.com,m:dave.hansen@linux.intel.com,m:song@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:yonghong.song@linux.dev,m:hpa@zytor.com,m:vincenzo.frascino@arm.com,m:shuah@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:xukuohai@huawei.com,m:daniel@iogearbox.net,m:x86@kernel.org,m:john.fastabend@gmail.com,m:andrii@kernel.org,m:kasan-dev@googlegroups.com,m:mingo@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:bastien.curutchet@bootlin.com,m:mcoquelin.stm32@gmail.com,m:ebpf@linuxfoundation.org,m:ast@kernel.org,m:bp@alien8.de,m:memxor@gmail.com,m:bpf@vger.kernel.org,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:netdev@vger.kernel.org,m:dsahern@kernel.org,m:linux-kernel@vger.kernel.org,m:eddyz87@gmail.com,m:tglx@kernel.org,m:jolsa@kernel.org,m:akpm@linux-foundation.org,m:martin.lau@linux.dev,m:davem@davemloft.net,m:ryabininaa@gmail.com,m:j
 ohnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[alexeistarovoitov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,linux.intel.com,kernel.org,gmail.com,google.com,linux.dev,zytor.com,arm.com,st-md-mailman.stormreply.com,huawei.com,iogearbox.net,googlegroups.com,redhat.com,lists.infradead.org,linuxfoundation.org,alien8.de,vger.kernel.org,kvack.org,linux-foundation.org,davemloft.net];
	NEURAL_HAM(-0.00)[-0.975];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,mail.gmail.com:mid,bootlin.com:email,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: D46523FB5FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBBcHIgMTQsIDIwMjYgYXQgNjoyNOKAr0FNIEFsZXhpcyBMb3Rob3LDqQo8YWxleGlz
LmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gVHVlIEFwciAxNCwgMjAyNiBhdCAx
MjoyMCBBTSBDRVNULCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4gT24gTW9uLCBBcHIgMTMs
IDIwMjYgYXQgODoyOeKAr1BNIEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKQo+ID4g
PGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Pgo+ID4+IEFkZCBhIG5ldyBL
Y29uZmlnIG9wdGlvbiBDT05GSUdfQlBGX0pJVF9LQVNBTiB0aGF0IGF1dG9tYXRpY2FsbHkgZW5h
Ymxlcwo+ID4+IEtBU0FOIChLZXJuZWwgQWRkcmVzcyBTYW5pdGl6ZXIpIG1lbW9yeSBhY2Nlc3Mg
Y2hlY2tzIGZvciBKSVQtY29tcGlsZWQKPiA+PiBCUEYgcHJvZ3JhbXMsIHdoZW4gYm90aCBLQVNB
TiBhbmQgSklUIGNvbXBpbGVyIGFyZSBlbmFibGVkLiBXaGVuCj4gPj4gZW5hYmxlZCwgdGhlIEpJ
VCBjb21waWxlciB3aWxsIGVtaXQgc2hhZG93IG1lbW9yeSBjaGVja3MgYmVmb3JlIG1lbW9yeQo+
ID4+IGxvYWRzIGFuZCBzdG9yZXMgdG8gZGV0ZWN0IHVzZS1hZnRlci1mcmVlLCBvdXQtb2YtYm91
bmRzLCBhbmQgb3RoZXIKPiA+PiBtZW1vcnkgc2FmZXR5IGJ1Z3MgYXQgcnVudGltZS4gVGhlIG9w
dGlvbiBpcyBnYXRlZCBiZWhpbmQKPiA+PiBIQVZFX0VCUEZfSklUX0tBU0FOLCBhcyBpdCBuZWVk
cyBwcm9wZXIgYXJjaC1zcGVjaWZpYyBpbXBsZW1lbnRhdGlvbi4KPiA+Pgo+ID4+IFNpZ25lZC1v
ZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKSA8YWxleGlzLmxvdGhvcmVA
Ym9vdGxpbi5jb20+Cj4gPj4gLS0tCj4gPj4gIGtlcm5lbC9icGYvS2NvbmZpZyB8IDkgKysrKysr
KysrCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPiA+Pgo+ID4+IGRpZmYg
LS1naXQgYS9rZXJuZWwvYnBmL0tjb25maWcgYi9rZXJuZWwvYnBmL0tjb25maWcKPiA+PiBpbmRl
eCBlYjNkZTM1NzM0ZjAuLjI4MzkyYWRiM2Q3ZSAxMDA2NDQKPiA+PiAtLS0gYS9rZXJuZWwvYnBm
L0tjb25maWcKPiA+PiArKysgYi9rZXJuZWwvYnBmL0tjb25maWcKPiA+PiBAQCAtMTcsNiArMTcs
MTAgQEAgY29uZmlnIEhBVkVfQ0JQRl9KSVQKPiA+PiAgY29uZmlnIEhBVkVfRUJQRl9KSVQKPiA+
PiAgICAgICAgIGJvb2wKPiA+Pgo+ID4+ICsjIEtBU0FOIHN1cHBvcnQgZm9yIEpJVCBjb21waWxl
cgo+ID4+ICtjb25maWcgSEFWRV9FQlBGX0pJVF9LQVNBTgo+ID4+ICsgICAgICAgYm9vbAo+ID4+
ICsKPiA+PiAgIyBVc2VkIGJ5IGFyY2hzIHRvIHRlbGwgdGhhdCB0aGV5IHdhbnQgdGhlIEJQRiBK
SVQgY29tcGlsZXIgZW5hYmxlZCBieQo+ID4+ICAjIGRlZmF1bHQgZm9yIGtlcm5lbHMgdGhhdCB3
ZXJlIGNvbXBpbGVkIHdpdGggQlBGIEpJVCBzdXBwb3J0Lgo+ID4+ICBjb25maWcgQVJDSF9XQU5U
X0RFRkFVTFRfQlBGX0pJVAo+ID4+IEBAIC0xMDEsNCArMTA1LDkgQEAgY29uZmlnIEJQRl9MU00K
PiA+Pgo+ID4+ICAgICAgICAgICBJZiB5b3UgYXJlIHVuc3VyZSBob3cgdG8gYW5zd2VyIHRoaXMg
cXVlc3Rpb24sIGFuc3dlciBOLgo+ID4+Cj4gPj4gK2NvbmZpZyBCUEZfSklUX0tBU0FOCj4gPj4g
KyAgICAgICBib29sCj4gPj4gKyAgICAgICBkZXBlbmRzIG9uIEhBVkVfRUJQRl9KSVRfS0FTQU4K
PiA+PiArICAgICAgIGRlZmF1bHQgeSBpZiBCUEZfSklUICYmIEtBU0FOX0dFTkVSSUMKPiA+Cj4g
PiBTaG91bGQgdGhpcyBiZSAiZGVwZW5kcyBvbiBLQVNBTiAmJiBLQVNBTl9HRU5FUklDIj8KPgo+
IE1lYW5pbmcsIG1ha2luZyBpdCBhbiBleHBsaWNpdCB1c2VyLXNlbGVjdGFibGUgb3B0aW9uID8K
Pgo+IElmIHNvLCB0aGUgY3VycmVudCBkZXNpZ24gY2hvaWNlIGlzIHZvbHVudGFyeSBhbmQgYmFz
ZWQgb24gdGhlIGZlZWRiYWNrCj4gcmVjZWl2ZWQgb24gdGhlIG9yaWdpbmFsIFJGQywgd2hlcmUg
SSBoYXZlIGJlZW4gc3VnZ2VzdGVkIHRvCj4gYXV0b21hdGljYWxseSBlbmFibGUgdGhlIEtBU0FO
IGluc3RydW1lbnRhdGlvbiBpbiBCUEYgcHJvZ3JhbXMgaWYgS0FTQU4KPiBzdXBwb3J0IGlzIGVu
YWJsZWQgaW4gdGhlIGtlcm5lbCAoWzFdKS4gQnV0IGlmIGEgdXNlci1zZWxlY3RhYmxlIHRvZ2ds
ZQo+IGlzIGV2ZW50dWFsbHkgYSBiZXR0ZXIgc29sdXRpb24sIEknbSBmaW5lIHdpdGggY2hhbmdp
bmcgaXQuCgpMZXQncyBub3QgYWRkIG1vcmUgY29uZmlnIGtub2JzLgpFdmVuIHRoaXMgcGF0Y2gg
bG9va3MgcmVkdW5kYW50LgpJbnNpZGUgSklUIGRvIGluc3RydW1lbnRhdGlvbiB3aGVuIEtBU0FO
X0dFTkVSSUMgaXMgc2V0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
