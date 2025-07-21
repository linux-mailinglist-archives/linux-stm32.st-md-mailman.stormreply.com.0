Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0B0B0CD86
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jul 2025 01:06:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09E35C3F933;
	Mon, 21 Jul 2025 23:06:15 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1501CC349C6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 23:06:12 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3de1875bf9dso41917475ab.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 16:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753139172; x=1753743972;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KEFwVf9DCXPYhb5E+L2S2B43pN/gLrA3tUcn9Sv1yes=;
 b=XuCORYm6XgVE2w4AvipSqDXZ0IoIrlEldqo2yqFMpd+vxTGy7xKOOVCsmjlnLn+PoY
 qfahT37DthFNIS2mcP2DFSOIbUIjTggi6EWTOMRbG6fmtC0Cc6zm55l2ps2sooAfi5NH
 2L22cQ81bUYUemZCrPYir8lIY0T9KwgWKXWUN4uVnzvgvPwxJjndpgWywYZCD3pr56om
 941FjcseZRF+fSxLzVDkjRTd8L7HbfdjMoqDYJbD6hrIGy6+RopJdX4wO/s+Onjq6XYk
 7lVm+KppkkpYzFlRh520juvPyb7Ld/4gMFWSDB4882UGgR3V3gK3OW1KDUowiAv1r2rc
 Ghaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753139172; x=1753743972;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KEFwVf9DCXPYhb5E+L2S2B43pN/gLrA3tUcn9Sv1yes=;
 b=s8cHUcD4fMydGBJdP6UEM+EI9gmbwr5TzSLXiTkmhoZjHSye6dx0+UK5JJd7gYgq3H
 i/gswmkIoePoN8a5bW6X4PrTH8AkeGhQEfdRtz4W/xsRLIaSdwqrtvoQVj5oMobv6vwz
 pjbWDE5+8izFkf2E7HTC9itmcfjt4wYwG3pzR77VcaWOqojxLAaB2CWjzVQtXG2g3DiP
 xA31Z17UrZUnMmrBYQeXDPmpIt5iQPAtm8LDCQojt9oesBCDMTr6p4k6VfXdFqjWrdWa
 QAxROmLEiwISgjpBNAZjTq3hJ6QmPrwIBOUmuf+RMLXvp7fXPvaAul/Dm4mSfHECQkT2
 XFQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxLNbpa9AnyLiXihkkTH2r9G3HorDaALq13EoKbXlcTz/RgurCn3GUWXhtVSAcmvIGA+Mv7AzHBq/5hw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxMIAlQS501xfuIayPAsYbxk28YzDvQNbqxfEFscmRsTsaQcioE
 YYfS7uPwOcaNMBkPYkp7olgllYa27Z573+IIT4JW7gTxcZckLm2waoOOurtUkzZENhIR7zguG8s
 syye3kxS9bvraqyBhrFphQa1BaqoxIv4=
X-Gm-Gg: ASbGncukNWNi2PVH4O7+LnbKqflwAgc7EWjl+G/TIR82Z+okIDI7Of79S7ot8xZ3kAE
 vDEPbvOtRqG9TsU/YF4q3Kg4sQl5A06AS0B0XFWJJvxUmoELm2IQPmaiMndNsgaCr9QQXt8PPVM
 zzmpk4C+JRbVyK6YkebPGu2QlGDEk6Btf3FCv0cWv83fyB4lb3Oy82oQQB0O1w5y+XOVzMD+fFi
 6EIGIc=
X-Google-Smtp-Source: AGHT+IG5RIx4CUBqOhyC6+z/etJI6PdiSzvihPpHLIk0ADX/H+hEWkFMYdf4iuelppqsril2kN/LOnjdXOMfNu/RNqM=
X-Received: by 2002:a05:6e02:1d9d:b0:3e2:8ddd:b406 with SMTP id
 e9e14a558f8ab-3e28dddb51amr192280595ab.17.1753139171561; Mon, 21 Jul 2025
 16:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250721083343.16482-1-kerneljasonxing@gmail.com>
 <20250721083343.16482-2-kerneljasonxing@gmail.com>
 <aH5exXo_BdonTfmf@mini-arch>
In-Reply-To: <aH5exXo_BdonTfmf@mini-arch>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 22 Jul 2025 07:05:35 +0800
X-Gm-Features: Ac12FXzrl82q1J1EBI4gPmmpTws7FVNkFQm2LLp1FtXXiWxpRliUiuaDdNslSpc
Message-ID: <CAL+tcoB9U-YnJ7MPn7FQ4+ZsW5cgQXE3Tks-7=kGMhUE6nNprg@mail.gmail.com>
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: edumazet@google.com, anthony.l.nguyen@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 przemyslaw.kitszel@intel.com, john.fastabend@gmail.com, sdf@fomichev.me,
 intel-wired-lan@lists.osuosl.org, kuba@kernel.org, pabeni@redhat.com,
 Jason Xing <kernelxing@tencent.com>, maciej.fijalkowski@intel.com,
 hawk@kernel.org, ast@kernel.org, magnus.karlsson@intel.com,
 netdev@vger.kernel.org, andrew+netdev@lunn.ch, bjorn@kernel.org,
 mcoquelin.stm32@gmail.com, jonathan.lemon@gmail.com, bpf@vger.kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] stmmac: xsk: fix underflow
 of budget in zerocopy mode
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

