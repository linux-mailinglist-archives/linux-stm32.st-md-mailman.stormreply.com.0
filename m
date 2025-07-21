Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 697E4B0BFC7
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 11:16:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC610C32E8E;
	Mon, 21 Jul 2025 09:16:20 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48D31C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 09:16:19 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-3ddda0a8ba2so39368415ab.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 02:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753089378; x=1753694178;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aWTCrJr+jkFbr7yY/GDDx9r5qnemW4sfX9ZnAt73ZW0=;
 b=GNYkdPHGhBz1rSN8E7gLrBOwJgsYyYv2aXogS7D/TuqvhumBiAiB0it++rJjBx4irR
 xoxd060IotwaaLcBVMOMKIOnERTtstSdC567gQQeYARCVG3h6ejhO1kCuIja2aLqc7+c
 ROqA55WfFio6ItJvW6EpnRWb4UlC4Q+wNgVjZlZEqyv1bxIJllhd4QR6BGsxkMH+QUSA
 2KvRw/VbYu5167zANEGRCRQkgu4+sD161mTVn7jctO5/E+V20iMhmtKO6Se5YGHanDCA
 ZzcWAJBZFOwrHCMnXhSE0p6tV05s9LiOLz5Pw8g3c5U7gsnT2GgARlT+nTLZcqz4kDW+
 Qjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753089378; x=1753694178;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aWTCrJr+jkFbr7yY/GDDx9r5qnemW4sfX9ZnAt73ZW0=;
 b=E3RFG3GfujVZ5zOZGgQj2WczPhCL5mNleWTF5ZTKhMMISVIT/Z1HatOOnUtjE2jZAh
 UDCSi2TvWf/8m8Q00sccNqiB7XX+LcH2QXr7Wy+SpOgLIe25diCjlR+jrnqllEorUjuo
 SsAonqjZmnqNrbRfWjNdLb91ajZ+iPehnPfQIuQZcIEFOzoA49I++RA/E6WBqdd4kkOV
 Fucw+sqLK03aAvnHpCeU2UPg/lKhVc0Flx2fwROkziS8zw4nD4s2aTuKow+6S8khLKeM
 0mLXvvDBSmWVD1E6PcbMJFwyjGBjM6U3zzg9uHwy5D6LIiMtb1A/3h9QI5TDOY5H+9OX
 6XVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVpnzI5HjigRXOOA8klZvVQMSHcDzh0Y3NMzeNUbf181mM/40PVs2q0MiOq29ltQ2YWK03px9qFrfprg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwZI5qBCrLX5NAo4P+rXug69qj0KyJzbhgNhYPApmDZ1PP62UCw
 NwbNzyaKhm//fShSDjngfCh+kQID6Z+QT0o2BBGq7QenJtT6ghGNx1XGdbHG7Uk37llrO2yv4Tc
 lzZyok0yAwTwwq4/KGl/+9ADuJL7iVFY=
X-Gm-Gg: ASbGncv09Qc3x13OTXwBpZDw5TsoKkCZ3FMNWmK3B6zABnQ0ruDu2YoDICEr70GFtV5
 9nXbe9Qw9Nexo4s77glsSnzMLhQrFlG+bDM2KyGmghIBFCM8Md5iokJZmcnpfZ2TAjFc7oG9cBi
 VlPsPiEylJo8/gjhnXtTCEXzyjecpJvpQJf/SwW87i8xx0roTkKNYqNmoknqvWpRvL5WsJz4I25
 J/lqA==
X-Google-Smtp-Source: AGHT+IG2nZhptU5sMShiQM05wOmbJqhauf2H0RI8O2kKSAiSqbryj8HoWrcq2C8YGYvMd2oBpjurux1VpzbYVEFH93k=
X-Received: by 2002:a05:6e02:19c7:b0:3dd:e7d6:18bb with SMTP id
 e9e14a558f8ab-3e2824f58c8mr214595465ab.17.1753089377803; Mon, 21 Jul 2025
 02:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250721083343.16482-1-kerneljasonxing@gmail.com>
 <20250721083343.16482-2-kerneljasonxing@gmail.com>
 <8c9e97e4-3590-49a8-940b-717deac0078d@molgen.mpg.de>
