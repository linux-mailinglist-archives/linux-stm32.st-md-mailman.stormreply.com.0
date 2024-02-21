Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7D885CE3F
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Feb 2024 03:46:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF658C6B45E;
	Wed, 21 Feb 2024 02:46:01 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AC1BC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Feb 2024 02:46:00 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-29951f5c2e7so1952079a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 18:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1708483559; x=1709088359;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ve1P36IQxgQSH5e/j0CQ97PbRHxGM/0Cwkl/MH1SMuI=;
 b=IlNxCIuwIj3CUvot5GztBv0YgZbFSeE1ArX56yLz72v/sd0xeON5lBnPtgZrIgG8BN
 bWdY6zV5A+4pHg8K/k2TPoM9VNGTvSQdV7JJ3YsRJA5Cx0gpw540lJ4AekiTVbEpjOYV
 11Gj0tjC4sW+6b+D1z6jVAaFcu6LiF2lrKvykOSc/cNNJL4bwsK2dq8W6Gujr4ztvLCk
 gM2MAJQ4HV5Ny483tzLoSOEcK/qzQx89XkxMepvH1jYxRBn3QVXmiaLHyVrdXm7xiuTM
 7X0a4ky/Ox6SKJzIlOJcBysUOdtArWFJKX/Cp3c96kArmJKwyV1/2lO9A3k5ItHfLV2o
 vGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708483559; x=1709088359;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ve1P36IQxgQSH5e/j0CQ97PbRHxGM/0Cwkl/MH1SMuI=;
 b=MFpqgJfDUXzl6PMiuITqEYFvTaBAn8yZxEahB01DiUjXcSGrgeVQQIHs7mxmkCYfN1
 b9O8VJel5Zj9hSVntiU2iJ0ychj+2wVX5CXZbS4dshM+eq2ZidZ1K1ZjXXS25NLsYIqU
 0iOw0GfUOnvseTgNCVIGbc3pDKOzCPlr9yAZ49oCilhdFRsvzFPiXtu+P0tCOpSBoj4O
 uJxVjEx51e/ocHGzWDGZLA7yuK0eABzR3RIRHNP6awPMdS0c4jWjdmUzdr3m65890qJE
 BATQJGd3n9aq3sLhI9Lvp0CRluLlp6wOynMwQYrCSjQKRcIUGN6UduAwoGLJt70sm0er
 sNRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE36j1dbKPTFxbcFis/rF9yCljw9vzq5zd3y0fHMrokLhxrr14mcYaj9pf54LNDN3hThuhMY8XaeBwMXUTZ/vlir7uvDNJ2cIClf2XB8dP7GCLgqumjM2s
X-Gm-Message-State: AOJu0YwBkQCyKaUtxYJXIhw3vzmk8lmDBiGsZ8YkcGF4WSC4LQ5VWQUN
 GqWMph5JVjy2pfYpI6Bjwbl8V0BVJI59xVt2/2IwY/Io6wVKqZfXPVexqTva4dI3udfzfjJ0CHB
 QMZ2+ldrhTgVoff7JkFa7pfcpMMITunqBjkCqAA==
X-Google-Smtp-Source: AGHT+IGashesbOHbcyrknzxfVk2lf4tXLZJ5jdamBO+1t79MQQSOI9DHPUj6TjyB6Xz8pKhd36pDvEFEfQoRdh2c6sc=
X-Received: by 2002:a17:90b:1281:b0:299:6848:28c1 with SMTP id
 fw1-20020a17090b128100b00299684828c1mr7815650pjb.26.1708483558766; Tue, 20
 Feb 2024 18:45:58 -0800 (PST)
MIME-Version: 1.0
References: <20240220035105.34626-1-dongmenglong.8@bytedance.com>
 <CAADnVQ+E4ygZV6dcs8wj5FdFz9bfrQ=61235uiRoxe9RqQvR9Q@mail.gmail.com>
 <CALz3k9g__P+UdO2vLPrR5Y4sQonQJjOnGPNmhmxtRfhLKoV7Rg@mail.gmail.com>
