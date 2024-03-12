Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE461879895
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Mar 2024 17:11:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 719DCC6C83C;
	Tue, 12 Mar 2024 16:11:54 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86267C64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 16:11:53 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-33e99b639e0so1410163f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 09:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710259913; x=1710864713;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mlMGohocih4/vv8NN3ExYyD4aDTNUoH7ERTwZOWg+9o=;
 b=h0f+pFYiXT6CvZLUQe3qTwZC+loXZyRr3NZOaG7Cz2hRKWNIgKmBcB75WSthzHG/KC
 HQWA8M0k76xBMqioBuZLlLrA6IQ/wRhZ/Mf2i/zVCbuMF2FdRzF1JP2pSpGkp+w54/BL
 qqUcs14XK16zAKTCi2A2nn1MMF7EBxS0jMIqIWVcz9I4mAezU+jGPsQaelbgfq6ucTtx
 8P2boLyZ68t4F+wppsl39YWxYQ0+whZdq9jeneN6G9nnc/JClw7P8bQx1B9m/8bxz3uS
 pH5Xko6FOvwU9UWkDIS2aWuEuiudBF7MwQdydrLkXRodTbVKS/O2tBqlVz8dnSwLpTms
 vMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710259913; x=1710864713;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mlMGohocih4/vv8NN3ExYyD4aDTNUoH7ERTwZOWg+9o=;
 b=vKWG4fdElsoNEsvf+5tK4G4kYyDiVyw3t05GFlKuguxrRcZwgfdvPhT2i61eAGzslZ
 h7ODp+M0d3ebcroGrg1mrDI7tyCa1zaOzxC8yrs/V60m26DkSHaaa7io4MYn/qSAu8AW
 r8TYjx6ncOhS6p1+8dmxVIqeYrB9Zy8cxiJRskpN9BKfZhAWksutPCBUHcizHdHdw8IF
 SfLYENjbVEuut5/AAw6mH+y0mMI6iz15BhaFzcmedTwbJVjuLPp3iKAoEjCspplhEhX3
 2nijBu7pHuuhPjdicc7pKdi4zTS6bInk0JEdvrBo4Fh22t1Ahk4zDgDGQyAOgJVz/yn/
 r11A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYYi1PzzeN18YkJJcIqumEhwlge/IG5DK0GVy+Qj2Jx8d86RwRGJCK2ZnxwL952k3GXwXqOKhzW45rwxzLYZ7wDplnlLhrMYDKSt+Ry+SmTJdOORgdG9wG
X-Gm-Message-State: AOJu0Yzt1yprcVb/EV4pEqsLKEO4p9fB1rFBDcU6vMdpW6kHL4spc4f+
 9lPbW+CD/8zQBX6gn7uqj0tnz7i/maaSA5ofqRPzcVFO68B21h1YxIx3lHP+aMDIwuU6dDK0Q9T
 UxQKqLHuBnNTVvTq+lPEFSGnTcQc=
X-Google-Smtp-Source: AGHT+IEluJaPH2ZbEhOuqEk+ZR7WjEJU3XS86GzKec4PZE8B7+fsWbUJbxd+Mrhd/TndoYPK/al8v9EOlZQdZgQXq3Y=
X-Received: by 2002:adf:f60a:0:b0:33c:e396:b035 with SMTP id
 t10-20020adff60a000000b0033ce396b035mr458814wrp.69.1710259912730; Tue, 12 Mar
 2024 09:11:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-9-dongmenglong.8@bytedance.com>
 <CAADnVQK+s3XgSYhpSdh7_9Qhq4DimmSO-D9d5+EsSZQMX4TxxA@mail.gmail.com>
 <CALz3k9hZxsbUGoe5JoWpMEV0URykRwiKWLKZNj4nhvnXg3V=Zg@mail.gmail.com>
In-Reply-To: <CALz3k9hZxsbUGoe5JoWpMEV0URykRwiKWLKZNj4nhvnXg3V=Zg@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 12 Mar 2024 09:11:41 -0700
Message-ID: <CAADnVQJ87Ov6ny2hj-0_WymGB3TeuEZu373EmqmRJqZv-8Ze_Q@mail.gmail.com>
To: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
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