In-Reply-To: <8c9e97e4-3590-49a8-940b-717deac0078d@molgen.mpg.de>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 21 Jul 2025 17:15:41 +0800
X-Gm-Features: Ac12FXxJ1BHePlaT48Hqw0KdfZnHkKmI2oq2Xb6hjs7o-cBEjOG5DrUKN96fo1c
Message-ID: <CAL+tcoAP7Zk7A4pzK-za+_NMoX11SGR3ubtY6R+aaywoEq_H+g@mail.gmail.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: edumazet@google.com, anthony.l.nguyen@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 przemyslaw.kitszel@intel.com, john.fastabend@gmail.com, sdf@fomichev.me,
 intel-wired-lan@lists.osuosl.org, kuba@kernel.org, pabeni@redhat.com,
 Jason Xing <kernelxing@tencent.com>, maciej.fijalkowski@intel.com,
 hawk@kernel.org, ast@kernel.org, magnus.karlsson@intel.com,
 netdev@vger.kernel.org, andrew+netdev@lunn.ch, bjorn@kernel.org,
 mcoquelin.stm32@gmail.com, jonathan.lemon@gmail.com, bpf@vger.kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [Intel-wired-lan] [PATCH net-next 1/2] stmmac:
 xsk: fix underflow of budget in zerocopy mode
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

