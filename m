Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XwkYD6R732k5UAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 13:51:00 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9C740407F
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 13:51:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52999C8F29B;
	Wed, 15 Apr 2026 11:50:59 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E059C8F286
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2026 13:13:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7FCA11A32A8;
 Tue, 14 Apr 2026 13:13:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 46E3160410;
 Tue, 14 Apr 2026 13:13:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 569A6104500A2; 
 Tue, 14 Apr 2026 15:12:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1776172379; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ljtr9WPSUnaAjZD/FtGwji3II/sbFJuzXTsBaHKsQSU=;
 b=lhDeNvog7+cXfwfKejAzO+yVIre7KeKOh4nxhyYR84tw7Qhs4CDNLFYshF/sNo/ddcHeul
 OAXDnRRPYFfdKmNFr6FNXLWBgkwR5bSerHfi1jG3QAuxmeyq9DKVn4ADpvD+k/LktKcxCV
 Qo+C51KQYvBPk2tQWgzerrUX38wX8fl9mns5nowg6aBHUe0QUCDETlFcTsN3Vd+g6AhDW1
 t0+PPdVn0VXoKLO/NdWsu8xr8pa5SfFsPWlNHjagwF2HUg4Jwz/bTTtoEDbu5jNS5UXcqe
 /1a7m2ycQR5Rypiiam1nxF1Kid65dAD8mzMdsDqIpVAnb6rsDVnu+pzT2qXnlw==
Mime-Version: 1.0
Date: Tue, 14 Apr 2026 15:12:47 +0200
Message-Id: <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Andrey Konovalov" <andreyknvl@gmail.com>,
 =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
In-Reply-To: <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
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
 Alexei Starovoitov <ast@kernel.org>, Borislav
 Petkov <bp@alien8.de>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 bpf@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>, linux-kernel@vger.kernel.org,
 Eduard Zingerman <eddyz87@gmail.com>, Thomas
 Gleixner <tglx@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Martin
 KaFai Lau <martin.lau@linux.dev>, "David S. Miller" <davem@davemloft.net>
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
X-Spamd-Result: default: False [5.89 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	MV_CASE(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andreyknvl@gmail.com,m:alexis.lothore@bootlin.com,m:thomas.petazzoni@bootlin.com,m:dave.hansen@linux.intel.com,m:song@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:yonghong.song@linux.dev,m:hpa@zytor.com,m:vincenzo.frascino@arm.com,m:shuah@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:xukuohai@huawei.com,m:daniel@iogearbox.net,m:x86@kernel.org,m:john.fastabend@gmail.com,m:andrii@kernel.org,m:kasan-dev@googlegroups.com,m:mingo@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:bastien.curutchet@bootlin.com,m:jolsa@kernel.org,m:ebpf@linuxfoundation.org,m:ast@kernel.org,m:bp@alien8.de,m:memxor@gmail.com,m:bpf@vger.kernel.org,m:dvyukov@google.com,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:netdev@vger.kernel.org,m:dsahern@kernel.org,m:linux-kernel@vger.kernel.org,m:eddyz87@gmail.com,m:tglx@kernel.org,m:mcoquelin.stm32@gmail.com,m:akpm@linux-foundation.org,m:martin.lau@linux.dev,m:davem@davemloft.net,m:ryabininaa@gmail.com,m:j
 ohnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FREEMAIL_TO(0.00)[gmail.com,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[bootlin.com,linux.intel.com,kernel.org,gmail.com,google.com,linux.dev,zytor.com,arm.com,st-md-mailman.stormreply.com,huawei.com,iogearbox.net,googlegroups.com,redhat.com,lists.infradead.org,linuxfoundation.org,alien8.de,vger.kernel.org,kvack.org,linux-foundation.org,davemloft.net];
	NEURAL_SPAM(0.00)[0.584];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[bootlin.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,bootlin.com:email,bootlin.com:mid,bootlin.com:url]
X-Rspamd-Queue-Id: 1F9C740407F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQW5kcmV5LCB0aGFua3MgZm9yIHRoZSBwcm9tcHQgcmV2aWV3ICEKCk9uIFR1ZSBBcHIgMTQs
IDIwMjYgYXQgMTI6MTkgQU0gQ0VTVCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiBPbiBNb24s
IEFwciAxMywgMjAyNiBhdCA4OjI54oCvUE0gQWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRp
b24pCj4gPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKPj4KClsuLi5dCgo+PiAr
I2lmZGVmIENPTkZJR19LQVNBTl9HRU5FUklDCj4+ICt2b2lkIF9fYXNhbl9sb2FkMSh2b2lkICpw
KTsKPj4gK3ZvaWQgX19hc2FuX3N0b3JlMSh2b2lkICpwKTsKPj4gK3ZvaWQgX19hc2FuX2xvYWQy
KHZvaWQgKnApOwo+PiArdm9pZCBfX2FzYW5fc3RvcmUyKHZvaWQgKnApOwo+PiArdm9pZCBfX2Fz
YW5fbG9hZDQodm9pZCAqcCk7Cj4+ICt2b2lkIF9fYXNhbl9zdG9yZTQodm9pZCAqcCk7Cj4+ICt2
b2lkIF9fYXNhbl9sb2FkOCh2b2lkICpwKTsKPj4gK3ZvaWQgX19hc2FuX3N0b3JlOCh2b2lkICpw
KTsKPj4gK3ZvaWQgX19hc2FuX2xvYWQxNih2b2lkICpwKTsKPj4gK3ZvaWQgX19hc2FuX3N0b3Jl
MTYodm9pZCAqcCk7Cj4+ICsjZW5kaWYgLyogQ09ORklHX0tBU0FOX0dFTkVSSUMgKi8KPgo+IFRo
aXMgbG9va3MgdWdseSwgbGV0J3Mgbm90IGRvIHRoaXMgdW5sZXNzIGl0J3MgcmVhbGx5IHJlcXVp
cmVkLgo+Cj4gWW91IGNhbiBqdXN0IHVzZSBrYXNhbl9jaGVja19yZWFkL3dyaXRlKCkgaW5zdGVh
ZCAtIHRoZXNlIGFyZSBwdWJsaWMKPiB3cmFwcGVycyBhcm91bmQgdGhlIHNhbWUgc2hhZG93IG1l
bW9yeSBjaGVja2luZyBmdW5jdGlvbnMuIEFuZCB0aGV5Cj4gYWxzbyB3b3JrIHdpdGggdGhlIFNX
X1RBR1MgbW9kZSwgaW4gY2FzZSB0aGUgQlBGIHdvdWxkIHdhbnQgdG8gdXNlCj4gdGhhdCBtb2Rl
IGF0IHNvbWUgcG9pbnQuIChGb3IgSFdfVEFHUywgd2Ugb25seSBoYXZlIGthc2FuX2NoZWNrX2J5
dGUoKQo+IHRoYXQgY2hlY2tzIGEgc2luZ2xlIGJ5dGUsIGJ1dCBpdCBjYW4gYmUgZXh0ZW5kZWQg
aW4gdGhlIGZ1dHVyZSBpZgo+IHJlcXVpcmVkIHRvIGJlIHVzZWQgYnkgQlBGLikKCkFDSywgSSds
bCB0cnkgdG8gdXNlIHRob3NlIGthc2FuX2NoZWNrX3JlYWQgYW5kIGthc2FuX2NoZWNrX3dyaXRl
IHJhdGhlcgp0aGFuIF9fYXNhbl97bG9hZCxzdG9yZX1YLgoKQWxleGlzCgotLSAKQWxleGlzIExv
dGhvcsOpLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0
cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
