Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM1pCuRkEGrvWwYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2026 16:15:00 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6575B5F65
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2026 16:14:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AA08C8F297;
	Fri, 22 May 2026 14:14:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B25D0C8F296
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2026 14:14:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id AB689C2C65D;
 Fri, 22 May 2026 14:15:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 02B006003C;
 Fri, 22 May 2026 14:14:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5BB6F108114CA; 
 Fri, 22 May 2026 16:14:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1779459294; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=MCr0vkGm9xcy3EIrUUYMtpoAG6We8dBTUowneJJEzqk=;
 b=y5oLDx4MGy2qc7YsUG7iHN1xn8YtdnwJTaS+MweXzZYeTNKztTrSK6FkTS5hegoJZRjtx/
 +KPJ88pozLnoBFId69yh0BFSmYr2Oid0fQhr2rdZXSEViLMGh37HZ3wFYq3sXIwaltcL4H
 Ru8nuWXTFrJ7XB1LT7TKvjf55JQe+Wwr57sEwswqTCVrHvSyCZl6RSGSFe4rzRp/5LcBlt
 U9OC+4uUcAsfHb7a6LexLMZh7y7JlLFFF5SVyh2/PQsumMTUzuN7QBIlOn2LRCblqP/6xx
 dRGN6BEjblEu7ydOpdyrpOiH0emrXZ12KjrfkRuxO1yuH60EFy2zP3F5X5BPHQ==
Mime-Version: 1.0
Date: Fri, 22 May 2026 16:14:38 +0200
Message-Id: <DIP9O3BEWG3C.2BAHKYUIA4H4E@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-3-1a5831230821@bootlin.com>
 <CA+fCnZf-o8tiv_tX9YB5eBUGx17OpztKZsEB6Awjw3WAqBAiUw@mail.gmail.com>
 <DHSWSSYRPUVC.2W3G3OU27L3HG@bootlin.com>
 <CAADnVQLj=UosnsC-4V2+mN92Fe0-kW++U+m-O9c93kk6BwiXgw@mail.gmail.com>
