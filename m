Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ADE893DEC
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Apr 2024 17:57:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7CC2C69067;
	Mon,  1 Apr 2024 15:57:21 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88D7ACFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Apr 2024 15:57:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9929FCE130B;
 Mon,  1 Apr 2024 15:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C86C433F1;
 Mon,  1 Apr 2024 15:57:13 +0000 (UTC)
Date: Mon, 1 Apr 2024 11:59:28 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Message-ID: <20240401115928.3d012be2@gandalf.local.home>
In-Reply-To: <CALz3k9j_RGqSMdN+GvbHEjRqMWYe4R9VNZRANG7jbfL_jVpoVg@mail.gmail.com>
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
 <CALz3k9j_RGqSMdN+GvbHEjRqMWYe4R9VNZRANG7jbfL_jVpoVg@mail.gmail.com>
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

T24gTW9uLCAxIEFwciAyMDI0IDEwOjI4OjE3ICswODAwCuaipum+meiRoyA8ZG9uZ21lbmdsb25n
LjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cgo+IE9uIFN1biwgTWFyIDMxLCAyMDI0IGF0IDM6MzTi
gK9BTSBTdGV2ZW4gUm9zdGVkdCA8cm9zdGVkdEBnb29kbWlzLm9yZz4gd3JvdGU6Cj4gPgo+ID4g
T24gU2F0LCAzMCBNYXIgMjAyNCAxMToxODoyOSArMDgwMAo+ID4g5qKm6b6Z6JGjIDxkb25nbWVu
Z2xvbmcuOEBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+ICAKPiA+ID4gPiBJZiB5b3UgcmVhbGx5
IHdhbnQgdG8gaGF2ZSB0aG91c2FuZHMgb2YgZnVuY3Rpb25zLCB3aHkgbm90IGp1c3QgcmVnaXN0
ZXIgaXQKPiA+ID4gPiB3aXRoIGZ0cmFjZSBpdHNlbGYuIEl0IHdpbGwgZ2l2ZSB5b3UgdGhlIGFy
Z3VtZW50cyB2aWEgdGhlIGZ0cmFjZV9yZWdzCj4gPiA+ID4gc3RydWN0dXJlLiBDYW4ndCB5b3Ug
anVzdCByZWdpc3RlciBhIHByb2dyYW0gYXMgdGhlIGNhbGxiYWNrPwo+ID4gPiA+ICAKPiA+ID4K
PiA+ID4gRW5ubi4uLkkgZG9uJ3QgdW5kZXJzdGFuZC4gVGhlIG1haW4gcHVycG9zZSBmb3IKPiA+
ID4gbWUgdG8gdXNlIFRSQUNJTkcgaXM6Cj4gPiA+Cj4gPiA+IDEuIHdlIGNhbiBkaXJlY3RseSBh
Y2Nlc3MgdGhlIG1lbW9yeSwgd2hpY2ggaXMgbW9yZQo+ID4gPiAgICBlZmZpY2llbnQuICAKPiA+
Cj4gPiBJJ20gbm90IHN1cmUgd2hhdCB5b3UgbWVhbiBieSB0aGUgYWJvdmUuIEFjY2VzcyB3aGF0
IG1lbW9yeT8KPiA+ICAKPiAKPiBXZSBuZWVkIHRvIHVzZSB0aGUgaGVscGVyIG9mIGJwZl9wcm9i
ZV9yZWFkX2tlcm5lbAo+IHdoZW4gd2UgcmVhZCAic2tiLT5zayIgaW4ga3Byb2JlLCBhbmQgdGhl
ICJza2IiIGlzIHRoZQo+IDFzdCBhcmcgaW4gaXBfcmN2KCkuIEFuZCB3ZSBjYW4gZGlyZWN0bHkg
cmVhZCAic2tiLT5zayIKPiBpbiB0cmFjaW5nLCB3aGljaCBpcyBtb3JlIGVmZmljaWVudC4gSXNu
J3QgaXQ/CgpJZiB5b3UgYWRkIGEgZnRyYWNlX29wcyBmdW5jdGlvbiBoYW5kbGVyIHRoYXQgY2Fs
bHMgYSBCUEYgcHJvZ3JhbSwgSSBkb24ndApzZWUgd2h5IHlvdSBjYW4ndCBqdXN0IGdpdmUgaXQg
dGhlIHBhcmFtZXRlcnMgaXQgbmVlZHMgaW5zdGVhZCBvZiB1c2luZyBicGYKaGVscGVycy4gSXQn
cyBubyBkaWZmZXJlbnQgdGhhbiB1c2luZyBhIHRyYW1wb2xpbmUgdG8gZG8gdGhlIHNhbWUgdGhp
bmcuCgotLSBTdGV2ZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
