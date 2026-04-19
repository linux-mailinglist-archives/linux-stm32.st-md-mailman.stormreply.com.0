Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2C3tNKKG72lPCAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:10 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1994759C8
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 488DAC57A51;
	Mon, 27 Apr 2026 15:54:09 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 747C1C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Apr 2026 21:49:10 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso22883855e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Apr 2026 14:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776635350; cv=none;
 d=google.com; s=arc-20240605;
 b=bT17UbEiZyoaj4ITYBK6CEHlZt1Lm46xm1FkM2IB2beMhcPDYhdYB6J0P94P3ylcqP
 jNRWbX358sBuc/+rz+DbfyKL/KI9H0NkOri9HIH8zFPniW717dLbnhU8d0CBpstYbm4b
 OMcXiqRYZLcdMbyxBqCwq3fqEamyl7aDpuekykGUP0VnIthxBffiIKebsjuYrp8uOm+t
 9Ye8Rr7Nq/gDSDeT5iiYDjmsgbkbJmtUhq1z4zxZVvbkaP/ek4KGloLDa0R7ibTHLVLz
 VEUPKByK5NppFW52LLb635ZKgp3mQ+RR8DLHf6gtJEq62bvnGiXkGYUFRoJMvvQEBc+x
 nz9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=cFrGrWFy/krqcVnxXtLhe3ZTOUNcitG9G8OlGBpdvQs=;
 fh=DRF20mr895hxt5aImqkbNnVZeq8A4OWJ4Ch6tBfSmC4=;
 b=L1NvfhUI3xNqwY3iaUGF5o5AApmoZaZjqNcOxeVOaUPpzKL/Y/c2nd/bSzQ4I9ElW4
 6ZL8sJQErgr9bN3Qy4Qb9c1EREfglhJgixruuTpDG7RSMF8Xf01xGVCxLEIVgXeuHSrD
 zzHCiFHPLCbJcLRR2s5LGc+q2SgsOJ9OjpA/9J9/9vJygUr1wG0LpT4WyNu0zpVs9SbW
 XmZuflUcyv5Ehf6J4k7fnBfukiFJUiSnhzuh8ads6gModgB0rG29zU7w5MLNQHnT3p/a
 h8P/cEokNOwsqAan/MVH1t05LxXUDPfPJw1Xqprv5xVHhIl9Uena4ojfmD2PlMUVs5K9
 N3kw==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776635350; x=1777240150;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cFrGrWFy/krqcVnxXtLhe3ZTOUNcitG9G8OlGBpdvQs=;
 b=N/GBanHTQxJs31xdO8szOuXHwkJOw7mai2dPo5VwOPVCl8F/XnHw68Mcid94WL0hxr
 KrI7NHoHKi+F0qSieVGRthBOzYMR02ms6HNaJ6nzULAnec3SjxKU98x7R6EIjekpHveU
 IkCT9zx6ar8QIt5NsYIVimb6ZQB4DI31oTJSVHA/lz1UBGZxFNa/DO0Yl7Tb2Zi8LBWC
 ETlWA4qhWq7QeosNlpx4fjoHA86UGeyM8G2rBcgSX+0mU9vwovFQWjyZLEQI/qpqnTyu
 XAd+yBppa6JXVNo/qLuW99/AVUnHzPXQDmWkwGBtUrreuDoMXLZHI8y+Q/NhHP8QqtUM
 vlQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776635350; x=1777240150;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cFrGrWFy/krqcVnxXtLhe3ZTOUNcitG9G8OlGBpdvQs=;
 b=eqcNSP1kOkse92LzImJca+GDbxOeeuJRvAXvHgqdmfH6lvY5nziomdxVrNqNIqsS3+
 Z11LGGmPJtKqUCUo+6+WWYbO0WlgUgpZRUXfzY5hzDUN+kttUzv5miwzpvNXOngi9/2q
 RdI7SJarwwuUHaReZ4HaJaiYgTCmZSN/8We3G7wzO4jBz6O7aWf7IOnkOGN0boxo/1kT
 9v5UbnYID4yJWmjZSh8ABHeLS3xELsNHk/w3w1FpdBKmNGvk6yr01jt1l7Cyyuxe2uLd
 D8iedG3OLEdwm9kd6Aq07UDgKl4c1N6cMvI3wedpp2jdV/yKy1oEo662VrUvSFdLcVT7
 2gZA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9LTVWocbtXbD+rEpxGsEpHZuCIX2hUvUlwlZoW2jUjYNEXBkCyHmoEuEiB3nSuxBFknC3kGbrqsd39KA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz+9oTPiB/EZe0MpjUPeXhyKUMRQk4Pj4/O0sB7NJOMZ9NXI+MU
 vm+nv28NYtCeH0vr4/OZDl5eUf5TbssM9lTFmYFRP2LZw0fWl4IYsZHQgMETUKjTDtUQbb1YV3l
 CFcwKfn6vv6cykNmXmbUiW/ijBATdSX0=
