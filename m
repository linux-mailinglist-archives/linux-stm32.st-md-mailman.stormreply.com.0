Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A204385CF2F
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Feb 2024 04:58:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57C5FC6B460;
	Wed, 21 Feb 2024 03:58:12 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 137A2C64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Feb 2024 03:58:11 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-6e4841ce028so729702b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 19:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1708487889; x=1709092689;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jquv4CpaBSqhtiqh7lJvpOasNrgo49Zb1h9viA+rxj4=;
 b=YSi+IkkZvdIuumH4MTKbnDaFFDFno6mlvB2ok79OiFE1terf32dZ8buLi3gJVPsCmN
 yXXlhLLXV+/WtP3P/G0CtRHp4DVfuvVFGVrdS0HDw38962OgpWnjFvU3MIsRs25exUH/
 GVGBH+NWDMDCEAkn4wAie6u1GAKC+Z1EEip4mn1TLB4YHsKclN8vF73/6/cYWTj2wzEB
 7uE9uG7Xp/EkGLN5lUnP0mbue1vfNBgpTIB+w3fJoo7jL1gQPOCoFIXsKhV6PmQXmvDY
 56osS+RrlOgrhr+UhOEApw223fr+syQ5HIiAvzSFPMG+x4OULT4/BHdsZrbLGOQLsq0X
 jkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708487889; x=1709092689;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jquv4CpaBSqhtiqh7lJvpOasNrgo49Zb1h9viA+rxj4=;
 b=B2PYz/WlLvoiNgNWbJvG56qPQnGueJLaxhwIa/H98jhAn3ZAd31Svw1/54rrgrvj/o
 jNnj7unUCdxG5c0kzbduwIVviRcAh6ZC5er/1WMYwxoTXkNc924mnJ8/XVAhMrLRauN9
 HoxC9igwSkjviP3sgXYAOhXfKEwledH7D+nQpil5JghslPtH18t/chXv6qmp+w99pY+p
 OcSIE+49q1MTlL5Uu74q5Hk2iUsR+QAh0jAfvvJDLT6WuRvUX+idViggveKO2SmmVMsP
 Dg+PIPBWfmSq9kwiSn9sY6MVaU9QI5auW/0sEnmYfJ3AWQ/bYU9HowMGXYjYpaLXCt2K
 gV3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGPZOG9b7dbPXOy1JCja0V9bqqfbem0eR/cGhQkgS/OX3hK+oeFuJypExnfxCXqrlVCfk5nzZldvHNXGj0oORmn3VQZ+hUhrGknfE8xofia8V9DsLPdv2z
X-Gm-Message-State: AOJu0YwHNJ1oRjowIUQrVFwq7mFItQSZiRYAo4yE4VVfiPo3EKWc0gCH
 J9T1ZrbaSFnjMHDkHudhCf38mFdKPIUBZ1q6iiChF22zI+i28JGUwRhmHQa3N3Qz+dH0p7f5Q77
 2x0rKRDV7gUCKPFQj2xr3AM65KtG5sJHfD3+7TQ==
X-Google-Smtp-Source: AGHT+IEFB9mgAouA35P/IFzUU88J+61x2Pg2aLsGi1Cb2/PG/KohmSs7+vl57fDt/Eq95l7k+PyXxygh+8rDDdHcp2E=
X-Received: by 2002:a05:6a20:d38f:b0:19e:a353:81b0 with SMTP id
 iq15-20020a056a20d38f00b0019ea35381b0mr17920299pzb.11.1708487889551; Tue, 20
 Feb 2024 19:58:09 -0800 (PST)
MIME-Version: 1.0
References: <20240220035105.34626-1-dongmenglong.8@bytedance.com>
 <CAADnVQ+E4ygZV6dcs8wj5FdFz9bfrQ=61235uiRoxe9RqQvR9Q@mail.gmail.com>
 <CALz3k9g__P+UdO2vLPrR5Y4sQonQJjOnGPNmhmxtRfhLKoV7Rg@mail.gmail.com>
 <CALz3k9h8CoAP8+ZmNvNGeXL9D_Q83Ovrubz9zHECr6C0TXuoVg@mail.gmail.com>
 <CAADnVQ+bOhh1R_eCoThyNg50dd4nA4-qhpXxOWheLeA_44npXg@mail.gmail.com>
 <CALz3k9jDsmNMrXdxdx152fgvBxDoY4Lj_xMf8z-pwPtpm75vXQ@mail.gmail.com>
 <CAADnVQLtHQO9X7EBxe4x6YyAdQi33aqzTirTJff5epTcBatd3g@mail.gmail.com>
In-Reply-To: <CAADnVQLtHQO9X7EBxe4x6YyAdQi33aqzTirTJff5epTcBatd3g@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Wed, 21 Feb 2024 11:57:58 +0800
Message-ID: <CALz3k9gM9Leuztxs9ZrM5YgwLXFQ4FMnBxHr6P=Q+GppPv5d=g@mail.gmail.com>
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

