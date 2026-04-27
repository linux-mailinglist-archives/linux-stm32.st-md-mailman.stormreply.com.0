Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EE07A08k72nE7wAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 10:54:39 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB7146F6D9
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 10:54:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DE63C57A50;
	Mon, 27 Apr 2026 08:54:38 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B0DCC08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2026 08:54:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 32E231A342E;
 Mon, 27 Apr 2026 08:54:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 00C60600D1;
 Mon, 27 Apr 2026 08:54:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3E6B410722270; 
 Mon, 27 Apr 2026 10:54:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777280074; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=TXqEElTwN2Tki8IktRXTfIVL9D01k/xyxgMf0ctrAd4=;
 b=S6fWitaVDU/VTZT6yPZJGXT7mUzoaUUbLCjgB4vRC3fCgw3YaEa8rUxESSeQ4XM7sjxdld
 w2wJkszlpI/+wJv4VqWfh21mPO0o4KNiRTj9oqzk+O10QqDUfqSImMWvLhCIOcLEjFMtyG
 sUY57bQmm2xTj8ZjKaHYGBs4eCyHXGr/RuUPsVyddOb3ET/DEUbe3cIOjRYxQgYqhcHujv
 mmeRT0Ooj0pRPIPSI9VdRSjRGsZnUXRi8k6doRZ/9vcuXQtb+ezrvE5e+kTwdL2pM/S1MO
 LmYK6n6Izjxt4mzCaSxAD8ryLg7XzSE0B+bbHBjSDcwj2rcfoRc1SPkXzxFAtQ==
Mime-Version: 1.0
Date: Mon, 27 Apr 2026 10:54:24 +0200
Message-Id: <DI3T7A3A3LWQ.1WBAS2CWS2343@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <71fb19ff-6dde-43f4-a0e9-5c8cf2ba4ed4@linux.dev>
 <CAADnVQ+ytaX5oq_1TjKC66dnjd1-yh3yjmPrP-kEg5wEvX643g@mail.gmail.com>
In-Reply-To: <CAADnVQ+ytaX5oq_1TjKC66dnjd1-yh3yjmPrP-kEg5wEvX643g@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Song Liu <song@kernel.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, "H. Peter Anvin" <hpa@zytor.com>,
 Vincenzo
 Frascino <vincenzo.frascino@arm.com>, Shuah Khan <shuah@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Xu Kuohai <xukuohai@huawei.com>,
 Daniel Borkmann <daniel@iogearbox.net>, X86 ML <x86@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Bastien
 Curutchet <bastien.curutchet@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, ebpf@linuxfoundation.org,
 Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>,
 =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>, bpf <bpf@vger.kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 "open list:KERNEL SELFTEST
 FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 Network Development <netdev@vger.kernel.org>, David
 Ahern <dsahern@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Eduard
 Zingerman <eddyz87@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>
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
X-Rspamd-Queue-Id: 9DB7146F6D9
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
	FORGED_RECIPIENTS(0.00)[m:alexei.starovoitov@gmail.com,m:ihor.solodrai@linux.dev,m:thomas.petazzoni@bootlin.com,m:dave.hansen@linux.intel.com,m:song@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:yonghong.song@linux.dev,m:hpa@zytor.com,m:vincenzo.frascino@arm.com,m:shuah@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:xukuohai@huawei.com,m:daniel@iogearbox.net,m:x86@kernel.org,m:john.fastabend@gmail.com,m:andrii@kernel.org,m:kasan-dev@googlegroups.com,m:mingo@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:bastien.curutchet@bootlin.com,m:mcoquelin.stm32@gmail.com,m:ebpf@linuxfoundation.org,m:ast@kernel.org,m:bp@alien8.de,m:alexis.lothore@bootlin.com,m:bpf@vger.kernel.org,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:netdev@vger.kernel.org,m:dsahern@kernel.org,m:linux-kernel@vger.kernel.org,m:eddyz87@gmail.com,m:tglx@kernel.org,m:jolsa@kernel.org,m:akpm@linux-foundation.org,m:martin.lau@linux.dev,m:davem@da
 vemloft.net,m:memxor@gmail.com,m:alexeistarovoitov@gmail.com,m:ryabininaa@gmail.com,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.dev];
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
	FREEMAIL_CC(0.00)[bootlin.com,linux.intel.com,kernel.org,gmail.com,google.com,linux.dev,zytor.com,arm.com,st-md-mailman.stormreply.com,huawei.com,iogearbox.net,googlegroups.com,redhat.com,lists.infradead.org,linuxfoundation.org,alien8.de,vger.kernel.org,kvack.org,linux-foundation.org,davemloft.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_HAM(-0.00)[-0.815];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,linux.dev:email,bootlin.com:mid,bootlin.com:url,st-md-mailman.stormreply.com:rdns]

