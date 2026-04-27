Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BxMNz8i72lV7gAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 10:45:51 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D4C46F4C0
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 10:45:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3502C57A50;
	Mon, 27 Apr 2026 08:45:50 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59213C08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2026 08:45:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A24BE1A343D;
 Mon, 27 Apr 2026 08:45:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6D3D9600D1;
 Mon, 27 Apr 2026 08:45:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4E94B10722389; 
 Mon, 27 Apr 2026 10:45:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777279546; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=enlPWmXbCXiBTtPjtrqyyDQhH4YVYS+iBt6pkMFkQHE=;
 b=WJbcAploUg0VmF8Pr+sfgdotkcsE+3i3sOgj0VN9GILZjM/dn7k2l6yEnDFaLgNnsHB2ke
 rIiFoGiqvbcbZUtxKswbsaRljyz+xXTtAxqH/KKDTh71KwOwbOw8l/vQCMnSwhlcMo4xCC
 xoIgVMfDds0upX6YXNRrk8BNT5gtD69tE0EPWoJGdDPyPEFVH4WSMc76pnmesP3PyyGxoi
 WSBqZVZb+deNlGfh7SjsbGBSVzPwbj+XpuWgjdaPkUDHoOr+AiZQXiqXcxWBxKDn39Kuzf
 8xtuEKI55YCnUaxvGQOliOLdPRRmK0uaNRPXrzMWGxybldX6FdIJZBopPxlCjQ==
Mime-Version: 1.0
Date: Mon, 27 Apr 2026 10:45:34 +0200
Message-Id: <DI3T0IKVGW9X.KVYWOQJN3PCI@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>,
 =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "John Fastabend"
 <john.fastabend@gmail.com>, "David S. Miller" <davem@davemloft.net>, "David
 Ahern" <dsahern@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Shuah Khan" <shuah@kernel.org>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>,
 "Alexander Potapenko" <glider@google.com>, "Andrey Konovalov"
 <andreyknvl@gmail.com>, "Dmitry Vyukov" <dvyukov@google.com>, "Vincenzo
 Frascino" <vincenzo.frascino@arm.com>, "Andrew Morton"
 <akpm@linux-foundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <71fb19ff-6dde-43f4-a0e9-5c8cf2ba4ed4@linux.dev>
In-Reply-To: <71fb19ff-6dde-43f4-a0e9-5c8cf2ba4ed4@linux.dev>
X-Last-TLS-Session-Version: TLSv1.3
Cc: linux-kselftest@vger.kernel.org,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, netdev@vger.kernel.org,
 ebpf@linuxfoundation.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bpf@vger.kernel.org,
 Xu Kuohai <xukuohai@huawei.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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
X-Rspamd-Queue-Id: 74D4C46F4C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.89 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MV_CASE(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ihor.solodrai@linux.dev,m:alexis.lothore@bootlin.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:memxor@gmail.com,m:song@kernel.org,m:yonghong.song@linux.dev,m:jolsa@kernel.org,m:john.fastabend@gmail.com,m:davem@davemloft.net,m:dsahern@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:shuah@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:akpm@linux-foundation.org,m:linux-kselftest@vger.kernel.org,m:bastien.curutchet@bootlin.com,m:netdev@vger.kernel.org,m:ebpf@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:thomas.petazzoni@bootlin.com,m:bpf@vger.kernel.org,m:xukuohai@huawei.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-
 arm-kernel@lists.infradead.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,bootlin.com,kernel.org,iogearbox.net,gmail.com,davemloft.net,redhat.com,alien8.de,linux.intel.com,zytor.com,foss.st.com,google.com,arm.com,linux-foundation.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[bootlin.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.885];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]

