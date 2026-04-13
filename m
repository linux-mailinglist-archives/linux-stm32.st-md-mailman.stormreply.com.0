Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CK5fOqN732nFTgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 13:50:59 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 995E140406B
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 13:50:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C8D0C8F297;
	Wed, 15 Apr 2026 11:50:59 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F36F8C555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2026 22:20:24 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43cfac48bc7so3370327f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2026 15:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776118824; cv=none;
 d=google.com; s=arc-20240605;
 b=NTNyf/JKEEIdFdoKdk1tmPABVmiNbzFWOWEjLCzFo6JW9i1+dXre1KgN3Y0J29HqHA
 CP0NCiox2dk5X6uG6UqNKv7CP1JlgUcCkGVCxS5fjUHVKt8WrtRLWNLtJiTtuQFdIIwM
 aj5x6H32KDL5uJuw3aJNXLyY9wJuFZySs3inIHlbVGR1MTazza8P1DqlKizCMqmiZi9U
 tB5+uvk/XAWu6NfTVp5cU08/EQRGwwaEO8kgwnm3yGqqNu3t1TGe0YkKz9843h/FnOOy
 ucfGTeVpfC9oOBvbKSfdQNtF2Y4mnkz4sOnwMuBvKpEQuFyNk0wMo9eEXBy9+qgJQd/h
 UC0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=fp+8IeHiDM+bCUp+Ky89VxSnxaC5A7VFTmU45Et8ZaE=;
 fh=96svC8ASUP6KDD6uWPvF6875r5xqMbb7V3NFsJNqrWM=;
 b=c2m6iTQIfcaxDy57Nzak8YbTYWCoQTn7MDxlimHzHbErfMhisuHLh+WiLfm/UrMdG9
 fTVpJECOE1r/g2/vjZGlIaxTc0KN+NA81cByg7trUzS3lka37YX6HDxcyzf4TvyiaKzz
 NL0HgsAwnHW8VJKdQDuutk3qi6rb63aZN6bsq0o7pvIPCGaQxkiHEcrhYOKf5nP1nkDc
 yJImSM+m3L/Wu73/QS6EPcReEKQhb87cvL0eqC7cCuG/V9Zpmw5lcWwV3ywbOBZW0GqC
 CdoCE7z8Wm/SMkPZsv0yHYSmucQ4P2zNZV85/G4S37WyXzfrWGfpAgEd5OUXRcH+5tQt
 SBzQ==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776118824; x=1776723624;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fp+8IeHiDM+bCUp+Ky89VxSnxaC5A7VFTmU45Et8ZaE=;
 b=FKO+bqNubxw2AG7Pidq5ymiybjA/uF32KdHRjNDpMIucYxhsGQxyB769IQ57akZ5cV
 EO+v8RnyzRxtbiQQkZgS8VaInIUQuC1rVJqt4IjrzHVAnz3el0Itc8hWnlOGf4rYyb0N
 o2l3cg4tlUmb4kf3KeCe1SVqC0qqPkooFbjR/TGjO9VgGmhJgwHwlPDnqZJkpvh/tx4T
 olEbaE5Im6j1sYzKmTMSJz78I4ghfDcAGdiPU+DomtYpG0qAZOOzkUmf79SY131s7vHW
 dmBtdhAPx+xgc2ZHavLBlBMxDEnjL3FR27pSaDYdrSxEaBX8kY6bAwHVj6W79uRndU8R
 V1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776118824; x=1776723624;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fp+8IeHiDM+bCUp+Ky89VxSnxaC5A7VFTmU45Et8ZaE=;
 b=JzG7z/C9fsVYf4sxjrtm3jtlWgMFQkmgndHz03jEqhtTFIxORRbB7ls3JCoNdti+lC
 wmykw7nNDee3cIK47AQEVrzHUjLLZBermVXvfjOZ1Y93Kx5TtLDNHtlJJSmZEPfu4eyv
 Kg7wQ+bPFA0c0wenFFfFCMNc24avdUhOtLaWo8QcRyEJty/pilFlLOxboskq8MkWUver
 8AGUcpOERMDDzMm2UO3QNGETklOVdpuQgGtKSrixLLOxYdZ2WNGeBDwT8CwlZAS5p49u
 +hq2U4+uicooBXCj4ZyGbuDolvfwcby2QfXHMMxT5ElZmQHWCAVf/kZa+4wB4ut1Aha9
 DltA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ZXe8ligytOQOdcqz2kSGNzRHXdrp8Aq5/xyJCjkf3VYwb/TANiNj/K7o10GpGIJtwfZ+wbXZputNhgw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywz6Iwuai17tQAIWwOIPT55AquR/6HaQDkDBVt0hJIV5+gKd6sF
 e6WFpvibXV+Kt6TGoeBw3XWFdE10jFxz8KJhpTLl/vlsGz8NyolB2y8/+uOAK42jaVHRtARQwPj
 M4UxpB97cZg1+mlNorc7DGrXvGab3UPo=
