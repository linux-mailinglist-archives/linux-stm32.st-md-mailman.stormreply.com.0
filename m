Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C082878D16
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Mar 2024 03:44:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58F17C6DD73;
	Tue, 12 Mar 2024 02:44:21 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D09AC6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 02:44:19 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-29c2880c8b6so620683a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 19:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1710211458; x=1710816258;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n2/zqf8TfkF7fmO3ryrALVmJ2Vqgii1SZQQKBoGp30M=;
 b=absVmQqS1jGhmwlyTQy8H/0zG+EVlcGVyzgCS3SPCMtuiGVmcO4K6r6NkuaNcAtiG2
 IqLp7QYlbxS4vV5cAaqCYcJuazePgbnlUw2Ug7o3QJIXZBHRAutm+RwV/GK4VzAQGV6+
 xambGQ62bY0BfSziBRa/N+pvhGYXVWjI3oC4HqLQ2PQ9Lh28JToiaSwBIRnv7KhoMtjk
 4fYU/CN/aTE6BkQboGLQZBjtw897bJQAxCh3tKWbD/+JytH8ESO+JFEHqovx/4mrPksf
 hDEwnxiUQPXfd1E7QGdTWd46wDmgCDIMFrNk2CmhFz5hSq/m1mKxQuIw3LPwPxs2ptDm
 petg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710211458; x=1710816258;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n2/zqf8TfkF7fmO3ryrALVmJ2Vqgii1SZQQKBoGp30M=;
 b=LspR4k2TWrWswJI3CwvUFiO53RnQytyjQffiIlZtT5ZeveuLR0QRRYLkHjQl+n0lm8
 9rp2Dmu6MYU5CHsxE3ZHDulGImlHxsh7iVGo0MfdqBSS7daw9l+h4Su1Q0emhzEQuwwQ
 8+R4/l1hZ/BmmZ/nk9PMiQr7gPK8gog1XysUpiyiSYw/g7X5t5YGJyn6jN9y1CmQFV2o
 MI3+vywIL8tVzNmde/y6mkCKnZtiAj2tWCEX+vlYTH6d31aK9+nQGPS6ev2eqwKmWIqp
 zwOs7auGNOeZgi/YNyaIGVnoMcwsJoVyIlduvYpWWWKd3Agzg2tGjhLRcMCx4ioQab14
 queA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+YZ5nlAWYnszseyrpHa56WHvuM1CE1dQiO4YMVhZh1Sb55443y0eHh4KcYGVcnUGjHwq1zrrda4HjlT6CNkvL7vIvGOYgM1hT8XlnmpVOmpMvK2G4cJgS
X-Gm-Message-State: AOJu0YwXGr6peuVDMwvH2YBGO8i20JvK/6m3iiIIbJNML3tl39Xii9lg
 jFKMs8GlovGrl3+m7LMWSj2J/0Y6/WPeMjFLQR02udA/Wm1oyvPgrgLTJMlgwv0dTdaeBHC4F5z
 T/Wz76HYK/s6ZqEvdlvkvbeAQm5A0nwBOs+IyeA==
X-Google-Smtp-Source: AGHT+IGvIums+DTS3WHK+W5NCGfLkPUVfEDar4QbCGrncl6WQdDDS8a1T8ll9cvRYezwajGoT7cszDUrP5tYmNtBalM=
X-Received: by 2002:a17:90b:3ec9:b0:29c:4082:2d0b with SMTP id
 rm9-20020a17090b3ec900b0029c40822d0bmr49744pjb.28.1710211457742; Mon, 11 Mar
 2024 19:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-9-dongmenglong.8@bytedance.com>
 <CAADnVQK+s3XgSYhpSdh7_9Qhq4DimmSO-D9d5+EsSZQMX4TxxA@mail.gmail.com>
