Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ4xGApA3mlvpwkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Apr 2026 15:24:26 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9E33FA709
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Apr 2026 15:24:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80AD2C8F292;
	Tue, 14 Apr 2026 13:24:25 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37685C8F286
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2026 13:24:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 49A624E429A0;
 Tue, 14 Apr 2026 13:24:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 15A6960410;
 Tue, 14 Apr 2026 13:24:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 91474104500A2; 
 Tue, 14 Apr 2026 15:24:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1776173062; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=cMPO/P6ZptnY7PwA9Kq6DHiKsIFPvqoz4r+zqZlAlBc=;
 b=X6A4tqU3MkoqM6hdV2BYcurk14+6JZDEN/gbqla0kWX1zkUOVhzepr1g+eqrPNbNUv/huV
 YvRVcaXQMDSoKNvHHEev5avgGrcMFEKbpEaqiYiDYgm7Bt3jlvoqJQ5ERrTOmbM6hkpZ4c
 lSZlrap8zNk/UzuRZwSWbVolH6CoRl3/X0CCVwBfc1YF32vGuKDzOTtnFMST1koqfhy2JQ
 FHgxzpJuT7y8RT0NzKx5KsKEo6MlgAJgguOw61CCS91aw38/mmn96yQctauQKN1Mw/26EC
 Mku30aEpcpuqoVCUdGMmoRzHpFjahdvvfYrXfOquex2Iaj6Ff2PksIHe5lfBCw==
Mime-Version: 1.0
Date: Tue, 14 Apr 2026 15:24:14 +0200
Message-Id: <DHSWSSYRPUVC.2W3G3OU27L3HG@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Andrey Konovalov" <andreyknvl@gmail.com>,
 =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-3-1a5831230821@bootlin.com>
 <CA+fCnZf-o8tiv_tX9YB5eBUGx17OpztKZsEB6Awjw3WAqBAiUw@mail.gmail.com>