X-Gm-Gg: AeBDietVgFMrmq7laZ+3VbHn03JXsIL/k7pnBkVlGjLC3xZ9yhgJ1orZHXbkYT3swu2
 YV2dUgfwzWl0UG4EB7T3hA+V4NA/pX3mOBdbOS7HIGe5fPLtcfL7RkZgwZFTWXIEbVqKXkig+iR
 XKE+3JpPKzUH0BBo+lmwOhKgv4oTBiSzY7Qh0D+y+JKz8xzSJv4+oINCurcrZEZZmB1vlYFT8lh
 d6EKPc8CVHgepRDb+/C688dyDylMM1vcUVWcAwL1uuT33IuE7OTrcdBwOd3gi6QpdJ+oiq9MaOd
 bQtlZaSrHfUQlym4GrijK2WgdppVO0K+dpPV6U7c
X-Received: by 2002:a05:6000:2303:b0:43d:7af0:3a8a with SMTP id
 ffacd0b85a97d-43d7af03dffmr7155232f8f.46.1776118824134; Mon, 13 Apr 2026
 15:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-3-1a5831230821@bootlin.com>
In-Reply-To: <20260413-kasan-v1-3-1a5831230821@bootlin.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 14 Apr 2026 00:20:13 +0200
X-Gm-Features: AQROBzASLHf5ILBNuw_x5OeLAHJGUfv8fbkKsOkNoaIfzCwURKyPvUbS0Z-ZunI
Message-ID: <CA+fCnZf-o8tiv_tX9YB5eBUGx17OpztKZsEB6Awjw3WAqBAiUw@mail.gmail.com>
To: =?UTF-8?Q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
X-Mailman-Approved-At: Wed, 15 Apr 2026 11:50:57 +0000
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Song Liu <song@kernel.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, "H. Peter Anvin" <hpa@zytor.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan <shuah@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Xu Kuohai <xukuohai@huawei.com>,
 Daniel Borkmann <daniel@iogearbox.net>, x86@kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 kasan-dev@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Jiri Olsa <jolsa@kernel.org>, ebpf@linuxfoundation.org,
 Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org,
 Dmitry Vyukov <dvyukov@google.com>, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 linux-kernel@vger.kernel.org, Eduard Zingerman <eddyz87@gmail.com>,
 Thomas Gleixner <tglx@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
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
X-Spamd-Result: default: False [5.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	DATE_IN_PAST(1.00)[37];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[andreyknvl@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:alexis.lothore@bootlin.com,m:thomas.petazzoni@bootlin.com,m:dave.hansen@linux.intel.com,m:song@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:yonghong.song@linux.dev,m:hpa@zytor.com,m:vincenzo.frascino@arm.com,m:shuah@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:xukuohai@huawei.com,m:daniel@iogearbox.net,m:x86@kernel.org,m:john.fastabend@gmail.com,m:andrii@kernel.org,m:kasan-dev@googlegroups.com,m:mingo@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:bastien.curutchet@bootlin.com,m:jolsa@kernel.org,m:ebpf@linuxfoundation.org,m:ast@kernel.org,m:bp@alien8.de,m:memxor@gmail.com,m:bpf@vger.kernel.org,m:dvyukov@google.com,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:netdev@vger.kernel.org,m:dsahern@kernel.org,m:linux-kernel@vger.kernel.org,m:eddyz87@gmail.com,m:tglx@kernel.org,m:mcoquelin.stm32@gmail.com,m:akpm@linux-foundation.org,m:martin.lau@linux.dev,m:davem@davemloft.net,m:ryabininaa@gmail.com,m:johnfastabend@gmail.com,
 m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,linux.intel.com,kernel.org,gmail.com,google.com,linux.dev,zytor.com,arm.com,st-md-mailman.stormreply.com,huawei.com,iogearbox.net,googlegroups.com,redhat.com,lists.infradead.org,linuxfoundation.org,alien8.de,vger.kernel.org,kvack.org,linux-foundation.org,davemloft.net];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.089];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreyknvl@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 995E140406B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gTW9uLCBBcHIgMTMsIDIwMjYgYXQgODoyOeKAr1BNIEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBG
