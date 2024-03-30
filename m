Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1CD892CC9
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Mar 2024 20:34:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA7D7C6C855;
	Sat, 30 Mar 2024 19:34:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAB11C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Mar 2024 19:34:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 62E81602DC;
 Sat, 30 Mar 2024 19:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE4AC433F1;
 Sat, 30 Mar 2024 19:34:33 +0000 (UTC)
Date: Sat, 30 Mar 2024 15:37:22 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Message-ID: <20240330153722.65104301@gandalf.local.home>
In-Reply-To: <CALz3k9idLX10+Gh18xWepwtgvp4VZ3zQfY4aoNXn0gCh8Fs_fA@mail.gmail.com>
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

T24gU2F0LCAzMCBNYXIgMjAyNCAxMToxODoyOSArMDgwMArmoqbpvpnokaMgPGRvbmdtZW5nbG9u
Zy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgoKPiA+IElmIHlvdSByZWFsbHkgd2FudCB0byBoYXZl
IHRob3VzYW5kcyBvZiBmdW5jdGlvbnMsIHdoeSBub3QganVzdCByZWdpc3RlciBpdAo+ID4gd2l0
aCBmdHJhY2UgaXRzZWxmLiBJdCB3aWxsIGdpdmUgeW91IHRoZSBhcmd1bWVudHMgdmlhIHRoZSBm
dHJhY2VfcmVncwo+ID4gc3RydWN0dXJlLiBDYW4ndCB5b3UganVzdCByZWdpc3RlciBhIHByb2dy
YW0gYXMgdGhlIGNhbGxiYWNrPwo+ID4gIAo+IAo+IEVubm4uLi5JIGRvbid0IHVuZGVyc3RhbmQu
IFRoZSBtYWluIHB1cnBvc2UgZm9yCj4gbWUgdG8gdXNlIFRSQUNJTkcgaXM6Cj4gCj4gMS4gd2Ug
Y2FuIGRpcmVjdGx5IGFjY2VzcyB0aGUgbWVtb3J5LCB3aGljaCBpcyBtb3JlCj4gICAgZWZmaWNp
ZW50LgoKSSdtIG5vdCBzdXJlIHdoYXQgeW91IG1lYW4gYnkgdGhlIGFib3ZlLiBBY2Nlc3Mgd2hh
dCBtZW1vcnk/Cgo+IDIuIHdlIGNhbiBvYnRhaW4gdGhlIGZ1bmN0aW9uIGFyZ3MgaW4gRkVYSVQs
IHdoaWNoCj4gICAgIGtyZXRwcm9iZSBjYW4ndCBkbyBpdC4gQW5kIHRoaXMgaXMgdGhlIG1haW4g
cmVhc29uLgoKSSBkaWRuJ3QgbWVudGlvbiBrcmV0cHJvYmUuIElmIHlvdSBuZWVkIGFjY2VzcyB0
byB0aGUgZXhpdCBvZiB0aGUgZnVuY3Rpb24sCnlvdSBjYW4gdXNlIE1hc2FtaSdzIGZncmFwaCB1
cGRhdGUuCgogZmVudHJ5IC0+IGZ0cmFjZV90cmFtcG9saW5lIC0+IHlvdXJfY29kZQoKRm9yIGZn
cmFwaDoKCiBmZW50cnkgLT4gZnRyYWNlX3RyYW1wb2xpbmUgLT4gZmdyYXBoIFtzZXRzIHVwIHJl
dHVybiBjYWxsXSAtPiB5b3VyX2VudHJ5X2NvZGUKCiBmdW5jdGlvbiByZXQgLT4gZmdyYXBoX3Jl
dF9oYW5kbGVyIC0+IHlvdXJfZXhpdF9jb2RlCgpBbmQgeW91IHdpbGwgYmUgYWJsZSB0byBwYXNz
IGRhdGEgZnJvbSB0aGUgZW50cnkgdG8gdGhlIGV4aXQgY29kZSwKaW5jbHVkaW5nIHBhcmFtZXRl
cnMuCgotLSBTdGV2ZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
