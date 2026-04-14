Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LL+HJxE3mlvpwkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Apr 2026 15:43:56 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2AC3FAA20
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Apr 2026 15:43:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6041C8F292;
	Tue, 14 Apr 2026 13:43:55 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB8BEC8F291
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2026 13:43:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 210641A32A8;
 Tue, 14 Apr 2026 13:43:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E416660410;
 Tue, 14 Apr 2026 13:43:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 450DD10450118; 
 Tue, 14 Apr 2026 15:43:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1776174232; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=fBYaHCpG8hC1NEAoLKhT2eDDnp5ePCFis5i2nukgCY4=;
 b=S6AAfSv+oUeOvIrxD+z5bbdfpbvEOB21uXEtXvB4AqMh4FY8aCuyB3wHwx9r7WuVdHJYL+
 rD0/08M7IBbmkTkrkT4y4rKcwWyqFckHbY0d9PtwNrkx7DaSk7KT0vztBafKaTOmUOws5w
 qAGaNH/SCsFaeSpXq+U1fXnRnSb6RTAFiP4wAme1fA2E/ecJefwxeRaUPgj3ZmXhRt7wxY
 aas0aDmqQnMSQ8xEcyHooL1//5S5S9RSul/ZsJlUWSIBozq2b3PI6l6xl3ldUHUduj47SE
 koioV9P/g0ItanZHdEow/RtOOTONKeljDR3QB5PLNB90x26lfEpu4eQqk7yUEg==
Mime-Version: 1.0
Date: Tue, 14 Apr 2026 15:43:42 +0200
Message-Id: <DHSX7PABLUSN.1VYMRZ02DFZEL@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Andrey Konovalov" <andreyknvl@gmail.com>,
 =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-8-1a5831230821@bootlin.com>
 <CA+fCnZekgcEgsZnRrOB=+HoG=neRg=oLTt2jStyrPJ6mYf2ctQ@mail.gmail.com>