b3VuZGF0aW9uKQo8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gQWRkIGEg
bmV3IEtjb25maWcgb3B0aW9uIENPTkZJR19CUEZfSklUX0tBU0FOIHRoYXQgYXV0b21hdGljYWxs
eSBlbmFibGVzCj4gS0FTQU4gKEtlcm5lbCBBZGRyZXNzIFNhbml0aXplcikgbWVtb3J5IGFjY2Vz
cyBjaGVja3MgZm9yIEpJVC1jb21waWxlZAo+IEJQRiBwcm9ncmFtcywgd2hlbiBib3RoIEtBU0FO
IGFuZCBKSVQgY29tcGlsZXIgYXJlIGVuYWJsZWQuIFdoZW4KPiBlbmFibGVkLCB0aGUgSklUIGNv
bXBpbGVyIHdpbGwgZW1pdCBzaGFkb3cgbWVtb3J5IGNoZWNrcyBiZWZvcmUgbWVtb3J5Cj4gbG9h
ZHMgYW5kIHN0b3JlcyB0byBkZXRlY3QgdXNlLWFmdGVyLWZyZWUsIG91dC1vZi1ib3VuZHMsIGFu
ZCBvdGhlcgo+IG1lbW9yeSBzYWZldHkgYnVncyBhdCBydW50aW1lLiBUaGUgb3B0aW9uIGlzIGdh
dGVkIGJlaGluZAo+IEhBVkVfRUJQRl9KSVRfS0FTQU4sIGFzIGl0IG5lZWRzIHByb3BlciBhcmNo
LXNwZWNpZmljIGltcGxlbWVudGF0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhv
csOpIChlQlBGIEZvdW5kYXRpb24pIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KPiAtLS0K
PiAga2VybmVsL2JwZi9LY29uZmlnIHwgOSArKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9icGYvS2NvbmZpZyBiL2tlcm5l
bC9icGYvS2NvbmZpZwo+IGluZGV4IGViM2RlMzU3MzRmMC4uMjgzOTJhZGIzZDdlIDEwMDY0NAo+
IC0tLSBhL2tlcm5lbC9icGYvS2NvbmZpZwo+ICsrKyBiL2tlcm5lbC9icGYvS2NvbmZpZwo+IEBA
IC0xNyw2ICsxNywxMCBAQCBjb25maWcgSEFWRV9DQlBGX0pJVAo+ICBjb25maWcgSEFWRV9FQlBG
X0pJVAo+ICAgICAgICAgYm9vbAo+Cj4gKyMgS0FTQU4gc3VwcG9ydCBmb3IgSklUIGNvbXBpbGVy
Cj4gK2NvbmZpZyBIQVZFX0VCUEZfSklUX0tBU0FOCj4gKyAgICAgICBib29sCj4gKwo+ICAjIFVz
ZWQgYnkgYXJjaHMgdG8gdGVsbCB0aGF0IHRoZXkgd2FudCB0aGUgQlBGIEpJVCBjb21waWxlciBl
bmFibGVkIGJ5Cj4gICMgZGVmYXVsdCBmb3Iga2VybmVscyB0aGF0IHdlcmUgY29tcGlsZWQgd2l0
aCBCUEYgSklUIHN1cHBvcnQuCj4gIGNvbmZpZyBBUkNIX1dBTlRfREVGQVVMVF9CUEZfSklUCj4g
QEAgLTEwMSw0ICsxMDUsOSBAQCBjb25maWcgQlBGX0xTTQo+Cj4gICAgICAgICAgIElmIHlvdSBh
cmUgdW5zdXJlIGhvdyB0byBhbnN3ZXIgdGhpcyBxdWVzdGlvbiwgYW5zd2VyIE4uCj4KPiArY29u
ZmlnIEJQRl9KSVRfS0FTQU4KPiArICAgICAgIGJvb2wKPiArICAgICAgIGRlcGVuZHMgb24gSEFW
RV9FQlBGX0pJVF9LQVNBTgo+ICsgICAgICAgZGVmYXVsdCB5IGlmIEJQRl9KSVQgJiYgS0FTQU5f
R0VORVJJQwoKU2hvdWxkIHRoaXMgYmUgImRlcGVuZHMgb24gS0FTQU4gJiYgS0FTQU5fR0VORVJJ
QyI/CgoKPiArCj4gIGVuZG1lbnUgIyAiQlBGIHN1YnN5c3RlbSIKPgo+IC0tCj4gMi41My4wCj4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
