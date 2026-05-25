Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBTrDeIQFGpeJQcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 11:05:38 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B725C8527
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 11:05:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F7B4C597BF;
	Mon, 25 May 2026 09:05:37 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B21F0C1A979
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 09:05:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A099E4E42D57;
 Mon, 25 May 2026 09:05:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 54B44603DC;
 Mon, 25 May 2026 09:05:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B71FC10812103; 
 Mon, 25 May 2026 11:05:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1779699932; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EbTl273WowpTVFd0f4oge0/+s8K6R22iN2Gqank6L1c=;
 b=Fx+Uvlj9hDV8t2hT+BbSnAxNsdOpOaJIechqvnvpMOkSitZzXRjbsdPmMEWqyKUFfSsFqJ
 09p3+5rjCc8SD5giFz2CNAPnkmaK402kZ1+6NUodo6410UYt45sJg+eUEcarYV6jiVsG7K
 3r7plioTNGCAIgXGCNJ+2+ZTHyduDJ07uQslX/NevZyhzexSjWxmYTd3uD3CWiJVY0Dx6L
 1Io8kWVF0On9LOxU2++gFB1HzzqUg55GF2+VuffbtA126LB+ZWF26BfdlTvZICqiAoOO3B
 zd+yqqxctwthai14JAAAUMFcgFwq3eBOVqm4oxh90R+vs0N3KX+iOH5nwmbVzw==
Date: Mon, 25 May 2026 11:05:16 +0200
Message-Id: <DIRMYUXFYOVY.1LQV9E3OHGGBK@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Emil Tsalapatis" <emil@etsalapatis.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, "Alexei
 Starovoitov" <alexei.starovoitov@gmail.com>
Mime-Version: 1.0
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-3-1a5831230821@bootlin.com>
 <CA+fCnZf-o8tiv_tX9YB5eBUGx17OpztKZsEB6Awjw3WAqBAiUw@mail.gmail.com>
 <DHSWSSYRPUVC.2W3G3OU27L3HG@bootlin.com>
 <CAADnVQLj=UosnsC-4V2+mN92Fe0-kW++U+m-O9c93kk6BwiXgw@mail.gmail.com>
 <DIP9O3BEWG3C.2BAHKYUIA4H4E@bootlin.com>
 <DIPDH3PCUDDG.EGYL0SYSG1IO@etsalapatis.com>