T24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgMTE6MTjigK9BTSBBbGV4ZWkgU3Rhcm92b2l0b3YKPGFs
ZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBGZWIgMjAsIDIw
MjQgYXQgNzowNuKAr1BNIOaipum+meiRoyA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4g
d3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgMTE6MDLigK9BTSBBbGV4ZWkg
U3Rhcm92b2l0b3YKPiA+IDxhbGV4ZWkuc3Rhcm92b2l0b3ZAZ21haWwuY29tPiB3cm90ZToKPiA+
ID4KPiA+ID4gT24gVHVlLCBGZWIgMjAsIDIwMjQgYXQgNjo0NeKAr1BNIOaipum+meiRoyA8ZG9u
Z21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBXZWQs
IEZlYiAyMSwgMjAyNCBhdCAxMDozNeKAr0FNIOaipum+meiRoyA8ZG9uZ21lbmdsb25nLjhAYnl0
ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSGVsbG8sCj4gPiA+ID4gPgo+
ID4gPiA+ID4gT24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgOToyNOKAr0FNIEFsZXhlaSBTdGFyb3Zv
aXRvdgo+ID4gPiA+ID4gPGFsZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+IHdyb3RlOgo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiBPbiBNb24sIEZlYiAxOSwgMjAyNCBhdCA3OjUx4oCvUE0gTWVu
Z2xvbmcgRG9uZwo+ID4gPiA+ID4gPiA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4gd3Jv
dGU6Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBGb3Igbm93LCB0aGUgQlBGIHByb2dyYW0g
b2YgdHlwZSBCUEZfUFJPR19UWVBFX1RSQUNJTkcgaXMgbm90IGFsbG93ZWQgdG8KPiA+ID4gPiA+
ID4gPiBiZSBhdHRhY2hlZCB0byBtdWx0aXBsZSBob29rcywgYW5kIHdlIGhhdmUgdG8gY3JlYXRl
IGEgQlBGIHByb2dyYW0gZm9yCj4gPiA+ID4gPiA+ID4gZWFjaCBrZXJuZWwgZnVuY3Rpb24sIGZv
ciB3aGljaCB3ZSB3YW50IHRvIHRyYWNlLCBldmVuIHRocm91Z2ggYWxsIHRoZQo+ID4gPiA+ID4g
PiA+IHByb2dyYW0gaGF2ZSB0aGUgc2FtZSAob3Igc2ltaWxhcikgbG9naWMuIFRoaXMgY2FuIGNv
bnN1bWUgZXh0cmEgbWVtb3J5LAo+ID4gPiA+ID4gPiA+IGFuZCBtYWtlIHRoZSBwcm9ncmFtIGxv
YWRpbmcgc2xvdyBpZiB3ZSBoYXZlIHBsZW50eSBvZiBrZXJuZWwgZnVuY3Rpb24gdG8KPiA+ID4g
PiA+ID4gPiB0cmFjZS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gU2hvdWxkIHRoaXMgYmUgY29t
YmluZWQgd2l0aCBtdWx0aSBsaW5rID8KPiA+ID4gPiA+ID4gKEFzIHdhcyByZWNlbnRseSBkb25l
IGZvciBrcHJvYmVfbXVsdGkgYW5kIHVwcm9iZV9tdWx0aSkuCj4gPiA+ID4gPiA+IExvYWRpbmcg
ZmVudHJ5IHByb2cgb25jZSBhbmQgYXR0YWNoaW5nIGl0IHRocm91Z2ggbWFueSBicGZfbGlua3MK
PiA+ID4gPiA+ID4gdG8gbXVsdGlwbGUgcGxhY2VzIGlzIGEgbmljZSBhZGRpdGlvbiwKPiA+ID4g
PiA+ID4gYnV0IHdlIHNob3VsZCBwcm9iYWJseSBhZGQgYSBtdWx0aSBsaW5rIHJpZ2h0IGF3YXkg
dG9vLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEkgd2FzIHBsYW5uaW5nIHRvIGltcGxlbWVudCB0aGUg
bXVsdGkgbGluayBmb3IgdHJhY2luZyBhZnRlciB0aGlzCj4gPiA+ID4gPiBzZXJpZXMgaW4gYW5v
dGhlciBzZXJpZXMuIEkgY2FuIGRvIGl0IHRvZ2V0aGVyIHdpdGggdGhpcyBzZXJpZXMKPiA+ID4g
PiA+IGlmIHlvdSBwcmVmZXIuCj4gPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gU2hvdWxkIEkgaW50
cm9kdWNlIHRoZSBtdWx0aSBsaW5rIGZvciB0cmFjaW5nIGZpcnN0LCB0aGVuIHRoaXMgc2VyaWVz
Pwo+ID4gPiA+IChGdXJ0aGVybW9yZSwgdGhpcyBzZXJpZXMgc2VlbXMgbm90IG5lY2Vzc2FyeS4p
Cj4gPiA+Cj4gPiA+IFdoYXQgZG8geW91IG1lYW4gIm5vdCBuZWNlc3NhcnkiID8KPiA+ID4gRG9u
J3QgeW91IHdhbnQgdG8gc3RpbGwgY2hlY2sgdGhhdCBicGYgcHJvZyBhY2Nlc3Mgb25seSBOIGFy
Z3MKPiA+ID4gYW5kIEJURiBmb3IgdGhlc2UgYXJncyBtYXRjaGVzIGFjcm9zcyBhbGwgYXR0YWNo
IHBvaW50cyA/Cj4gPgo+ID4gTm8sIEkgbWVhbnMgdGhhdCBpZiB3ZSBzaG91bGQga2VlcCB0aGUK
PiA+Cj4gPiAiTG9hZGluZyBmZW50cnkgcHJvZyBvbmNlIGFuZCBhdHRhY2hpbmcgaXQgdGhyb3Vn
aCBtYW55IGJwZl9saW5rcyB0bwo+ID4gbXVsdGlwbGUgcGxhY2VzIgo+ID4KPiA+IGFuZCBvbmx5
IGtlZXAgdGhlIG11bHRpIGxpbmsuCj4KPiBJIHN1c3BlY3Qgc3VwcG9ydGluZyBtdWx0aSBsaW5r
IG9ubHkgaXMgYmV0dGVyLAo+IHNpbmNlIHRoZSBhbW91bnQgb2Yga2VybmVsIGNvZGUgdG8gbWFp
bnRhaW4gd2lsbCBiZSBsZXNzLgoKT2theSEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