X-Gm-Gg: AeBDiet6roUoVw+lrRFFiyk5r94fkuqX43UJ4ybBxCDHEMfzkO/FfzgcriKBK1LGRXT
 R4V+GhZsNHEIv3MIAvnIfoij73mDJxRLxyye4yUmWpiMfTqeEvONZoIOrw72xAKqc8goA9rPJ8Y
 8u6XFWj5qiS0c9VOrqZXoqyiPffzwdF/fWhlS8QuMrKua7TSV6gdq+kqEtBhRO3BMwuhIGInSrz
 Nxm3aSl1ByhT/u9OZNZ4EBEIY7wxZ1fbMoE8RbShoBl3TERdO6+O39SExIWIPQ4MOaf8+F/i2MI
 QWsxaGakCD6AGwv5v175OLZE+T2t9i2PauiQ1LzIFYZKxfnNt8Q4
X-Received: by 2002:a05:600c:8909:b0:489:1b10:d896 with SMTP id
 5b1f17b1804b1-4891b10dd45mr22100635e9.0.1776635349567; Sun, 19 Apr 2026
 14:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
 <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com>
 <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
 <CA+fCnZd31GzdpEqR8VhfK4JtUKyyRMgbBoAbeGACJgm7WvB6Vw@mail.gmail.com>
 <CAADnVQKv5y+gq=TnOAEXSqgBRpmHNjwqCfxpLaw5XkcbQ+23bg@mail.gmail.com>
In-Reply-To: <CAADnVQKv5y+gq=TnOAEXSqgBRpmHNjwqCfxpLaw5XkcbQ+23bg@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sun, 19 Apr 2026 23:48:57 +0200
X-Gm-Features: AQROBzBeG23-litRs0f9sM5oKr7DzVV_-wsJjyIfGuOE5YpAx7fmmNXRz9M5Gbk
Message-ID: <CA+fCnZe-b0Qqbo5gGv3HN20twquQETDfYYkE1r9tPr9zUFbW9Q@mail.gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
X-Mailman-Approved-At: Mon, 27 Apr 2026 15:54:08 +0000
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
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 bpf <bpf@vger.kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, Network Development <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC bpf-next 1/8] kasan: expose generic
	kasan helpers
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
X-Rspamd-Queue-Id: 5E1994759C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[186];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[andreyknvl@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:alexei.starovoitov@gmail.com,m:thomas.petazzoni@bootlin.com,m:dave.hansen@linux.intel.com,m:song@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:yonghong.song@linux.dev,m:hpa@zytor.com,m:vincenzo.frascino@arm.com,m:shuah@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:xukuohai@huawei.com,m:daniel@iogearbox.net,m:x86@kernel.org,m:john.fastabend@gmail.com,m:andrii@kernel.org,m:kasan-dev@googlegroups.com,m:mingo@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:bastien.curutchet@bootlin.com,m:mcoquelin.stm32@gmail.com,m:ebpf@linuxfoundation.org,m:ast@kernel.org,m:bp@alien8.de,m:alexis.lothore@bootlin.com,m:bpf@vger.kernel.org,m:dvyukov@google.com,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:netdev@vger.kernel.org,m:dsahern@kernel.org,m:linux-kernel@vger.kernel.org,m:eddyz87@gmail.com,m:tglx@kernel.org,m:jolsa@kernel.org,m:akpm@linux-foundation.org,m:martin.lau@linux.dev,m:davem@davemloft.net,m:memxor@gmail.com,m:alexeistarovoito
 v@gmail.com,m:ryabininaa@gmail.com,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,linux.intel.com,kernel.org,gmail.com,google.com,linux.dev,zytor.com,arm.com,st-md-mailman.stormreply.com,huawei.com,iogearbox.net,googlegroups.com,redhat.com,lists.infradead.org,linuxfoundation.org,alien8.de,vger.kernel.org,kvack.org,linux-foundation.org,davemloft.net];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreyknvl@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.974];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]

