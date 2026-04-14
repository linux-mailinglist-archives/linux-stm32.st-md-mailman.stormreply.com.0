Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFoMGaR732k3UAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 13:51:00 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7F740408B
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 13:51:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF9D6C90089;
	Wed, 15 Apr 2026 11:50:59 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC635C8F286
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2026 19:16:17 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso72747815e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2026 12:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776194177; cv=none;
 d=google.com; s=arc-20240605;
 b=LK0EmMp/A0F/zO//z22f7xzKEQykGXFBjnJnPS9pIm+4EinCxYpSbFSfy6j+uK9pAg
 OoIsMqe5QfeqBMLgp3ZaVifDrSn6E2uCpVtkBzEVKC/34U+ZBiK2reokH0K+NzW57Clk
 fu7cTO+vnXYVJDmOfQNiFoS+hzUnsSuokTXDez573mU67SuOo0bjPY6+mrnsAuqLT+Wl
 vbbH1qvFBYxio+qlk23HeJQvTaXTe/x+McOQOVl+OAi8ohhJcVA0aDUPhmtptq69y0W7
 lRsHkrAyD8+ucy9kYarnDJpGMOSiO6cW8Ba9zfCt4X4zaN2b0FVjfL41nLIFKMk50bHj
 Gtfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Pa9Tyq9G0aEPQgad+vwhYFPvxVvYUvSmDxYTMccNEa8=;
 fh=P4uMXc5ohkJRlHaElz+B+LVuOCdSx68W9+4Q5j9rLbs=;
 b=G/kqQwzb6DOU3D49BvfxlK1erfIyIHyn0SIIfIiJGYvmmgFhNsa3L0k+xJ/voZY7B4
 4TmFGc61JhtTu51d/Sd1MRU2L/9woe91RV6Cg0PJ5v4JjSkd8/EreTkq7NXmTFKbyEqD
 nkrOsjsyDGgXIXD5/wdvPw1r9I7bErogiF0vYkvFastmRU1ymb3R5eADVbsCvIIvvO/c
 8Pjzh+9I7I+X7Qm+JCuq+TVc2cTqUnzSp5jxfV0iBAf4xdEeVVMKu1DlqCO29eaPb4gC
 VSmd5O86u3vXpp0MAKZdLpY5FlRtHw/rLfB2xRefQjvqRqD8M1QURge+vJ89lU9xA3Xr
 Txhg==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776194177; x=1776798977;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pa9Tyq9G0aEPQgad+vwhYFPvxVvYUvSmDxYTMccNEa8=;
 b=PNeVfGZvc9BhYbSZj8d/Huoy8nfjcy7V8dFg1i9gb28nKRwNaHxoAq0I+1y0UtSmOc
 zgxtUbSa38RZPmkXZS6s/7prWjbDWZ402m61BK7os4pkhfnHITbQjS2LqBlIPWOJ/9i3
 uXSbj3EW0QB8zU9AMr4JGD4AVROA727IB2QtX9o27XjvGZXyii24zzJm3pwtO/yvQvQm
 hqxS5Bttg4M/J/taMQH1HpEnGWYYTHg3MuF7dcsgLifK55PTuKPr0jc5pVJJKQXB7ztZ
 DlB10DmDf64sn56Okw4QuqVWIzK4dD6kzRtrIlR0eU1j/eSzgb2HSQDY4PFcrJASVnmW
 5BUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776194177; x=1776798977;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Pa9Tyq9G0aEPQgad+vwhYFPvxVvYUvSmDxYTMccNEa8=;
 b=B60UXd9PCiT302gyzRQIa+6qg+SwK7mXGLGd0ytL7h6hmupjb7ooU2kc5+XHgNaCHy
 CprJqcfL32w4ESf4ht9N+ojST2g/uE2WLx9Vow2LomWAcWVoiPKI8cvWHg98m1F77b6w
 bDLVeqocg0IAkgyHLeued0zWcOAAVUQ61DuI9QLPIC0DNU9N7/6b82TDHQpcNwz1lVuT
 7qSli1+c/27i8MYuA6fh4kkTMAZ6VZa6ysCn6Kn1qnSPj5lHUQB5Ibb/eC5Gmcr9plCt
 cS7TeOj6OKzEKVIYddGvNXW+5l4kLVoNaSil9QLu0ZVQLNyH7xM3NqtMDdhx7jLzttgD
 5ZWw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+0bfNvD6l2jsNM/iqS32nw+4a9wbLSaSKxGUXHZSGsYdiShYaG0dFKxiE4UQZYNyL5B7exKUlsPnO8wA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyICUDOKriTSLVBe0iDIQe5IeyH9n/GzZQDJacPT253RVUoEy5r
 onYfycpPmElB8O2wx5AOzeKz5DL4CFHqGyEAui7rSQba2LxhE7sJ8EtRycWjKPngMCDo4H5laph
 1DPEf9cA1C6cMPJcHRhzSWuvJAxRwYks=