T24gTW9uLCBKdWwgMjEsIDIwMjUgYXQgMTE6MzfigK9QTSBTdGFuaXNsYXYgRm9taWNoZXYKPHN0
Zm9taWNoZXZAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIDA3LzIxLCBKYXNvbiBYaW5nIHdyb3Rl
Ogo+ID4gRnJvbTogSmFzb24gWGluZyA8a2VybmVseGluZ0B0ZW5jZW50LmNvbT4KPiA+Cj4gPiBU
aGUgaXNzdWUgY2FuIGhhcHBlbiB3aGVuIHRoZSBidWRnZXQgbnVtYmVyIG9mIGRlc2NzIGFyZSBj
b25zdW1lZC4gQXMKPiA+IGxvbmcgYXMgdGhlIGJ1ZGdldCBpcyBkZWNyZWFzZWQgdG8gemVybywg
aXQgd2lsbCBhZ2FpbiBnbyBpbnRvCj4gPiB3aGlsZSAoYnVkZ2V0LS0gPiAwKSBzdGF0ZW1lbnQg
YW5kIGdldCBkZWNyZWFzZWQgYnkgb25lLCBzbyB0aGUKPiA+IHVuZGVyZmxvdyBpc3N1ZSBjYW4g
aGFwcGVuLiBJdCB3aWxsIGxlYWQgdG8gcmV0dXJuaW5nIHRydWUgd2hlcmVhcyB0aGUKPiA+IGV4
cGVjdGVkIHZhbHVlIHNob3VsZCBiZSBmYWxzZS4KPiA+Cj4gPiBJbiB0aGlzIGNhc2Ugd2hlcmUg
YWxsIHRoZSBidWRnZXQgYXJlIHVzZWQgdXAsIGl0IG1lYW5zIHpjIGZ1bmN0aW9uCj4gPiBzaG91
bGQgcmV0dXJuIGZhbHNlIHRvIGxldCB0aGUgcG9sbCBydW4gYWdhaW4gYmVjYXVzZSBub3JtYWxs
eSB3ZQo+ID4gbWlnaHQgaGF2ZSBtb3JlIGRhdGEgdG8gcHJvY2Vzcy4KPiA+Cj4gPiBGaXhlczog
MTMyYzMyZWU1YmMwICgibmV0OiBzdG1tYWM6IEFkZCBUWCB2aWEgWERQIHplcm8tY29weSBzb2Nr
ZXQiKQo+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24gWGluZyA8a2VybmVseGluZ0B0ZW5jZW50LmNv
bT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1h
Y19tYWluLmMgfCA0ICsrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3Jv
L3N0bW1hYy9zdG1tYWNfbWFpbi5jCj4gPiBpbmRleCBmMzUwYTY2NjI4ODAuLmVhNTU0MWY5ZTlh
NiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0
bW1hY19tYWluLmMKPiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L3N0bW1hY19tYWluLmMKPiA+IEBAIC0yNTk2LDcgKzI1OTYsNyBAQCBzdGF0aWMgYm9vbCBzdG1t
YWNfeGRwX3htaXRfemMoc3RydWN0IHN0bW1hY19wcml2ICpwcml2LCB1MzIgcXVldWUsIHUzMiBi
dWRnZXQpCj4gPgo+ID4gICAgICAgYnVkZ2V0ID0gbWluKGJ1ZGdldCwgc3RtbWFjX3R4X2F2YWls
KHByaXYsIHF1ZXVlKSk7Cj4gPgo+ID4gLSAgICAgd2hpbGUgKGJ1ZGdldC0tID4gMCkgewo+ID4g
KyAgICAgd2hpbGUgKGJ1ZGdldCA+IDApIHsKPgo+IFRoZXJlIGlzIGEgY29udGludWUgb24gbGlu
ZSAyNjIxLgoKVGhhbmtzIGZvciBjYXRjaGluZyB0aGlzIQoKPiBTaG91bGQgd2UgZG8gJ2ZvciAo
OyBidWRnZXQgPiAwOyBidWRnZXQtLSknCj4gaW5zdGVhZD8gQW5kIG1heWJlIHRoZSBzYW1lIGZv
ciBpeGdiZSBbMF0/CgpOb3QgcmVhbGx5LiBJIHRoaW5rIEkgY2FuIG1vdmUgdGhlICdidWRnZXQt
LScganVzdCBiZWZvcmUgdGhlCidjb250aW51ZScgcGFydC4gSWYgd2UgY29udmVydCBpdCB0byB1
c2UgJ2ZvcicgbG9vcCBhbmQgdGhlbiB3ZSBlbmQgdXAKd2l0aCBvbmUgb2YgJ2JyZWFrJyBzdGF0
ZW1lbnRzLCB0aGUgYnVkZ2V0IHN0aWxsIGdldHMgYWNjaWRlbnRseQppbmNyZWFzZWQgYnkgb25l
IHdoZXJlYXMgaXhnYmUgZHJpdmVyIGV2ZW4gZG9lc24ndCBoYW5kbGUgdGhlIGRlc2MKdGhpcyB0
aW1lLiBJSVVDLCBpdCBzaG91bGQgbm90IGhhcHBlbiwgcmlnaHQ/Cgo+Cj4gMDogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjUwNzIwMDkxMTIzLjQ3NC0zLWtlcm5lbGphc29ueGlu
Z0BnbWFpbC5jb20vCgpUaGUgc2FtZSBsb2dpYyBhcyBhYm92ZSBjYW4gYmUgYXBwbGllZCBoZXJl
IGFzIHdlbGwuIFRoZXJlIGFyZSB0aHJlZQonYnJlYWsnIHN0YXRlbWVudHMgaW4gaXhnYmVfeG1p
dF96YygpLgoKSGVuY2UsIElNSE8sIEkgcHJlZmVyIHRvIHVzZSB3aGlsZSguLi4pIGluIHRoaXMg
Y2FzZSBidXQgSSBvdWdodCB0bwphZGp1c3QgdGhlIHBvc2l0aW9uIG9mIGJ1ZGdldC0tLgoKVGhh
bmtzLApKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
