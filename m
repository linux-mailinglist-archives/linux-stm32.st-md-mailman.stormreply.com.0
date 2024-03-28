Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4E88902B1
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Mar 2024 16:10:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B51A0C6DD96;
	Thu, 28 Mar 2024 15:10:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91FC3C6DD93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Mar 2024 15:10:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3EB2D60DD7;
 Thu, 28 Mar 2024 15:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D2BC433C7;
 Thu, 28 Mar 2024 15:10:47 +0000 (UTC)
Date: Thu, 28 Mar 2024 11:13:30 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Message-ID: <20240328111330.194dcbe5@gandalf.local.home>
In-Reply-To: <CALz3k9jG5Jrqw=BGjt05yMkEF-1u909GbBYrV-02W0dQtm6KQQ@mail.gmail.com>
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-2-dongmenglong.8@bytedance.com>
 <CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
 <CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com>
 <CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
 <CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
 <CAADnVQLwgw8bQ7OHBbqLhcPJ2QpxiGw3fkMFur+2cjZpM_78oA@mail.gmail.com>
 <CALz3k9g9k7fEwdTZVLhrmGoXp8CE47Q+83r-AZDXrzzuR+CjVA@mail.gmail.com>
 <CAADnVQLHpi3J6cBJ0QBgCQ2aY6fWGnVvNGdfi3W-jmoa9d1eVQ@mail.gmail.com>
 <CALz3k9g-U8ih=ycJPRbyU9x_9cp00fNkU3PGQ6jP0WJ+=uKmqQ@mail.gmail.com>
 <CALz3k9jG5Jrqw=BGjt05yMkEF-1u909GbBYrV-02W0dQtm6KQQ@mail.gmail.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Alexei Starovoitov <ast@kernel.org>,
 Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, X86 ML <x86@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Quentin Monnet <quentin@isovalent.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 linux-trace-kernel@vger.kernel.org, KP Singh <kpsingh@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>, Network Development <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Eddy Z <eddyz87@gmail.com>, Sven Schnelle <svens@linux.ibm.com>,
 Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, "David S.
 Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [External] Re: [PATCH bpf-next v2 1/9] bpf:
 tracing: add support to record and check the accessed args
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