In-Reply-To: <DIPDH3PCUDDG.EGYL0SYSG1IO@etsalapatis.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Song Liu <song@kernel.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, "H. Peter Anvin" <hpa@zytor.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan <shuah@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Xu Kuohai <xukuohai@huawei.com>,
 Daniel Borkmann <daniel@iogearbox.net>, X86 ML <x86@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii
 Nakryiko <andrii@kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, Ingo
 Molnar <mingo@redhat.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, ebpf@linuxfoundation.org,
 Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf <bpf@vger.kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 "open list:KERNEL SELFTEST
 FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 Network Development <netdev@vger.kernel.org>, David
 Ahern <dsahern@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
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
X-Spamd-Result: default: False [5.89 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	MV_CASE(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:emil@etsalapatis.com,m:alexis.lothore@bootlin.com,m:alexei.starovoitov@gmail.com,m:thomas.petazzoni@bootlin.com,m:dave.hansen@linux.intel.com,m:song@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:yonghong.song@linux.dev,m:hpa@zytor.com,m:vincenzo.frascino@arm.com,m:shuah@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:xukuohai@huawei.com,m:daniel@iogearbox.net,m:x86@kernel.org,m:john.fastabend@gmail.com,m:andrii@kernel.org,m:kasan-dev@googlegroups.com,m:mingo@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:bastien.curutchet@bootlin.com,m:mcoquelin.stm32@gmail.com,m:ebpf@linuxfoundation.org,m:ast@kernel.org,m:bp@alien8.de,m:memxor@gmail.com,m:bpf@vger.kernel.org,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:netdev@vger.kernel.org,m:dsahern@kernel.org,m:linux-kernel@vger.kernel.org,m:eddyz87@gmail.com,m:tglx@kernel.org,m:jolsa@kernel.org,m:akpm@linux-foundation.org,m:martin.lau@linu
 x.dev,m:davem@davemloft.net,m:alexeistarovoitov@gmail.com,m:ryabininaa@gmail.com,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[etsalapatis.com,bootlin.com,gmail.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:-];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[bootlin.com,linux.intel.com,kernel.org,gmail.com,google.com,linux.dev,zytor.com,arm.com,st-md-mailman.stormreply.com,huawei.com,iogearbox.net,googlegroups.com,redhat.com,lists.infradead.org,linuxfoundation.org,alien8.de,vger.kernel.org,kvack.org,linux-foundation.org,davemloft.net];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: C1B725C8527
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gRnJpIE1heSAyMiwgMjAyNiBhdCA3OjEzIFBNIENFU1QsIEVtaWwgVHNhbGFwYXRpcyB3cm90
ZToKPiBPbiBGcmkgTWF5IDIyLCAyMDI2IGF0IDEwOjE0IEFNIEVEVCwgQWxleGlzIExvdGhvcsOp
IHdyb3RlOgo+PiBPbiBUdWUgQXByIDE0LCAyMDI2IGF0IDQ6MzggUE0gQ0VTVCwgQWxleGVpIFN0
YXJvdm9pdG92IHdyb3RlOgo+Pj4gT24gVHVlLCBBcHIgMTQsIDIwMjYgYXQgNjoyNOKAr0FNIEFs
ZXhpcyBMb3Rob3LDqQo+Pj4gPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKPj4+
Pgo+Pj4+IE9uIFR1ZSBBcHIgMTQsIDIwMjYgYXQgMTI6MjAgQU0gQ0VTVCwgQW5kcmV5IEtvbm92
YWxvdiB3cm90ZToKPj4+PiA+IE9uIE1vbiwgQXByIDEzLCAyMDI2IGF0IDg6MjnigK9QTSBBbGV4
aXMgTG90aG9yw6kgKGVCUEYgRm91bmRhdGlvbikKPj4+PiA+IDxhbGV4aXMubG90aG9yZUBib290
bGluLmNvbT4gd3JvdGU6Cj4+Cj4+IFsuLi5dCj4+Cj4+Pj4gPj4gK2NvbmZpZyBCUEZfSklUX0tB
U0FOCj4+Pj4gPj4gKyAgICAgICBib29sCj4+Pj4gPj4gKyAgICAgICBkZXBlbmRzIG9uIEhBVkVf
RUJQRl9KSVRfS0FTQU4KPj4+PiA+PiArICAgICAgIGRlZmF1bHQgeSBpZiBCUEZfSklUICYmIEtB
U0FOX0dFTkVSSUMKPj4+PiA+Cj4+Pj4gPiBTaG91bGQgdGhpcyBiZSAiZGVwZW5kcyBvbiBLQVNB
TiAmJiBLQVNBTl9HRU5FUklDIj8KPj4+Pgo+Pj4+IE1lYW5pbmcsIG1ha2luZyBpdCBhbiBleHBs
aWNpdCB1c2VyLXNlbGVjdGFibGUgb3B0aW9uID8KPj4+Pgo+Pj4+IElmIHNvLCB0aGUgY3VycmVu
dCBkZXNpZ24gY2hvaWNlIGlzIHZvbHVudGFyeSBhbmQgYmFzZWQgb24gdGhlIGZlZWRiYWNrCj4+
Pj4gcmVjZWl2ZWQgb24gdGhlIG9yaWdpbmFsIFJGQywgd2hlcmUgSSBoYXZlIGJlZW4gc3VnZ2Vz
dGVkIHRvCj4+Pj4gYXV0b21hdGljYWxseSBlbmFibGUgdGhlIEtBU0FOIGluc3RydW1lbnRhdGlv
biBpbiBCUEYgcHJvZ3JhbXMgaWYgS0FTQU4KPj4+PiBzdXBwb3J0IGlzIGVuYWJsZWQgaW4gdGhl
IGtlcm5lbCAoWzFdKS4gQnV0IGlmIGEgdXNlci1zZWxlY3RhYmxlIHRvZ2dsZQo+Pj4+IGlzIGV2
ZW50dWFsbHkgYSBiZXR0ZXIgc29sdXRpb24sIEknbSBmaW5lIHdpdGggY2hhbmdpbmcgaXQuCj4+
Pgo+Pj4gTGV0J3Mgbm90IGFkZCBtb3JlIGNvbmZpZyBrbm9icy4KPj4+IEV2ZW4gdGhpcyBwYXRj
aCBsb29rcyByZWR1bmRhbnQuCj4+PiBJbnNpZGUgSklUIGRvIGluc3RydW1lbnRhdGlvbiB3aGVu
IEtBU0FOX0dFTkVSSUMgaXMgc2V0Lgo+Pgo+PiAod2l0aCBxdWl0ZSBzb21lIGRlbGF5KSBJIHRo
aW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBrZWVwIHRoaXMgbmV3Cj4+IEJQRl9KSVRfS0FTQU4s
IGJlY2F1c2UgYXNpZGUgZnJvbSB0aGUgcG9zc2liaWxpdHkgdG8gdXNlIGl0IGluCj4+IGJwZl9q
aXRfY29tcC5jLCBpdCBhbGxvd3MgdG8gdXBkYXRlIHRlc3RzIGFmZmVjdGVkIGJ5IEtBU0FOCj4+
IGluc3RydW1lbnRhdGlvbiBpbiBhIG5pY2VyIHdheS4gRm9yIGV4YW1wbGUsIHRoZSB0ZXN0X2xv
YWRlciBzdWJ0ZXN0cwo+PiB0aGF0IG1vbml0b3IgSklUdGVkIGluc3RydWN0aW9ucyBhcmUgY29u
ZnVzZWQgYnkgS0FTQU4uIEkgY2FuIGVpdGhlcgo+PiBza2lwIHRoZW0gb3IgbWFrZSB0aGVtIHNt
YXJ0ZXIgd2hlbiBLQVNBTiBpcyBlbmFibGVkIGZvciBCUEYsIGJ1dCBpbgo+PiBib3RoIGNhc2Vz
LCBpdCB3b3VsZCBiZSBuaWNlciB0byBqdXN0IGFkYXB0IHRoZSBiZWhhdmlvciBiYXNlZCBvbiBh
Cj4+IGdlbmVyaWMgQ09ORklHX0JQRl9KSVRfS0FTQU4sIHJhdGhlciB0aGFuIHNwcmlua2xpbmcg
c29tZSAiaWYKPj4gaml0X2VuYWJsZWQgQU5EIENPTkZJR19LQVNBTl9HRU5FUklDIEFORCBBUkNI
X1g4NiIgaW4gc2VsZnRlc3RzLiBUaGF0Cj4+IHN0aWxsIGRvZXMgbm90IG1ha2UgaXQgYSBjb25m
aWcga25vYiwgdGhhdCBqdXN0IGNyZWF0ZXMgYW4gaW50ZXJuYWwKPj4gS2NvbmZpZyBvcHRpb24g
dGhhdCBpcyBhdXRvbWF0aWNhbGx5IHR1cm5lZCBvbiB3aGVuIEtBU0FOIGFuZCBKSVQgYXJlCj4+
IGVuYWJsZWQgYXQgYnVpbGQgdGltZS4KPgo+IEhhdmluZyBhIHRvZ2dsYWJsZSBjb25maWcga25v
YiBnaXZlcyB1cyB0aGUgb3B0aW9uIHRvIHNldCB1cCBLQVNBTiBmb3IKPiB0aGUga2VybmVsIGJ1
dCBub3QgZm9yIEJQRiwgYW5kIEkgZG9uJ3Qgc2VlIHdoeSB3ZSdkIHdhbnQgdGhhdC4gSW1vIHdl
IGFyZQo+IGFscmVhZHkgcGF5aW5nIHRoZSBjb3N0IG9mIEtBU0FOIGZvciB0aGUgcmVzdCBvZiB0
aGUga2VybmVsLCB0aGVyZSBpcyBubwo+IGluY2VudGl2ZSB0byBub3QgcnVuIGl0IGZvciB0aGUg
QlBGIEpJVC4gSGF2aW5nIHRvIGVhdCB0aGUgY29tcGxleGl0eSBjb3N0Cj4gaW4gdGhlIHNlbGZ0
ZXN0cyBzZWVtcyByZWFzb25hYmxlIGlmIHRoZSBhbHRlcm5hdGl2ZSBtZWFucyBhIGNsZWFuZXIK
PiBpbnRlcmZhY2UgZm9yIHRoZSB1c2VyIChwcmV2ZW50aW5nIHRoZW0gZnJvbSBjaG9vc2luZyBh
biB1bnJlYXNvbmFibGUKPiBjb21iaW5hdGlvbiBvZiBvcHRpb25zKS4KCkFnYWluLCB0aGlzIGRv
ZXMgbm90IGV4cG9zZSBhIHRvZ2dsYWJsZSBrbm9iLCB0aGlzIGlzIGEgcHVyZWx5IGludGVybmFs
Cmtjb25maWcsIGF1dG9tYXRpY2FsbHkgZW5hYmxlZCBpZiBDT05GSUdfS0FTQU5fR0VORVJJQyBp
cyBzZXQgYW5kIGlmIHRoZQphcmNoaXRlY3R1cmUtc3BlY2lmaWMgS2NvbmZpZyBkZWZpbmVzIEhB
VkVfRUJQRl9KSVRfS0FTQU4gKHNpbmNlIHdlIHdhbnQKaXQgZm9yIHg4NiBvbmx5KSwgYW5kIHRo
ZXJlIHdvdWxkIGJlIG5vIHdheSB0byBlbmFibGUgS0FTQU4gZm9yIGtlcm5lbApvbmx5IGFuZCBu
b3QgZm9yIEJQRiwgb3IgdGhlIG90aGVyIHdheSBhcm91bmQuIFdoYXQgSSBhbSBwcm9wb3Npbmcg
aXMKanVzdCBhbiBpbnRlcm5hbCwgYXJjaGl0ZWN0dXJlLWFnbm9zdGljZSBrY29uZmlnIHRvIGF2
b2lkIGNvbmRpdGlvbmluZwpzb21lIHNlbGZ0ZXN0cyB0byBhbnkgYXJjaGl0ZWN0dXJlLiAKCkFs
ZXhpcwoKLS0gCkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2Vy
bmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