In-Reply-To: <CAADnVQLj=UosnsC-4V2+mN92Fe0-kW++U+m-O9c93kk6BwiXgw@mail.gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexei.starovoitov@gmail.com,m:alexis.lothore@bootlin.com,m:thomas.petazzoni@bootlin.com,m:dave.hansen@linux.intel.com,m:song@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:yonghong.song@linux.dev,m:hpa@zytor.com,m:vincenzo.frascino@arm.com,m:shuah@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:xukuohai@huawei.com,m:daniel@iogearbox.net,m:x86@kernel.org,m:john.fastabend@gmail.com,m:andrii@kernel.org,m:kasan-dev@googlegroups.com,m:mingo@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:bastien.curutchet@bootlin.com,m:mcoquelin.stm32@gmail.com,m:ebpf@linuxfoundation.org,m:ast@kernel.org,m:bp@alien8.de,m:memxor@gmail.com,m:bpf@vger.kernel.org,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:netdev@vger.kernel.org,m:dsahern@kernel.org,m:linux-kernel@vger.kernel.org,m:eddyz87@gmail.com,m:tglx@kernel.org,m:jolsa@kernel.org,m:akpm@linux-foundation.org,m:martin.lau@linux.dev,m:davem@davemloft
 .net,m:alexeistarovoitov@gmail.com,m:ryabininaa@gmail.com,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[40];
	FREEMAIL_TO(0.00)[gmail.com,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[bootlin.com,linux.intel.com,kernel.org,gmail.com,google.com,linux.dev,zytor.com,arm.com,st-md-mailman.stormreply.com,huawei.com,iogearbox.net,googlegroups.com,redhat.com,lists.infradead.org,linuxfoundation.org,alien8.de,vger.kernel.org,kvack.org,linux-foundation.org,davemloft.net];
	NEURAL_SPAM(0.00)[1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,bootlin.com:email,bootlin.com:mid,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: AA6575B5F65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlIEFwciAxNCwgMjAyNiBhdCA0OjM4IFBNIENFU1QsIEFsZXhlaSBTdGFyb3ZvaXRvdiB3
cm90ZToKPiBPbiBUdWUsIEFwciAxNCwgMjAyNiBhdCA2OjI04oCvQU0gQWxleGlzIExvdGhvcsOp
Cj4gPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKPj4KPj4gT24gVHVlIEFwciAx
NCwgMjAyNiBhdCAxMjoyMCBBTSBDRVNULCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+PiA+IE9u
IE1vbiwgQXByIDEzLCAyMDI2IGF0IDg6MjnigK9QTSBBbGV4aXMgTG90aG9yw6kgKGVCUEYgRm91
bmRhdGlvbikKPj4gPiA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgoKWy4uLl0K
Cj4+ID4+ICtjb25maWcgQlBGX0pJVF9LQVNBTgo+PiA+PiArICAgICAgIGJvb2wKPj4gPj4gKyAg
ICAgICBkZXBlbmRzIG9uIEhBVkVfRUJQRl9KSVRfS0FTQU4KPj4gPj4gKyAgICAgICBkZWZhdWx0
IHkgaWYgQlBGX0pJVCAmJiBLQVNBTl9HRU5FUklDCj4+ID4KPj4gPiBTaG91bGQgdGhpcyBiZSAi
ZGVwZW5kcyBvbiBLQVNBTiAmJiBLQVNBTl9HRU5FUklDIj8KPj4KPj4gTWVhbmluZywgbWFraW5n
IGl0IGFuIGV4cGxpY2l0IHVzZXItc2VsZWN0YWJsZSBvcHRpb24gPwo+Pgo+PiBJZiBzbywgdGhl
IGN1cnJlbnQgZGVzaWduIGNob2ljZSBpcyB2b2x1bnRhcnkgYW5kIGJhc2VkIG9uIHRoZSBmZWVk
YmFjawo+PiByZWNlaXZlZCBvbiB0aGUgb3JpZ2luYWwgUkZDLCB3aGVyZSBJIGhhdmUgYmVlbiBz
dWdnZXN0ZWQgdG8KPj4gYXV0b21hdGljYWxseSBlbmFibGUgdGhlIEtBU0FOIGluc3RydW1lbnRh
dGlvbiBpbiBCUEYgcHJvZ3JhbXMgaWYgS0FTQU4KPj4gc3VwcG9ydCBpcyBlbmFibGVkIGluIHRo
ZSBrZXJuZWwgKFsxXSkuIEJ1dCBpZiBhIHVzZXItc2VsZWN0YWJsZSB0b2dnbGUKPj4gaXMgZXZl
bnR1YWxseSBhIGJldHRlciBzb2x1dGlvbiwgSSdtIGZpbmUgd2l0aCBjaGFuZ2luZyBpdC4KPgo+
IExldCdzIG5vdCBhZGQgbW9yZSBjb25maWcga25vYnMuCj4gRXZlbiB0aGlzIHBhdGNoIGxvb2tz
IHJlZHVuZGFudC4KPiBJbnNpZGUgSklUIGRvIGluc3RydW1lbnRhdGlvbiB3aGVuIEtBU0FOX0dF
TkVSSUMgaXMgc2V0LgoKKHdpdGggcXVpdGUgc29tZSBkZWxheSkgSSB0aGluayBpdCB3b3VsZCBi
ZSBiZXR0ZXIgdG8ga2VlcCB0aGlzIG5ldwpCUEZfSklUX0tBU0FOLCBiZWNhdXNlIGFzaWRlIGZy
b20gdGhlIHBvc3NpYmlsaXR5IHRvIHVzZSBpdCBpbgpicGZfaml0X2NvbXAuYywgaXQgYWxsb3dz
IHRvIHVwZGF0ZSB0ZXN0cyBhZmZlY3RlZCBieSBLQVNBTgppbnN0cnVtZW50YXRpb24gaW4gYSBu
aWNlciB3YXkuIEZvciBleGFtcGxlLCB0aGUgdGVzdF9sb2FkZXIgc3VidGVzdHMKdGhhdCBtb25p
dG9yIEpJVHRlZCBpbnN0cnVjdGlvbnMgYXJlIGNvbmZ1c2VkIGJ5IEtBU0FOLiBJIGNhbiBlaXRo
ZXIKc2tpcCB0aGVtIG9yIG1ha2UgdGhlbSBzbWFydGVyIHdoZW4gS0FTQU4gaXMgZW5hYmxlZCBm
b3IgQlBGLCBidXQgaW4KYm90aCBjYXNlcywgaXQgd291bGQgYmUgbmljZXIgdG8ganVzdCBhZGFw
dCB0aGUgYmVoYXZpb3IgYmFzZWQgb24gYQpnZW5lcmljIENPTkZJR19CUEZfSklUX0tBU0FOLCBy
YXRoZXIgdGhhbiBzcHJpbmtsaW5nIHNvbWUgImlmCmppdF9lbmFibGVkIEFORCBDT05GSUdfS0FT
QU5fR0VORVJJQyBBTkQgQVJDSF9YODYiIGluIHNlbGZ0ZXN0cy4gVGhhdApzdGlsbCBkb2VzIG5v
dCBtYWtlIGl0IGEgY29uZmlnIGtub2IsIHRoYXQganVzdCBjcmVhdGVzIGFuIGludGVybmFsCktj
b25maWcgb3B0aW9uIHRoYXQgaXMgYXV0b21hdGljYWxseSB0dXJuZWQgb24gd2hlbiBLQVNBTiBh
bmQgSklUIGFyZQplbmFibGVkIGF0IGJ1aWxkIHRpbWUuCgoKLS0gCkFsZXhpcyBMb3Rob3LDqSwg
Qm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9v
dGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
