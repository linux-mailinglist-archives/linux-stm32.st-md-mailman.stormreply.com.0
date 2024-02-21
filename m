Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 487E485CE9E
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Feb 2024 04:18:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F01A9C6B45E;
	Wed, 21 Feb 2024 03:18:38 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EAB8C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Feb 2024 03:18:37 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-33d4c11bd34so2191201f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 19:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708485517; x=1709090317;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YjOY1NT3Toze+hbapT33EQhrctZc4RHHjTOynWFnvX8=;
 b=Eg6X+qh0XuUINt4UItE4fr0yh0tQBVU+Qn5WpeUZvyUi03tAczFF8tZVjkKIyyBDzO
 LpJ3ujKq9ewDZ15rDpByKjgYwmkhkWdmNnw3YsbHSKspPV+mgdliK3CyB45tMgekaOaN
 Kr0HwoxdGfrGyy1PvQpChPouHecmwFyiDU1VDWOpUxGYFlN6tKGsPxlFBtb7ZPLeh2o/
 EU14speivKIFQdEZ3jR/jUR0I2vaPhOiPOnHsvXypQ60IRDodzY87z3lBm3T9KHsw/B/
 UWaltHvwwFGsjYf1c5yOissyyCsrpBpvUia/OfeghROVwuGv1CYJLH47s0cBo/OIvAGe
 hrvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708485517; x=1709090317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YjOY1NT3Toze+hbapT33EQhrctZc4RHHjTOynWFnvX8=;
 b=ohqBNWn5kK+tAyufRXxSsQ7HJyfIoSEAqACRag0OgPRaS1yrJZUQZG8KaEGE71kZGQ
 FJhT5ALk/ZmG3kUUC1ONinpTNMnZGNIeiAqDPOjvn9VwSKqpzXjLIozWj3fJOWGUi4K0
 DKrFouzc82kyfJEIBoKNbVbu9dILQentKZI+jCwYULogRmnsJEhuCCsW+v9jEen/4rm8
 lJIF1qu0nF2kLZ+SImx1mdX9SpUwbLwui2GvzzVmslgeUz7X4hT/adhRlGIlJmgqmjTf
 eVES2TBbU3R1lhMFkJfNZRZkxlNuai0XyU+X7sGlMcaEOzVLDoPwS5JDcjv7uHmqCRjp
 oZDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhkhx0W6a+LXkFCZyyeppXTehjnL5C85mwHujED3jY/Y/QdaSQDSTL3qsHTEWMFOoNgrOPvVZqJ+WHrxegDlSx4ZdXb8DIzZbBcpn5czqVN+nPrI0Ah+ZM
X-Gm-Message-State: AOJu0YzG7hq8mcDX54S7uGvb7nF+G8WJK5MlR2nqd5ug6+BdqAU+hyGo
 B7s3PFd2/q5wfJ/fWGEHAtQvd934+8DDj/MUqvtLSFqzDcfujFZhZws4rm7D+GPal6BLFlzCR6P
 QtDNhVxMWeNxMraHog+tyxtmbgDI=
X-Google-Smtp-Source: AGHT+IEV5OTOCU7bkVs32hhOGawMm8ecRegdVLd5HB02lrhHelgJw8Pdx9lykB+NhxWj43O86nFnQy3ZP+oLC/c+43E=
X-Received: by 2002:a5d:660e:0:b0:33c:f9d6:fb20 with SMTP id
 n14-20020a5d660e000000b0033cf9d6fb20mr13184216wru.45.1708485516775; Tue, 20
 Feb 2024 19:18:36 -0800 (PST)
MIME-Version: 1.0
References: <20240220035105.34626-1-dongmenglong.8@bytedance.com>
 <CAADnVQ+E4ygZV6dcs8wj5FdFz9bfrQ=61235uiRoxe9RqQvR9Q@mail.gmail.com>
 <CALz3k9g__P+UdO2vLPrR5Y4sQonQJjOnGPNmhmxtRfhLKoV7Rg@mail.gmail.com>
 <CALz3k9h8CoAP8+ZmNvNGeXL9D_Q83Ovrubz9zHECr6C0TXuoVg@mail.gmail.com>
 <CAADnVQ+bOhh1R_eCoThyNg50dd4nA4-qhpXxOWheLeA_44npXg@mail.gmail.com>
 <CALz3k9jDsmNMrXdxdx152fgvBxDoY4Lj_xMf8z-pwPtpm75vXQ@mail.gmail.com>
In-Reply-To: <CALz3k9jDsmNMrXdxdx152fgvBxDoY4Lj_xMf8z-pwPtpm75vXQ@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 20 Feb 2024 19:18:25 -0800
Message-ID: <CAADnVQLtHQO9X7EBxe4x6YyAdQi33aqzTirTJff5epTcBatd3g@mail.gmail.com>
To: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
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