In-Reply-To: <CALz3k9g__P+UdO2vLPrR5Y4sQonQJjOnGPNmhmxtRfhLKoV7Rg@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Wed, 21 Feb 2024 10:45:47 +0800
Message-ID: <CALz3k9h8CoAP8+ZmNvNGeXL9D_Q83Ovrubz9zHECr6C0TXuoVg@mail.gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Dave Marchevsky <davemarchevsky@fb.com>, Song Liu <song@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Yonghong Song <yonghong.song@linux.dev>,
 Kui-Feng Lee <thinker.li@gmail.com>, Shuah Khan <shuah@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Mykola Lysenko <mykolal@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Feng Zhou <zhoufeng.zf@bytedance.com>, mcoquelin.stm32@gmail.com,
 Alexei Starovoitov <ast@kernel.org>, Daniel Xu <dxu@dxuuu.xyz>,
 KP Singh <kpsingh@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Eddy Z <eddyz87@gmail.com>, Jiri Olsa <jolsa@kernel.org>,
 bpf <bpf@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [Linux-stm32] [External] Re: [PATCH bpf-next 0/5] bpf: make
 tracing program support multi-attach
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

T24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgMTA6MzXigK9BTSDmoqbpvpnokaMgPGRvbmdtZW5nbG9u
Zy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiBPbiBXZWQsIEZlYiAyMSwg
MjAyNCBhdCA5OjI04oCvQU0gQWxleGVpIFN0YXJvdm9pdG92Cj4gPGFsZXhlaS5zdGFyb3ZvaXRv
dkBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgRmViIDE5LCAyMDI0IGF0IDc6NTHi
gK9QTSBNZW5nbG9uZyBEb25nCj4gPiA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IEZvciBub3csIHRoZSBCUEYgcHJvZ3JhbSBvZiB0eXBlIEJQRl9QUk9H
X1RZUEVfVFJBQ0lORyBpcyBub3QgYWxsb3dlZCB0bwo+ID4gPiBiZSBhdHRhY2hlZCB0byBtdWx0
aXBsZSBob29rcywgYW5kIHdlIGhhdmUgdG8gY3JlYXRlIGEgQlBGIHByb2dyYW0gZm9yCj4gPiA+
IGVhY2gga2VybmVsIGZ1bmN0aW9uLCBmb3Igd2hpY2ggd2Ugd2FudCB0byB0cmFjZSwgZXZlbiB0
aHJvdWdoIGFsbCB0aGUKPiA+ID4gcHJvZ3JhbSBoYXZlIHRoZSBzYW1lIChvciBzaW1pbGFyKSBs
b2dpYy4gVGhpcyBjYW4gY29uc3VtZSBleHRyYSBtZW1vcnksCj4gPiA+IGFuZCBtYWtlIHRoZSBw
cm9ncmFtIGxvYWRpbmcgc2xvdyBpZiB3ZSBoYXZlIHBsZW50eSBvZiBrZXJuZWwgZnVuY3Rpb24g
dG8KPiA+ID4gdHJhY2UuCj4gPgo+ID4gU2hvdWxkIHRoaXMgYmUgY29tYmluZWQgd2l0aCBtdWx0
aSBsaW5rID8KPiA+IChBcyB3YXMgcmVjZW50bHkgZG9uZSBmb3Iga3Byb2JlX211bHRpIGFuZCB1
cHJvYmVfbXVsdGkpLgo+ID4gTG9hZGluZyBmZW50cnkgcHJvZyBvbmNlIGFuZCBhdHRhY2hpbmcg
aXQgdGhyb3VnaCBtYW55IGJwZl9saW5rcwo+ID4gdG8gbXVsdGlwbGUgcGxhY2VzIGlzIGEgbmlj
ZSBhZGRpdGlvbiwKPiA+IGJ1dCB3ZSBzaG91bGQgcHJvYmFibHkgYWRkIGEgbXVsdGkgbGluayBy
aWdodCBhd2F5IHRvby4KPgo+IEkgd2FzIHBsYW5uaW5nIHRvIGltcGxlbWVudCB0aGUgbXVsdGkg
bGluayBmb3IgdHJhY2luZyBhZnRlciB0aGlzCj4gc2VyaWVzIGluIGFub3RoZXIgc2VyaWVzLiBJ
IGNhbiBkbyBpdCB0b2dldGhlciB3aXRoIHRoaXMgc2VyaWVzCj4gaWYgeW91IHByZWZlci4KPgoK
U2hvdWxkIEkgaW50cm9kdWNlIHRoZSBtdWx0aSBsaW5rIGZvciB0cmFjaW5nIGZpcnN0LCB0aGVu
IHRoaXMgc2VyaWVzPwooRnVydGhlcm1vcmUsIHRoaXMgc2VyaWVzIHNlZW1zIG5vdCBuZWNlc3Nh
cnkuKQoKPiBUaGFua3MhCj4gTWVuZ2xvbmcgRG9uZwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
