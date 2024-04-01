Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C7D8936EE
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Apr 2024 04:28:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD472C6C820;
	Mon,  1 Apr 2024 02:28:31 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 398D4C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Apr 2024 02:28:30 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so2713150a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 Mar 2024 19:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1711938509; x=1712543309;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IXMeLoImPZ33R4zJ3SWpn56WCPhsxXC6Los6ajh1i8M=;
 b=JNw6u5gojUqvOOZu4s+fwLno8lMxl6YdillPJ+aMbib6P6t/knDtKxFg2HKXbfQH74
 35+mMi4nC1pVxQqFCsyZgsoZQ1tkTx1xhXB8wlXJh97RNeH41Yidser1NvoVXYz5Q+7t
 hXeNQHBQ6rlbnzzZUEWi7wyKVqoBVKz3KV+bKi4/1PTCiYnFt9epJvgj9Jcc81wClypt
 qHr+HH2DUeKGcpQ3ffMIn9MH7eQ2newE2iUK0LCICX76y+FwPrLewKliCCZpyEaE9r04
 gXaiS63avV0avXXRainTq/j8a5Ot3o+5Qd6qh9obXKY5a/VQOaZ98q97UPvuu0vVLQGf
 2opw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711938509; x=1712543309;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IXMeLoImPZ33R4zJ3SWpn56WCPhsxXC6Los6ajh1i8M=;
 b=YsaoUfoXF0jeswRHDRR6ngMn8gaAjy2K0988/rORd28RJaQ4hsW89AO+6/U0Mq1KJ3
 92E5vRm1tibr1OBuVaxGdeM3qvcLxGsbvyloD7T+el1MKMaQLt+oqzmDAMfkm0Nt+DSf
 nRkd72PZ9VgXIDz70H5jXGvWa36w83JFkK+bWYmCgUmOYbXcr0tdCI4mL7yZ846YTU8D
 SBqZeIGrnvQCJHlNbDD3lfEIjZ1rtOt1h1QZVl1g4DLaeOz9EjafIOsA++ZnRDc1lHTb
 dDHji8bjoUTg6HxfKJoD3Djb4xO1u205g2vDCgEH7lH+R5uVmJsqsNKe0+7XB+1gj5jg
 ZWSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzpJLM8CR9y0zAb4ETolj3Ol4GUbGKXSc7MO9Ad2At5/ODgNnkipWKK06CARngR8TisZ9n/3TNJ/Xvo6tEpPMG8v0M3kR4oe9CVm2TvdYJRZEmytbDueYp
X-Gm-Message-State: AOJu0YyIZqtq4GiynCUSGWyO88gzzbeJ1rq2NmSpLtnqe34Eeyc+SMg2
 ODWKC2tKfo5rbUW+ff/NNgJvqQBkgQ+DevU4b4zsOnFt8kc3resa5Rzr8OaUmfQb/VOP2iGknZY
 /IU/F4pXBZ5MrH494m1cp4hK8Juwx76qMuryV0A==
X-Google-Smtp-Source: AGHT+IGzGQQaneP5xALvw57pZKTHGiCwen67uykrwqg6rWGJrnO4HP/K70Vm6Xhliw5Ne2x0YoSn10U7kH5Lflzm9D8=
X-Received: by 2002:a05:6a20:550a:b0:1a3:6a74:2e6a with SMTP id
 ko10-20020a056a20550a00b001a36a742e6amr8586402pzb.14.1711938508724; Sun, 31
 Mar 2024 19:28:28 -0700 (PDT)
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
 <CALz3k9idLX10+Gh18xWepwtgvp4VZ3zQfY4aoNXn0gCh8Fs_fA@mail.gmail.com>
 <20240330153722.65104301@gandalf.local.home>
In-Reply-To: <20240330153722.65104301@gandalf.local.home>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Mon, 1 Apr 2024 10:28:17 +0800
Message-ID: <CALz3k9j_RGqSMdN+GvbHEjRqMWYe4R9VNZRANG7jbfL_jVpoVg@mail.gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
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

