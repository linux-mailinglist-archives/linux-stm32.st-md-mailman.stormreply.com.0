Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4818927C9
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Mar 2024 00:28:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5253FC6C83D;
	Fri, 29 Mar 2024 23:28:49 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1470C6C83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Mar 2024 23:28:47 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-5d4d15ec7c5so1764207a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Mar 2024 16:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711754926; x=1712359726;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rvV1tZGanDBSafK6edOdycvbQYDEdHbTCxngJvsvk3c=;
 b=UbjEjGtG4iSwSXtwPxUKIOsF9F+ZDLJvBVciMFlcUHK5J9djk+FPHdcLpDqAhbdY7a
 CAFkyAxUND8poywP0SeWdN5CLeLfDyfyZEHEMjqPlY4Wp6QhOKklwUdNMDLCV2cm/bxb
 2knANJSRVAMviee0v5K2uk9KGQuoD08hcUVfYSLyg5v57Q41Ly1u/AvYqqWIsMXD6fQl
 Tt937yuNbS5+vaMvqvtuO+5t337TZHmMuji9hPw2GUdqJ/1YtkoDIqpYzCU/IuF4NIBr
 4qXwDdpLslWcEwWoFHTqwmJtZIdZ7P8Wnrps6p+NN4ewZbCT1jyrSe+jFW7Lbn6JzIo0
 6akQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711754926; x=1712359726;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rvV1tZGanDBSafK6edOdycvbQYDEdHbTCxngJvsvk3c=;
 b=c85NLNZBbw6ukZ4rLzTNEzzknubf4Z4zvZSBFELMc+8qc18H6BQzQlZ/Is7R/J1MWp
 BOcLXbBeImzo/yko7lOAOVbCiTiM0k9aBpx1Qw0KUNd0HtPfzpJDA9EK7dISymkZc+P2
 qVhF6Z1y1/eI00jTF6dj85M2ftGxsNZZljybCEP2IDmZ7jeID7YIGztm7QDFsryYXl0s
 Q/5wXaQ5lW8QLdP2yrFObMjTI2z2hZYqcG3gIEeeRdFTyDtNzCbOuIcS4aeOZNTqNb4o
 zVgGy50ROw5t+4WLgI1fWVsnXs6wuja6yMNcNnbBGuOh3d1aCAetwErHqM4t6RrNNOod
 K+2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCULyxy1NBrKI1nyTvNqWFrFvQdUWd4rr9FNjv72B9qw7MxsvRQ1Y+g3Q46UEnjpeHJQzvKq5kJvo7FGqPK3AF/fzmgjFMYbc0xJHpm+USyC6Lp0chZ8p1x6
X-Gm-Message-State: AOJu0Yxly6CXjlLg9OH2A3fLaA9piwIvhppdAxS/M0SNG0P6k/pDqZyC
 wGRqpnhsQwRiGyvBpJs/34BXQEte56kGG6jDHsCPQ1y1yZnO7eTWhgntYcau0hRcEsTZyxP/IfX
 skI8JoKNHqiEWP/qM6e3KNmRNqfE=
X-Google-Smtp-Source: AGHT+IFNbTnA2C1UowyvpIWfWMecar3RYOVPJRlOoVy5NMmPOOKB6ZhvqfzCxbpKkf/w3Z3THbX/GA+A1iwjf07EvPY=
X-Received: by 2002:a17:90a:be04:b0:2a2:1415:723d with SMTP id
 a4-20020a17090abe0400b002a21415723dmr3177860pjs.42.1711754926271; Fri, 29 Mar
 2024 16:28:46 -0700 (PDT)
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
In-Reply-To: <20240328111330.194dcbe5@gandalf.local.home>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 29 Mar 2024 16:28:33 -0700
Message-ID: <CAEf4BzYgzOti+Hfdn3SUCjuofGedXRSGApVDD+K2TdG6oNE-pw@mail.gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Alexei Starovoitov <ast@kernel.org>,
 Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 linux-s390 <linux-s390@vger.kernel.org>,
 =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>,
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

