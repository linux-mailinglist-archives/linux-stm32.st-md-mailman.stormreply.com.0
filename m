Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E4187C982
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Mar 2024 09:01:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6ACDAC6A613;
	Fri, 15 Mar 2024 08:01:09 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50302C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Mar 2024 08:01:08 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-29c4fe68666so1464261a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Mar 2024 01:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1710489667; x=1711094467;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p0en/GCOfhc21UxAgSvgpjSxEaCkV+SmFKeaU1UDvXQ=;
 b=kEbf93Z+PFoCk+aI8L0xn8Mh28vnlSVAXIwn6uZg/LhgzXH3qFGJXc2N/L243h41Dk
 Ivgpum4cmIYZPvnl/WpcwkB/QmP6cHUZq4UEMKGxPy8gBJ1pzgyY9XS+zata+er0bbXK
 LWSNAEHM14vTXAWDvR4YzEY71M4dWzttnr0hmCDbP4dtw5XE6U83P/XHH1VRVBLTzhZ+
 zzG8bkjO+eX+5ARL2wC45LoARAI/wB5XjoxfMeADBz6f4jYCi/6bN0YEouGrhjv9m04U
 JusRv8C6ymHCqmXj6/nEEOVbNKC09lI59CWbNZpCJmDFZyWkjQH0tgXp9vhdRFBFgowT
 GYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710489667; x=1711094467;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p0en/GCOfhc21UxAgSvgpjSxEaCkV+SmFKeaU1UDvXQ=;
 b=k/zBx/9vxFRhfFRfosX+MjAx2Y+qxUbHCMW0hMpcCQBgTktafyDthdT4qRQNQj3dtO
 OzW8iLtNl6C4OmShR45UNU39RUmoxQjR2WH3zH/n9zvUr1aLlWLrJgyn01bq0IejI4bq
 nN/l8IQ9GXFTuwmLHqsOFSnl35m006K8PcABFinl3ac5Evm4TWSE/n/KADFQa84vcsVc
 gJTpcFWEuwUp2veIITs3L/RDYqXcLZV/7/WX2HL20syaBIJpMfR30Vys5tU8jApnvR7E
 A1hMBTP5qbMXhCxlvqW3xX0hzJnz9t5jzRT8+D99TmdsZoaXP0Qhtp3vG1llcLuospaU
 Z7jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDb3DWzkQvHwUNwtXzsYQnNh+n1sUz2eu2RDt8sCOg/IjNrHUgCQ+ns+UYvc3Ci4qY9X4smduWdPEJREbouXSQWgyRBMr8Y5j45W6FEWEqsAH73lu1ycI5
X-Gm-Message-State: AOJu0YzxT+WjP/zH3DLDgmTeKtr7coNcCirMDvEFGADNxYLUT5Wdm7RT
 WA0QF7KsVebSmNrEQoT5nYbb4uCUZcRc+t4R7528plwwIaDhjNQWwAKhZWhPgx108SlEy2IpRAi
 fPP7uQ8wo4b7hCclCMoMgF/XxeEqJ8zPTxOrMzw==
X-Google-Smtp-Source: AGHT+IEpM9Mqa5iEhQbTXQByuieojUsSQiVC/HtuI16NWpRWnCf8v9wukRY0tmuiax6xN5WzRfxP5Mr9rKAT0G28iSY=
X-Received: by 2002:a17:90a:dc0b:b0:29d:fe1c:79e7 with SMTP id
 i11-20020a17090adc0b00b0029dfe1c79e7mr271232pjv.45.1710489666842; Fri, 15 Mar
 2024 01:01:06 -0700 (PDT)
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
In-Reply-To: <CAADnVQLHpi3J6cBJ0QBgCQ2aY6fWGnVvNGdfi3W-jmoa9d1eVQ@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Fri, 15 Mar 2024 16:00:55 +0800
Message-ID: <CALz3k9g-U8ih=ycJPRbyU9x_9cp00fNkU3PGQ6jP0WJ+=uKmqQ@mail.gmail.com>
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