In-Reply-To: <CA+fCnZf-o8tiv_tX9YB5eBUGx17OpztKZsEB6Awjw3WAqBAiUw@mail.gmail.com>
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
	NEURAL_SPAM(0.00)[0.373];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:mid,bootlin.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: EC9E33FA709
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlIEFwciAxNCwgMjAyNiBhdCAxMjoyMCBBTSBDRVNULCBBbmRyZXkgS29ub3ZhbG92IHdy
b3RlOgo+IE9uIE1vbiwgQXByIDEzLCAyMDI2IGF0IDg6MjnigK9QTSBBbGV4aXMgTG90aG9yw6kg
KGVCUEYgRm91bmRhdGlvbikKPiA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgo+
Pgo+PiBBZGQgYSBuZXcgS2NvbmZpZyBvcHRpb24gQ09ORklHX0JQRl9KSVRfS0FTQU4gdGhhdCBh
dXRvbWF0aWNhbGx5IGVuYWJsZXMKPj4gS0FTQU4gKEtlcm5lbCBBZGRyZXNzIFNhbml0aXplcikg
bWVtb3J5IGFjY2VzcyBjaGVja3MgZm9yIEpJVC1jb21waWxlZAo+PiBCUEYgcHJvZ3JhbXMsIHdo
ZW4gYm90aCBLQVNBTiBhbmQgSklUIGNvbXBpbGVyIGFyZSBlbmFibGVkLiBXaGVuCj4+IGVuYWJs
ZWQsIHRoZSBKSVQgY29tcGlsZXIgd2lsbCBlbWl0IHNoYWRvdyBtZW1vcnkgY2hlY2tzIGJlZm9y
ZSBtZW1vcnkKPj4gbG9hZHMgYW5kIHN0b3JlcyB0byBkZXRlY3QgdXNlLWFmdGVyLWZyZWUsIG91
dC1vZi1ib3VuZHMsIGFuZCBvdGhlcgo+PiBtZW1vcnkgc2FmZXR5IGJ1Z3MgYXQgcnVudGltZS4g
VGhlIG9wdGlvbiBpcyBnYXRlZCBiZWhpbmQKPj4gSEFWRV9FQlBGX0pJVF9LQVNBTiwgYXMgaXQg
bmVlZHMgcHJvcGVyIGFyY2gtc3BlY2lmaWMgaW1wbGVtZW50YXRpb24uCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKSA8YWxleGlzLmxvdGhvcmVA
Ym9vdGxpbi5jb20+Cj4+IC0tLQo+PiAga2VybmVsL2JwZi9LY29uZmlnIHwgOSArKysrKysrKysK
Pj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2tl
cm5lbC9icGYvS2NvbmZpZyBiL2tlcm5lbC9icGYvS2NvbmZpZwo+PiBpbmRleCBlYjNkZTM1NzM0
ZjAuLjI4MzkyYWRiM2Q3ZSAxMDA2NDQKPj4gLS0tIGEva2VybmVsL2JwZi9LY29uZmlnCj4+ICsr
KyBiL2tlcm5lbC9icGYvS2NvbmZpZwo+PiBAQCAtMTcsNiArMTcsMTAgQEAgY29uZmlnIEhBVkVf
Q0JQRl9KSVQKPj4gIGNvbmZpZyBIQVZFX0VCUEZfSklUCj4+ICAgICAgICAgYm9vbAo+Pgo+PiAr
IyBLQVNBTiBzdXBwb3J0IGZvciBKSVQgY29tcGlsZXIKPj4gK2NvbmZpZyBIQVZFX0VCUEZfSklU
X0tBU0FOCj4+ICsgICAgICAgYm9vbAo+PiArCj4+ICAjIFVzZWQgYnkgYXJjaHMgdG8gdGVsbCB0
aGF0IHRoZXkgd2FudCB0aGUgQlBGIEpJVCBjb21waWxlciBlbmFibGVkIGJ5Cj4+ICAjIGRlZmF1
bHQgZm9yIGtlcm5lbHMgdGhhdCB3ZXJlIGNvbXBpbGVkIHdpdGggQlBGIEpJVCBzdXBwb3J0Lgo+
PiAgY29uZmlnIEFSQ0hfV0FOVF9ERUZBVUxUX0JQRl9KSVQKPj4gQEAgLTEwMSw0ICsxMDUsOSBA
QCBjb25maWcgQlBGX0xTTQo+Pgo+PiAgICAgICAgICAgSWYgeW91IGFyZSB1bnN1cmUgaG93IHRv
IGFuc3dlciB0aGlzIHF1ZXN0aW9uLCBhbnN3ZXIgTi4KPj4KPj4gK2NvbmZpZyBCUEZfSklUX0tB
U0FOCj4+ICsgICAgICAgYm9vbAo+PiArICAgICAgIGRlcGVuZHMgb24gSEFWRV9FQlBGX0pJVF9L
QVNBTgo+PiArICAgICAgIGRlZmF1bHQgeSBpZiBCUEZfSklUICYmIEtBU0FOX0dFTkVSSUMKPgo+
IFNob3VsZCB0aGlzIGJlICJkZXBlbmRzIG9uIEtBU0FOICYmIEtBU0FOX0dFTkVSSUMiPwoKTWVh
bmluZywgbWFraW5nIGl0IGFuIGV4cGxpY2l0IHVzZXItc2VsZWN0YWJsZSBvcHRpb24gPwoKSWYg
c28sIHRoZSBjdXJyZW50IGRlc2lnbiBjaG9pY2UgaXMgdm9sdW50YXJ5IGFuZCBiYXNlZCBvbiB0
aGUgZmVlZGJhY2sKcmVjZWl2ZWQgb24gdGhlIG9yaWdpbmFsIFJGQywgd2hlcmUgSSBoYXZlIGJl
ZW4gc3VnZ2VzdGVkIHRvCmF1dG9tYXRpY2FsbHkgZW5hYmxlIHRoZSBLQVNBTiBpbnN0cnVtZW50
YXRpb24gaW4gQlBGIHByb2dyYW1zIGlmIEtBU0FOCnN1cHBvcnQgaXMgZW5hYmxlZCBpbiB0aGUg
a2VybmVsIChbMV0pLiBCdXQgaWYgYSB1c2VyLXNlbGVjdGFibGUgdG9nZ2xlCmlzIGV2ZW50dWFs
bHkgYSBiZXR0ZXIgc29sdXRpb24sIEknbSBmaW5lIHdpdGggY2hhbmdpbmcgaXQuCgpbMV0gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmL0NBQURuVlFMWDdSU25PcVF1VTMyQ2dxLWUwTVZxeWVO
cnRDUVNCYmswVzJ4R2tFLVpOd0BtYWlsLmdtYWlsLmNvbS8KCj4KPgo+PiArCj4+ICBlbmRtZW51
ICMgIkJQRiBzdWJzeXN0ZW0iCj4+Cj4+IC0tCj4+IDIuNTMuMAo+PgoKCgoKLS0gCkFsZXhpcyBM
b3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0
dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