T24gVHVlLCBGZWIgMjAsIDIwMjQgYXQgNzowNuKAr1BNIOaipum+meiRoyA8ZG9uZ21lbmdsb25n
LjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEZlYiAyMSwgMjAyNCBhdCAxMTow
MuKAr0FNIEFsZXhlaSBTdGFyb3ZvaXRvdgo+IDxhbGV4ZWkuc3Rhcm92b2l0b3ZAZ21haWwuY29t
PiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIEZlYiAyMCwgMjAyNCBhdCA2OjQ14oCvUE0g5qKm6b6Z
6JGjIDxkb25nbWVuZ2xvbmcuOEBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24g
V2VkLCBGZWIgMjEsIDIwMjQgYXQgMTA6MzXigK9BTSDmoqbpvpnokaMgPGRvbmdtZW5nbG9uZy44
QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gSGVsbG8sCj4gPiA+ID4KPiA+
ID4gPiBPbiBXZWQsIEZlYiAyMSwgMjAyNCBhdCA5OjI04oCvQU0gQWxleGVpIFN0YXJvdm9pdG92
Cj4gPiA+ID4gPGFsZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4K
PiA+ID4gPiA+IE9uIE1vbiwgRmViIDE5LCAyMDI0IGF0IDc6NTHigK9QTSBNZW5nbG9uZyBEb25n
Cj4gPiA+ID4gPiA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IEZvciBub3csIHRoZSBCUEYgcHJvZ3JhbSBvZiB0eXBlIEJQRl9QUk9H
X1RZUEVfVFJBQ0lORyBpcyBub3QgYWxsb3dlZCB0bwo+ID4gPiA+ID4gPiBiZSBhdHRhY2hlZCB0
byBtdWx0aXBsZSBob29rcywgYW5kIHdlIGhhdmUgdG8gY3JlYXRlIGEgQlBGIHByb2dyYW0gZm9y
Cj4gPiA+ID4gPiA+IGVhY2gga2VybmVsIGZ1bmN0aW9uLCBmb3Igd2hpY2ggd2Ugd2FudCB0byB0
cmFjZSwgZXZlbiB0aHJvdWdoIGFsbCB0aGUKPiA+ID4gPiA+ID4gcHJvZ3JhbSBoYXZlIHRoZSBz
YW1lIChvciBzaW1pbGFyKSBsb2dpYy4gVGhpcyBjYW4gY29uc3VtZSBleHRyYSBtZW1vcnksCj4g
PiA+ID4gPiA+IGFuZCBtYWtlIHRoZSBwcm9ncmFtIGxvYWRpbmcgc2xvdyBpZiB3ZSBoYXZlIHBs
ZW50eSBvZiBrZXJuZWwgZnVuY3Rpb24gdG8KPiA+ID4gPiA+ID4gdHJhY2UuCj4gPiA+ID4gPgo+
ID4gPiA+ID4gU2hvdWxkIHRoaXMgYmUgY29tYmluZWQgd2l0aCBtdWx0aSBsaW5rID8KPiA+ID4g
PiA+IChBcyB3YXMgcmVjZW50bHkgZG9uZSBmb3Iga3Byb2JlX211bHRpIGFuZCB1cHJvYmVfbXVs
dGkpLgo+ID4gPiA+ID4gTG9hZGluZyBmZW50cnkgcHJvZyBvbmNlIGFuZCBhdHRhY2hpbmcgaXQg
dGhyb3VnaCBtYW55IGJwZl9saW5rcwo+ID4gPiA+ID4gdG8gbXVsdGlwbGUgcGxhY2VzIGlzIGEg
bmljZSBhZGRpdGlvbiwKPiA+ID4gPiA+IGJ1dCB3ZSBzaG91bGQgcHJvYmFibHkgYWRkIGEgbXVs
dGkgbGluayByaWdodCBhd2F5IHRvby4KPiA+ID4gPgo+ID4gPiA+IEkgd2FzIHBsYW5uaW5nIHRv
IGltcGxlbWVudCB0aGUgbXVsdGkgbGluayBmb3IgdHJhY2luZyBhZnRlciB0aGlzCj4gPiA+ID4g
c2VyaWVzIGluIGFub3RoZXIgc2VyaWVzLiBJIGNhbiBkbyBpdCB0b2dldGhlciB3aXRoIHRoaXMg
c2VyaWVzCj4gPiA+ID4gaWYgeW91IHByZWZlci4KPiA+ID4gPgo+ID4gPgo+ID4gPiBTaG91bGQg
SSBpbnRyb2R1Y2UgdGhlIG11bHRpIGxpbmsgZm9yIHRyYWNpbmcgZmlyc3QsIHRoZW4gdGhpcyBz
ZXJpZXM/Cj4gPiA+IChGdXJ0aGVybW9yZSwgdGhpcyBzZXJpZXMgc2VlbXMgbm90IG5lY2Vzc2Fy
eS4pCj4gPgo+ID4gV2hhdCBkbyB5b3UgbWVhbiAibm90IG5lY2Vzc2FyeSIgPwo+ID4gRG9uJ3Qg
eW91IHdhbnQgdG8gc3RpbGwgY2hlY2sgdGhhdCBicGYgcHJvZyBhY2Nlc3Mgb25seSBOIGFyZ3MK
PiA+IGFuZCBCVEYgZm9yIHRoZXNlIGFyZ3MgbWF0Y2hlcyBhY3Jvc3MgYWxsIGF0dGFjaCBwb2lu
dHMgPwo+Cj4gTm8sIEkgbWVhbnMgdGhhdCBpZiB3ZSBzaG91bGQga2VlcCB0aGUKPgo+ICJMb2Fk
aW5nIGZlbnRyeSBwcm9nIG9uY2UgYW5kIGF0dGFjaGluZyBpdCB0aHJvdWdoIG1hbnkgYnBmX2xp
bmtzIHRvCj4gbXVsdGlwbGUgcGxhY2VzIgo+Cj4gYW5kIG9ubHkga2VlcCB0aGUgbXVsdGkgbGlu
ay4KCkkgc3VzcGVjdCBzdXBwb3J0aW5nIG11bHRpIGxpbmsgb25seSBpcyBiZXR0ZXIsCnNpbmNl
IHRoZSBhbW91bnQgb2Yga2VybmVsIGNvZGUgdG8gbWFpbnRhaW4gd2lsbCBiZSBsZXNzLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