In-Reply-To: <CA+fCnZekgcEgsZnRrOB=+HoG=neRg=oLTt2jStyrPJ6mYf2ctQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
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
Subject: Re: [Linux-stm32] [PATCH RFC bpf-next 8/8] selftests/bpf: add tests
 to validate KASAN on JIT programs
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andreyknvl@gmail.com,m:alexis.lothore@bootlin.com,m:thomas.petazzoni@bootlin.com,m:dave.hansen@linux.intel.com,m:song@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:yonghong.song@linux.dev,m:hpa@zytor.com,m:vincenzo.frascino@arm.com,m:shuah@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:xukuohai@huawei.com,m:daniel@iogearbox.net,m:x86@kernel.org,m:john.fastabend@gmail.com,m:andrii@kernel.org,m:kasan-dev@googlegroups.com,m:mingo@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:bastien.curutchet@bootlin.com,m:jolsa@kernel.org,m:ebpf@linuxfoundation.org,m:ast@kernel.org,m:bp@alien8.de,m:memxor@gmail.com,m:bpf@vger.kernel.org,m:dvyukov@google.com,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:netdev@vger.kernel.org,m:dsahern@kernel.org,m:linux-kernel@vger.kernel.org,m:eddyz87@gmail.com,m:tglx@kernel.org,m:mcoquelin.stm32@gmail.com,m:akpm@linux-foundation.org,m:martin.lau@linux.dev,m:davem@davemloft.net,m:ryabininaa@gmail.com,m:j
 ohnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[39];
	FREEMAIL_TO(0.00)[gmail.com,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[bootlin.com,linux.intel.com,kernel.org,gmail.com,google.com,linux.dev,zytor.com,arm.com,st-md-mailman.stormreply.com,huawei.com,iogearbox.net,googlegroups.com,redhat.com,lists.infradead.org,linuxfoundation.org,alien8.de,vger.kernel.org,kvack.org,linux-foundation.org,davemloft.net];
	NEURAL_SPAM(0.00)[0.457];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,bootlin.com:email,bootlin.com:mid,bootlin.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 0D2AC3FAA20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlIEFwciAxNCwgMjAyNiBhdCAxMjoyMCBBTSBDRVNULCBBbmRyZXkgS29ub3ZhbG92IHdy
b3RlOgo+IE9uIE1vbiwgQXByIDEzLCAyMDI2IGF0IDg6MjnigK9QTSBBbGV4aXMgTG90aG9yw6kg
KGVCUEYgRm91bmRhdGlvbikKPiA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgo+
Pgo+PiBBZGQgYSBiYXNpYyBLQVNBTiB0ZXN0IHJ1bm5lciB0aGF0IGxvYWRzIGFuZCB0ZXN0LXJ1
biBwcm9ncmFtcyB0aGF0IGNhbgo+PiB0cmlnZ2VyIG1lbW9yeSBtYW5hZ2VtZW50IGJ1Z3MuIFRo
ZSB0ZXN0IGNhcHR1cmVzIGtlcm5lbCBsb2dzIGFuZCBlbnN1cmUKPj4gdGhhdCB0aGUgZXhwZWN0
ZWQgS0FTQU4gc3BsYXQgaXMgZW1pdHRlZCBieSBzZWFyY2hpbmcgZm9yIHRoZQo+PiBjb3JyZXNw
b25kaW5nIGZpcnN0IGxpbmVzIGluIHRoZSByZXBvcnQuCj4+Cj4+IFRoaXMgdmVyc2lvbiBpbXBs
ZW1lbnRzIHR3byBmYXVsdHkgcHJvZ3JhbXMgdHJpZ2dlcmluZyBlaXRoZXIgYQo+PiB1c2VyLWFm
dGVyLWZyZWUsIG9yIGFuIG91dC1vZi1ib3VuZHMgbWVtb3J5IHVzYWdlLiBUaGUgYnVncyBhcmUK
Pj4gdHJpZ2dlcmVkIHRoYW5rcyB0byBzb21lIGRlZGljYXRlZCBrZnVuY3MgaW4gYnBmX3Rlc3Rt
b2QuYywgYnV0IHR3bwo+PiBkaWZmZXJlbnQgdGVjaG5pcXVlcyBhcmUgdXNlZCwgYXMgc29tZSBj
YXNlcyBjYW4gYmUgcXVpdGUgaGFyZCB0bwo+PiB0cmlnZ2VyIGluIGEgcHVyZSAiYmxhY2sgYm94
IiBhcHByb2FjaDoKPj4gLSBmb3IgcmVhZHMsIHdlIGNhbiBtYWtlIHRoZSB1c2VkIGtmdW5jcyBy
ZXR1cm4gc29tZSBmYXVsdHkgcG9pbnRlcnMKPj4gICB0aGF0IGVicGYgcHJvZ3JhbXMgd2lsbCBt
YW5pcHVsYXRlLCB0aGV5IHdpbGwgZ2VuZXJhdGUgbGVnaXRpbWF0ZQo+PiAgIGthc2FuIHJlcG9y
dHMgYXMgYSBjb25zZXF1ZW5jZQo+PiAtIGFwcGx5aW5nIHRoZSBzYW1lIHRyaWNrIGZvciBmYXVs
dHkgd3JpdGVzIGlzIGhhcmRlciwgYXMgZWJwZiBwcm9ncmFtcwo+PiAgIGNhbid0IHdyaXRlIGtl
cm5lbCBkYXRhIGZyZWVseS4gU28gZWJwZiBwcm9ncmFtcyBjYW4gY2FsbCBhbm90aGVyCj4+ICAg
c3BlY2lmaWMgdGVzdGluZyBrZnVuYyB0aGF0IHdpbGwgYWx0ZXIgdGhlIHNoYWRvdyBtZW1vcnkg
bWF0Y2hpbmcgdGhlCj4+ICAgcGFzc2VkIG1lbW9yeSAoZWc6IGEgbWFwKS4gV2hlbiB0aGUgcHJv
Z3JhbSB3aWxsIHRyeSB0byB3cml0ZSB0byB0aGUKPj4gICBjb3JyZXNwb25kaW5nIG1lbW9yeSwg
aXQgd2lsbCB0cmlnZ2VyIGEgcmVwb3J0IGFzIHdlbGwuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFs
ZXhpcyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5j
b20+Cj4+IC0tLQo+PiBUaGUgd2F5IG9mIGJyaW5naW5nIGthc2FuX3BvaXNvbiBpbnRvIGJwZl90
ZXN0bW9kIGlzIGRlZmluaXRlbHkgbm90Cj4+IGlkZWFsLiAgQnV0IEkgd291bGQgbGlrZSB0byB2
YWxpZGF0ZSB0aGUgdGVzdGluZyBhcHByb2FjaCAodHJpZ2dlcmluZwo+PiByZWFsIGZhdWx0eSBh
Y2Nlc3Nlcywgd2hpY2ggaXMgaGFyZCBvbiBzb21lIGNhc2VzLCBWUyBtYW51YWxseSBwb2lzb25p
bmcKPj4gQlBGLW1hbmlwdWxhdGVkIG1lbW9yeSkgYmVmb3JlIGV2ZW50dWFsbHkgbWFraW5nIGNs
ZWFuIGJyaWRnZXMgYmV0d2Vlbgo+PiBLQVNBTiBBUElzIGFuZCBicGZfdGVzdG1vZC5jLCBpZiB0
aGUgbGF0dGVyIGFwcHJvYWNoIGlzIHRoZSB2YWxpZCBvbmUuCj4KPiBXb3VsZCBpdCBtYWtlIHNl
bnNlIHRvIHB1dCB0aGVzZSB0ZXN0cyBpbnRvIEtBU0FOIEtVbml0IHRlc3RzIGluCj4gbW0va2Fz
YW4va2FzYW5fdGVzdF9jLmM/IEkgYXNzdW1lIHRoZXJlIGlzIGEga2VybmVsIEFQSSB0byBKSVQg
QlBGCj4gcHJvZ3JhbXMgZnJvbSB0aGUga2VybmVsIGl0c2VsZj8KClBvc3NpYmx5IGluZGVlZCwg
YnV0IEkgdGhpbmsgb25lIGltcG9ydGFudCB1c2UgY2FzZSB3aWxsIGJlIHRoZQpwb3NzaWJpbGl0
eSB0byBydW4gdGhvc2UgdGVzdHMgaW4gQlBGIENJIChbMV0pLCBhbmQgdGhpcyBkZXBlbmRzIG9u
CnRob3NlIHRlc3RzIGJlaW5nIGludGVncmF0ZWQgaW4gdGhlIHRlc3RfcHJvZ3MgZnJhbWV3b3Jr
Cih0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYpCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL2tl
cm5lbC1wYXRjaGVzL2JwZi9wdWxscwoKPiBUaGVyZSwgeW91IGNhbiBqdXN0IGNhbGwga2FzYW5f
cG9pc29uKCksIHNvbWUgdGVzdHMgYWxyZWFkeSBkbyB0aGlzLgo+IEFuZCB5b3UgY2FuIGFsc28g
ZXh0ZW5kIHRoZSBLQVNBTiBLVW5pdCB0ZXN0IGZyYW1ld29yayB0byBmaW5kIG91dAo+IHdoZXRo
ZXIgdGhlIGJhZCBhY2Nlc3MgaXMgYSByZWFkIG9yIHdyaXRlLCBpZiB5b3Ugd2FudCB0byBjaGVj
ayB0aGlzLgoKQWxleGlzCi0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGlu
dXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