T24gVGh1LCAyOCBNYXIgMjAyNCAyMjo0Mzo0NiArMDgwMArmoqbpvpnokaMgPGRvbmdtZW5nbG9u
Zy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgoKPiBJIGhhdmUgZG9uZSBhIHNpbXBsZSBiZW5jaG1h
cmsgb24gY3JlYXRpbmcgMTAwMAo+IHRyYW1wb2xpbmVzLiBJdCBpcyBzbG93LCBxdWl0ZSBzbG93
LCB3aGljaCBjb25zdW1lIHVwIHRvCj4gNjBzLiBXZSBjYW4ndCBkbyBpdCB0aGlzIHdheS4KPiAK
PiBOb3csIEkgaGF2ZSBhIGJhZCBpZGVhLiBIb3cgYWJvdXQgd2UgaW50cm9kdWNlCj4gYSAiZHlu
YW1pYyB0cmFtcG9saW5lIj8gVGhlIGJhc2ljIGxvZ2ljIG9mIGl0IGNhbiBiZToKPiAKPiAiIiIK
PiBzYXZlIHJlZ3MKPiBicGZzID0gdHJhbXBvbGluZV9sb29rdXBfaXAoaXApCj4gZmVudHJ5ID0g
YnBmcy0+ZmVudHJpZXMKPiB3aGlsZSBmZW50cnk6Cj4gICBmZW50cnkoY3R4KQo+ICAgZmVudHJ5
ID0gZmVudHJ5LT5uZXh0Cj4gCj4gY2FsbCBvcmlnaW4KPiBzYXZlIHJldHVybiB2YWx1ZQo+IAo+
IGZleGl0ID0gYnBmcy0+ZmV4aXRzCj4gd2hpbGUgZmV4aXQ6Cj4gICBmZXhpdChjdHgpCj4gICBm
ZXhpdCA9IGZleGl0LT5uZXh0Cj4gCj4geHh4eHh4Cj4gIiIiCj4gCj4gQW5kIHdlIGxvb2t1cCB0
aGUgImJwZnMiIGJ5IHRoZSBmdW5jdGlvbiBpcCBpbiBhIGhhc2ggbWFwCj4gaW4gdHJhbXBvbGlu
ZV9sb29rdXBfaXAuIFRoZSB0eXBlIG9mICJicGZzIiBpczoKPiAKPiBzdHJ1Y3QgYnBmX2FycmF5
IHsKPiAgIHN0cnVjdCBicGZfcHJvZyAqZmVudHJpZXM7Cj4gIHN0cnVjdCBicGZfcHJvZyAqZmV4
aXRzOwo+ICAgc3RydWN0IGJwZl9wcm9nICptb2RpZnlfcmV0dXJuczsKPiB9Cj4gCj4gV2hlbiB3
ZSBuZWVkIHRvIGF0dGFjaCB0aGUgYnBmIHByb2dBIHRvIGZ1bmN0aW9uIEEvQi9DLAo+IHdlIG9u
bHkgbmVlZCB0byBjcmVhdGUgdGhlIGJwZl9hcnJheUEsIGJwZl9hcnJheUIsIGJwZl9hcnJheUMK
PiBhbmQgYWRkIHRoZSBwcm9nQSB0byB0aGVtLCBhbmQgaW5zZXJ0IHRoZW0gdG8gdGhlIGhhc2gg
bWFwCj4gImRpcmVjdF9jYWxsX2JwZnMiLCBhbmQgYXR0YWNoIHRoZSAiZHluYW1pYyB0cmFtcG9s
aW5lIiB0bwo+IEEvQi9DLiBJZiBicGZfYXJyYXlBIGV4aXN0LCBqdXN0IGFkZCBwcm9nQSB0byB0
aGUgdGFpbCBvZgo+IGJwZl9hcnJheUEtPmZlbnRyaWVzLiBXaGVuIHdlIG5lZWQgdG8gYXR0YWNo
IHByb2dCIHRvCj4gQi9DLCBqdXN0IGFkZCBwcm9nQiB0byBicGZfYXJyYXlCLT5mZW50cmllcyBh
bmQKPiBicGZfYXJyYXlCLT5mZW50cmllcy4KPiAKPiBDb21wYXJlZCB0byB0aGUgdHJhbXBvbGlu
ZSwgZXh0cmEgb3ZlcmhlYWQgaXMgaW50cm9kdWNlZAo+IGJ5IHRoZSBoYXNoIGxvb2t1cGluZy4K
PiAKPiBJIGhhdmUgbm90IGJlZ3VuIHRvIGNvZGUgeWV0LCBhbmQgSSBhbSBub3Qgc3VyZSB0aGUg
b3ZlcmhlYWQgaXMKPiBhY2NlcHRhYmxlLiBDb25zaWRlcmluZyB0aGF0IHdlIGFsc28gbmVlZCB0
byBkbyBoYXNoIGxvb2t1cAo+IGJ5IHRoZSBmdW5jdGlvbiBpbiBrcHJvYmVfbXVsdGksIG1heWJl
IHRoZSBvdmVyaGVhZCBpcwo+IGFjY2VwdGFibGU/CgpTb3VuZHMgbGlrZSB5b3UgYXJlIGp1c3Qg
cmVjcmVhdGluZyB0aGUgZnVuY3Rpb24gbWFuYWdlbWVudCB0aGF0IGZ0cmFjZQpoYXMuIEl0IGFs
c28gY2FuIGFkZCB0aG91c2FuZHMgb2YgdHJhbXBvbGluZXMgdmVyeSBxdWlja2x5LCBiZWNhdXNl
IGl0IGRvZXMKaXQgaW4gYmF0Y2hlcy4gSXQgdGFrZXMgc3BlY2lhbCBzeW5jaHJvbml6YXRpb24g
c3RlcHMgdG8gYXR0YWNoIHRvIGZlbnRyeS4KZnRyYWNlIChhbmQgSSBiZWxpZXZlIG11bHRpLWtw
cm9iZXMpIHVwZGF0ZXMgYWxsIHRoZSBhdHRhY2htZW50cyBmb3IgZWFjaApzdGVwLCBzbyB0aGUg
c3luY2hyb25pemF0aW9uIG5lZWRlZCBpcyBvbmx5IGRvbmUgb25jZS4KCklmIHlvdSByZWFsbHkg
d2FudCB0byBoYXZlIHRob3VzYW5kcyBvZiBmdW5jdGlvbnMsIHdoeSBub3QganVzdCByZWdpc3Rl
ciBpdAp3aXRoIGZ0cmFjZSBpdHNlbGYuIEl0IHdpbGwgZ2l2ZSB5b3UgdGhlIGFyZ3VtZW50cyB2
aWEgdGhlIGZ0cmFjZV9yZWdzCnN0cnVjdHVyZS4gQ2FuJ3QgeW91IGp1c3QgcmVnaXN0ZXIgYSBw
cm9ncmFtIGFzIHRoZSBjYWxsYmFjaz8KCkl0IHdpbGwgcHJvYmFibHkgbWFrZSB5b3VyIGFjY291
bnRpbmcgbXVjaCBlYXNpZXIsIGFuZCBqdXN0IGxldCBmdHJhY2UKaGFuZGxlIHRoZSBmZW50cnkg
bG9naWMuIFRoYXQncyB3aGF0IGl0IHdhcyBtYWRlIHRvIGRvLgoKLS0gU3RldmUKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
