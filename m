Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 774FD85CE8C
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Feb 2024 04:06:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B693C6B45E;
	Wed, 21 Feb 2024 03:06:33 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CD90C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Feb 2024 03:06:32 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-299846d6ccfso1764213a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 19:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1708484791; x=1709089591;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Qyykz5fB4a0+o7/sN39zAOQibndEWz+FsTBhS+hLSs=;
 b=Rxij+XX7K1aLDmXEiOKcz95X6O2fXepCecxnZlpQ/qdj0B8gsmhh9dwvmgVCumTIJS
 HVSrTz5ks1p5kAZF2cUgjK42z8kU29rU4b6IE9T7XNi3vUsb/KhZZhcn8+OFpEUXFFWr
 DJRNZ8J8oYoask7zEdJyNC7KM9n2Q94dPn0um/xDWGY41HeRFM54mfjhcQjoqgRpvNZD
 HFMkdgK/DRHE8cSNzBDPUABIQ6kkDcBjikEAuXLeSlbl0uZgDjZWm9xdrQYyiXArPu97
 hvOIKjBC6j+eBQLTbbBi2QWsKn3YW5gi5O72GOQ4f3bIwY9T/JYmWLvC5YLqRJc/iprz
 9g4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708484791; x=1709089591;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Qyykz5fB4a0+o7/sN39zAOQibndEWz+FsTBhS+hLSs=;
 b=MB3eXSw1bayC1U4Ol6nrQ0NshKUuvaFRHRaiceCTDJCB6M/4RIB+Q1EcZ0YDDbscz9
 0sXtP04aOdKAf3po/ughzeiwStxKW5gLqDtWwVRL5ms4dGzEkiIZAg3iNnU3CHa+4mRg
 vJ3Vk9KJg9hlPsEG8DYZGStIBeiKXCEC/lkuFnqrzPMhDzk4pb1+Y8MB+zpY1Dj7HNxF
 5QZgiSK8xc6cP9eeizJ+UDxmpp4Wy8wPe4EI4CMj7aBD6CY8H9bngiVxehNtAjTPxAd3
 mh9EJP8jWGqEldaTowvCOCpFncB5s46Hj5WM3dz6gKHgvrLGTghOqBMioMFBbUPxFuPt
 fq0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeyyEkJ8jrX3jee86UPN7GOcQo7EwykCeDVaD4vOL5mkOrKZtfcqbVLUX1I8L7W2+0k9UBGc9aRB+LhS9syvStB/JoyXYMs3BDk+zDw9nhwRo/w9Xg7Vrf
X-Gm-Message-State: AOJu0YyOvhESaYEFnaYBBNSS4MYnxeSeTcujhLBtP4yEMMjyMK8b9CEu
 xJT5Xs8UrXx3lxEf5EwDNEfoeN4SfRUvhpFexJhwKOsiP6UDkEz79E/BQE6jQaBADC1NyHlRcEg
 6aJsjINqtnLC7yslsa99LEKVVnK5NWSUiK2Nzhg==
X-Google-Smtp-Source: AGHT+IG3cmZn0y1k/Co1iZTZhM0M3UdbM2Nc78xLp+KeD+3W703kJkSFPbNvwzYDxLMM6p/A3k8QRN1yRX7txCHLsec=
X-Received: by 2002:a17:90a:9a94:b0:299:1777:134c with SMTP id
 e20-20020a17090a9a9400b002991777134cmr12773740pjp.33.1708484790860; Tue, 20
 Feb 2024 19:06:30 -0800 (PST)
MIME-Version: 1.0
References: <20240220035105.34626-1-dongmenglong.8@bytedance.com>
 <CAADnVQ+E4ygZV6dcs8wj5FdFz9bfrQ=61235uiRoxe9RqQvR9Q@mail.gmail.com>
 <CALz3k9g__P+UdO2vLPrR5Y4sQonQJjOnGPNmhmxtRfhLKoV7Rg@mail.gmail.com>
 <CALz3k9h8CoAP8+ZmNvNGeXL9D_Q83Ovrubz9zHECr6C0TXuoVg@mail.gmail.com>
 <CAADnVQ+bOhh1R_eCoThyNg50dd4nA4-qhpXxOWheLeA_44npXg@mail.gmail.com>
In-Reply-To: <CAADnVQ+bOhh1R_eCoThyNg50dd4nA4-qhpXxOWheLeA_44npXg@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Wed, 21 Feb 2024 11:06:20 +0800
Message-ID: <CALz3k9jDsmNMrXdxdx152fgvBxDoY4Lj_xMf8z-pwPtpm75vXQ@mail.gmail.com>
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

