Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNGqOaKG72lPCAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:10 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 606674759CA
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79A6BC57B72;
	Mon, 27 Apr 2026 15:54:09 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B79AC56612
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2026 14:27:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 749361A3361;
 Mon, 20 Apr 2026 14:27:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4520E5FFA5;
 Mon, 20 Apr 2026 14:27:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D76FA104609E1; 
 Mon, 20 Apr 2026 16:27:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1776695251; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7iZB9lVR4tjlUQWISf4C9RaUtnMV6A5tolEZjLKPmq0=;
 b=cQx3iAWhs/KPT6ZKsayEJ77QUJ33XBAG/t0wnqcTpu3msayl+KXgWefDzyP6FHZbfakEkZ
 mUR9idudII95auF9BStFdEyg/ZfrWZJCELMf6aEJ9nJnKcF3lYW4yWiIbwvmeXqGWTpGmf
 6EF//PlEz9TgQjwnfV7Im08Tdi8PN2MJhTmQrHK3ZcYqVN+h4i1NR1PcJfySN2cwnhClDq
 928UAmnD/sIgSbP085aDV8aYk/2N8juRaUClIP5Mya/PjkZy+fiJZcnNXxg9mz4R2m4w41
 IRTL6ZhZmOioqx+JmCYgjuunP3yDG68/rxphRxpBvUN8z7Kr2df9dCBqhog1xw==
Mime-Version: 1.0
Date: Mon, 20 Apr 2026 16:27:19 +0200
Message-Id: <DHY1WD3EUHEE.2R8PQXVKW6FO4@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>, "Andrey Konovalov"
 <andreyknvl@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
 <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com>
 <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
 <CA+fCnZd31GzdpEqR8VhfK4JtUKyyRMgbBoAbeGACJgm7WvB6Vw@mail.gmail.com>
 <CAADnVQKv5y+gq=TnOAEXSqgBRpmHNjwqCfxpLaw5XkcbQ+23bg@mail.gmail.com>
 <CA+fCnZe-b0Qqbo5gGv3HN20twquQETDfYYkE1r9tPr9zUFbW9Q@mail.gmail.com>
 <CAADnVQKuptG_opA12O=Xb9_+cHf3f=ycAZdfUp17P2HBYQzdsg@mail.gmail.com>