T24gVHVlLCBBcHIgMTQsIDIwMjYgYXQgNTo1OOKAr1BNIEFsZXhlaSBTdGFyb3ZvaXRvdgo8YWxl
eGVpLnN0YXJvdm9pdG92QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBJIHRoaW5rIHdlJ3JlIHRhbGtp
bmcgcGFzdCBlYWNoIG90aGVyLgo+IFdlJ3JlIG5vdCBpbnRlcmVzdGVkIGluIEtBU0FOX1NXX1RB
R1Mgb3IgS0FTQU5fSFdfVEFHUy4KPiBXZSdyZSBub3QgZ29pbmcgdG8gbW9kaWZ5IGFybTY0IEpJ
VCBhdCBhbGwuCj4KPiBUaGlzIGlzIHB1cmVseSBLQVNBTl9HRU5SSUMgYW5kIG9ubHkgb24geDg2
LTY0Lgo+IEpJVCB3aWxsIGVtaXQgZXhhY3RseSB3aGF0IGNvbXBpbGVycyBlbWl0IGZvciBnZW5l
cmljCj4gd2hpY2ggaXMgX19hc2FuX2xvYWQvc3RvcmUuIFRoaXMgaXMgYXMgc3RhYmxlIEFCSSBh
cyBpdCBjYW4gZ2V0Cj4gYW5kIHdlIGRvbid0IHdhbnQgdG8gZGV2aWF0ZSBmcm9tIGl0LgoKT0ss
IEkgc3VwcG9zZWQgdGhhdCdzIGZhaXIuIFlvdSBkaWQgdGhyb3cgbWUgb2ZmIHBvaW50IHdpdGgg
eW91cgpwZXJmb3JtYW5jZSBjb21tZW50LiBCdXQgaWYgeW91IGRlY2lkZSB0byBhZGQgU1dfVEFH
UyBzdXBwb3J0IGF0IHNvbWUKcG9pbnQsIEkgdGhpbmsgdGhpcyBkaXNjdXNzaW9uIG5lZWRzIHRv
IGJlIHJldmlzaXRlZC4KCkJ1dCBwbGVhc2UgYWRkIGEgY29tbWVudCBzYXlpbmcgdGhhdCB0aG9z
ZSBmdW5jdGlvbnMgYXJlIG9ubHkgZXhwb3NlZApmb3IgQlBGIEpJVCBhbmQgdGhleSBhcmUgbm90
IHN1cHBvc2VkIHRvIGJlIHVzZWQgYnkgb3RoZXIgcGFydHMgb2YgdGhlCmtlcm5lbC4gQW5kIGlu
IGNhc2UgeW91IGRvIGVuZCB1cCBhZGRpbmcgYSBuZXcgY29uZmlnIG9wdGlvbiwgZ3VhcmQKdGhl
IHB1YmxpYyBkZWNsYXJhdGlvbnMgYnkgYSBjb3JyZXNwb25kaW5nIGlmZGVmLgoKPiBUaGUgZ29h
bCBoZXJlIGlzIHRvIGZpbmQgYnVncyBpbiB0aGUgdmVyaWZpZXIuCj4gSWYgc29tZXRoaW5nIGdv
dCBwYXN0IGl0LCB0aGF0IHNob3VsZG4ndCBoYXZlLAo+IGthc2FuIGdlbmVyaWMgb24geDg2LTY0
IGlzIGVub3VnaC4KCkZXSVcsIEkgc3VzcGVjdCBIV19UQUdTIEtBU0FOIGFscmVhZHkganVzdCB3
b3JrcyB3aXRoIEpJVGVkIEJQRiBjb2RlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
