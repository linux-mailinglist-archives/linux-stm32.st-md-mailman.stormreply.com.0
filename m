Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0n9iJaR732lAUAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 13:51:00 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBB640409F
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 13:51:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D16B9C9008B;
	Wed, 15 Apr 2026 11:50:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4B54C58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2026 20:44:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 36C6FC5AAB7;
 Tue, 14 Apr 2026 20:45:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CCCED60410;
 Tue, 14 Apr 2026 20:44:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4D13710450F98; 
 Tue, 14 Apr 2026 22:44:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1776199466; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=L8bWJr7FXUdlTXBxL69DdsJ20JowQnELYHkBWQ0j71o=;
 b=tp0oFwTf5VHzsnEQcoI6YFXubpXr48s6UWlXK4aDR8EDMSSF+/OjNf6hUwJE2BAbHAdgPz
 v2f4A8tTxVtK7dqJZfFAdjP+hWDl0Fam9eGGy91tNDrdqr1jGCVU5mlUKQsx7dKkw5Fj/o
 8xB9Inm9XOYYzG+OqKhmNW03MF+ALRZMBSynxDWIF5QBxopuN97KxRbIxhOyfKSB9o6wkS
 91454gD3J6J7wN/TaEOT0JgO64Dp+ztksnjtLIOwoMGIkVJ9RQPJZYo6iGmJA9iAtEHlyl
 YSu689PmkWekOvBlF+bpB2iuXK1nNSBHe1tFVeClAIGo4vy+Vjuo6lCfP898kw==
Mime-Version: 1.0
Date: Tue, 14 Apr 2026 22:44:13 +0200
Message-Id: <DHT65O6DS001.14GNQMXFJZHTN@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
 <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com>
 <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
 <DHT3JV7GTOBL.29205LGGNEDSH@bootlin.com>
 <CAADnVQ+c9h_wuNwj8pjx885oNErGY7bxxCwKi+DiJ0XKSpyYfg@mail.gmail.com>
