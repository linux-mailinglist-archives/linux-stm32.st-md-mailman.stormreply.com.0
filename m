Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 414FD89021E
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Mar 2024 15:42:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E72F6C6DD96;
	Thu, 28 Mar 2024 14:42:27 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BB18C6DD93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Mar 2024 14:42:26 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2a07b092c4fso878207a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Mar 2024 07:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1711636945; x=1712241745;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zOp5govZZQSJRzD95rrhGtQGcUj+k1AZvhk4Bdb7Q3s=;
 b=jFdb+riBhaIMVpiDPMwqq6K5sIyfTOT/Rlc0J/fB9lmAM+WNnt+atu2YMJzmerK2b2
 h4LDPqWYhDOcapbF1V2/3GtPisj/R4XZlv/2vnc3ZN1WggxpRWdsuIeYK4r2ETH3J16N
 6sEl82L+0wIWSbG3f4pMbxKWCYJRKAgbAhltW0B17kFrRPSxXnUBKUn6gGu+H1vUcQ5x
 vl6VeczZOGInXKmvJ7r6DtmilCgPFqAe04OLjd2E19d3h/w7Sq1zFcMLs6aZKGWgiyoR
 nFPk7V10w7bMj7JNyusgHWiKaFPw4Hey+IyXvn7uePVnQNRpKsstXmjd7FohO5Rzdn6E
 mv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711636945; x=1712241745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zOp5govZZQSJRzD95rrhGtQGcUj+k1AZvhk4Bdb7Q3s=;
 b=OHoXlCPWKNiEe4RL++QePG3ywfBi077cFuXGjfAGXsxrOOx4h841+rAKmC/c9XJsyn
 5OXHRnCGqdmdJdz86HpR9fDJ5Pfk4rVkVwMc7lU5Uy4aK5DJn2U5gSclGY2iC3NDDR7k
 TGdAqzN0fvDc56Q3NbbkiChNwU00WoKIK4OCGFKnHRw7eov/qYeaf/KO5/zuhvdQfYzY
 5wCF4vND+UpcsLfkmpXujhFkzo8J+hS3IJpSKhv/l+CqLtObEDG2tkywiDJZo3MPVAeT
 GRjxwKV/TyFZ6Tapc9I166INiiiL4W/Wfk6BlEYKMRtGJq1UJtQMJnSoK76HA/lKRdUS
 fQcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5W10kHWJcYeFMWUcxu9bAa6x9NVVrC4XHtaCa4zOrxQELLQ61Z7xyKOlfFxW8Hl75Kewogq510lCbhD72q0YsjrRCAo5WkEk/49EMh8RL09ot69qgU7Ib
X-Gm-Message-State: AOJu0YzNVkrGmZ0sT6ZeVOsISO3etf/5l0Tp5Gxklqggn+xJ7dQQr8om
 LJZ+bViuZMU0hYCH+e5TfIaQyB+KlJzBAWgsjprg7LaogF/UmltDq+jactgOZ5Pq3k8Szt5QzH5
 89oh1eZUrTw2y6bZXtSdDbMGuAUjVDbYbdvAJ6g==
X-Google-Smtp-Source: AGHT+IHIvCiL9/viH3Zv87RhUz8r9B/nNMpWCgwAx/ZU6AQHkrpwzseaugUZlw+S2sSjSOL/j/AgVGUngrHrFzkoTBM=
X-Received: by 2002:a17:90a:d481:b0:2a2:88d:19d9 with SMTP id
 s1-20020a17090ad48100b002a2088d19d9mr1331992pju.1.1711636945073; Thu, 28 Mar
 2024 07:42:25 -0700 (PDT)
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
In-Reply-To: <CALz3k9g-U8ih=ycJPRbyU9x_9cp00fNkU3PGQ6jP0WJ+=uKmqQ@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Thu, 28 Mar 2024 22:43:46 +0800
Message-ID: <CALz3k9jG5Jrqw=BGjt05yMkEF-1u909GbBYrV-02W0dQtm6KQQ@mail.gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Jiri Olsa <jolsa@kernel.org>
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