In-Reply-To: <CAADnVQK+s3XgSYhpSdh7_9Qhq4DimmSO-D9d5+EsSZQMX4TxxA@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Tue, 12 Mar 2024 10:44:06 +0800
Message-ID: <CALz3k9hZxsbUGoe5JoWpMEV0URykRwiKWLKZNj4nhvnXg3V=Zg@mail.gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Alexei Starovoitov <ast@kernel.org>,
 Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, X86 ML <x86@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
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
Subject: Re: [Linux-stm32] [External] Re: [PATCH bpf-next v2 8/9] libbpf:
 add support for the multi-link of tracing
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgOTo1NuKAr0FNIEFsZXhlaSBTdGFyb3ZvaXRvdgo8YWxl
eGVpLnN0YXJvdm9pdG92QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE1hciAxMSwgMjAy
NCBhdCAyOjM14oCvQU0gTWVuZ2xvbmcgRG9uZwo+IDxkb25nbWVuZ2xvbmcuOEBieXRlZGFuY2Uu
Y29tPiB3cm90ZToKPiA+Cj4gPgo+ID4gLSAgICAgICAgICAgICAgIGVyciA9IGxpYmJwZl9maW5k
X2F0dGFjaF9idGZfaWQocHJvZywgYXR0YWNoX25hbWUsICZidGZfb2JqX2ZkLCAmYnRmX3R5cGVf
aWQpOwo+ID4gKyAgICAgICAgICAgICAgIG5hbWVfZW5kID0gc3RyY2hyKGF0dGFjaF9uYW1lLCAn
LCcpOwo+ID4gKyAgICAgICAgICAgICAgIC8qIGZvciBtdWx0aS1saW5rIHRyYWNpbmcsIHVzZSB0
aGUgZmlyc3QgdGFyZ2V0IHN5bWJvbCBkdXJpbmcKPiA+ICsgICAgICAgICAgICAgICAgKiBsb2Fk
aW5nLgo+ID4gKyAgICAgICAgICAgICAgICAqLwo+ID4gKyAgICAgICAgICAgICAgIGlmICgoZGVm
ICYgU0VDX0FUVEFDSF9CVEZfTVVMVEkpICYmIG5hbWVfZW5kKSB7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBpbnQgbGVuID0gbmFtZV9lbmQgLSBhdHRhY2hfbmFtZSArIDE7Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBjaGFyICpmaXJzdF90Z3Q7Cj4gPiArCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICBmaXJzdF90Z3QgPSBtYWxsb2MobGVuKTsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGlmICghZmlyc3RfdGd0KQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVOT01FTTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0cm5jcHko
Zmlyc3RfdGd0LCBhdHRhY2hfbmFtZSwgbGVuKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGZpcnN0X3RndFtsZW4gLSAxXSA9ICdcMCc7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBl
cnIgPSBsaWJicGZfZmluZF9hdHRhY2hfYnRmX2lkKHByb2csIGZpcnN0X3RndCwgJmJ0Zl9vYmpf
ZmQsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZidGZfdHlwZV9pZCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBmcmVlKGZp
cnN0X3RndCk7Cj4gPiArICAgICAgICAgICAgICAgfSBlbHNlIHsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGVyciA9IGxpYmJwZl9maW5kX2F0dGFjaF9idGZfaWQocHJvZywgYXR0YWNoX25h
bWUsICZidGZfb2JqX2ZkLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAmYnRmX3R5cGVfaWQpOwo+ID4gKyAgICAgICAgICAgICAgIH0K
Pgo+IFBscyB1c2UgZ2xvYl9tYXRjaCB0aGUgd2F5IFtrdV1wcm9iZSBtdWx0aSBhcmUgZG9pbmcK
PiBpbnN0ZWFkIG9mIGV4YWN0IG1hdGNoLgoKSGVsbG8sCgpJJ20gYSBsaXR0bGUgc3VzcGVjdGlu
ZyB0aGUgZWZmZWN0IG9mIGdsb2JfbWF0Y2guIEkgc2VsZG9tIGZvdW5kCnRoZSB1c2UgY2FzZSB0
aGF0IHRoZSBrZXJuZWwgZnVuY3Rpb25zIHdoaWNoIHdlIHdhbnQgdG8gdHJhY2UKaGF2ZSB0aGUg
c2FtZSBuYW1pbmcgcGF0dGVybi4gQW5kIHRoZSBleGFjdCBtYXRjaCBzZWVtcyBtb3JlCnVzZWZ1
bC4KCkNhbiB3ZSB1c2UgYm90aCBleGFjdCBhbmQgZ2xvYiBtYXRjaCBoZXJlPwoKVGhhbmtzIQpN
ZW5nbG9uZyBEb25nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