In-Reply-To: <CAADnVQ+c9h_wuNwj8pjx885oNErGY7bxxCwKi+DiJ0XKSpyYfg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Wed, 15 Apr 2026 11:50:57 +0000
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
	FORGED_RECIPIENTS(0.00)[m:alexei.starovoitov@gmail.com,m:alexis.lothore@bootlin.com,m:thomas.petazzoni@bootlin.com,m:dave.hansen@linux.intel.com,m:song@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:yonghong.song@linux.dev,m:hpa@zytor.com,m:vincenzo.frascino@arm.com,m:shuah@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:xukuohai@huawei.com,m:daniel@iogearbox.net,m:x86@kernel.org,m:john.fastabend@gmail.com,m:andrii@kernel.org,m:kasan-dev@googlegroups.com,m:mingo@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:bastien.curutchet@bootlin.com,m:mcoquelin.stm32@gmail.com,m:ebpf@linuxfoundation.org,m:ast@kernel.org,m:bp@alien8.de,m:memxor@gmail.com,m:bpf@vger.kernel.org,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:netdev@vger.kernel.org,m:dsahern@kernel.org,m:linux-kernel@vger.kernel.org,m:eddyz87@gmail.com,m:tglx@kernel.org,m:jolsa@kernel.org,m:akpm@linux-foundation.org,m:martin.lau@linux.dev,m:davem@davemloft
 .net,m:alexeistarovoitov@gmail.com,m:ryabininaa@gmail.com,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	FREEMAIL_TO(0.00)[gmail.com,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[bootlin.com,linux.intel.com,kernel.org,gmail.com,google.com,linux.dev,zytor.com,arm.com,st-md-mailman.stormreply.com,huawei.com,iogearbox.net,googlegroups.com,redhat.com,lists.infradead.org,linuxfoundation.org,alien8.de,vger.kernel.org,kvack.org,linux-foundation.org,davemloft.net];
	NEURAL_SPAM(0.00)[0.555];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:mid,bootlin.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 7EBB640409F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlIEFwciAxNCwgMjAyNiBhdCA5OjE2IFBNIENFU1QsIEFsZXhlaSBTdGFyb3ZvaXRvdiB3
cm90ZToKPiBPbiBUdWUsIEFwciAxNCwgMjAyNiBhdCAxMTo0MeKAr0FNIEFsZXhpcyBMb3Rob3LD
qQo+IDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIFR1ZSBBcHIg
MTQsIDIwMjYgYXQgNDozNiBQTSBDRVNULCBBbGV4ZWkgU3Rhcm92b2l0b3Ygd3JvdGU6Cj4+ID4g
T24gVHVlLCBBcHIgMTQsIDIwMjYgYXQgNjoxM+KAr0FNIEFsZXhpcyBMb3Rob3LDqQo+PiA+IDxh
bGV4aXMubG90aG9yZUBib290bGluLmNvbT4gd3JvdGU6Cj4+ID4+Cj4+ID4+IEhpIEFuZHJleSwg
dGhhbmtzIGZvciB0aGUgcHJvbXB0IHJldmlldyAhCgpbLi4uXQoKPj4gPiBOby4gVGhlIHBlcmZv
cm1hbmNlIHBlbmFsdHkgd2lsbCBiZSB0b28gaGlnaC4KPj4KPj4gU2luY2Ugd2UgYXJlIG1lbnRp
b25pbmcgaXQsIEkgZGlkIG5vdCBjb25zaWRlciB5ZXQgYW55IHBlcmZvcm1hbmNlCj4+IGNvbXBh
cmlzaW9uL2JlbmNobWFya2luZyAoYW5kIEkgYW0gbm90IHJlYWxseSBmYW1pbGlhciB3aXRoIHVz
dWFsIGJwZgo+PiBwZXJmb3JtYW5jZSB2YWxpZGF0aW9uIHByYWN0aWNlcyBmb3IgbmV3IGJwZiBm
ZWF0dXJlcykuIElzIHRoZXJlIGFueQo+PiBleGlzdGluZyB0ZXN0IEkgc2hvdWxkIHRha2UgYSBs
b29rIGF0IGZvciB0aGlzID8gTWF5YmUgc29tZSBzcGVjaWZpYwo+PiBiZW5jaGVzIGluIHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9iZW5jaCA/Cj4KPiBTbyBmYXIgZXZlcnl0aGluZyBpbiBi
cGYvYmVuY2gvIG1lYXN1cmVzIGJwZiBpbmZyYSBsaWtlCj4gbWFwcywga3Byb2JlcywgdHJhY2Vw
b2ludHMsIGV0Yy4KPiBXZSBkb24ndCBoYXZlIGJlbmNobWFya3MgZm9yIGJwZiBwcm9ncmFtcy4K
PiBTbyB3ZSBkb24ndCBrbm93IGhvdyB3ZWxsIEpJVHMgYXJlIGdlbmVyYXRpbmcgY29kZQo+IGFu
ZCBob3cgbXVjaCBpbmxpbmluZyBkb25lIGJ5IHRoZSB2ZXJpZmllciwgSklUcyBhY3R1YWxseSBo
ZWxwcy4KPgo+IFB1cmFuamF5IGlzIHdvcmtpbmcgb24gY3JlYXRpbmcgYSBTUEVDaW50IGxpa2Ug
c2V0IG9mIGJlbmNobWFya3MuCj4KPiBGb3IgdGhpcyBrYXNhbiB3b3JrIHdlIHNob3VsZCBtYWtl
IHRoZSBiZXN0IGRlY2lzaW9ucyBmcm9tCj4gcGVyZm9ybWFuY2UgcG9pbnQgb2YgdmlldywgbGlr
ZSBub3Qgd2FzdGluZyB1bm5lY2Vzc2FyeSBjYWxsCj4gYW5kIG5vdCBzYXZpbmcgdW5uZWNlc3Nh
cnkgcmVnaXN0ZXJzLiBidHcgaW4gdGhlIG90aGVyIHBhdGNoCj4gSSB0aGluayB5b3UgY2FuIHNr
aXAgc2F2aW5nIG9mIHIxMCBhbmQgcjExLgoKTm90ZWQsIEknbGwgZG8gc29tZSBjaGVja3MgYW5k
IHRlc3RzIHdpdGhvdXQgdGhvc2UgdHdvLgoKPiBCdXQgd2UgY2Fubm90IHF1YW50aWZ5IHlldCB0
aGF0IGF2b2lkaW5nIGV4dHJhIGNhbGwgZ2l2ZXMgdXMgTiUuCj4KPiBZb3UgY2FuIG1pY3JvLWJl
bmNobWFyaywgb2YgY291cnNlLCBidXQgZ290dGEgYmUgY2FyZWZ1bAo+IGludGVycHJldGluZyB0
aGUgcmVzdWx0cy4gSXQgbWlnaHQgYmUgdG9vIGVhc3kgdG8gZ2V0IGludG8KPiB0aGlua2luZyB0
aGF0IEpJVCBtdXN0IGlubGluZSBfX2FzYW5fbG9hZCgpIGZvciB0aGUgc2FrZSBvZiBwZXJmb3Jt
YW5jZS4KCk9rLCBpbnRlcmVzdGluZywgdGhhbmtzIGZvciB0aG9zZSBkZXRhaWxzCgpBbGV4aXMK
Ci0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBl
bmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