T24gRnJpLCBNYXIgMTUsIDIwMjQgYXQgNDowMOKAr1BNIOaipum+meiRoyA8ZG9uZ21lbmdsb25n
LjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE1hciAxNCwgMjAyNCBhdCA4OjI3
4oCvQU0gQWxleGVpIFN0YXJvdm9pdG92Cj4gPGFsZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+
IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgTWFyIDEyLCAyMDI0IGF0IDY6NTPigK9QTSDmoqbpvpno
kaMgPGRvbmdtZW5nbG9uZy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+IFsuLi4uLi5dCj4gPiA+
IFdoYXQgZG9lcyAiYSBodW5kcmVkIGF0dGFjaG1lbnRzIG1heCIgbWVhbnM/IENhbid0IEkKPiA+
ID4gdHJhY2UgdGhvdXNhbmRzIG9mIGtlcm5lbCBmdW5jdGlvbnMgd2l0aCBhIGJwZiBwcm9ncmFt
IG9mCj4gPiA+IHRyYWNpbmcgbXVsdGktbGluaz8KPiA+Cj4gPiBJIG1lYW4gd2hhdCB0aW1lIGRv
ZXMgaXQgdGFrZSB0byBhdHRhY2ggb25lIHByb2dyYW0KPiA+IHRvIDEwMCBmZW50cnktcyA/Cj4g
PiBXaGF0IGlzIHRoZSB0aW1lIGZvciAxayBhbmQgZm9yIDEwayA/Cj4gPgo+ID4gVGhlIGtwcm9i
ZSBtdWx0aSB0ZXN0IGF0dGFjaGVzIHRvIHByZXR0eSBtdWNoIGFsbCBmdW5jcyBpbgo+ID4gL3N5
cy9rZXJuZWwvdHJhY2luZy9hdmFpbGFibGVfZmlsdGVyX2Z1bmN0aW9ucwo+ID4gYW5kIGl0J3Mg
ZmFzdCBlbm91Z2ggdG8gcnVuIGluIHRlc3RfcHJvZ3Mgb24gZXZlcnkgY29tbWl0IGluIGJwZiBD
SS4KPiA+IFNlZSBnZXRfc3ltcygpIGluIHByb2dfdGVzdHMva3Byb2JlX211bHRpX3Rlc3QuYwo+
ID4KPiA+IENhbiB0aGlzIG5ldyBtdWx0aSBmZW50cnkgZG8gdGhhdD8KPiA+IGFuZCBhdCB3aGF0
IHNwZWVkPwo+ID4gVGhlIGFuc3dlciB3aWxsIGRlY2lkZSBob3cgYXBwbGljYWJsZSB0aGlzIGFw
aSBpcyBnb2luZyB0byBiZS4KPiA+IEdlbmVyYXRpbmcgZGlmZmVyZW50IHRyYW1wb2xpbmVzIGZv
ciBldmVyeSBhdHRhY2ggcG9pbnQKPiA+IGlzIGFuIGFwcHJvYWNoIGFzIHdlbGwuIFBscyBiZW5j
aG1hcmsgaXQgdG9vLgo+Cj4gSSBzZWUuIENyZWF0aW5nIHBsZW50eSBvZiB0cmFtcG9saW5lcyBk
b2VzIHRha2UgYSBsb3Qgb2YgdGltZSwKPiBhbmQgSSdsbCBkbyB0ZXN0aW5nIG9uIGl0Lgo+CgpJ
IGhhdmUgZG9uZSBhIHNpbXBsZSBiZW5jaG1hcmsgb24gY3JlYXRpbmcgMTAwMAp0cmFtcG9saW5l
cy4gSXQgaXMgc2xvdywgcXVpdGUgc2xvdywgd2hpY2ggY29uc3VtZSB1cCB0bwo2MHMuIFdlIGNh
bid0IGRvIGl0IHRoaXMgd2F5LgoKTm93LCBJIGhhdmUgYSBiYWQgaWRlYS4gSG93IGFib3V0IHdl
IGludHJvZHVjZQphICJkeW5hbWljIHRyYW1wb2xpbmUiPyBUaGUgYmFzaWMgbG9naWMgb2YgaXQg
Y2FuIGJlOgoKIiIiCnNhdmUgcmVncwpicGZzID0gdHJhbXBvbGluZV9sb29rdXBfaXAoaXApCmZl
bnRyeSA9IGJwZnMtPmZlbnRyaWVzCndoaWxlIGZlbnRyeToKICBmZW50cnkoY3R4KQogIGZlbnRy
eSA9IGZlbnRyeS0+bmV4dAoKY2FsbCBvcmlnaW4Kc2F2ZSByZXR1cm4gdmFsdWUKCmZleGl0ID0g
YnBmcy0+ZmV4aXRzCndoaWxlIGZleGl0OgogIGZleGl0KGN0eCkKICBmZXhpdCA9IGZleGl0LT5u
ZXh0Cgp4eHh4eHgKIiIiCgpBbmQgd2UgbG9va3VwIHRoZSAiYnBmcyIgYnkgdGhlIGZ1bmN0aW9u
IGlwIGluIGEgaGFzaCBtYXAKaW4gdHJhbXBvbGluZV9sb29rdXBfaXAuIFRoZSB0eXBlIG9mICJi
cGZzIiBpczoKCnN0cnVjdCBicGZfYXJyYXkgewogIHN0cnVjdCBicGZfcHJvZyAqZmVudHJpZXM7
CiBzdHJ1Y3QgYnBmX3Byb2cgKmZleGl0czsKICBzdHJ1Y3QgYnBmX3Byb2cgKm1vZGlmeV9yZXR1
cm5zOwp9CgpXaGVuIHdlIG5lZWQgdG8gYXR0YWNoIHRoZSBicGYgcHJvZ0EgdG8gZnVuY3Rpb24g
QS9CL0MsCndlIG9ubHkgbmVlZCB0byBjcmVhdGUgdGhlIGJwZl9hcnJheUEsIGJwZl9hcnJheUIs
IGJwZl9hcnJheUMKYW5kIGFkZCB0aGUgcHJvZ0EgdG8gdGhlbSwgYW5kIGluc2VydCB0aGVtIHRv
IHRoZSBoYXNoIG1hcAoiZGlyZWN0X2NhbGxfYnBmcyIsIGFuZCBhdHRhY2ggdGhlICJkeW5hbWlj
IHRyYW1wb2xpbmUiIHRvCkEvQi9DLiBJZiBicGZfYXJyYXlBIGV4aXN0LCBqdXN0IGFkZCBwcm9n
QSB0byB0aGUgdGFpbCBvZgpicGZfYXJyYXlBLT5mZW50cmllcy4gV2hlbiB3ZSBuZWVkIHRvIGF0
dGFjaCBwcm9nQiB0bwpCL0MsIGp1c3QgYWRkIHByb2dCIHRvIGJwZl9hcnJheUItPmZlbnRyaWVz
IGFuZApicGZfYXJyYXlCLT5mZW50cmllcy4KCkNvbXBhcmVkIHRvIHRoZSB0cmFtcG9saW5lLCBl
eHRyYSBvdmVyaGVhZCBpcyBpbnRyb2R1Y2VkCmJ5IHRoZSBoYXNoIGxvb2t1cGluZy4KCkkgaGF2
ZSBub3QgYmVndW4gdG8gY29kZSB5ZXQsIGFuZCBJIGFtIG5vdCBzdXJlIHRoZSBvdmVyaGVhZCBp
cwphY2NlcHRhYmxlLiBDb25zaWRlcmluZyB0aGF0IHdlIGFsc28gbmVlZCB0byBkbyBoYXNoIGxv
b2t1cApieSB0aGUgZnVuY3Rpb24gaW4ga3Byb2JlX211bHRpLCBtYXliZSB0aGUgb3ZlcmhlYWQg
aXMKYWNjZXB0YWJsZT8KClRoYW5rcyEKTWVuZ2xvbmcgRG9uZwoKPiA+Cj4gPiA+ID4KPiA+ID4g
PiBMZXQncyBzdGVwIGJhY2suCj4gWy4uLi4uLl0KPiA+Cj4gPiBGb3Igb25lIHRyYW1wb2xpbmUg
dG8gaGFuZGxlIGFsbCBhdHRhY2ggcG9pbnRzIHdlIG1pZ2h0Cj4gPiBuZWVkIHNvbWUgYXJjaCBz
dXBwb3J0LCBidXQgd2UgY2FuIHN0YXJ0IHNpbXBsZS4KPiA+IE1ha2UgYnRmX2Z1bmNfbW9kZWwg
d2l0aCBNQVhfQlBGX0ZVTkNfUkVHX0FSR1MKPiA+IGJ5IGNhbGxpbmcgYnRmX2Rpc3RpbGxfZnVu
Y19wcm90bygpIHdpdGggZnVuYz09TlVMTC4KPiA+IEFuZCB1c2UgdGhhdCB0byBidWlsZCBhIHRy
YW1wb2xpbmUuCj4gPgo+ID4gVGhlIGNoYWxsZW5nZSBpcyBob3cgdG8gdXNlIG1pbmltYWwgbnVt
YmVyIG9mIHRyYW1wb2xpbmVzCj4gPiB3aGVuIGJwZl9wcm9nQSBpcyBhdHRhY2hlZCBmb3IgZnVu
YzEsIGZ1bmMyLCBmdW5jMwo+ID4gYW5kIGJwZl9wcm9nQiBpcyBhdHRhY2hlZCB0byBmdW5jMywg
ZnVuYzQsIGZ1bmM1Lgo+ID4gV2UnZCBzdGlsbCBuZWVkIDMgdHJhbXBvbGluZXM6Cj4gPiBmb3Ig
ZnVuY1sxMl0gdG8gY2FsbCBicGZfcHJvZ0EsCj4gPiBmb3IgZnVuYzMgdG8gY2FsbCBicGZfcHJv
Z0EgYW5kIGJwZl9wcm9nQiwKPiA+IGZvciBmdW5jWzQ1XSB0byBjYWxsIGJwZl9wcm9nQi4KPiA+
Cj4gPiBKaXJpIHdhcyB0cnlpbmcgdG8gc29sdmUgaXQgaW4gdGhlIHBhc3QuIEhpcyBzbGlkZXMg
ZnJvbSBMUEM6Cj4gPiBodHRwczovL2xwYy5ldmVudHMvZXZlbnQvMTYvY29udHJpYnV0aW9ucy8x
MzUwL2F0dGFjaG1lbnRzLzEwMzMvMTk4My9wbHVtYmVycy5wZGYKPiA+Cj4gPiBQbHMgc3R1ZHkg
dGhlbSBhbmQgaGlzIHByaW9yIHBhdGNoc2V0cyB0byBhdm9pZCBzdGVwcGluZyBvbiB0aGUgc2Ft
ZSByYWtlcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
