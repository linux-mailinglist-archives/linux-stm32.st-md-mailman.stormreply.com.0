Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E712892904
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Mar 2024 04:35:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9CCEC6C83D;
	Sat, 30 Mar 2024 03:35:19 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A7E4C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Mar 2024 03:35:18 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-29e0229d6b5so1989284a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Mar 2024 20:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1711769716; x=1712374516;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nQY9GynfzjdgI1A44B4TVgDxB7Pe9LKkrSIu40Cboqk=;
 b=X5i1S5OeaKdT6K2T7Cvs9V96S3CQOBrbO9V9EOfJmI6A4Pc1EoTlfcrs3ueWQc2dON
 M5QGMD3RRgpbcVTf8ioeRFwCPV9JzvbBRc8gc9Qr3UMhr5U5sXyCwGly1RJKbWuzs8QV
 VJ2rYEp8z8+zM3RfBM63HN4/nlFA6EOQZcb4CgprHA/9gQk1dB6LISYq80rFJbUVwRO0
 /BzUTMidvlqdwXbbl63T85tSE7yfegticLlkPaFQhrbHKz1CGqeFZQyDga5IuToPif65
 bUAQqnwX0pUsK8HA4As02SB2mssqpqwvkXS/ajGAgEhy68E93xTlfHHrfpb4FOpA/dJ3
 1fuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711769716; x=1712374516;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nQY9GynfzjdgI1A44B4TVgDxB7Pe9LKkrSIu40Cboqk=;
 b=UBsILTLz4l0SDmqtZwZ31425fpwWfQ14Mcn8BlVZ9p1lcQqEEz0MCZRFWzjmXLSodb
 HMpqUJLUDc+sby8ZkYpo0dm2qZFiLAl3h01AkWHwxt6KiyrWRNh2y6nRdbusTa4ayHlC
 crLQUEiWKBnOs+qvqhHLA8u+96o9FeA+dsg67MYsDtcGAelE5wuBBFRL1A9RSAo5Icvm
 EjiMHvRxc/re+PUtp9lbRDZHHVHCxuq1MYF6MaFbn+wDqpbA331k7xkpMwQ77hRmWuhw
 QQXlJ5TUOYbxnwLsBd9pvsasEi5mhJU8qCyJyxhXM+FxcMRtjAouAtfX7rwC6CPCooFt
 97Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/84zhdJQeHPauCFCLRirZVJTWiLt0Bm5M/ErlQeM0xfMtsDaL1rPT9rUKJUSUIkcKNB+82JRMVb+rjoNkmXiQbubLxt36Q7cvPybPJjHu+737BrSuKTXc
X-Gm-Message-State: AOJu0YzOdrfAPS/k0G9UE9LeFI+FQwcKmbUF8YAt75lV7ygt0Cqj9Yz1
 cRLxFdjJ6YMglmYd7pljRQyLsC3FglOg2Zvt6cKNAz81vT1S5q06/OHM8kysXviAa+f1jnYZvaw
 oISMO4mO+sAcJWwdW0GGH8yrllm2CUNjsJKAwRg==
X-Google-Smtp-Source: AGHT+IFQotfennixOm6ZOmiuiGgpegIwFVTzo5108kmA5lzvm5WNhtg5jy9iBOk0AMJbaUTPpapkU4prCLDmk6G3k3I=
X-Received: by 2002:a17:90a:474f:b0:29d:fe1c:79e7 with SMTP id
 y15-20020a17090a474f00b0029dfe1c79e7mr3306403pjg.45.1711769716617; Fri, 29
 Mar 2024 20:35:16 -0700 (PDT)
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
 <CAADnVQKsuV2OhT4rc+k=WDmVMQxbjDiC4+zNbre2Kpj1hod5xw@mail.gmail.com>
In-Reply-To: <CAADnVQKsuV2OhT4rc+k=WDmVMQxbjDiC4+zNbre2Kpj1hod5xw@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Sat, 30 Mar 2024 11:36:38 +0800
Message-ID: <CALz3k9j3aMpnuy3-6dPB9UiQ82LEE-bPapwJfotxX8DyAOc=iw@mail.gmail.com>
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
 Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>,
 bpf <bpf@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,
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

