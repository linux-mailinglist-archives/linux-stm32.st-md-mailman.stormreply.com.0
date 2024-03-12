Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B5A878D38
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Mar 2024 03:56:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3ECC1C6DD73;
	Tue, 12 Mar 2024 02:56:35 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB462C6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 02:56:33 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-29bf998872fso1081554a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 19:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1710212192; x=1710816992;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8duYlw7yiLaMQiEjvPs64/nXpWh4xT1l7do/uy0Ifvk=;
 b=V0xA7NWl8l4PVlzwJUO6v1cbkyA+10LKZcYqMj5C+VXSTgr/6wz1nZKGWVkJFxF+cN
 60+jgcSH8bj1q9p7mpfS6LJdp8RNMEVWzL7MyuO9VkVckyz1W2QvmvKOW8Y6PvT30upp
 2KXMTOcmNWTu9sF7ccw94opQCMjWK3T5P6W+vpfm6g7Wqj2A2umoHLkxZvyLkBMUE870
 ++V6s2b9EQbVwMr2h/u821XADUkxClbfUgyl0QsXhUkMYZvV/py5qSo/VG28Vi0ums3w
 xDyxaI1N1dq/qj0OjbpobfkdgeCE4OEheshpqW0ZmCwcdYhE8k4b+YbQdPWDfQR05e84
 eP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710212192; x=1710816992;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8duYlw7yiLaMQiEjvPs64/nXpWh4xT1l7do/uy0Ifvk=;
 b=wfn0+UsZ+wHVA3eJ6PgtX5xcEGtLfb1zbnIWMBuwAXt8o8kAZnAcWmAFLMd55cApMn
 nANHtppvDJ3j10S5qSgk1wtcoGXCGD1nwAsEu7oUZzvkNtU8y/i7wsxOOAANO9FeoZxL
 w8ymplchI/RXLzkBARxTe/KYi0qUBBOaNCxNIrmzyTzlNpSz+zzxoXt6bJ0Bc+EBgTdb
 aULmABQAhYcfZjxqrEz8BrKtT0gz2d372SOnRtvxMZck4q0tdEYWHOcfHp5ILEJf7Alx
 7IG6bq0e3/ZgQEKe57x1NZETkGJLj7VjEb7qJjS4fGLMaDEpWfm85MD6hedEmSGZ9jpH
 2UWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhj921s+7YpdebEGb1d9Z8CYBnNtfkYZ1k6UKYeks968XMczKrBSSPgI7WzBDm3USUp3bwEoRkD7U5ZQt1qKFVIHX9Xclg4zvUHFWojysGVbRJ6Hi3GTI1
X-Gm-Message-State: AOJu0Yx7/3sYexGJpCDxTfurSQ/342Nea6+siSpSRcP2klUecB97LOar
 flG9edBJrBXGZGS7rr2otq1CZ1tMvSRU2Ko794BEptIRYJSlfP+A7J5saGEf9TBp3FyQYFcjTjL
 kKsSyAUYXJ26Nk6ZvB2SsHZHZZmScqonq+DBAyw==
X-Google-Smtp-Source: AGHT+IEEbNdZpfvWrZfgFQVH2ecv7uQ4oHjBsb6d+e9PBZQkR1FkO3HlcgN1IPWibJVLKEs+f74flvYnRRAAWujNw0M=
X-Received: by 2002:a17:90a:f305:b0:299:63fe:3a27 with SMTP id
 ca5-20020a17090af30500b0029963fe3a27mr5454778pjb.19.1710212192599; Mon, 11
 Mar 2024 19:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-8-dongmenglong.8@bytedance.com>
 <CAADnVQK4tdefa3s=sim69Sc+ztd-hHohPEDXaUNVTU-mLNYUiw@mail.gmail.com>
 <CALz3k9iabeOwHSrPb9mkfCuOebanh3+bAfi7xh3kBBN0DzHC3A@mail.gmail.com>
 <CAADnVQKsrLB-2bD53R4ZdzUVdx1aqkgom1rzGCGKK0M3Uc+csQ@mail.gmail.com>
