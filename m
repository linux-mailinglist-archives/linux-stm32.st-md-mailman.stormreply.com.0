Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FC3892932
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Mar 2024 05:15:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 364C4C6C83D;
	Sat, 30 Mar 2024 04:15:34 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A660C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Mar 2024 04:15:32 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-5d3907ff128so1950173a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Mar 2024 21:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1711772130; x=1712376930;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ofE4DiMnvHuiRZX1XlrIQJQuThx3U4684j2Vrwr4bOc=;
 b=cu2pclOe7g6J7Dz7CZ3Rr2X8jeBHkiF54WeOOXgEnDP9zI+Qp3W/oAfXrykYwpuMxF
 MQr/I5eLXirmQr466bRGMr/bZh4+cmMPC8ekfG1XxPETj8motNSCtKrHuKjh+C/lqVsD
 l+ZonCqGrCa8AVTqvgpTRgfq+kHG+CZA1ChHeh1OliWyuRskmeBW42paVjcb0jstQY0R
 GenV8/oDYgtf3NZEqa30Y2U7IP0Ui2KZy1GYIb4dWhxym02XYmUG54w/ZwLGOatpRzFG
 dHKMiA/8NcXUJ+nGx8xMfN8RnneGYC+WhSzaIAr+kVGP6LK68jT7IiiUpkW5DihIvPcW
 4paQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711772130; x=1712376930;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ofE4DiMnvHuiRZX1XlrIQJQuThx3U4684j2Vrwr4bOc=;
 b=ieiiMSNllIX2onHJj9w//PyjzOJZmV7PkE2NyvLFIZ02Xngqaa2bPwUngnzQBUSFgu
 EKBIfZZpq9gtc1jCHal/8IzN1tTbGHQUnSPiVaAajeMZSgE9CLU0AYQbMs4hSKU1R64Q
 aRQwxwPuUD1Brn3kOlxDIMr/qZ5vYPlOZFJf9mHFxJHVDlQz+XuRfcrZkmz4Ulo7LtL8
 Ry9WJyBVwbuzhl4OUC3eMA7d6vmPt7kPv47t0PcmdAE9eV7hv8CFAdtiCRyK8Pl0e2OA
 cQZdrLIfUR5QNPZNStf6YLGUYFqx/PmEv68llT2/J6qngdl/RCT78BE/aPy+VQa2/m/Q
 HKpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCimopGrNqYyHhoNtWTcb8Wo9vyCvlFjHrWhIc2rd642su5p8V2zXte8vzXYubXbmFVK0Jor7vprDIR/0EkoqqgxZbx1dkuuj3pzAJpqcvhZJidacbxL9c
X-Gm-Message-State: AOJu0YwDHizsMuVEzySyuiC+0I6/gkrd3pGXG8puvmhnA0teGZfeEGT1
 59b5as9tVGDFvURJWa6CgY1XnNXEchBvsG0T/E0IX8QS0l0O2JOehho6gUxLQ+PwIVbCLMvaMkZ
 JiexJpb1+ZdPoeF04i0r8r5sL5LR9gtJOHehEJw==
X-Google-Smtp-Source: AGHT+IGgndwZ3xqfDhf4CyJqUlqHUpBRYWacoRvVkoWzKCTwU3GtudllRjOr+s4vd+S8mdhVeoofK0l9Hh+AwBW0mGw=
X-Received: by 2002:a05:6a20:17a2:b0:1a3:67fd:46b1 with SMTP id
 bl34-20020a056a2017a200b001a367fd46b1mr3653617pzb.36.1711772130610; Fri, 29
 Mar 2024 21:15:30 -0700 (PDT)
MIME-Version: 1.0
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
 <20240328111330.194dcbe5@gandalf.local.home>
 <CAEf4BzYgzOti+Hfdn3SUCjuofGedXRSGApVDD+K2TdG6oNE-pw@mail.gmail.com>
In-Reply-To: <CAEf4BzYgzOti+Hfdn3SUCjuofGedXRSGApVDD+K2TdG6oNE-pw@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Sat, 30 Mar 2024 12:16:52 +0800
Message-ID: <CALz3k9hm6U90K8+d7SprXiKvscRjFno83idqYneHEVwgs4pCiw@mail.gmail.com>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
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
 linux-trace-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 KP Singh <kpsingh@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>, Network Development <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Eddy Z <eddyz87@gmail.com>, Sven Schnelle <svens@linux.ibm.com>,
 Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>
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

