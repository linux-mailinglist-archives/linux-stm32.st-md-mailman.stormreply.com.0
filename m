Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGF8I7WG72kBCQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:29 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99766475A87
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E3E8C7A838;
	Mon, 27 Apr 2026 15:54:28 +0000 (UTC)
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com
 [95.215.58.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60CF7C08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2026 23:31:48 +0000 (UTC)
Message-ID: <d8fccecd-5418-46ff-8e9f-065d1dee6d98@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1777073506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zyUuyE7w6pvvtI2U755rVQDGqOG1TjZmAAoWkbcJ3pw=;
 b=FWyOdMQChNJACKlHSUigRbF+UkaZINGXAnfgG0l27LLGRf/hYjHu/Lxkyy0R7Svov/3cgV
 ca7lKrp+oJsiAffpgj9aIdrEaU8SwwAp8RbrsigFrfnx1EjvABSU63IFjcjHzxaGMsifyR
 FfCrsxV2p8KUbJc33PxkbcHVFDmYG7c=
Date: Fri, 24 Apr 2026 16:31:29 -0700
MIME-Version: 1.0
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Andrey Konovalov <andreyknvl@gmail.com>
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
 <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com>
 <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
 <CA+fCnZd31GzdpEqR8VhfK4JtUKyyRMgbBoAbeGACJgm7WvB6Vw@mail.gmail.com>
 <CAADnVQKv5y+gq=TnOAEXSqgBRpmHNjwqCfxpLaw5XkcbQ+23bg@mail.gmail.com>
 <CA+fCnZe-b0Qqbo5gGv3HN20twquQETDfYYkE1r9tPr9zUFbW9Q@mail.gmail.com>
 <CAADnVQKuptG_opA12O=Xb9_+cHf3f=ycAZdfUp17P2HBYQzdsg@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <CAADnVQKuptG_opA12O=Xb9_+cHf3f=ycAZdfUp17P2HBYQzdsg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
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
X-Rspamd-Queue-Id: 99766475A87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[64];
	R_DKIM_REJECT(1.00)[linux.dev:s=key1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.dev : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexei.starovoitov@gmail.com,m:andreyknvl@gmail.com,m:thomas.petazzoni@bootlin.com,m:dave.hansen@linux.intel.com,m:song@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:yonghong.song@linux.dev,m:hpa@zytor.com,m:vincenzo.frascino@arm.com,m:shuah@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:xukuohai@huawei.com,m:daniel@iogearbox.net,m:x86@kernel.org,m:john.fastabend@gmail.com,m:andrii@kernel.org,m:kasan-dev@googlegroups.com,m:mingo@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:bastien.curutchet@bootlin.com,m:mcoquelin.stm32@gmail.com,m:ebpf@linuxfoundation.org,m:ast@kernel.org,m:bp@alien8.de,m:alexis.lothore@bootlin.com,m:bpf@vger.kernel.org,m:dvyukov@google.com,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:netdev@vger.kernel.org,m:dsahern@kernel.org,m:linux-kernel@vger.kernel.org,m:eddyz87@gmail.com,m:tglx@kernel.org,m:jolsa@kernel.org,m:akpm@linux-foundation.org,m:martin.lau@linux.dev,m:davem@davemloft.net,m:memxor@gmail
 .com,m:alexeistarovoitov@gmail.com,m:ryabininaa@gmail.com,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[ihor.solodrai@linux.dev,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[40];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ihor.solodrai@linux.dev,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[bootlin.com,linux.intel.com,kernel.org,gmail.com,google.com,linux.dev,zytor.com,arm.com,st-md-mailman.stormreply.com,huawei.com,iogearbox.net,googlegroups.com,redhat.com,lists.infradead.org,linuxfoundation.org,alien8.de,vger.kernel.org,kvack.org,linux-foundation.org,davemloft.net];
	NEURAL_HAM(-0.00)[-0.385];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,qemu-project.gitlab.io:url]

T24gNC8xOS8yNiAzOjUxIFBNLCBBbGV4ZWkgU3Rhcm92b2l0b3Ygd3JvdGU6Cj4gT24gU3VuLCBB
cHIgMTksIDIwMjYgYXQgMjo0OeKAr1BNIEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ21h
aWwuY29tPiB3cm90ZToKPj4KPj4gT24gVHVlLCBBcHIgMTQsIDIwMjYgYXQgNTo1OOKAr1BNIEFs
ZXhlaSBTdGFyb3ZvaXRvdgo+PiA8YWxleGVpLnN0YXJvdm9pdG92QGdtYWlsLmNvbT4gd3JvdGU6
Cj4+Pgo+Pj4gSSB0aGluayB3ZSdyZSB0YWxraW5nIHBhc3QgZWFjaCBvdGhlci4KPj4+IFdlJ3Jl
IG5vdCBpbnRlcmVzdGVkIGluIEtBU0FOX1NXX1RBR1Mgb3IgS0FTQU5fSFdfVEFHUy4KPj4+IFdl
J3JlIG5vdCBnb2luZyB0byBtb2RpZnkgYXJtNjQgSklUIGF0IGFsbC4KPj4+Cj4+PiBUaGlzIGlz
IHB1cmVseSBLQVNBTl9HRU5SSUMgYW5kIG9ubHkgb24geDg2LTY0Lgo+Pj4gSklUIHdpbGwgZW1p
dCBleGFjdGx5IHdoYXQgY29tcGlsZXJzIGVtaXQgZm9yIGdlbmVyaWMKPj4+IHdoaWNoIGlzIF9f
YXNhbl9sb2FkL3N0b3JlLiBUaGlzIGlzIGFzIHN0YWJsZSBBQkkgYXMgaXQgY2FuIGdldAo+Pj4g
YW5kIHdlIGRvbid0IHdhbnQgdG8gZGV2aWF0ZSBmcm9tIGl0Lgo+Pgo+PiBPSywgSSBzdXBwb3Nl
ZCB0aGF0J3MgZmFpci4gWW91IGRpZCB0aHJvdyBtZSBvZmYgcG9pbnQgd2l0aCB5b3VyCj4+IHBl
cmZvcm1hbmNlIGNvbW1lbnQuIEJ1dCBpZiB5b3UgZGVjaWRlIHRvIGFkZCBTV19UQUdTIHN1cHBv
cnQgYXQgc29tZQo+PiBwb2ludCwgSSB0aGluayB0aGlzIGRpc2N1c3Npb24gbmVlZHMgdG8gYmUg
cmV2aXNpdGVkLgo+Pgo+PiBCdXQgcGxlYXNlIGFkZCBhIGNvbW1lbnQgc2F5aW5nIHRoYXQgdGhv
c2UgZnVuY3Rpb25zIGFyZSBvbmx5IGV4cG9zZWQKPj4gZm9yIEJQRiBKSVQgYW5kIHRoZXkgYXJl
IG5vdCBzdXBwb3NlZCB0byBiZSB1c2VkIGJ5IG90aGVyIHBhcnRzIG9mIHRoZQo+PiBrZXJuZWwu
IEFuZCBpbiBjYXNlIHlvdSBkbyBlbmQgdXAgYWRkaW5nIGEgbmV3IGNvbmZpZyBvcHRpb24sIGd1
YXJkCj4+IHRoZSBwdWJsaWMgZGVjbGFyYXRpb25zIGJ5IGEgY29ycmVzcG9uZGluZyBpZmRlZi4K
PiAKPiBJIGZlZWwgY29uY2VybnMgb2YgbWlzdXNlIGFyZSBvdmVyYmxvd24uCj4gQmVpbmcgaW4g
aW5jbHVkZS9saW51eC9rYXNhbi5oIGRvZXNuJ3QgbWFrZSB0aGVtIGZyZWUtZm9yLWFsbAo+IGFs
bCBvZiBhIHN1ZGRlbiwgYnV0IGlmIHlvdSBwcmVmZXIgd2UgY2FuIGp1c3QgY29weSBwYXN0ZToK
PiArdm9pZCBfX2FzYW5fbG9hZDEodm9pZCAqcCk7Cj4gK3ZvaWQgX19hc2FuX3N0b3JlMSh2b2lk
ICpwKTsKPiBpbnRvIGJwZl9qaXRfY29tcC5jCj4gCj4+PiBUaGUgZ29hbCBoZXJlIGlzIHRvIGZp
bmQgYnVncyBpbiB0aGUgdmVyaWZpZXIuCj4+PiBJZiBzb21ldGhpbmcgZ290IHBhc3QgaXQsIHRo
YXQgc2hvdWxkbid0IGhhdmUsCj4+PiBrYXNhbiBnZW5lcmljIG9uIHg4Ni02NCBpcyBlbm91Z2gu
Cj4+Cj4+IEZXSVcsIEkgc3VzcGVjdCBIV19UQUdTIEtBU0FOIGFscmVhZHkganVzdCB3b3JrcyB3
aXRoIEpJVGVkIEJQRiBjb2RlLgo+IAo+IE9oaC4gR29vZCBwb2ludC4gTG9va3MgbGlrZSBtb2Rl
cm4gYXJtNjQgY3B1cyBpbiBwdWJsaWMgY2xvdWRzCj4gZG9uJ3QgaGF2ZSB0aGF0IGVuYWJsZWQs
IHNvIG9uZSB3b3VsZCBuZWVkIHBpeGVsIHBob25lIHRvCj4gY2F0Y2ggdmVyaWZpZXIgYnVncyB2
aWEgaHdfdGFncy4KClRoaXMgY29tbWVudCBnb3QgbWUgY3VyaW91cywgYW5kIGFjY2trdHVhbGx5
IGlmIHdlICpyZWFsbHkqIHdhbnQgdG8sCndlIGNhbiBnZXQgc29tZSBLQVNBTl9IV19UQUdTIHRl
c3RpbmcgZm9yIEJQRiBhbHJlYWR5LgoKVGhlIGZpcnN0IG9wdGlvbiBpcyBlbXVsYXRpb24sIHNp
bmNlIFFFTVUgc3VwcG9ydHMgTVRFIFsxXSwgZS5nLjoKCiAgICBxZW11LXN5c3RlbS1hYXJjaDY0
IC1tYWNoaW5lIHZpcnQsbXRlPW9uIC4uLgoKVGhpcyBpcyBvZiBjb3Vyc2Ugc2xvdywgYmVjYXVz
ZSBpdCBydW5zIGluIHNvZnR3YXJlLCBzbyBpdCdzCmluZmVhc2libGUgdG8gcnVuIHRoaXMgZm9y
IGV2ZXJ5IHNpZ25sZSBwYXRjaCBvbiBCUEYgQ0kuIEJ1dCB3ZSBjb3VsZApydW4gaXQgb24gc2No
ZWR1bGUgb24gdGhlIGJhc2UgYnJhbmNoZXMgb3Igc210aCBsaWtlIHRoYXQuCgpbMV0gaHR0cHM6
Ly9xZW11LXByb2plY3QuZ2l0bGFiLmlvL3FlbXUvc3lzdGVtL2FybS92aXJ0Lmh0bWwKClRoZSBz
ZWNvbmQgb3B0aW9uIGlzIHNldCB1cCBhbiBBbXBlcmVPbmUgbWFjaGluZSBvbiBPcmFjbGUgQ2xv
dWQKKGFzc3VtaW5nIHRoZXkgYXJlIGF2YWlsYWJsZSwgaGF2ZW4ndCBjaGVja2VkKSwgYmVjYXVz
ZSBhcHBhcmVudGx5IFsyXQp0aG9zZSBDUFVzIHJ1biB3aXRoIE1URS4KCkl0J3MgYSBidW5jaCBv
ZiBpbmZyYSB3b3JrIGFuZCBzcGVuZGluZywgYnV0IGl0IGlzIGRvYWJsZSBpZiBpdCB3YXMKYSBw
cmlvcml0eS4KClsyXSBodHRwczovL2FyeGl2Lm9yZy9hYnMvMjUxMS4xNzc3MwoKCj4gU28gd2Ug
c3RpbGwgbmVlZCB0aGlzIHg4Ni1zcGVjaWZpYyBqaXQga2FzYW4uCj4gSSBndWVzcyBldmVudHVh
bGx5IGl0IGNhbiBiZSByZW1vdmVkIHdoZW4gaHdfdGFncyBzdXBwb3J0IGlzIHdpZGVzcHJlYWQu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