X-Gm-Gg: AeBDiet3vNN4a1QwEtMOUpkRpu+iepu1zjsK7kKXcwCRpOPipA6oSp3Z08oJBz9m3UN
 o1d1eFo5I4RKEJwhmDE5qxEgep0sKKeOXuZUZh2IUyRiNm6Bbh7lxpNxqjd6r8eeEC+smV0FBdV
 3A1/EYpy4JM4e+zQOYFPauqoXLqPmWVFQ8E7+cWTqZXi4yF9gsdDs3kCn1uAjiX056ZXxcyxupK
 yEbltLXsYmbz4EN+bvgMQl5KL9ugKJsUJS2V2oyKSzFMkSv0pKamLFauiR9Qd02p3a8TfQSrO2C
 e5F5BvrsCq8ENyCdUnLAaZPblnDQ4yCd3IYPzZsKxvy1dkGjw1q0DWN3tGJzKLVfMBcLz1Kn9mj
 wQyuBd0CXVueqSKdN8+6ZDKWqKqb3NcdIgUlT
X-Received: by 2002:a05:600c:1f83:b0:488:b99b:4177 with SMTP id
 5b1f17b1804b1-488d687bf61mr256552315e9.25.1776194176915; Tue, 14 Apr 2026
 12:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
 <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com>
 <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
 <DHT3JV7GTOBL.29205LGGNEDSH@bootlin.com>
In-Reply-To: <DHT3JV7GTOBL.29205LGGNEDSH@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 14 Apr 2026 12:16:05 -0700
X-Gm-Features: AQROBzCIKxzyzm1_jzBBwpYG5l-_Hq5ftS9HvYZuKsAkHlvW0CNWB1k5nfXPFjQ
Message-ID: <CAADnVQ+c9h_wuNwj8pjx885oNErGY7bxxCwKi+DiJ0XKSpyYfg@mail.gmail.com>
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailman-Approved-At: Wed, 15 Apr 2026 11:50:57 +0000
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexis.lothore@bootlin.com,m:thomas.petazzoni@bootlin.com,m:dave.hansen@linux.intel.com,m:song@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:yonghong.song@linux.dev,m:hpa@zytor.com,m:vincenzo.frascino@arm.com,m:shuah@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:xukuohai@huawei.com,m:daniel@iogearbox.net,m:x86@kernel.org,m:john.fastabend@gmail.com,m:andrii@kernel.org,m:kasan-dev@googlegroups.com,m:mingo@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:bastien.curutchet@bootlin.com,m:mcoquelin.stm32@gmail.com,m:ebpf@linuxfoundation.org,m:ast@kernel.org,m:bp@alien8.de,m:memxor@gmail.com,m:bpf@vger.kernel.org,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:netdev@vger.kernel.org,m:dsahern@kernel.org,m:linux-kernel@vger.kernel.org,m:eddyz87@gmail.com,m:tglx@kernel.org,m:jolsa@kernel.org,m:akpm@linux-foundation.org,m:martin.lau@linux.dev,m:davem@davemloft.net,m:ryabininaa@gmail.com,m:j
 ohnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_SENDER(0.00)[alexeistarovoitov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,linux.intel.com,kernel.org,gmail.com,google.com,linux.dev,zytor.com,arm.com,st-md-mailman.stormreply.com,huawei.com,iogearbox.net,googlegroups.com,redhat.com,lists.infradead.org,linuxfoundation.org,alien8.de,vger.kernel.org,kvack.org,linux-foundation.org,davemloft.net];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[alexeistarovoitov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.051];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,bootlin.com:email]