SGkgSWhvciwKdGhhbmtzIGEgbG90IGZvciB0aGUgcmV2aWV3IGFuZCBoZWxwICEKCk9uIFNhdCBB
cHIgMjUsIDIwMjYgYXQgMToxMCBBTSBDRVNULCBJaG9yIFNvbG9kcmFpIHdyb3RlOgo+IE9uIDQv
MTMvMjYgMTE6MjggQU0sIEFsZXhpcyBMb3Rob3LDg8KpIChlQlBGIEZvdW5kYXRpb24pIHdyb3Rl
Ogo+PiBIZWxsbywKPj4gdGhpcyBzZXJpZXMgYWltcyB0byBicmluZyBiYXNpYyBzdXBwb3J0IGZv
ciBLQVNBTiBjaGVja3MgdG8gQlBGIEpJVGVkCj4+IHByb2dyYW1zLiBUaGlzIGZvbGxvd3MgdGhl
IGZpcnN0IFJGQyBwb3N0ZWQgaW4gWzFdLgoKWy4uLl0KCj4+IFRoZSBzZXJpZXMgaXMgbWFya2Vk
IGFuZCBzZW50IGFzIFJGQzoKPj4gLSB0byBhbGxvdyBjb2xsZWN0aW5nIGZlZWRiYWNrIGVhcmx5
IGFuZCBtYWtlIHN1cmUgdGhhdCBpdCBnb2VzIGludG8gdGhlCj4+ICAgcmlnaHQgZGlyZWN0aW9u
Cj4+IC0gYmVjYXVzZSBpdCBkZXBlbmRzIG9uIFh1J3Mgd29yayB0byBwYXNzIGRhdGEgYmV0d2Vl
biB0aGUgdmVyaWZpZXIgYW5kCj4+ICAgSklUIGNvbXBpbGVycy4gVGhpcyB3b3JrIGlzIG5vdCBt
ZXJnZWQgeWV0LCBzZWUgWzJdLiBJIGhhdmUgYmVlbgo+PiAgIHRyYWNraW5nIHRoZSB2YXJpb3Vz
IHJldmlzaW9ucyBoZSBzZW50IG9uIHRoZSBNTCBhbmQgYmFzZWQgbXkgbG9jYWwKPj4gICBicmFu
Y2ggb24gaGlzIHdvcmsKPj4gLSBiZWNhdXNlIHRlc3RzIGJyb3VnaHQgYnkgdGhpcyBzZXJpZXMg
Y3VycmVudGx5IGNhbid0IHJ1biBvbiBCUEYgQ0k6Cj4+ICAgdGhleSBleHBlY3Qga2FzYW4gbXVs
dGlzaG90IHRvIGJlIGVuYWJsZWQsIG90aGVyd2lzZSB0aGUgZmlyc3QgdGVzdAo+PiAgIHdpbGwg
bWFrZSBhbGwgb3RoZXIga2FzYW4tcmVsYXRlZCB0ZXN0cyBmYWlsLgo+Cj4gQUZBSUNUIHRoaXMg
Y2FuIGJlIHRyaXZpYWxseSBmaXhlZCBvbiBCUEYgQ0kgc2lkZSwgd2UganVzdCBuZWVkIHRvIHNl
dAo+IGthc2FuX211bHRpX3Nob3QgZm9yIHRoZSBWTXMgcnVubmluZyB0aGUgdGVzdHMuIEkgd2ls
bCBkbyB0aGF0LCB5b3VyCj4gbmV4dCByZXZpc2lvbiBkb2Vzbid0IGhhdmUgdG8gYmUgYW5kIFJG
Qy4KClN3ZWV0LCBtdWNoIGFwcHJlY2lhdGVkIDopCgpJJ3ZlIHN0YXJ0ZWQgcmVjZWl2aW5nIHNv
bWUgU2FzaGlrbyByZXZpZXdzIG9uIHRoZSBzZXJpZXMgKGxpa2VseSB0aGFua3MKdG8gc29tZSBv
ZiB5b3VyIGFjdGlvbnMpLCBJJ2xsIHRha2UgYSBsb29rIGludG8gdGhvc2UgYW5kIHByZXBhcmUg
YQoobm9uLVJGQykgdjIuCgpUaGFua3MsCgpBbGV4aXMKCi0tIApBbGV4aXMgTG90aG9yw6ksIEJv
b3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3Rs
aW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
