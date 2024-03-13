Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED62A87A08B
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Mar 2024 02:14:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92E12C6C83C;
	Wed, 13 Mar 2024 01:14:16 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD186C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Mar 2024 01:14:15 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-29aa91e173dso4361891a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 18:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1710292454; x=1710897254;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=twMccmPlR7/SShgFg0AONE56vJVPPL3EBuKYw8SPbFI=;
 b=gTz+wUc0G3CTP/eRuOhw6JiWBLhdHBOoptI0g/jHIy1gP6UOfrmSJW/JltCzjMDBUL
 E9XaB9qltVXmp9GKixDDIdm0iqIskoZri9yMs7Uyg+fV/WouOFObv32Q+vl34D5zdr+A
 I8ffLgPrXXWNsdy2KA1Ozenhzrkeh/LaL5ilJbwAJ1UYuBeadN/X8jlJz2iZOGHracUu
 jckj8mQt5cK9/WjPzv3PjXUA29EhHYyDROgdY4G2834FjZZNjfUvlpWeWJxCHnpKgtes
 rLTSV4qnAIpCaPazreSHmr+XAElE97OnZ38XvPEHoRnmlKkYbmhDWYDpCsz5ZpcOmHWE
 J8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710292454; x=1710897254;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=twMccmPlR7/SShgFg0AONE56vJVPPL3EBuKYw8SPbFI=;
 b=WBAurvmLDYkRgZ7fuUnm06WiCzcNBPrt/tNRt3y0HYCjBF0zfqJhWQngF2yV2Ggsfs
 bV4iEyDAMlsRte/2TV6iTjr5vA2DCGGeZvezMIT8ErkPZ8ONQnu+DkwqjbdSdJHI4RGT
 ISynP2mDiUTFD6PYme+8ynLQGuB/6hxadCozfS205+9dd1T1Z7auxO9pzYEEZB1pB+uG
 W5Z+CiBWIyka9qCg8MlsX5niYPdhO4HovmDX0yyXViy5BQ1rvyQMyNiR+aLhZ/aH0zjB
 2f5kJxSStGbnPMApVYju1cUEgL7YdfsY4oINaIPtKV++sU8warv8ajnX8g0C+NLOeI6n
 cosw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV30jI+Rp/7C1EEjGtXV5fqJMzUIm5TfNva8STFGgAf16bUmqD86PyBzELsNxEpQjM7LqYZ44T5uJqMcnBKfN/QHy1JNx6sY/1i5Sy+s83lELU3I7RBk6+5
X-Gm-Message-State: AOJu0Yzzh7EU3RK5W3uanXq6VS3pilQJqdXrQaR7hit/Lk7SMfxLPcP/
 eQCLOu0RLmCs/wS8cmujKX10/BKD7jXc1xPlfVxcyaxfYUCJNpkFiY1cmhjJdNwF9HVInKHuTKB
 AL5j/VzkQZftRiUg0SFPZEsTSnFoZd/b2RC7O9g==
X-Google-Smtp-Source: AGHT+IFJ2nJztVxlcv7iF1fLo4e+81DiH9lck4a4XLEq2MMi6yrbHR+XGNXNfeaQ8LZdIPeyXdsLEIp10M0upU5dDak=
X-Received: by 2002:a17:90a:bb0d:b0:29c:5ba3:890e with SMTP id
 u13-20020a17090abb0d00b0029c5ba3890emr829001pjr.4.1710292454186; Tue, 12 Mar
 2024 18:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-9-dongmenglong.8@bytedance.com>
 <CAADnVQK+s3XgSYhpSdh7_9Qhq4DimmSO-D9d5+EsSZQMX4TxxA@mail.gmail.com>
 <CALz3k9hZxsbUGoe5JoWpMEV0URykRwiKWLKZNj4nhvnXg3V=Zg@mail.gmail.com>
 <CAADnVQJ87Ov6ny2hj-0_WymGB3TeuEZu373EmqmRJqZv-8Ze_Q@mail.gmail.com>
In-Reply-To: <CAADnVQJ87Ov6ny2hj-0_WymGB3TeuEZu373EmqmRJqZv-8Ze_Q@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Wed, 13 Mar 2024 09:14:03 +0800
Message-ID: <CALz3k9jf4Q7KJPes=omx5oBpEmoFNSvc=vp=D0hEa-51i7tc_A@mail.gmail.com>
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

T24gV2VkLCBNYXIgMTMsIDIwMjQgYXQgMTI6MTLigK9BTSBBbGV4ZWkgU3Rhcm92b2l0b3YKPGFs
ZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXIgMTEsIDIw
MjQgYXQgNzo0NOKAr1BNIOaipum+meiRoyA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4g
d3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgOTo1NuKAr0FNIEFsZXhlaSBT
dGFyb3ZvaXRvdgo+ID4gPGFsZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+IHdyb3RlOgo+ID4g
Pgo+ID4gPiBPbiBNb24sIE1hciAxMSwgMjAyNCBhdCAyOjM14oCvQU0gTWVuZ2xvbmcgRG9uZwo+
ID4gPiA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6ClsuLi5dCj4gPiA+IFBs
cyB1c2UgZ2xvYl9tYXRjaCB0aGUgd2F5IFtrdV1wcm9iZSBtdWx0aSBhcmUgZG9pbmcKPiA+ID4g
aW5zdGVhZCBvZiBleGFjdCBtYXRjaC4KPiA+Cj4gPiBIZWxsbywKPiA+Cj4gPiBJJ20gYSBsaXR0
bGUgc3VzcGVjdGluZyB0aGUgZWZmZWN0IG9mIGdsb2JfbWF0Y2guIEkgc2VsZG9tIGZvdW5kCj4g
PiB0aGUgdXNlIGNhc2UgdGhhdCB0aGUga2VybmVsIGZ1bmN0aW9ucyB3aGljaCB3ZSB3YW50IHRv
IHRyYWNlCj4gPiBoYXZlIHRoZSBzYW1lIG5hbWluZyBwYXR0ZXJuLiBBbmQgdGhlIGV4YWN0IG1h
dGNoIHNlZW1zIG1vcmUKPiA+IHVzZWZ1bC4KPiA+Cj4gPiBDYW4gd2UgdXNlIGJvdGggZXhhY3Qg
YW5kIGdsb2IgbWF0Y2ggaGVyZT8KPgo+IGV4YWN0IGlzIGEgc3Vic2V0IG9mIGdsb2JfbWF0Y2gu
Cj4gUGxzIGZvbGxvdyB0aGUgcGF0dGVybiB0aGF0W2t1XXByb2JlIG11bHRpIGVzdGFibGlzaGVk
Cj4gaW4gdGVybXMgb2YgdXNlciBpbnRlcmZhY2UgZXhwZWN0YXRpb25zLgoKT2theSEKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