T24gVGh1LCBNYXIgMTQsIDIwMjQgYXQgODoyN+KAr0FNIEFsZXhlaSBTdGFyb3ZvaXRvdgo8YWxl
eGVpLnN0YXJvdm9pdG92QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1hciAxMiwgMjAy
NCBhdCA2OjUz4oCvUE0g5qKm6b6Z6JGjIDxkb25nbWVuZ2xvbmcuOEBieXRlZGFuY2UuY29tPiB3
cm90ZToKWy4uLi4uLl0KPiA+IFdoYXQgZG9lcyAiYSBodW5kcmVkIGF0dGFjaG1lbnRzIG1heCIg
bWVhbnM/IENhbid0IEkKPiA+IHRyYWNlIHRob3VzYW5kcyBvZiBrZXJuZWwgZnVuY3Rpb25zIHdp
dGggYSBicGYgcHJvZ3JhbSBvZgo+ID4gdHJhY2luZyBtdWx0aS1saW5rPwo+Cj4gSSBtZWFuIHdo
YXQgdGltZSBkb2VzIGl0IHRha2UgdG8gYXR0YWNoIG9uZSBwcm9ncmFtCj4gdG8gMTAwIGZlbnRy
eS1zID8KPiBXaGF0IGlzIHRoZSB0aW1lIGZvciAxayBhbmQgZm9yIDEwayA/Cj4KPiBUaGUga3By
b2JlIG11bHRpIHRlc3QgYXR0YWNoZXMgdG8gcHJldHR5IG11Y2ggYWxsIGZ1bmNzIGluCj4gL3N5
cy9rZXJuZWwvdHJhY2luZy9hdmFpbGFibGVfZmlsdGVyX2Z1bmN0aW9ucwo+IGFuZCBpdCdzIGZh
c3QgZW5vdWdoIHRvIHJ1biBpbiB0ZXN0X3Byb2dzIG9uIGV2ZXJ5IGNvbW1pdCBpbiBicGYgQ0ku
Cj4gU2VlIGdldF9zeW1zKCkgaW4gcHJvZ190ZXN0cy9rcHJvYmVfbXVsdGlfdGVzdC5jCj4KPiBD
YW4gdGhpcyBuZXcgbXVsdGkgZmVudHJ5IGRvIHRoYXQ/Cj4gYW5kIGF0IHdoYXQgc3BlZWQ/Cj4g
VGhlIGFuc3dlciB3aWxsIGRlY2lkZSBob3cgYXBwbGljYWJsZSB0aGlzIGFwaSBpcyBnb2luZyB0
byBiZS4KPiBHZW5lcmF0aW5nIGRpZmZlcmVudCB0cmFtcG9saW5lcyBmb3IgZXZlcnkgYXR0YWNo
IHBvaW50Cj4gaXMgYW4gYXBwcm9hY2ggYXMgd2VsbC4gUGxzIGJlbmNobWFyayBpdCB0b28uCgpJ
IHNlZS4gQ3JlYXRpbmcgcGxlbnR5IG9mIHRyYW1wb2xpbmVzIGRvZXMgdGFrZSBhIGxvdCBvZiB0
aW1lLAphbmQgSSdsbCBkbyB0ZXN0aW5nIG9uIGl0LgoKPgo+ID4gPgo+ID4gPiBMZXQncyBzdGVw
IGJhY2suClsuLi4uLi5dCj4KPiBGb3Igb25lIHRyYW1wb2xpbmUgdG8gaGFuZGxlIGFsbCBhdHRh
Y2ggcG9pbnRzIHdlIG1pZ2h0Cj4gbmVlZCBzb21lIGFyY2ggc3VwcG9ydCwgYnV0IHdlIGNhbiBz
dGFydCBzaW1wbGUuCj4gTWFrZSBidGZfZnVuY19tb2RlbCB3aXRoIE1BWF9CUEZfRlVOQ19SRUdf
QVJHUwo+IGJ5IGNhbGxpbmcgYnRmX2Rpc3RpbGxfZnVuY19wcm90bygpIHdpdGggZnVuYz09TlVM
TC4KPiBBbmQgdXNlIHRoYXQgdG8gYnVpbGQgYSB0cmFtcG9saW5lLgo+Cj4gVGhlIGNoYWxsZW5n
ZSBpcyBob3cgdG8gdXNlIG1pbmltYWwgbnVtYmVyIG9mIHRyYW1wb2xpbmVzCj4gd2hlbiBicGZf
cHJvZ0EgaXMgYXR0YWNoZWQgZm9yIGZ1bmMxLCBmdW5jMiwgZnVuYzMKPiBhbmQgYnBmX3Byb2dC
IGlzIGF0dGFjaGVkIHRvIGZ1bmMzLCBmdW5jNCwgZnVuYzUuCj4gV2UnZCBzdGlsbCBuZWVkIDMg
dHJhbXBvbGluZXM6Cj4gZm9yIGZ1bmNbMTJdIHRvIGNhbGwgYnBmX3Byb2dBLAo+IGZvciBmdW5j
MyB0byBjYWxsIGJwZl9wcm9nQSBhbmQgYnBmX3Byb2dCLAo+IGZvciBmdW5jWzQ1XSB0byBjYWxs
IGJwZl9wcm9nQi4KPgo+IEppcmkgd2FzIHRyeWluZyB0byBzb2x2ZSBpdCBpbiB0aGUgcGFzdC4g
SGlzIHNsaWRlcyBmcm9tIExQQzoKPiBodHRwczovL2xwYy5ldmVudHMvZXZlbnQvMTYvY29udHJp
YnV0aW9ucy8xMzUwL2F0dGFjaG1lbnRzLzEwMzMvMTk4My9wbHVtYmVycy5wZGYKPgo+IFBscyBz
dHVkeSB0aGVtIGFuZCBoaXMgcHJpb3IgcGF0Y2hzZXRzIHRvIGF2b2lkIHN0ZXBwaW5nIG9uIHRo
ZSBzYW1lIHJha2VzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