SGkgUGF1bCwKCk9uIE1vbiwgSnVsIDIxLCAyMDI1IGF0IDQ6NTbigK9QTSBQYXVsIE1lbnplbCA8
cG1lbnplbEBtb2xnZW4ubXBnLmRlPiB3cm90ZToKPgo+IERlYXIgSmFzb24sCj4KPgo+IFRoYW5r
IHlvdSBmb3IgeW91ciBwYXRjaC4KClRoYW5rcyBmb3IgeW91ciBxdWljayByZXNwb25zZSBhbmQg
cmV2aWV3IDopCgo+Cj4gQW0gMjEuMDcuMjUgdW0gMTA6MzMgc2NocmllYiBKYXNvbiBYaW5nOgo+
ID4gRnJvbTogSmFzb24gWGluZyA8a2VybmVseGluZ0B0ZW5jZW50LmNvbT4KPiA+Cj4gPiBUaGUg
aXNzdWUgY2FuIGhhcHBlbiB3aGVuIHRoZSBidWRnZXQgbnVtYmVyIG9mIGRlc2NzIGFyZSBjb25z
dW1lZC4gQXMKPgo+IEluc3RlYWQgb2Yg4oCcVGhlIGlzc3Vl4oCdLCBJ4oCZZCB1c2Ug4oCcQW4g
dW5kZXJmbG93IOKApuKAnS4KCldpbGwgY2hhbmdlIGl0LgoKPgo+ID4gbG9uZyBhcyB0aGUgYnVk
Z2V0IGlzIGRlY3JlYXNlZCB0byB6ZXJvLCBpdCB3aWxsIGFnYWluIGdvIGludG8KPiA+IHdoaWxl
IChidWRnZXQtLSA+IDApIHN0YXRlbWVudCBhbmQgZ2V0IGRlY3JlYXNlZCBieSBvbmUsIHNvIHRo
ZQo+ID4gdW5kZXJmbG93IGlzc3VlIGNhbiBoYXBwZW4uIEl0IHdpbGwgbGVhZCB0byByZXR1cm5p
bmcgdHJ1ZSB3aGVyZWFzIHRoZQo+ID4gZXhwZWN0ZWQgdmFsdWUgc2hvdWxkIGJlIGZhbHNlLgo+
Cj4gV2hhdCBpcyDigJxpdOKAnT8KCkl0IG1lYW5zICd1bmRlcmZsb3cgb2YgYnVkZ2V0JyBiZWhh
dmlvci4KCj4KPiA+IEluIHRoaXMgY2FzZSB3aGVyZSBhbGwgdGhlIGJ1ZGdldCBhcmUgdXNlZCB1
cCwgaXQgbWVhbnMgemMgZnVuY3Rpb24KPgo+ICppcyogdXNlZD8KCkdvdCBpdC4KCj4KPiA+IHNo
b3VsZCByZXR1cm4gZmFsc2UgdG8gbGV0IHRoZSBwb2xsIHJ1biBhZ2FpbiBiZWNhdXNlIG5vcm1h
bGx5IHdlCj4gPiBtaWdodCBoYXZlIG1vcmUgZGF0YSB0byBwcm9jZXNzLgo+Cj4gRG8geW91IGhh
dmUgYSByZXByb2R1Y2VyLCB5b3UgY291bGQgYWRkIHRvIHRoZSBjb21taXQgbWVzc2FnZT8KClNv
cnJ5LCBJIGRpZG4ndCBoYXZlIGEgcmVwcm9kdWNlci4gSSBjb29rZWQgdGhpcyBwYXRjaCBhZnRl
ciBhbmFseXppbmcKdGhlIHdob2xlIGxvZ2ljIChiZWNhdXNlIHJlY2VudGx5IEknbSByZWFkaW5n
IHRoZSB6YyB4bWl0CmltcGxlbWVudGF0aW9uIGFtb25nIHZhcmlvdXMgZHJpdmVycy4pCgo+Cj4g
PiBGaXhlczogMTMyYzMyZWU1YmMwICgibmV0OiBzdG1tYWM6IEFkZCBUWCB2aWEgWERQIHplcm8t
Y29weSBzb2NrZXQiKQo+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24gWGluZyA8a2VybmVseGluZ0B0
ZW5jZW50LmNvbT4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9zdG1tYWNfbWFpbi5jIHwgNCArKystCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYyBiL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPiA+IGluZGV4IGYzNTBhNjY2Mjg4MC4u
ZWE1NTQxZjllOWE2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvc3RtbWFjX21haW4uYwo+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwo+ID4gQEAgLTI1OTYsNyArMjU5Niw3IEBAIHN0YXRp
YyBib29sIHN0bW1hY194ZHBfeG1pdF96YyhzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYsIHUzMiBx
dWV1ZSwgdTMyIGJ1ZGdldCkKPiA+Cj4gPiAgICAgICBidWRnZXQgPSBtaW4oYnVkZ2V0LCBzdG1t
YWNfdHhfYXZhaWwocHJpdiwgcXVldWUpKTsKPiA+Cj4gPiAtICAgICB3aGlsZSAoYnVkZ2V0LS0g
PiAwKSB7Cj4gPiArICAgICB3aGlsZSAoYnVkZ2V0ID4gMCkgewo+Cj4gU28sIGlmIHRoZSB3aGls
ZSBsb29wIHNob3VsZCBub3QgYmUgZW50ZXJlZCB3aXRoIGJ1ZGdldCBiZWluZyAwLCB0aGVuCj4g
dGhlIGxpbmUgY291bGQgIGJlIGNoYW5nZWQgdG8gYHdoaWxlICgtLWJ1ZGdldCA+IDApIHtgPyBC
dXQgdGhlbiBpdAo+IHdvdWxkbuKAmXQgYmUgY2FsbGVkIGZvciBidWRnZXQgYmVpbmcgMS4KClJp
Z2h0LCBzbyBpdCBzaG91bGRuJ3QgYmUgJy0tYnVkZ2V0Jy4KCj4KPiBBIGZvciBsb29wIG1pZ2h0
IGJlIHRoZSBiZXR0ZXIgY2hvaWNlIGZvciBhIGxvb3Agd2l0aCBidWRnZXQgYXMgY291bnRpbmcK
PiB2YXJpYWJsZT8KClNvcnJ5LCBJIGRpZG4ndCBmb2xsb3cgeW91LgoKPgo+ID4gICAgICAgICAg
ICAgICBzdHJ1Y3Qgc3RtbWFjX21ldGFkYXRhX3JlcXVlc3QgbWV0YV9yZXE7Cj4gPiAgICAgICAg
ICAgICAgIHN0cnVjdCB4c2tfdHhfbWV0YWRhdGEgKm1ldGEgPSBOVUxMOwo+ID4gICAgICAgICAg
ICAgICBkbWFfYWRkcl90IGRtYV9hZGRyOwo+ID4gQEAgLTI2ODEsNiArMjY4MSw4IEBAIHN0YXRp
YyBib29sIHN0bW1hY194ZHBfeG1pdF96YyhzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYsIHUzMiBx
dWV1ZSwgdTMyIGJ1ZGdldCkKPiA+Cj4gPiAgICAgICAgICAgICAgIHR4X3EtPmN1cl90eCA9IFNU
TU1BQ19HRVRfRU5UUlkodHhfcS0+Y3VyX3R4LCBwcml2LT5kbWFfY29uZi5kbWFfdHhfc2l6ZSk7
Cj4gPiAgICAgICAgICAgICAgIGVudHJ5ID0gdHhfcS0+Y3VyX3R4Owo+ID4gKwo+ID4gKyAgICAg
ICAgICAgICBidWRnZXQtLTsKPiA+ICAgICAgIH0KPiA+ICAgICAgIHU2NF9zdGF0c191cGRhdGVf
YmVnaW4oJnR4cV9zdGF0cy0+bmFwaV9zeW5jcCk7Cj4gPiAgICAgICB1NjRfc3RhdHNfYWRkKCZ0
eHFfc3RhdHMtPm5hcGkudHhfc2V0X2ljX2JpdCwgdHhfc2V0X2ljX2JpdCk7Cj4KPiBFeGN1c2Ug
bXkgaWdub3JhbmNlLCBidXQgSSBkbyBub3QgeWV0IHNlZSB0aGUgcHJvYmxlbSB0aGF0IHRoZSB3
aGlsZQo+IGxvb3AgaXMgZW50ZXJlZCBhbmQgYnVmZmVyIGlzIHNldCB0byAwLiBJcyBpdCBsYXRl
ciB0aGUgcmV0dXJuIGNvbmRpdGlvbj8KCkxldCBtZSBnaXZlIGEgc2ltcGxlIGV4YW1wbGUuIFN1
cHBvc2luZyB0aGUgYnVkZ2V0IGlzIG9uZSBpbml0aWFsbHksCmF0IHRoZSBmaXJzdCByb3VuZCwg
dGhlIGJ1ZGdldCB3aWxsIGJlIHplcm8uIExhdGVyLCBhZnRlciB0aGlzIGRlc2MKYmVpbmcgcHJv
Y2Vzc2VkLCB0aGUgJ3doaWxlIChidWRnZXQtLSA+IDApJyBzdGF0ZW1lbnQgd2lsbCBiZSBhY2Nl
c3NlZAphZ2FpbiwgYW5kIHRoZW4gdGhlIGJ1ZGdldCB3aWxsIGJlIGRlY3JlYXNlZCBieSBvbmUg
d2hpY2ggaXMgdTMyKDAgLQoxKSwgbmFtZWx5LCBVSU5UX01BWC4gISFVSU5UX01BWCBpcyB0cnVl
IHdoaWxlIHRoZSBleHBlY3RlZCByZXR1cm4KdmFsdWUgaXMgZmFsc2UgKCEhMCwgMCBpcyB0aGUg
ZXhwZWN0ZWQgYnVkZ2V0IHZhbHVlKS4KCmk0MGVfY2xlYW5fdHhfaXJxKCkgaGFuZGxlcyB0aGlz
IGNvcnJlY3RseSwgRllJLgoKVGhhbmtzLApKYXNvbgoKPgo+ICAgICAgcmV0dXJuICEhYnVkZ2V0
ICYmIHdvcmtfZG9uZTsKPgo+Cj4gS2luZCByZWdhcmRzLAo+Cj4gUGF1bApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