T24gU3VuLCBNYXIgMzEsIDIwMjQgYXQgMzozNOKAr0FNIFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0
QGdvb2RtaXMub3JnPiB3cm90ZToKPgo+IE9uIFNhdCwgMzAgTWFyIDIwMjQgMTE6MTg6MjkgKzA4
MDAKPiDmoqbpvpnokaMgPGRvbmdtZW5nbG9uZy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4g
PiA+IElmIHlvdSByZWFsbHkgd2FudCB0byBoYXZlIHRob3VzYW5kcyBvZiBmdW5jdGlvbnMsIHdo
eSBub3QganVzdCByZWdpc3RlciBpdAo+ID4gPiB3aXRoIGZ0cmFjZSBpdHNlbGYuIEl0IHdpbGwg
Z2l2ZSB5b3UgdGhlIGFyZ3VtZW50cyB2aWEgdGhlIGZ0cmFjZV9yZWdzCj4gPiA+IHN0cnVjdHVy
ZS4gQ2FuJ3QgeW91IGp1c3QgcmVnaXN0ZXIgYSBwcm9ncmFtIGFzIHRoZSBjYWxsYmFjaz8KPiA+
ID4KPiA+Cj4gPiBFbm5uLi4uSSBkb24ndCB1bmRlcnN0YW5kLiBUaGUgbWFpbiBwdXJwb3NlIGZv
cgo+ID4gbWUgdG8gdXNlIFRSQUNJTkcgaXM6Cj4gPgo+ID4gMS4gd2UgY2FuIGRpcmVjdGx5IGFj
Y2VzcyB0aGUgbWVtb3J5LCB3aGljaCBpcyBtb3JlCj4gPiAgICBlZmZpY2llbnQuCj4KPiBJJ20g
bm90IHN1cmUgd2hhdCB5b3UgbWVhbiBieSB0aGUgYWJvdmUuIEFjY2VzcyB3aGF0IG1lbW9yeT8K
PgoKV2UgbmVlZCB0byB1c2UgdGhlIGhlbHBlciBvZiBicGZfcHJvYmVfcmVhZF9rZXJuZWwKd2hl
biB3ZSByZWFkICJza2ItPnNrIiBpbiBrcHJvYmUsIGFuZCB0aGUgInNrYiIgaXMgdGhlCjFzdCBh
cmcgaW4gaXBfcmN2KCkuIEFuZCB3ZSBjYW4gZGlyZWN0bHkgcmVhZCAic2tiLT5zayIKaW4gdHJh
Y2luZywgd2hpY2ggaXMgbW9yZSBlZmZpY2llbnQuIElzbid0IGl0PwoKPiA+IDIuIHdlIGNhbiBv
YnRhaW4gdGhlIGZ1bmN0aW9uIGFyZ3MgaW4gRkVYSVQsIHdoaWNoCj4gPiAgICAga3JldHByb2Jl
IGNhbid0IGRvIGl0LiBBbmQgdGhpcyBpcyB0aGUgbWFpbiByZWFzb24uCj4KPiBJIGRpZG4ndCBt
ZW50aW9uIGtyZXRwcm9iZS4gSWYgeW91IG5lZWQgYWNjZXNzIHRvIHRoZSBleGl0IG9mIHRoZSBm
dW5jdGlvbiwKPiB5b3UgY2FuIHVzZSBNYXNhbWkncyBmZ3JhcGggdXBkYXRlLgo+Cj4gIGZlbnRy
eSAtPiBmdHJhY2VfdHJhbXBvbGluZSAtPiB5b3VyX2NvZGUKPgo+IEZvciBmZ3JhcGg6Cj4KPiAg
ZmVudHJ5IC0+IGZ0cmFjZV90cmFtcG9saW5lIC0+IGZncmFwaCBbc2V0cyB1cCByZXR1cm4gY2Fs
bF0gLT4geW91cl9lbnRyeV9jb2RlCj4KPiAgZnVuY3Rpb24gcmV0IC0+IGZncmFwaF9yZXRfaGFu
ZGxlciAtPiB5b3VyX2V4aXRfY29kZQo+Cj4gQW5kIHlvdSB3aWxsIGJlIGFibGUgdG8gcGFzcyBk
YXRhIGZyb20gdGhlIGVudHJ5IHRvIHRoZSBleGl0IGNvZGUsCj4gaW5jbHVkaW5nIHBhcmFtZXRl
cnMuCgpZZWFoLCB0aGUgZmdyYXBoIHNvdW5kcyBsaWtlIGEgbmljZSBzb2x1dGlvbiB0byBteSBw
cm9ibGVtLgpJJ2xsIGhhdmUgYSB0cnkgb24gaXQuCgpUaGFua3MhCk1lbmdsb25nIERvbmcKCj4K
PiAtLSBTdGV2ZQo+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
