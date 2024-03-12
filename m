Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F15878CE2
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Mar 2024 03:13:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60010C6DD9D;
	Tue, 12 Mar 2024 02:13:18 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12337C6DD73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 02:13:16 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-33e9dfd343fso607104f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 19:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710209596; x=1710814396;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xxgkr5eNkvW5q1zkcYlUGp+GjUJ5hPdmOjnvJkUucnk=;
 b=MvmoSfzs8Y69AGeF//ycU1WehHFnWhB6yCNyrzJzZRANrIqJ2GWnflDkqEeVA9r4eX
 5lIf0oSIFowaHLXiBbnpqRtDzFQcZoraZ6VRTc+ZNDnUQp7G0RWRMsIkn972wC+EDm6u
 5+bUimTdF1qd0+ZUFHBT6v1V5R1yfpCp+9reWJB+QH2LwewE03vFdCZfVfgGSasYLjKo
 HJdx632SAiyzrEzBhzrvGaPMS4P4TGn7QkPan3fUjJ3BqEk09/I1S7ntCd8pEUSyRP5g
 1Ig2Yuhn2RWJYseIfhg4rruik0bamJgAi8Kocs/TwEfd5JSBC8HZ7jLKumjPUfBlSSrU
 msLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710209596; x=1710814396;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xxgkr5eNkvW5q1zkcYlUGp+GjUJ5hPdmOjnvJkUucnk=;
 b=qwHanmDsc6p8edafLKAJ9db5MQpkEjfGq4aJOk0u1ey/n8lgy63lVxNnv07g0ADcOl
 mShZgvfBmOEWd+yORQHrAAV4Pcblyq7OpK5NYvsrnvbdvCdUG6Z7CL6GWkF9CtooraTl
 0LKrtt3iNd1Vkwup5Zr1EGIW0FaEFZsOVOaR+Del+RYLqSxzXhXuvjP030lfej3zHTKb
 GFdIM0CbA8+dlZrKHYsQ5aSLW8ZMk5XxCleMJ7LD+tLRNCXoLD2rjuvnLnx9xPy+NZzW
 rfaWL3H/yTjN8Wp//KiygV+zJsh5+hnSrLWsuYCsZEY96CNm7XS49j2MZc6jRdXy39nR
 Er9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/1OwVBOwlFoCR0sgS0ycqKEc4lQSNAw8vacBaw2+FNA8bsRYWirh2tnFfIQw42RifIfOjvE++2nTbEbxr3T4QRpEt8h7nKMFR4+bsPhMX5eX8YuOh/HRl
X-Gm-Message-State: AOJu0YzJ0siWz7UVwI5DE7mwQ6rZ3G6j49kTUoqaLPSvO4+7olehGoRN
 qiopdW9xKtHUYWw6+ZS6SZDAQuQ1KAfZjXr01ywqLTbXMaFxeSmtWXe+l0UQxtpDNhaHOe+ZNm8
 SOqCl9IdEQnOLt8lXdkLqwj/txmI=
X-Google-Smtp-Source: AGHT+IGaeIqJnZOJ/SuZRPtu+8MtD/3nozajQZ94fUgHlD7gwqeVkMLfFrTcgwoFQp9lHB+TsWg3BU+ivdAF6tyjFJM=
X-Received: by 2002:a5d:4112:0:b0:33e:74c6:bcb2 with SMTP id
 l18-20020a5d4112000000b0033e74c6bcb2mr5165378wrp.16.1710209596408; Mon, 11
 Mar 2024 19:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-8-dongmenglong.8@bytedance.com>
 <CAADnVQK4tdefa3s=sim69Sc+ztd-hHohPEDXaUNVTU-mLNYUiw@mail.gmail.com>
 <CALz3k9iabeOwHSrPb9mkfCuOebanh3+bAfi7xh3kBBN0DzHC3A@mail.gmail.com>
In-Reply-To: <CALz3k9iabeOwHSrPb9mkfCuOebanh3+bAfi7xh3kBBN0DzHC3A@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 11 Mar 2024 19:13:05 -0700
Message-ID: <CAADnVQKsrLB-2bD53R4ZdzUVdx1aqkgom1rzGCGKK0M3Uc+csQ@mail.gmail.com>
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

T24gTW9uLCBNYXIgMTEsIDIwMjQgYXQgNzowNeKAr1BNIOaipum+meiRoyA8ZG9uZ21lbmdsb25n
LjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiA+ID4KPiA+ID4gK0xJQkJQRl9BUEkgdm9pZCBi
cGZfb2JqZWN0X19mcmVlX2J0ZnMoc3RydWN0IGJwZl9vYmplY3QgKm9iaik7Cj4gPiA+ICsKPiA+
Cj4gPiBJdCBzaG91bGRuJ3QgYmUgZXhwb3J0ZWQuCj4gPiBsaWJicGYgc2hvdWxkIGNsZWFuIGl0
IHVwIHdoZW4gYnBmX29iamVjdCBpcyBmcmVlZC4KPgo+IFllcywgbGliYnBmIHdpbGwgY2xlYW4g
dXAgdGhlIGJ0ZnMgd2hlbiBicGZfb2JqZWN0IGlzIGZyZWVkIGluCj4gdGhpcyBjb21taXQuIEFu
ZCBJJ20gdHJ5aW5nIHRvIG9mZmVyIGEgd2F5IHRvIGVhcmx5IGZyZWUgdGhlIGJ0ZnMKPiBieSB0
aGUgdXNlcnMgbWFudWFsIHRvIHJlZHVjZSB0aGUgbWVtb3J5IHVzYWdlLiBPciwgdGhlCj4gYnRm
cyB0aGF0IHdlIG9wZW5lZCB3aWxsIGtlZXAgZXhpc3RpbmcgdW50aWwgd2UgY2xvc2UgdGhlCj4g
YnBmX29iamVjdC4KPgo+IFRoaXMgaXMgb3B0aW9uYWwsIEkgY2FuIHJlbW92ZSBpdCBpZiB5b3Ug
cHJlZmVyLgoKTGV0J3Mgbm90IGV4dGVuZCBsaWJicGYgYXBpIHVubGVzcyB3ZSByZWFsbHkgbmVl
ZCB0by4KYnBmX3Byb2dyYW1fX2F0dGFjaF90cmFjZV9tdWx0aV9vcHRzKCkgYW5kCipza2VsKl9f
YXR0YWNoKCkgY2FuIHByb2JhYmx5IGZyZWUgdGhlbS4KSSBkb24ndCBzZWUgYSB1c2UgY2FzZSB3
aGVyZSB5b3UnZCB3YW50IHRvIGtlZXAgdGhlbSBhZnRlcndhcmRzLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