In-Reply-To: <CAADnVQKuptG_opA12O=Xb9_+cHf3f=ycAZdfUp17P2HBYQzdsg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Mon, 27 Apr 2026 15:54:08 +0000
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Song Liu <song@kernel.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, "H. Peter Anvin" <hpa@zytor.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan <shuah@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Xu Kuohai <xukuohai@huawei.com>,
 Daniel Borkmann <daniel@iogearbox.net>, X86
 ML <x86@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, ebpf@linuxfoundation.org, Alexei
 Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 bpf <bpf@vger.kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 "open list:KERNEL SELFTEST
 FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 Network
 Development <netdev@vger.kernel.org>, David Ahern <dsahern@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Thomas Gleixner <tglx@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>, Kumar
 Kartikeya Dwivedi <memxor@gmail.com>
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
X-Rspamd-Queue-Id: 606674759CA
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.89 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[169];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	MV_CASE(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORGED_RECIPIENTS(0.00)[m:alexei.starovoitov@gmail.com,m:andreyknvl@gmail.com,m:thomas.petazzoni@bootlin.com,m:dave.hansen@linux.intel.com,m:song@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:yonghong.song@linux.dev,m:hpa@zytor.com,m:vincenzo.frascino@arm.com,m:shuah@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:xukuohai@huawei.com,m:daniel@iogearbox.net,m:x86@kernel.org,m:john.fastabend@gmail.com,m:andrii@kernel.org,m:kasan-dev@googlegroups.com,m:mingo@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:bastien.curutchet@bootlin.com,m:mcoquelin.stm32@gmail.com,m:ebpf@linuxfoundation.org,m:ast@kernel.org,m:bp@alien8.de,m:alexis.lothore@bootlin.com,m:bpf@vger.kernel.org,m:dvyukov@google.com,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:netdev@vger.kernel.org,m:dsahern@kernel.org,m:linux-kernel@vger.kernel.org,m:eddyz87@gmail.com,m:tglx@kernel.org,m:jolsa@kernel.org,m:akpm@linux-foundation.org,m:martin.lau@linux.dev,m:davem@davemloft.net,m:memxor@gmail
 .com,m:alexeistarovoitov@gmail.com,m:ryabininaa@gmail.com,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,linux.intel.com,kernel.org,gmail.com,google.com,linux.dev,zytor.com,arm.com,st-md-mailman.stormreply.com,huawei.com,iogearbox.net,googlegroups.com,redhat.com,lists.infradead.org,linuxfoundation.org,alien8.de,vger.kernel.org,kvack.org,linux-foundation.org,davemloft.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[bootlin.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.764];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:url,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Spam: Yes

T24gTW9uIEFwciAyMCwgMjAyNiBhdCAxMjo1MSBBTSBDRVNULCBBbGV4ZWkgU3Rhcm92b2l0b3Yg
d3JvdGU6Cj4gT24gU3VuLCBBcHIgMTksIDIwMjYgYXQgMjo0OeKAr1BNIEFuZHJleSBLb25vdmFs
b3YgPGFuZHJleWtudmxAZ21haWwuY29tPiB3cm90ZToKPj4KPj4gT24gVHVlLCBBcHIgMTQsIDIw
MjYgYXQgNTo1OOKAr1BNIEFsZXhlaSBTdGFyb3ZvaXRvdgo+PiA8YWxleGVpLnN0YXJvdm9pdG92
QGdtYWlsLmNvbT4gd3JvdGU6Cj4+ID4KPj4gPiBJIHRoaW5rIHdlJ3JlIHRhbGtpbmcgcGFzdCBl
YWNoIG90aGVyLgo+PiA+IFdlJ3JlIG5vdCBpbnRlcmVzdGVkIGluIEtBU0FOX1NXX1RBR1Mgb3Ig
S0FTQU5fSFdfVEFHUy4KPj4gPiBXZSdyZSBub3QgZ29pbmcgdG8gbW9kaWZ5IGFybTY0IEpJVCBh
dCBhbGwuCj4+ID4KPj4gPiBUaGlzIGlzIHB1cmVseSBLQVNBTl9HRU5SSUMgYW5kIG9ubHkgb24g
eDg2LTY0Lgo+PiA+IEpJVCB3aWxsIGVtaXQgZXhhY3RseSB3aGF0IGNvbXBpbGVycyBlbWl0IGZv
ciBnZW5lcmljCj4+ID4gd2hpY2ggaXMgX19hc2FuX2xvYWQvc3RvcmUuIFRoaXMgaXMgYXMgc3Rh
YmxlIEFCSSBhcyBpdCBjYW4gZ2V0Cj4+ID4gYW5kIHdlIGRvbid0IHdhbnQgdG8gZGV2aWF0ZSBm
cm9tIGl0Lgo+Pgo+PiBPSywgSSBzdXBwb3NlZCB0aGF0J3MgZmFpci4gWW91IGRpZCB0aHJvdyBt
ZSBvZmYgcG9pbnQgd2l0aCB5b3VyCj4+IHBlcmZvcm1hbmNlIGNvbW1lbnQuIEJ1dCBpZiB5b3Ug
ZGVjaWRlIHRvIGFkZCBTV19UQUdTIHN1cHBvcnQgYXQgc29tZQo+PiBwb2ludCwgSSB0aGluayB0
aGlzIGRpc2N1c3Npb24gbmVlZHMgdG8gYmUgcmV2aXNpdGVkLgo+Pgo+PiBCdXQgcGxlYXNlIGFk
ZCBhIGNvbW1lbnQgc2F5aW5nIHRoYXQgdGhvc2UgZnVuY3Rpb25zIGFyZSBvbmx5IGV4cG9zZWQK
Pj4gZm9yIEJQRiBKSVQgYW5kIHRoZXkgYXJlIG5vdCBzdXBwb3NlZCB0byBiZSB1c2VkIGJ5IG90
aGVyIHBhcnRzIG9mIHRoZQo+PiBrZXJuZWwuIEFuZCBpbiBjYXNlIHlvdSBkbyBlbmQgdXAgYWRk
aW5nIGEgbmV3IGNvbmZpZyBvcHRpb24sIGd1YXJkCj4+IHRoZSBwdWJsaWMgZGVjbGFyYXRpb25z
IGJ5IGEgY29ycmVzcG9uZGluZyBpZmRlZi4KPgo+IEkgZmVlbCBjb25jZXJucyBvZiBtaXN1c2Ug
YXJlIG92ZXJibG93bi4KPiBCZWluZyBpbiBpbmNsdWRlL2xpbnV4L2thc2FuLmggZG9lc24ndCBt
YWtlIHRoZW0gZnJlZS1mb3ItYWxsCj4gYWxsIG9mIGEgc3VkZGVuLCBidXQgaWYgeW91IHByZWZl
ciB3ZSBjYW4ganVzdCBjb3B5IHBhc3RlOgo+ICt2b2lkIF9fYXNhbl9sb2FkMSh2b2lkICpwKTsK
PiArdm9pZCBfX2FzYW5fc3RvcmUxKHZvaWQgKnApOwo+IGludG8gYnBmX2ppdF9jb21wLmMKClRo
YXQncyBhY3R1YWxseSB3aGF0IEkgaW5pdGlhbGx5IHdlbnQgd2l0aCB3aGVuIHdvcmtpbmcgb24g
dGhpcywgYnV0IGl0CmRpZCBsb29rIGEgYml0IGZyYWdpbGUsIGFuZCBzdXNwZWN0ZWQgdGhhdCBJ
IHdvdWxkIHJhdGhlciBiZSBhc2tlZCB0byBleHBvcnQKdGhlbSBwcm9wZXJseSB0aHJvdWdoIGEg
ZGVkaWNhdGVkIGhlYWRlci4gSSdtIGZpbmUgd2l0aCBwdXR0aW5nIGJhY2sgdGhlCm1hbnVhbCBk
ZWNsYXJhdGlvbnMgaW4gaml0IGNvbXAsIHRob3VnaC4KCj4KPj4gPiBUaGUgZ29hbCBoZXJlIGlz
IHRvIGZpbmQgYnVncyBpbiB0aGUgdmVyaWZpZXIuCj4+ID4gSWYgc29tZXRoaW5nIGdvdCBwYXN0
IGl0LCB0aGF0IHNob3VsZG4ndCBoYXZlLAo+PiA+IGthc2FuIGdlbmVyaWMgb24geDg2LTY0IGlz
IGVub3VnaC4KPj4KPj4gRldJVywgSSBzdXNwZWN0IEhXX1RBR1MgS0FTQU4gYWxyZWFkeSBqdXN0
IHdvcmtzIHdpdGggSklUZWQgQlBGIGNvZGUuCj4KPiBPaGguIEdvb2QgcG9pbnQuIExvb2tzIGxp
a2UgbW9kZXJuIGFybTY0IGNwdXMgaW4gcHVibGljIGNsb3Vkcwo+IGRvbid0IGhhdmUgdGhhdCBl
bmFibGVkLCBzbyBvbmUgd291bGQgbmVlZCBwaXhlbCBwaG9uZSB0bwo+IGNhdGNoIHZlcmlmaWVy
IGJ1Z3MgdmlhIGh3X3RhZ3MuCj4gU28gd2Ugc3RpbGwgbmVlZCB0aGlzIHg4Ni1zcGVjaWZpYyBq
aXQga2FzYW4uCj4gSSBndWVzcyBldmVudHVhbGx5IGl0IGNhbiBiZSByZW1vdmVkIHdoZW4gaHdf
dGFncyBzdXBwb3J0IGlzIHdpZGVzcHJlYWQuCgoKCgotLSAKQWxleGlzIExvdGhvcsOpLCBCb290
bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGlu
LmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