X-Rspamd-Queue-Id: 4A7F740408B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBBcHIgMTQsIDIwMjYgYXQgMTE6NDHigK9BTSBBbGV4aXMgTG90aG9yw6kKPGFsZXhp
cy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSBBcHIgMTQsIDIwMjYgYXQg
NDozNiBQTSBDRVNULCBBbGV4ZWkgU3Rhcm92b2l0b3Ygd3JvdGU6Cj4gPiBPbiBUdWUsIEFwciAx
NCwgMjAyNiBhdCA2OjEz4oCvQU0gQWxleGlzIExvdGhvcsOpCj4gPiA8YWxleGlzLmxvdGhvcmVA
Ym9vdGxpbi5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gSGkgQW5kcmV5LCB0aGFua3MgZm9yIHRoZSBw
cm9tcHQgcmV2aWV3ICEKPiA+Pgo+ID4+IE9uIFR1ZSBBcHIgMTQsIDIwMjYgYXQgMTI6MTkgQU0g
Q0VTVCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+PiA+IE9uIE1vbiwgQXByIDEzLCAyMDI2
IGF0IDg6MjnigK9QTSBBbGV4aXMgTG90aG9yw6kgKGVCUEYgRm91bmRhdGlvbikKPiA+PiA+IDxh
bGV4aXMubG90aG9yZUBib290bGluLmNvbT4gd3JvdGU6Cj4gPj4gPj4KPiA+Pgo+ID4+IFsuLi5d
Cj4gPj4KPiA+PiA+PiArI2lmZGVmIENPTkZJR19LQVNBTl9HRU5FUklDCj4gPj4gPj4gK3ZvaWQg
X19hc2FuX2xvYWQxKHZvaWQgKnApOwo+ID4+ID4+ICt2b2lkIF9fYXNhbl9zdG9yZTEodm9pZCAq
cCk7Cj4gPj4gPj4gK3ZvaWQgX19hc2FuX2xvYWQyKHZvaWQgKnApOwo+ID4+ID4+ICt2b2lkIF9f
YXNhbl9zdG9yZTIodm9pZCAqcCk7Cj4gPj4gPj4gK3ZvaWQgX19hc2FuX2xvYWQ0KHZvaWQgKnAp
Owo+ID4+ID4+ICt2b2lkIF9fYXNhbl9zdG9yZTQodm9pZCAqcCk7Cj4gPj4gPj4gK3ZvaWQgX19h
c2FuX2xvYWQ4KHZvaWQgKnApOwo+ID4+ID4+ICt2b2lkIF9fYXNhbl9zdG9yZTgodm9pZCAqcCk7
Cj4gPj4gPj4gK3ZvaWQgX19hc2FuX2xvYWQxNih2b2lkICpwKTsKPiA+PiA+PiArdm9pZCBfX2Fz
YW5fc3RvcmUxNih2b2lkICpwKTsKPiA+PiA+PiArI2VuZGlmIC8qIENPTkZJR19LQVNBTl9HRU5F
UklDICovCj4gPj4gPgo+ID4+ID4gVGhpcyBsb29rcyB1Z2x5LCBsZXQncyBub3QgZG8gdGhpcyB1
bmxlc3MgaXQncyByZWFsbHkgcmVxdWlyZWQuCj4gPj4gPgo+ID4+ID4gWW91IGNhbiBqdXN0IHVz
ZSBrYXNhbl9jaGVja19yZWFkL3dyaXRlKCkgaW5zdGVhZCAtIHRoZXNlIGFyZSBwdWJsaWMKPiA+
PiA+IHdyYXBwZXJzIGFyb3VuZCB0aGUgc2FtZSBzaGFkb3cgbWVtb3J5IGNoZWNraW5nIGZ1bmN0
aW9ucy4gQW5kIHRoZXkKPiA+PiA+IGFsc28gd29yayB3aXRoIHRoZSBTV19UQUdTIG1vZGUsIGlu
IGNhc2UgdGhlIEJQRiB3b3VsZCB3YW50IHRvIHVzZQo+ID4+ID4gdGhhdCBtb2RlIGF0IHNvbWUg
cG9pbnQuIChGb3IgSFdfVEFHUywgd2Ugb25seSBoYXZlIGthc2FuX2NoZWNrX2J5dGUoKQo+ID4+
ID4gdGhhdCBjaGVja3MgYSBzaW5nbGUgYnl0ZSwgYnV0IGl0IGNhbiBiZSBleHRlbmRlZCBpbiB0
aGUgZnV0dXJlIGlmCj4gPj4gPiByZXF1aXJlZCB0byBiZSB1c2VkIGJ5IEJQRi4pCj4gPj4KPiA+
PiBBQ0ssIEknbGwgdHJ5IHRvIHVzZSB0aG9zZSBrYXNhbl9jaGVja19yZWFkIGFuZCBrYXNhbl9j
aGVja193cml0ZSByYXRoZXIKPiA+PiB0aGFuIF9fYXNhbl97bG9hZCxzdG9yZX1YLgo+ID4KPiA+
IE5vLiBUaGUgcGVyZm9ybWFuY2UgcGVuYWx0eSB3aWxsIGJlIHRvbyBoaWdoLgo+Cj4gU2luY2Ug
d2UgYXJlIG1lbnRpb25pbmcgaXQsIEkgZGlkIG5vdCBjb25zaWRlciB5ZXQgYW55IHBlcmZvcm1h
bmNlCj4gY29tcGFyaXNpb24vYmVuY2htYXJraW5nIChhbmQgSSBhbSBub3QgcmVhbGx5IGZhbWls
aWFyIHdpdGggdXN1YWwgYnBmCj4gcGVyZm9ybWFuY2UgdmFsaWRhdGlvbiBwcmFjdGljZXMgZm9y
IG5ldyBicGYgZmVhdHVyZXMpLiBJcyB0aGVyZSBhbnkKPiBleGlzdGluZyB0ZXN0IEkgc2hvdWxk
IHRha2UgYSBsb29rIGF0IGZvciB0aGlzID8gTWF5YmUgc29tZSBzcGVjaWZpYwo+IGJlbmNoZXMg
aW4gdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL2JlbmNoID8KClNvIGZhciBldmVyeXRoaW5n
IGluIGJwZi9iZW5jaC8gbWVhc3VyZXMgYnBmIGluZnJhIGxpa2UKbWFwcywga3Byb2JlcywgdHJh
Y2Vwb2ludHMsIGV0Yy4KV2UgZG9uJ3QgaGF2ZSBiZW5jaG1hcmtzIGZvciBicGYgcHJvZ3JhbXMu
ClNvIHdlIGRvbid0IGtub3cgaG93IHdlbGwgSklUcyBhcmUgZ2VuZXJhdGluZyBjb2RlCmFuZCBo
b3cgbXVjaCBpbmxpbmluZyBkb25lIGJ5IHRoZSB2ZXJpZmllciwgSklUcyBhY3R1YWxseSBoZWxw
cy4KClB1cmFuamF5IGlzIHdvcmtpbmcgb24gY3JlYXRpbmcgYSBTUEVDaW50IGxpa2Ugc2V0IG9m
IGJlbmNobWFya3MuCgpGb3IgdGhpcyBrYXNhbiB3b3JrIHdlIHNob3VsZCBtYWtlIHRoZSBiZXN0
IGRlY2lzaW9ucyBmcm9tCnBlcmZvcm1hbmNlIHBvaW50IG9mIHZpZXcsIGxpa2Ugbm90IHdhc3Rp
bmcgdW5uZWNlc3NhcnkgY2FsbAphbmQgbm90IHNhdmluZyB1bm5lY2Vzc2FyeSByZWdpc3RlcnMu
IGJ0dyBpbiB0aGUgb3RoZXIgcGF0Y2gKSSB0aGluayB5b3UgY2FuIHNraXAgc2F2aW5nIG9mIHIx
MCBhbmQgcjExLgpCdXQgd2UgY2Fubm90IHF1YW50aWZ5IHlldCB0aGF0IGF2b2lkaW5nIGV4dHJh
IGNhbGwgZ2l2ZXMgdXMgTiUuCgpZb3UgY2FuIG1pY3JvLWJlbmNobWFyaywgb2YgY291cnNlLCBi
dXQgZ290dGEgYmUgY2FyZWZ1bAppbnRlcnByZXRpbmcgdGhlIHJlc3VsdHMuIEl0IG1pZ2h0IGJl
IHRvbyBlYXN5IHRvIGdldCBpbnRvCnRoaW5raW5nIHRoYXQgSklUIG11c3QgaW5saW5lIF9fYXNh
bl9sb2FkKCkgZm9yIHRoZSBzYWtlIG9mIHBlcmZvcm1hbmNlLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