T24gU2F0IEFwciAyNSwgMjAyNiBhdCAxOjI4IEFNIENFU1QsIEFsZXhlaSBTdGFyb3ZvaXRvdiB3
cm90ZToKPiBPbiBGcmksIEFwciAyNCwgMjAyNiBhdCA0OjEw4oCvUE0gSWhvciBTb2xvZHJhaSA8
aWhvci5zb2xvZHJhaUBsaW51eC5kZXY+IHdyb3RlOgo+Pgo+PiBJIHdvbmRlciBpZiBpdCdzIGZl
YXNpYmxlIHRvIGltcGxlbWVudCBLQVNBTiBzdXBwb3J0IG9uIHRoZSB2ZXJpZmllcgo+PiBzaWRl
IGluIHBvc3QtdmVyaWZpY2F0aW9uIGZpeHVwcy4gQUkgc2xvcCBmb3IgaWxsdXN0cmF0aW9uOgo+
Pgo+PiAgIDs7IE9yaWdpbmFsICgxIEJQRiBpbnNuKToKPj4gICBkc3QgPSAqKHU2NCAqKShzcmMg
KyBvZmYpICAgICAgICAgICA7IEJQRl9MRFggfCBCUEZfTUVNIHwgQlBGX0RXCj4+Cj4+ICAgOzsg
UmV3cml0ZSAofjcgQlBGIGluc25zKToKPj4gICByX3RtcDEgPSBzcmMgICAgICAgICAgICAgICAg
ICAgICAgICAgOyBCUEZfTU9WNjRfUkVHCj4+ICAgcl90bXAxICs9IG9mZiAgICAgICAgICAgICAg
ICAgICAgICAgIDsgQlBGX0FMVTY0IHwgQlBGX0FERCB8IEsgICAoZnVsbCBhZGRyZXNzKQo+PiAg
IHJfdG1wMiA9IHJfdG1wMSAgICAgICAgICAgICAgICAgICAgICA7IGNvcHkKPj4gICByX3RtcDIg
Pj49IDMgICAgICAgICAgICAgICAgICAgICAgICAgOyBLQVNBTl9TSEFET1dfU0NBTEVfU0hJRlQK
Pj4gICByX3RtcDIgKz0gS0FTQU5fU0hBRE9XX09GRlNFVCAgICAgICAgOyBzaGFkb3cgYWRkcmVz
cwo+PiAgIHJfdG1wMyA9ICoodTggKikocl90bXAyICsgMCkgICAgICAgICA7IEJQRl9MRFggfCBC
UEZfQiAgIChsb2FkIHNoYWRvdyBieXRlKQo+PiAgIGlmIHJfdG1wMyAhPSAwIGdvdG8gKzIgICAg
ICAgICAgICAgICA7IEJQRl9KTkUgfCBQQysyCj4+ICAgZHN0ID0gKih1NjQgKikoc3JjICsgb2Zm
KSAgICAgICAgICAgIDsgb3JpZ2luYWwgYWNjZXNzIChmYXN0IHBhdGgpCj4+ICAgZ290byArMSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDsgc2tpcCBzbG93cGF0aAo+PiAgIGNhbGwgX19h
c2FuX3JlcG9ydF9sb2FkOCAgICAgICAgICAgICA7IEJQRiBrZnVuYwo+PiAgIGRzdCA9ICoodTY0
ICopKHNyYyArIG9mZikgICAgICAgICAgICA7IHJldHJ5IHRoZSBhY2Nlc3MgYWZ0ZXIgcmVwb3J0
IChub24tZmF0YWwpCj4+Cj4+IEEgc29ydCBvZiBpbmxpbmUga2FzYW4gZGlyZWN0bHkgaW4gQlBG
Lgo+Pgo+PiBUaGVyZSBhcmUgcGxlbnR5IG9mIGlzc3VlcyB3aXRoIGl0OiBpbnN0cnVjdGlvbiBs
aW1pdCwgZXhwb3NpbmcgYXNhbgo+PiBBUEkgYXMga2Z1bmNzLCBldGMuIE9uIHRoZSBmbGlwIHNp
ZGUgd2UgZ2V0IGNyb3NzLWFyY2ggc3VwcG9ydCBvdXQgb2YKPj4gdGhlIGJveCB3aXRoIG5vIG9y
IG1pbmluYWwgSklUIGNoYW5nZXMuCj4+Cj4+IEhvbmVzdGx5IEknbSBub3QgZXhjaXRlZCBhYm91
dCB0aGlzIGFwcHJvYWNoLCBidXQgY3VyaW91cyBpZiBhbnlvbmUKPj4gdGhvdWdodCBhYm91dCB0
aGlzLCBvciBtYXliZSBpdCB3YXMgYWxyZWFkeSBkaXNjdXNzZWQ/Cj4KPiBXZSBkaXNjdXNzZWQg
dGhpcy4KPiBJdCB3b24ndCB3b3JrIGJlY2F1c2Ugd2UgZG9uJ3QgaGF2ZSB0aGF0IG1hbnkgdGVt
cCByZWdpc3RlcnMgZm9yIG9uY2UKPiBhbmQgc2Vjb25kIGl0IGhhcyB0byBwcmVzZXJ2ZSBhbGwg
KGJvdGggY2FsbGVlIGFuZCBjYWxsZXIgc2F2ZWQgcmVncykuCj4gVGhpcyBpcyBhcmNoIHNwZWNp
ZmljLgoKVGhpcyAiZmFzdCBwYXRoIiB3YXMgaW5kZWVkIHBhcnQgb2YgbXkgaW5pdGlhbCBwcm9w
b3NhbC4gRm9yIHRoZSByZWNvcmQ6CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvREc3VUcx
MTJBVkJDLkpLWUlTRFRBTTMwVEBib290bGluLmNvbS8KCmluIHRoZSAiQmFzaWMgaW5zdHJ1bWVu
dGF0aW9uIiBibG9jay4KCgotLSAKQWxleGlzIExvdGhvcsOpLCBCb290bGluCkVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