T24gU2F0LCBNYXIgMzAsIDIwMjQgYXQgNzoyOOKAr0FNIEFuZHJpaSBOYWtyeWlrbwo8YW5kcmlp
Lm5ha3J5aWtvQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE1hciAyOCwgMjAyNCBhdCA4
OjEw4oCvQU0gU3RldmVuIFJvc3RlZHQgPHJvc3RlZHRAZ29vZG1pcy5vcmc+IHdyb3RlOgo+ID4K
PiA+IE9uIFRodSwgMjggTWFyIDIwMjQgMjI6NDM6NDYgKzA4MDAKPiA+IOaipum+meiRoyA8ZG9u
Z21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gPiBJIGhhdmUgZG9uZSBh
IHNpbXBsZSBiZW5jaG1hcmsgb24gY3JlYXRpbmcgMTAwMAo+ID4gPiB0cmFtcG9saW5lcy4gSXQg
aXMgc2xvdywgcXVpdGUgc2xvdywgd2hpY2ggY29uc3VtZSB1cCB0bwo+ID4gPiA2MHMuIFdlIGNh
bid0IGRvIGl0IHRoaXMgd2F5Lgo+ID4gPgo+ID4gPiBOb3csIEkgaGF2ZSBhIGJhZCBpZGVhLiBI
b3cgYWJvdXQgd2UgaW50cm9kdWNlCj4gPiA+IGEgImR5bmFtaWMgdHJhbXBvbGluZSI/IFRoZSBi
YXNpYyBsb2dpYyBvZiBpdCBjYW4gYmU6Cj4gPiA+Cj4gPiA+ICIiIgo+ID4gPiBzYXZlIHJlZ3MK
PiA+ID4gYnBmcyA9IHRyYW1wb2xpbmVfbG9va3VwX2lwKGlwKQo+ID4gPiBmZW50cnkgPSBicGZz
LT5mZW50cmllcwo+ID4gPiB3aGlsZSBmZW50cnk6Cj4gPiA+ICAgZmVudHJ5KGN0eCkKPiA+ID4g
ICBmZW50cnkgPSBmZW50cnktPm5leHQKPiA+ID4KPiA+ID4gY2FsbCBvcmlnaW4KPiA+ID4gc2F2
ZSByZXR1cm4gdmFsdWUKPiA+ID4KPiA+ID4gZmV4aXQgPSBicGZzLT5mZXhpdHMKPiA+ID4gd2hp
bGUgZmV4aXQ6Cj4gPiA+ICAgZmV4aXQoY3R4KQo+ID4gPiAgIGZleGl0ID0gZmV4aXQtPm5leHQK
PiA+ID4KPiA+ID4geHh4eHh4Cj4gPiA+ICIiIgo+ID4gPgo+ID4gPiBBbmQgd2UgbG9va3VwIHRo
ZSAiYnBmcyIgYnkgdGhlIGZ1bmN0aW9uIGlwIGluIGEgaGFzaCBtYXAKPiA+ID4gaW4gdHJhbXBv
bGluZV9sb29rdXBfaXAuIFRoZSB0eXBlIG9mICJicGZzIiBpczoKPiA+ID4KPiA+ID4gc3RydWN0
IGJwZl9hcnJheSB7Cj4gPiA+ICAgc3RydWN0IGJwZl9wcm9nICpmZW50cmllczsKPiA+ID4gIHN0
cnVjdCBicGZfcHJvZyAqZmV4aXRzOwo+ID4gPiAgIHN0cnVjdCBicGZfcHJvZyAqbW9kaWZ5X3Jl
dHVybnM7Cj4gPiA+IH0KPiA+ID4KPiA+ID4gV2hlbiB3ZSBuZWVkIHRvIGF0dGFjaCB0aGUgYnBm
IHByb2dBIHRvIGZ1bmN0aW9uIEEvQi9DLAo+ID4gPiB3ZSBvbmx5IG5lZWQgdG8gY3JlYXRlIHRo
ZSBicGZfYXJyYXlBLCBicGZfYXJyYXlCLCBicGZfYXJyYXlDCj4gPiA+IGFuZCBhZGQgdGhlIHBy
b2dBIHRvIHRoZW0sIGFuZCBpbnNlcnQgdGhlbSB0byB0aGUgaGFzaCBtYXAKPiA+ID4gImRpcmVj
dF9jYWxsX2JwZnMiLCBhbmQgYXR0YWNoIHRoZSAiZHluYW1pYyB0cmFtcG9saW5lIiB0bwo+ID4g
PiBBL0IvQy4gSWYgYnBmX2FycmF5QSBleGlzdCwganVzdCBhZGQgcHJvZ0EgdG8gdGhlIHRhaWwg
b2YKPiA+ID4gYnBmX2FycmF5QS0+ZmVudHJpZXMuIFdoZW4gd2UgbmVlZCB0byBhdHRhY2ggcHJv
Z0IgdG8KPiA+ID4gQi9DLCBqdXN0IGFkZCBwcm9nQiB0byBicGZfYXJyYXlCLT5mZW50cmllcyBh
bmQKPiA+ID4gYnBmX2FycmF5Qi0+ZmVudHJpZXMuCj4gPiA+Cj4gPiA+IENvbXBhcmVkIHRvIHRo
ZSB0cmFtcG9saW5lLCBleHRyYSBvdmVyaGVhZCBpcyBpbnRyb2R1Y2VkCj4gPiA+IGJ5IHRoZSBo
YXNoIGxvb2t1cGluZy4KPiA+ID4KPiA+ID4gSSBoYXZlIG5vdCBiZWd1biB0byBjb2RlIHlldCwg
YW5kIEkgYW0gbm90IHN1cmUgdGhlIG92ZXJoZWFkIGlzCj4gPiA+IGFjY2VwdGFibGUuIENvbnNp
ZGVyaW5nIHRoYXQgd2UgYWxzbyBuZWVkIHRvIGRvIGhhc2ggbG9va3VwCj4gPiA+IGJ5IHRoZSBm
dW5jdGlvbiBpbiBrcHJvYmVfbXVsdGksIG1heWJlIHRoZSBvdmVyaGVhZCBpcwo+ID4gPiBhY2Nl
cHRhYmxlPwo+ID4KPiA+IFNvdW5kcyBsaWtlIHlvdSBhcmUganVzdCByZWNyZWF0aW5nIHRoZSBm
dW5jdGlvbiBtYW5hZ2VtZW50IHRoYXQgZnRyYWNlCj4gPiBoYXMuIEl0IGFsc28gY2FuIGFkZCB0
aG91c2FuZHMgb2YgdHJhbXBvbGluZXMgdmVyeSBxdWlja2x5LCBiZWNhdXNlIGl0IGRvZXMKPiA+
IGl0IGluIGJhdGNoZXMuIEl0IHRha2VzIHNwZWNpYWwgc3luY2hyb25pemF0aW9uIHN0ZXBzIHRv
IGF0dGFjaCB0byBmZW50cnkuCj4gPiBmdHJhY2UgKGFuZCBJIGJlbGlldmUgbXVsdGkta3Byb2Jl
cykgdXBkYXRlcyBhbGwgdGhlIGF0dGFjaG1lbnRzIGZvciBlYWNoCj4gPiBzdGVwLCBzbyB0aGUg
c3luY2hyb25pemF0aW9uIG5lZWRlZCBpcyBvbmx5IGRvbmUgb25jZS4KPiA+Cj4gPiBJZiB5b3Ug
cmVhbGx5IHdhbnQgdG8gaGF2ZSB0aG91c2FuZHMgb2YgZnVuY3Rpb25zLCB3aHkgbm90IGp1c3Qg
cmVnaXN0ZXIgaXQKPiA+IHdpdGggZnRyYWNlIGl0c2VsZi4gSXQgd2lsbCBnaXZlIHlvdSB0aGUg
YXJndW1lbnRzIHZpYSB0aGUgZnRyYWNlX3JlZ3MKPiA+IHN0cnVjdHVyZS4gQ2FuJ3QgeW91IGp1
c3QgcmVnaXN0ZXIgYSBwcm9ncmFtIGFzIHRoZSBjYWxsYmFjaz8KPiA+Cj4gPiBJdCB3aWxsIHBy
b2JhYmx5IG1ha2UgeW91ciBhY2NvdW50aW5nIG11Y2ggZWFzaWVyLCBhbmQganVzdCBsZXQgZnRy
YWNlCj4gPiBoYW5kbGUgdGhlIGZlbnRyeSBsb2dpYy4gVGhhdCdzIHdoYXQgaXQgd2FzIG1hZGUg
dG8gZG8uCj4gPgo+Cj4gSSB0aG91Z2h0IEknbGwganVzdCBhc2sgaW5zdGVhZCBvZiBkaWdnaW5n
IHRocm91Z2ggY29kZSwgc29ycnkgZm9yCj4gYmVpbmcgbGF6eSA6KSBJcyB0aGVyZSBhbnkgd2F5
IHRvIHBhc3MgcHRfcmVncy9mdHJhY2VfcmVncyBjYXB0dXJlZAo+IGJlZm9yZSBmdW5jdGlvbiBl
eGVjdXRpb24gdG8gYSByZXR1cm4gcHJvYmUgKGZleGl0L2tyZXRwcm9iZSk/IEkuZS4sCj4gaG93
IGhhcmQgaXMgaXQgdG8gcGFzcyBpbnB1dCBmdW5jdGlvbiBhcmd1bWVudHMgdG8gYSBrcmV0cHJv
YmU/IFRoYXQncwo+IHRoZSBiaWdnZXN0IGFkdmFudGFnZSBvZiBmZXhpdCBvdmVyIGtyZXRwcm9i
ZSwgYW5kIGlmIHdlIGNhbiBtYWtlCj4gdGhlc2Ugb3JpZ2luYWwgcHRfcmVncy9mdHJhY2VfcmVn
cyBhdmFpbGFibGUgdG8ga3JldHByb2JlLCB0aGVuCj4gbXVsdGkta3JldHByb2JlIHdpbGwgZWZm
ZWN0aXZlbHkgYmUgdGhpcyBtdWx0aS1mZXhpdC4KClllcywgd2UgY2FuIHVzZSBtdWx0aS1rcmV0
cHJvYmUgaW5zdGVhZCBvZiBtdWx0aS1mZXhpdAppZiB3ZSBjYW4gb2J0YWluIHRoZSBmdW5jdGlv
biBhcmdzIGluIGtyZXRwcm9iZS4KCkkgdGhpbmsgaXQncyBoYXJkLiBUaGUgcmVhc29uIHRoYXQg
d2UgY2FuIG9idGFpbiB0aGUKZnVuY3Rpb24gYXJncyBpcyB0aGF0IHdlIGhhdmUgYSB0cmFtcG9s
aW5lLCBhbmQgaXQKY2FsbCB0aGUgb3JpZ2luIGZ1bmN0aW9uIGZvciBGRVhJVC4gSWYgd2UgZG8g
dGhlIHNhbWUKZm9yIG11bHRpLWtyZXRwcm9iZSwgd2UgbmVlZCB0byBtb2RpZnkgZnRyYWNlX3Jl
Z3NfY2FsbGVyCnRvOgoKZnRyYWNlX3JlZ3NfY2FsbGVyCnwKX19mdHJhY2Vfb3BzX2xpc3RfZnVu
Ywp8CmNhbGwgYWxsIG11bHRpLWtwcm9iZSBjYWxsYmFja3MKfApjYWxsIG9yZ2luCnwKY2FsbCBh
bGwgbXVsdGkta3JldHByb2JlIGNhbGxiYWNrcwp8CmNhbGwgYnBmIHRyYW1wb2xpbmUoZm9yIFRS
QUNJTkcpCgpIb3dldmVyLCB0aGlzIGxvZ2ljIGNvbmZsaWN0cyB3aXRoIGJwZiB0cmFtcG9saW5l
LAphcyBpdCBjYW4gYWxzbyBjYWxsIHRoZSBvcmlnaW4gZnVuY3Rpb24uIFdoYXQncyBtb3JlLAp0
aGUgRkVOVFJZIHNob3VsZCBiZSBjYWxsZWQgYmVmb3JlIHRoZSAiY2FsbCBvcmlnaW4iCmFib3Zl
LgoKSSdtIHN1cmUgaWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgYXMgSSBoYXZlIG5vdApmaWd1
cmVkIG91dCBob3cgbXVsdGkta3JldHByb2JlIHdvcmtzIGluIGZwcm9iZS4KClRoYW5rcyEKTWVu
Z2xvbmcgRG9uZwoKPgo+ID4gLS0gU3RldmUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