T24gTW9uLCBNYXIgMTEsIDIwMjQgYXQgNzo0NOKAr1BNIOaipum+meiRoyA8ZG9uZ21lbmdsb25n
LjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1hciAxMiwgMjAyNCBhdCA5OjU2
4oCvQU0gQWxleGVpIFN0YXJvdm9pdG92Cj4gPGFsZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+
IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgTWFyIDExLCAyMDI0IGF0IDI6MzXigK9BTSBNZW5nbG9u
ZyBEb25nCj4gPiA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+Cj4gPiA+IC0gICAgICAgICAgICAgICBlcnIgPSBsaWJicGZfZmluZF9hdHRhY2hfYnRmX2lk
KHByb2csIGF0dGFjaF9uYW1lLCAmYnRmX29ial9mZCwgJmJ0Zl90eXBlX2lkKTsKPiA+ID4gKyAg
ICAgICAgICAgICAgIG5hbWVfZW5kID0gc3RyY2hyKGF0dGFjaF9uYW1lLCAnLCcpOwo+ID4gPiAr
ICAgICAgICAgICAgICAgLyogZm9yIG11bHRpLWxpbmsgdHJhY2luZywgdXNlIHRoZSBmaXJzdCB0
YXJnZXQgc3ltYm9sIGR1cmluZwo+ID4gPiArICAgICAgICAgICAgICAgICogbG9hZGluZy4KPiA+
ID4gKyAgICAgICAgICAgICAgICAqLwo+ID4gPiArICAgICAgICAgICAgICAgaWYgKChkZWYgJiBT
RUNfQVRUQUNIX0JURl9NVUxUSSkgJiYgbmFtZV9lbmQpIHsKPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgaW50IGxlbiA9IG5hbWVfZW5kIC0gYXR0YWNoX25hbWUgKyAxOwo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBjaGFyICpmaXJzdF90Z3Q7Cj4gPiA+ICsKPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgZmlyc3RfdGd0ID0gbWFsbG9jKGxlbik7Cj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGlmICghZmlyc3RfdGd0KQo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICBzdHJuY3B5KGZpcnN0X3RndCwgYXR0YWNoX25hbWUsIGxlbik7Cj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGZpcnN0X3RndFtsZW4gLSAxXSA9ICdcMCc7Cj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGVyciA9IGxpYmJwZl9maW5kX2F0dGFjaF9idGZfaWQocHJvZywgZmlyc3Rf
dGd0LCAmYnRmX29ial9mZCwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAmYnRmX3R5cGVfaWQpOwo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBmcmVlKGZpcnN0X3RndCk7Cj4gPiA+ICsgICAgICAgICAgICAgICB9IGVsc2Ug
ewo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSBsaWJicGZfZmluZF9hdHRhY2hf
YnRmX2lkKHByb2csIGF0dGFjaF9uYW1lLCAmYnRmX29ial9mZCwKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmYnRmX3R5cGVfaWQp
Owo+ID4gPiArICAgICAgICAgICAgICAgfQo+ID4KPiA+IFBscyB1c2UgZ2xvYl9tYXRjaCB0aGUg
d2F5IFtrdV1wcm9iZSBtdWx0aSBhcmUgZG9pbmcKPiA+IGluc3RlYWQgb2YgZXhhY3QgbWF0Y2gu
Cj4KPiBIZWxsbywKPgo+IEknbSBhIGxpdHRsZSBzdXNwZWN0aW5nIHRoZSBlZmZlY3Qgb2YgZ2xv
Yl9tYXRjaC4gSSBzZWxkb20gZm91bmQKPiB0aGUgdXNlIGNhc2UgdGhhdCB0aGUga2VybmVsIGZ1
bmN0aW9ucyB3aGljaCB3ZSB3YW50IHRvIHRyYWNlCj4gaGF2ZSB0aGUgc2FtZSBuYW1pbmcgcGF0
dGVybi4gQW5kIHRoZSBleGFjdCBtYXRjaCBzZWVtcyBtb3JlCj4gdXNlZnVsLgo+Cj4gQ2FuIHdl
IHVzZSBib3RoIGV4YWN0IGFuZCBnbG9iIG1hdGNoIGhlcmU/CgpleGFjdCBpcyBhIHN1YnNldCBv
ZiBnbG9iX21hdGNoLgpQbHMgZm9sbG93IHRoZSBwYXR0ZXJuIHRoYXRba3VdcHJvYmUgbXVsdGkg
ZXN0YWJsaXNoZWQKaW4gdGVybXMgb2YgdXNlciBpbnRlcmZhY2UgZXhwZWN0YXRpb25zLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