T24gRnJpLCBNYXIgMjksIDIwMjQgYXQgNzoxN+KAr0FNIEFsZXhlaSBTdGFyb3ZvaXRvdgo8YWxl
eGVpLnN0YXJvdm9pdG92QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE1hciAyOCwgMjAy
NCBhdCA4OjEw4oCvQU0gU3RldmVuIFJvc3RlZHQgPHJvc3RlZHRAZ29vZG1pcy5vcmc+IHdyb3Rl
Ogo+ID4KPiA+IE9uIFRodSwgMjggTWFyIDIwMjQgMjI6NDM6NDYgKzA4MDAKPiA+IOaipum+meiR
oyA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gPiBJIGhhdmUg
ZG9uZSBhIHNpbXBsZSBiZW5jaG1hcmsgb24gY3JlYXRpbmcgMTAwMAo+ID4gPiB0cmFtcG9saW5l
cy4gSXQgaXMgc2xvdywgcXVpdGUgc2xvdywgd2hpY2ggY29uc3VtZSB1cCB0bwo+ID4gPiA2MHMu
IFdlIGNhbid0IGRvIGl0IHRoaXMgd2F5Lgo+ID4gPgo+ID4gPiBOb3csIEkgaGF2ZSBhIGJhZCBp
ZGVhLiBIb3cgYWJvdXQgd2UgaW50cm9kdWNlCj4gPiA+IGEgImR5bmFtaWMgdHJhbXBvbGluZSI/
IFRoZSBiYXNpYyBsb2dpYyBvZiBpdCBjYW4gYmU6Cj4gPiA+Cj4gPiA+ICIiIgo+ID4gPiBzYXZl
IHJlZ3MKPiA+ID4gYnBmcyA9IHRyYW1wb2xpbmVfbG9va3VwX2lwKGlwKQo+ID4gPiBmZW50cnkg
PSBicGZzLT5mZW50cmllcwo+ID4gPiB3aGlsZSBmZW50cnk6Cj4gPiA+ICAgZmVudHJ5KGN0eCkK
PiA+ID4gICBmZW50cnkgPSBmZW50cnktPm5leHQKPiA+ID4KPiA+ID4gY2FsbCBvcmlnaW4KPiA+
ID4gc2F2ZSByZXR1cm4gdmFsdWUKPiA+ID4KPiA+ID4gZmV4aXQgPSBicGZzLT5mZXhpdHMKPiA+
ID4gd2hpbGUgZmV4aXQ6Cj4gPiA+ICAgZmV4aXQoY3R4KQo+ID4gPiAgIGZleGl0ID0gZmV4aXQt
Pm5leHQKPiA+ID4KPiA+ID4geHh4eHh4Cj4gPiA+ICIiIgo+ID4gPgo+ID4gPiBBbmQgd2UgbG9v
a3VwIHRoZSAiYnBmcyIgYnkgdGhlIGZ1bmN0aW9uIGlwIGluIGEgaGFzaCBtYXAKPiA+ID4gaW4g
dHJhbXBvbGluZV9sb29rdXBfaXAuIFRoZSB0eXBlIG9mICJicGZzIiBpczoKPiA+ID4KPiA+ID4g
c3RydWN0IGJwZl9hcnJheSB7Cj4gPiA+ICAgc3RydWN0IGJwZl9wcm9nICpmZW50cmllczsKPiA+
ID4gIHN0cnVjdCBicGZfcHJvZyAqZmV4aXRzOwo+ID4gPiAgIHN0cnVjdCBicGZfcHJvZyAqbW9k
aWZ5X3JldHVybnM7Cj4gPiA+IH0KPiA+ID4KPiA+ID4gV2hlbiB3ZSBuZWVkIHRvIGF0dGFjaCB0
aGUgYnBmIHByb2dBIHRvIGZ1bmN0aW9uIEEvQi9DLAo+ID4gPiB3ZSBvbmx5IG5lZWQgdG8gY3Jl
YXRlIHRoZSBicGZfYXJyYXlBLCBicGZfYXJyYXlCLCBicGZfYXJyYXlDCj4gPiA+IGFuZCBhZGQg
dGhlIHByb2dBIHRvIHRoZW0sIGFuZCBpbnNlcnQgdGhlbSB0byB0aGUgaGFzaCBtYXAKPiA+ID4g
ImRpcmVjdF9jYWxsX2JwZnMiLCBhbmQgYXR0YWNoIHRoZSAiZHluYW1pYyB0cmFtcG9saW5lIiB0
bwo+ID4gPiBBL0IvQy4gSWYgYnBmX2FycmF5QSBleGlzdCwganVzdCBhZGQgcHJvZ0EgdG8gdGhl
IHRhaWwgb2YKPiA+ID4gYnBmX2FycmF5QS0+ZmVudHJpZXMuIFdoZW4gd2UgbmVlZCB0byBhdHRh
Y2ggcHJvZ0IgdG8KPiA+ID4gQi9DLCBqdXN0IGFkZCBwcm9nQiB0byBicGZfYXJyYXlCLT5mZW50
cmllcyBhbmQKPiA+ID4gYnBmX2FycmF5Qi0+ZmVudHJpZXMuCj4gPiA+Cj4gPiA+IENvbXBhcmVk
IHRvIHRoZSB0cmFtcG9saW5lLCBleHRyYSBvdmVyaGVhZCBpcyBpbnRyb2R1Y2VkCj4gPiA+IGJ5
IHRoZSBoYXNoIGxvb2t1cGluZy4KPiA+ID4KPiA+ID4gSSBoYXZlIG5vdCBiZWd1biB0byBjb2Rl
IHlldCwgYW5kIEkgYW0gbm90IHN1cmUgdGhlIG92ZXJoZWFkIGlzCj4gPiA+IGFjY2VwdGFibGUu
IENvbnNpZGVyaW5nIHRoYXQgd2UgYWxzbyBuZWVkIHRvIGRvIGhhc2ggbG9va3VwCj4gPiA+IGJ5
IHRoZSBmdW5jdGlvbiBpbiBrcHJvYmVfbXVsdGksIG1heWJlIHRoZSBvdmVyaGVhZCBpcwo+ID4g
PiBhY2NlcHRhYmxlPwo+ID4KPiA+IFNvdW5kcyBsaWtlIHlvdSBhcmUganVzdCByZWNyZWF0aW5n
IHRoZSBmdW5jdGlvbiBtYW5hZ2VtZW50IHRoYXQgZnRyYWNlCj4gPiBoYXMuIEl0IGFsc28gY2Fu
IGFkZCB0aG91c2FuZHMgb2YgdHJhbXBvbGluZXMgdmVyeSBxdWlja2x5LCBiZWNhdXNlIGl0IGRv
ZXMKPiA+IGl0IGluIGJhdGNoZXMuIEl0IHRha2VzIHNwZWNpYWwgc3luY2hyb25pemF0aW9uIHN0
ZXBzIHRvIGF0dGFjaCB0byBmZW50cnkuCj4gPiBmdHJhY2UgKGFuZCBJIGJlbGlldmUgbXVsdGkt
a3Byb2JlcykgdXBkYXRlcyBhbGwgdGhlIGF0dGFjaG1lbnRzIGZvciBlYWNoCj4gPiBzdGVwLCBz
byB0aGUgc3luY2hyb25pemF0aW9uIG5lZWRlZCBpcyBvbmx5IGRvbmUgb25jZS4KPiA+Cj4gPiBJ
ZiB5b3UgcmVhbGx5IHdhbnQgdG8gaGF2ZSB0aG91c2FuZHMgb2YgZnVuY3Rpb25zLCB3aHkgbm90
IGp1c3QgcmVnaXN0ZXIgaXQKPiA+IHdpdGggZnRyYWNlIGl0c2VsZi4gSXQgd2lsbCBnaXZlIHlv
dSB0aGUgYXJndW1lbnRzIHZpYSB0aGUgZnRyYWNlX3JlZ3MKPiA+IHN0cnVjdHVyZS4gQ2FuJ3Qg
eW91IGp1c3QgcmVnaXN0ZXIgYSBwcm9ncmFtIGFzIHRoZSBjYWxsYmFjaz8KPiA+Cj4gPiBJdCB3
aWxsIHByb2JhYmx5IG1ha2UgeW91ciBhY2NvdW50aW5nIG11Y2ggZWFzaWVyLCBhbmQganVzdCBs
ZXQgZnRyYWNlCj4gPiBoYW5kbGUgdGhlIGZlbnRyeSBsb2dpYy4gVGhhdCdzIHdoYXQgaXQgd2Fz
IG1hZGUgdG8gZG8uCj4KPiBBYnNvbHV0ZWx5IGFncmVlLgo+IFRoZXJlIGlzIG5vIHBvaW50IHJl
LWludmVudGluZyB0aGlzIGxvZ2ljLgo+Cj4gTWVubG9uZywKPiBiZWZvcmUgeW91IGhvb2sgdXAg
aW50byBmdHJhY2UgY2hlY2sgd2hldGhlcgo+IGl0J3MgZ29pbmcgdG8gYmUgYW55IGRpZmZlcmVu
dCBmcm9tIGtwcm9iZS1tdWx0aSwKPiBzaW5jZSBpdCdzIHRoZSBzYW1lIGZ0cmFjZSB1bmRlcm5l
YXRoLgo+IEkgc3VzcGVjdCBpdCB3aWxsIGxvb2sgZXhhY3RseSB0aGUgc2FtZS4KClllYWgsIEkg
ZGlnIGl0IGEgbGl0dGxlLiBJIHRoaW5rIGl0IGlzIGRpZmZlcmVudC4gRm9yIG11bHRpLWtwcm9i
ZSwKaXQgcmVnaXN0ZXJzIGEgZnRyYWNlX29wcyB0byBmdHJhY2Vfb3BzX2xpc3QgZm9yIGV2ZXJ5
IGJwZgpwcm9ncmFtLiBUaGlzIG1lYW5zIHRoYXQgd2UgY2FuIHJlZ2lzdGVyIDIgb3IgbW9yZQpt
dWx0aS1rcHJvYmUgaW4gdGhlIHNhbWUgZnVuY3Rpb24uIFRoZSBicGYgaXMgY2FsbGVkIGluCnRo
ZSBmb2xsb3dpbmcgc3RlcDoKCmZ0cmFjZV9yZWdzX2NhbGxlcgp8Cl9fZnRyYWNlX29wc19saXN0
X2Z1bmMgLT4gZnByb2JlX2hhbmRsZXIgLT4ga3Byb2JlX211bHRpX2xpbmtfaGFuZGxlciAtPiBy
dW4gQlBGCgpBbmQgZm9yIHRyYW1wb2xpbmUsIGl0IG5lZWRzIHRvIGJlIGNhbGxlZCBkaXJlY3Rs
eSwKc28gaXQgY2FuJ3QgYmUgcmVnaXN0ZXJlZCBhcyBhIGNhbGxiYWNrIHRvIGZ0cmFjZV9vcHNf
bGlzdC4KSXQgbmVlZCB0byBiZSBjYWxsZWQgaW4gdGhlIGZvbGxvd2luZyBzdGVwOgoKZnRyYWNl
X3JlZ3NfY2FsbGVyCnwKX19mdHJhY2Vfb3BzX2xpc3RfZnVuYyAtPiBjYWxsX2RpcmVjdF9mdW5j
cyAtPiBzYXZlIHRyYW1wb2xpbmUgdG8KcHRfcmVncy0+b3JpZ2luX2F4CnwKY2FsbCBwdF9yZWdz
LT5vcmlnaW5fYXggaWYgbm90IE5VTEwKCj4gU28gaXQgc291bmRzIGxpa2UgbXVsdGktZmVudHJ5
IGlkZWEgd2lsbCBiZSBzaGVsdmVkIG9uY2UgYWdhaW4uCgpFbm4uLi50aGlzIGlzIHRoZSBiZXN0
IHNvbHV0aW9uIHRoYXQgSSBjYW4gdGhpbmsgb2YuIElmIGl0CmRvZXNuJ3Qgd29yaywgSSBzdXNw
ZWN0IGl0IHdpbGwgYmUgc2hlbHZlZCBhZ2Fpbi4KClRoYW5rcyEKTWVuZ2xvbmcgRG9uZwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