In-Reply-To: <CAADnVQKsrLB-2bD53R4ZdzUVdx1aqkgom1rzGCGKK0M3Uc+csQ@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Tue, 12 Mar 2024 10:56:21 +0800
Message-ID: <CALz3k9jJtxVRmgGM4F-33m1wp=aCShnqdaX+7pZ9UmHwntFgXw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [External] Re: [PATCH bpf-next v2 7/9] libbpf:
 don't free btf if program of multi-link tracing existing
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgMTA6MTPigK9BTSBBbGV4ZWkgU3Rhcm92b2l0b3YKPGFs
ZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXIgMTEsIDIw
MjQgYXQgNzowNeKAr1BNIOaipum+meiRoyA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4g
d3JvdGU6Cj4gPgo+ID4gPiA+Cj4gPiA+ID4gK0xJQkJQRl9BUEkgdm9pZCBicGZfb2JqZWN0X19m
cmVlX2J0ZnMoc3RydWN0IGJwZl9vYmplY3QgKm9iaik7Cj4gPiA+ID4gKwo+ID4gPgo+ID4gPiBJ
dCBzaG91bGRuJ3QgYmUgZXhwb3J0ZWQuCj4gPiA+IGxpYmJwZiBzaG91bGQgY2xlYW4gaXQgdXAg
d2hlbiBicGZfb2JqZWN0IGlzIGZyZWVkLgo+ID4KPiA+IFllcywgbGliYnBmIHdpbGwgY2xlYW4g
dXAgdGhlIGJ0ZnMgd2hlbiBicGZfb2JqZWN0IGlzIGZyZWVkIGluCj4gPiB0aGlzIGNvbW1pdC4g
QW5kIEknbSB0cnlpbmcgdG8gb2ZmZXIgYSB3YXkgdG8gZWFybHkgZnJlZSB0aGUgYnRmcwo+ID4g
YnkgdGhlIHVzZXJzIG1hbnVhbCB0byByZWR1Y2UgdGhlIG1lbW9yeSB1c2FnZS4gT3IsIHRoZQo+
ID4gYnRmcyB0aGF0IHdlIG9wZW5lZCB3aWxsIGtlZXAgZXhpc3RpbmcgdW50aWwgd2UgY2xvc2Ug
dGhlCj4gPiBicGZfb2JqZWN0Lgo+ID4KPiA+IFRoaXMgaXMgb3B0aW9uYWwsIEkgY2FuIHJlbW92
ZSBpdCBpZiB5b3UgcHJlZmVyLgo+Cj4gTGV0J3Mgbm90IGV4dGVuZCBsaWJicGYgYXBpIHVubGVz
cyB3ZSByZWFsbHkgbmVlZCB0by4KPiBicGZfcHJvZ3JhbV9fYXR0YWNoX3RyYWNlX211bHRpX29w
dHMoKSBhbmQKPiAqc2tlbCpfX2F0dGFjaCgpIGNhbiBwcm9iYWJseSBmcmVlIHRoZW0uCgpUaGF0
J3MgYSBnb29kIGlkZWEhIFNob3VsZCB3ZSBhZGQgYSAiYm9vbCBmcmVlX2J0ZiIgZmllbGQKdG8g
c3RydWN0IGJwZl90cmFjZV9tdWx0aV9vcHRzPyBicGZfcHJvZ3JhbV9fYXR0YWNoX3RyYWNlX211
bHRpX29wdHMoKQpjYW4gYmUgY2FsbGVkIG11bHRpIHRpbWVzIGZvciBhIGJwZl9vYmplY3QsIHdo
aWNoIGhhcyBtdWx0aSBicGYKcHJvZ3JhbSBvZiB0eXBlIHRyYWNpbmcgbXVsdGktbGluay4gT3Is
IGNhbiB3ZSBmcmVlIHRoZSBidGZzCmF1dG9tYXRpY2FsbHkgaWYgd2UgZm91bmQgYWxsIHRyYWNp
bmcgbXVsdGktbGluayBwcm9ncmFtcyBhcmUgYXR0YWNoZWQ/CgpUaGFua3MhCk1lbmdsb25nIERv
bmcKCj4gSSBkb24ndCBzZWUgYSB1c2UgY2FzZSB3aGVyZSB5b3UnZCB3YW50IHRvIGtlZXAgdGhl
bSBhZnRlcndhcmRzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