T24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgMTE6MDLigK9BTSBBbGV4ZWkgU3Rhcm92b2l0b3YKPGFs
ZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBGZWIgMjAsIDIw
MjQgYXQgNjo0NeKAr1BNIOaipum+meiRoyA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4g
d3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgMTA6MzXigK9BTSDmoqbpvpno
kaMgPGRvbmdtZW5nbG9uZy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBIZWxs
bywKPiA+ID4KPiA+ID4gT24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgOToyNOKAr0FNIEFsZXhlaSBT
dGFyb3ZvaXRvdgo+ID4gPiA8YWxleGVpLnN0YXJvdm9pdG92QGdtYWlsLmNvbT4gd3JvdGU6Cj4g
PiA+ID4KPiA+ID4gPiBPbiBNb24sIEZlYiAxOSwgMjAyNCBhdCA3OjUx4oCvUE0gTWVuZ2xvbmcg
RG9uZwo+ID4gPiA+IDxkb25nbWVuZ2xvbmcuOEBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+ID4g
PiA+Cj4gPiA+ID4gPiBGb3Igbm93LCB0aGUgQlBGIHByb2dyYW0gb2YgdHlwZSBCUEZfUFJPR19U
WVBFX1RSQUNJTkcgaXMgbm90IGFsbG93ZWQgdG8KPiA+ID4gPiA+IGJlIGF0dGFjaGVkIHRvIG11
bHRpcGxlIGhvb2tzLCBhbmQgd2UgaGF2ZSB0byBjcmVhdGUgYSBCUEYgcHJvZ3JhbSBmb3IKPiA+
ID4gPiA+IGVhY2gga2VybmVsIGZ1bmN0aW9uLCBmb3Igd2hpY2ggd2Ugd2FudCB0byB0cmFjZSwg
ZXZlbiB0aHJvdWdoIGFsbCB0aGUKPiA+ID4gPiA+IHByb2dyYW0gaGF2ZSB0aGUgc2FtZSAob3Ig
c2ltaWxhcikgbG9naWMuIFRoaXMgY2FuIGNvbnN1bWUgZXh0cmEgbWVtb3J5LAo+ID4gPiA+ID4g
YW5kIG1ha2UgdGhlIHByb2dyYW0gbG9hZGluZyBzbG93IGlmIHdlIGhhdmUgcGxlbnR5IG9mIGtl
cm5lbCBmdW5jdGlvbiB0bwo+ID4gPiA+ID4gdHJhY2UuCj4gPiA+ID4KPiA+ID4gPiBTaG91bGQg
dGhpcyBiZSBjb21iaW5lZCB3aXRoIG11bHRpIGxpbmsgPwo+ID4gPiA+IChBcyB3YXMgcmVjZW50
bHkgZG9uZSBmb3Iga3Byb2JlX211bHRpIGFuZCB1cHJvYmVfbXVsdGkpLgo+ID4gPiA+IExvYWRp
bmcgZmVudHJ5IHByb2cgb25jZSBhbmQgYXR0YWNoaW5nIGl0IHRocm91Z2ggbWFueSBicGZfbGlu
a3MKPiA+ID4gPiB0byBtdWx0aXBsZSBwbGFjZXMgaXMgYSBuaWNlIGFkZGl0aW9uLAo+ID4gPiA+
IGJ1dCB3ZSBzaG91bGQgcHJvYmFibHkgYWRkIGEgbXVsdGkgbGluayByaWdodCBhd2F5IHRvby4K
PiA+ID4KPiA+ID4gSSB3YXMgcGxhbm5pbmcgdG8gaW1wbGVtZW50IHRoZSBtdWx0aSBsaW5rIGZv
ciB0cmFjaW5nIGFmdGVyIHRoaXMKPiA+ID4gc2VyaWVzIGluIGFub3RoZXIgc2VyaWVzLiBJIGNh
biBkbyBpdCB0b2dldGhlciB3aXRoIHRoaXMgc2VyaWVzCj4gPiA+IGlmIHlvdSBwcmVmZXIuCj4g
PiA+Cj4gPgo+ID4gU2hvdWxkIEkgaW50cm9kdWNlIHRoZSBtdWx0aSBsaW5rIGZvciB0cmFjaW5n
IGZpcnN0LCB0aGVuIHRoaXMgc2VyaWVzPwo+ID4gKEZ1cnRoZXJtb3JlLCB0aGlzIHNlcmllcyBz
ZWVtcyBub3QgbmVjZXNzYXJ5LikKPgo+IFdoYXQgZG8geW91IG1lYW4gIm5vdCBuZWNlc3Nhcnki
ID8KPiBEb24ndCB5b3Ugd2FudCB0byBzdGlsbCBjaGVjayB0aGF0IGJwZiBwcm9nIGFjY2VzcyBv
bmx5IE4gYXJncwo+IGFuZCBCVEYgZm9yIHRoZXNlIGFyZ3MgbWF0Y2hlcyBhY3Jvc3MgYWxsIGF0
dGFjaCBwb2ludHMgPwoKTm8sIEkgbWVhbnMgdGhhdCBpZiB3ZSBzaG91bGQga2VlcCB0aGUKCiJM
b2FkaW5nIGZlbnRyeSBwcm9nIG9uY2UgYW5kIGF0dGFjaGluZyBpdCB0aHJvdWdoIG1hbnkgYnBm
X2xpbmtzIHRvCm11bHRpcGxlIHBsYWNlcyIKCmFuZCBvbmx5IGtlZXAgdGhlIG11bHRpIGxpbmsu
CgpCb3RoIG1ldGhvZHMgbmVlZCB0byBjaGVjayB0aGUgYWNjZXNzZWQgYXJncyBvZiB0aGUgdGFy
Z2V0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