T24gVGh1LCBNYXIgMjgsIDIwMjQgYXQgODoxMOKAr0FNIFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0
QGdvb2RtaXMub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgMjggTWFyIDIwMjQgMjI6NDM6NDYgKzA4
MDAKPiDmoqbpvpnokaMgPGRvbmdtZW5nbG9uZy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4g
PiBJIGhhdmUgZG9uZSBhIHNpbXBsZSBiZW5jaG1hcmsgb24gY3JlYXRpbmcgMTAwMAo+ID4gdHJh
bXBvbGluZXMuIEl0IGlzIHNsb3csIHF1aXRlIHNsb3csIHdoaWNoIGNvbnN1bWUgdXAgdG8KPiA+
IDYwcy4gV2UgY2FuJ3QgZG8gaXQgdGhpcyB3YXkuCj4gPgo+ID4gTm93LCBJIGhhdmUgYSBiYWQg
aWRlYS4gSG93IGFib3V0IHdlIGludHJvZHVjZQo+ID4gYSAiZHluYW1pYyB0cmFtcG9saW5lIj8g
VGhlIGJhc2ljIGxvZ2ljIG9mIGl0IGNhbiBiZToKPiA+Cj4gPiAiIiIKPiA+IHNhdmUgcmVncwo+
ID4gYnBmcyA9IHRyYW1wb2xpbmVfbG9va3VwX2lwKGlwKQo+ID4gZmVudHJ5ID0gYnBmcy0+ZmVu
dHJpZXMKPiA+IHdoaWxlIGZlbnRyeToKPiA+ICAgZmVudHJ5KGN0eCkKPiA+ICAgZmVudHJ5ID0g
ZmVudHJ5LT5uZXh0Cj4gPgo+ID4gY2FsbCBvcmlnaW4KPiA+IHNhdmUgcmV0dXJuIHZhbHVlCj4g
Pgo+ID4gZmV4aXQgPSBicGZzLT5mZXhpdHMKPiA+IHdoaWxlIGZleGl0Ogo+ID4gICBmZXhpdChj
dHgpCj4gPiAgIGZleGl0ID0gZmV4aXQtPm5leHQKPiA+Cj4gPiB4eHh4eHgKPiA+ICIiIgo+ID4K
PiA+IEFuZCB3ZSBsb29rdXAgdGhlICJicGZzIiBieSB0aGUgZnVuY3Rpb24gaXAgaW4gYSBoYXNo
IG1hcAo+ID4gaW4gdHJhbXBvbGluZV9sb29rdXBfaXAuIFRoZSB0eXBlIG9mICJicGZzIiBpczoK
PiA+Cj4gPiBzdHJ1Y3QgYnBmX2FycmF5IHsKPiA+ICAgc3RydWN0IGJwZl9wcm9nICpmZW50cmll
czsKPiA+ICBzdHJ1Y3QgYnBmX3Byb2cgKmZleGl0czsKPiA+ICAgc3RydWN0IGJwZl9wcm9nICpt
b2RpZnlfcmV0dXJuczsKPiA+IH0KPiA+Cj4gPiBXaGVuIHdlIG5lZWQgdG8gYXR0YWNoIHRoZSBi
cGYgcHJvZ0EgdG8gZnVuY3Rpb24gQS9CL0MsCj4gPiB3ZSBvbmx5IG5lZWQgdG8gY3JlYXRlIHRo
ZSBicGZfYXJyYXlBLCBicGZfYXJyYXlCLCBicGZfYXJyYXlDCj4gPiBhbmQgYWRkIHRoZSBwcm9n
QSB0byB0aGVtLCBhbmQgaW5zZXJ0IHRoZW0gdG8gdGhlIGhhc2ggbWFwCj4gPiAiZGlyZWN0X2Nh
bGxfYnBmcyIsIGFuZCBhdHRhY2ggdGhlICJkeW5hbWljIHRyYW1wb2xpbmUiIHRvCj4gPiBBL0Iv
Qy4gSWYgYnBmX2FycmF5QSBleGlzdCwganVzdCBhZGQgcHJvZ0EgdG8gdGhlIHRhaWwgb2YKPiA+
IGJwZl9hcnJheUEtPmZlbnRyaWVzLiBXaGVuIHdlIG5lZWQgdG8gYXR0YWNoIHByb2dCIHRvCj4g
PiBCL0MsIGp1c3QgYWRkIHByb2dCIHRvIGJwZl9hcnJheUItPmZlbnRyaWVzIGFuZAo+ID4gYnBm
X2FycmF5Qi0+ZmVudHJpZXMuCj4gPgo+ID4gQ29tcGFyZWQgdG8gdGhlIHRyYW1wb2xpbmUsIGV4
dHJhIG92ZXJoZWFkIGlzIGludHJvZHVjZWQKPiA+IGJ5IHRoZSBoYXNoIGxvb2t1cGluZy4KPiA+
Cj4gPiBJIGhhdmUgbm90IGJlZ3VuIHRvIGNvZGUgeWV0LCBhbmQgSSBhbSBub3Qgc3VyZSB0aGUg
b3ZlcmhlYWQgaXMKPiA+IGFjY2VwdGFibGUuIENvbnNpZGVyaW5nIHRoYXQgd2UgYWxzbyBuZWVk
IHRvIGRvIGhhc2ggbG9va3VwCj4gPiBieSB0aGUgZnVuY3Rpb24gaW4ga3Byb2JlX211bHRpLCBt
YXliZSB0aGUgb3ZlcmhlYWQgaXMKPiA+IGFjY2VwdGFibGU/Cj4KPiBTb3VuZHMgbGlrZSB5b3Ug
YXJlIGp1c3QgcmVjcmVhdGluZyB0aGUgZnVuY3Rpb24gbWFuYWdlbWVudCB0aGF0IGZ0cmFjZQo+
IGhhcy4gSXQgYWxzbyBjYW4gYWRkIHRob3VzYW5kcyBvZiB0cmFtcG9saW5lcyB2ZXJ5IHF1aWNr
bHksIGJlY2F1c2UgaXQgZG9lcwo+IGl0IGluIGJhdGNoZXMuIEl0IHRha2VzIHNwZWNpYWwgc3lu
Y2hyb25pemF0aW9uIHN0ZXBzIHRvIGF0dGFjaCB0byBmZW50cnkuCj4gZnRyYWNlIChhbmQgSSBi
ZWxpZXZlIG11bHRpLWtwcm9iZXMpIHVwZGF0ZXMgYWxsIHRoZSBhdHRhY2htZW50cyBmb3IgZWFj
aAo+IHN0ZXAsIHNvIHRoZSBzeW5jaHJvbml6YXRpb24gbmVlZGVkIGlzIG9ubHkgZG9uZSBvbmNl
Lgo+Cj4gSWYgeW91IHJlYWxseSB3YW50IHRvIGhhdmUgdGhvdXNhbmRzIG9mIGZ1bmN0aW9ucywg
d2h5IG5vdCBqdXN0IHJlZ2lzdGVyIGl0Cj4gd2l0aCBmdHJhY2UgaXRzZWxmLiBJdCB3aWxsIGdp
dmUgeW91IHRoZSBhcmd1bWVudHMgdmlhIHRoZSBmdHJhY2VfcmVncwo+IHN0cnVjdHVyZS4gQ2Fu
J3QgeW91IGp1c3QgcmVnaXN0ZXIgYSBwcm9ncmFtIGFzIHRoZSBjYWxsYmFjaz8KPgo+IEl0IHdp
bGwgcHJvYmFibHkgbWFrZSB5b3VyIGFjY291bnRpbmcgbXVjaCBlYXNpZXIsIGFuZCBqdXN0IGxl
dCBmdHJhY2UKPiBoYW5kbGUgdGhlIGZlbnRyeSBsb2dpYy4gVGhhdCdzIHdoYXQgaXQgd2FzIG1h
ZGUgdG8gZG8uCj4KCkkgdGhvdWdodCBJJ2xsIGp1c3QgYXNrIGluc3RlYWQgb2YgZGlnZ2luZyB0
aHJvdWdoIGNvZGUsIHNvcnJ5IGZvcgpiZWluZyBsYXp5IDopIElzIHRoZXJlIGFueSB3YXkgdG8g
cGFzcyBwdF9yZWdzL2Z0cmFjZV9yZWdzIGNhcHR1cmVkCmJlZm9yZSBmdW5jdGlvbiBleGVjdXRp
b24gdG8gYSByZXR1cm4gcHJvYmUgKGZleGl0L2tyZXRwcm9iZSk/IEkuZS4sCmhvdyBoYXJkIGlz
IGl0IHRvIHBhc3MgaW5wdXQgZnVuY3Rpb24gYXJndW1lbnRzIHRvIGEga3JldHByb2JlPyBUaGF0
J3MKdGhlIGJpZ2dlc3QgYWR2YW50YWdlIG9mIGZleGl0IG92ZXIga3JldHByb2JlLCBhbmQgaWYg
d2UgY2FuIG1ha2UKdGhlc2Ugb3JpZ2luYWwgcHRfcmVncy9mdHJhY2VfcmVncyBhdmFpbGFibGUg
dG8ga3JldHByb2JlLCB0aGVuCm11bHRpLWtyZXRwcm9iZSB3aWxsIGVmZmVjdGl2ZWx5IGJlIHRo
aXMgbXVsdGktZmV4aXQuCgo+IC0tIFN0ZXZlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
