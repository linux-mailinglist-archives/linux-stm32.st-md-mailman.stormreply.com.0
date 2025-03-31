Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54052A7628D
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Mar 2025 10:38:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB807C78F8F;
	Mon, 31 Mar 2025 08:38:21 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95F8FC78F8C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Mar 2025 08:38:20 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so829275e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Mar 2025 01:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743410300; x=1744015100;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sSvzNDeWLA9j3MF9b45BUxK0OhrQzBBAn5lDkDpSzqk=;
 b=tZYCaKX5x1jaAvecDNzaGHBo1qiG5cgSbrjrmnbDnJszpQ03rR5kVCiP2YKEYrqE+S
 gTDguXOt+WTsc3ACNy2NaW9tl6ro3qVO82s8EfvlBbEULQroNHGY3xwNSnaao5wYMxr/
 1UzZetcuu4eWhKASgIgzOz/H97rxViQV0n7dr+OLkiXuqPear3GavNk6pP54KsaumIBv
 E17EXM3/afXvXtPqeg9Jnf6l6r+80kg7pWxejB4Rim/TDd/s0ZQAaJFS9y5qBHXb1fL6
 sa+Q+ivTAnGd/cS8ZF/MQiXuQoRdx+rpDkMr5OMDY752wmZxmFa0E4myiw8k0hOE3IvG
 yaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743410300; x=1744015100;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sSvzNDeWLA9j3MF9b45BUxK0OhrQzBBAn5lDkDpSzqk=;
 b=S5ZfycoxGahk18oe/Bk5m9i7qzN8yXvEBfO59Xr7Rw8dGaBNgXaZfXh9g7Picf0U2N
 RxQseeg3hF66mAnub+tGuLgxE8j9sOKKbXSpr3KVy305r60NwIciPF85fQBR6wMSzlsm
 Kj4ndF0HeOOyYKmRrPIrh1D6jf7G7MnHPVu+S++lAVXvNnFyvn5y4wfI4bbcL3mdXwss
 JA3M4Bre017E+rnMgBdiE50ImPtk2q4wt71AeEZASQdlGbkFAtHbqjsQ918/H/fR8ExA
 o/tjLmm2hfs4hZ6fweCDaRioh/yKin8agGGb7VpzzHywJWcFDqmfjSzsjJT9JDMNaivv
 q/tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkoPPBa12i2wkOrQ109+KK/calKsd67XctgBF1vyxHPTLRuZ89wcje387U2nBApQON2CmMj8RaKVjELQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YybtKWx193CtGE6HWkR6Z1TZZTTbhf8e/6w0O4zokpn+IlAAwPi
 fCgDM2ar7VlCHABeCdAlhidIsEzlXaeCvFJhKJP+PhRg3RADb5p1KSbtLFMXlxg=
X-Gm-Gg: ASbGncsH2JUDGzcv2szgYME5khcGOd3GEFX5iYhi+XXPNIcP5JzLY/JjrYVnFqGYKz3
 /brTMdw6AZsHrwrlV9aWongDSiL8cuaxFr0L/ISEOLZTmBMzszkNaMcttygp+KrWG88EVVxLPL4
 1J2tNQ9xCeRQOC+06bn2tRpMJY9w/iHKJsbT+OjNwKoTul6wShnenv2M3oejMhvy/HxUItc1V94
 0U2Szapc1AYWf0mDLuTpPWmEzaReUrfIgSg3nMPV7ZMb37q+CR4x184b/KSYDvQkBgaEW+15i9Y
 FO//gBSooV77OvRUeq0yxFWZ2GJH23ZgD0SRN+byyKnd7xZHhuWB/RLwIokwEbC/rbmnHziFG9M
 C5iNlc8rr
X-Google-Smtp-Source: AGHT+IHnymAzt9wzLtLJDSjlzRXQxVPcbpSsh6FvhFdIm6eixK9JeGM+C1pvqMUaMqG2vD0oiiyYsQ==
X-Received: by 2002:a05:600c:310c:b0:43b:c0fa:f9cd with SMTP id
 5b1f17b1804b1-43db6227ac9mr57538675e9.7.1743410299906; 
 Mon, 31 Mar 2025 01:38:19 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43d82dedd6fsm163362265e9.7.2025.03.31.01.38.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 01:38:18 -0700 (PDT)
Message-ID: <6bca05ac-13d0-4197-b4af-5509884c83c6@linaro.org>
Date: Mon, 31 Mar 2025 10:38:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, tglx@linutronix.de
References: <20250328134208.2183653-1-daniel.lezcano@linaro.org>
 <20250328134208.2183653-2-daniel.lezcano@linaro.org>
 <a81c615a-a1f5-4dfc-81ce-6235abed0820@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <a81c615a-a1f5-4dfc-81ce-6235abed0820@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 S32@nxp.com, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Larisa.Grigore@nxp.com,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, thomas.fossati@linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 ghennadi.procopciuc@nxp.com,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: timer: Add NXP System
	Timer Module
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMjkvMDMvMjAyNSAwNjowMywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAyOC8w
My8yMDI1IDE0OjQyLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPj4gQWRkIHRoZSBTeXN0ZW0gVGlt
ZXIgTW9kdWxlIGRlc2NyaXB0aW9uIGZvdW5kIG9uIHRoZSBOWFAgczMyIHBsYXRmb3JtCj4+IGFu
ZCB0aGUgY29tcGF0aWJsZSBmb3IgdGhlIHMzMmcyIHZhcmlhbnQuCj4+Cj4+IENjOiBHaGVubmFk
aSBQcm9jb3BjaXVjIDxnaGVubmFkaS5wcm9jb3BjaXVjQG9zcy5ueHAuY29tPgo+PiBDYzogS3J6
eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgo+PiBDYzog
VGhvbWFzIEZvc3NhdGkgPHRob21hcy5mb3NzYXRpQGxpbmFyby5vcmc+Cj4+IFNpZ25lZC1vZmYt
Ynk6IERhbmllbCBMZXpjYW5vIDxkYW5pZWwubGV6Y2Fub0BsaW5hcm8ub3JnPgo+PiAtLS0KPiAK
PiBJIGdvdCBvbmx5IHRoaXMgcGF0Y2gsIG5vIGNvdmVyIGxldHRlciwgbm8gY2hhbmdlbG9nLiBX
aGF0IGhhcHBlbmVkIGhlcmU/CgpNeSBiYWQsIG15IHNjcmlwdHMgbmVlZHMgc29tZSBtb3JlIHdv
cmsgOikKCldpbGwgQ2MgeW91IGluIHRoZSBuZXh0IHZlcnNpb24KCj4+ICAgLi4uL2JpbmRpbmdz
L3RpbWVyL254cCxzdG0tdGltZXIueWFtbCAgICAgICAgIHwgNTAgKysrKysrKysrKysrKysrKysr
Kwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspCj4+ICAgY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9ueHAsc3RtLXRp
bWVyLnlhbWwKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy90aW1lci9ueHAsc3RtLXRpbWVyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdGltZXIvbnhwLHN0bS10aW1lci55YW1sCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uYTljMDE1MWQ2MmJlCj4+IC0tLSAvZGV2L251bGwKPj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL254cCxzdG0tdGlt
ZXIueWFtbAo+IAo+IEZpbGVuYW1lIGZvbGxvd2luZyBjb21wYXRpYmxlLgo+IAo+PiBAQCAtMCww
ICsxLDUwIEBACj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9S
IEJTRC0yLUNsYXVzZSkKPj4gKyVZQU1MIDEuMgo+PiArLS0tCj4+ICskaWQ6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL3RpbWVyL254cCxzdG0tdGltZXIueWFtbCMKPj4gKyRzY2hlbWE6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+PiArCj4+ICt0
aXRsZTogTlhQIFN5c3RlbSBUaW1lciBNb2R1bGUgKFNUTSkKPj4gKwo+PiArbWFpbnRhaW5lcnM6
Cj4+ICsgIC0gRGFuaWVsIExlemNhbm8gPGRhbmllbC5sZXpjYW5vQGtlcm5lbC5vcmc+Cj4+ICsK
Pj4gK2Rlc2NyaXB0aW9uOgo+PiArICBUaGUgU3lzdGVtIFRpbWVyIE1vZHVsZSBzdXBwb3J0cyBj
b21tb25seSByZXF1aXJlZCBzeXN0ZW0gYW5kIGFwcGxpY2F0aW9uCj4+ICsgIHNvZnR3YXJlIHRp
bWluZyBmdW5jdGlvbnMuIFNUTSBpbmNsdWRlcyBhIDMyLWJpdCBjb3VudC11cCB0aW1lciBhbmQg
Zm91cgo+PiArICAzMi1iaXQgY29tcGFyZSBjaGFubmVscyB3aXRoIGEgc2VwYXJhdGUgaW50ZXJy
dXB0IHNvdXJjZSBmb3IgZWFjaCBjaGFubmVsLgo+PiArICBUaGUgdGltZXIgaXMgZHJpdmVuIGJ5
IHRoZSBTVE0gbW9kdWxlIGNsb2NrIGRpdmlkZWQgYnkgYW4gOC1iaXQgcHJlc2NhbGUKPj4gKyAg
dmFsdWUuCj4+ICsKPj4gK3Byb3BlcnRpZXM6Cj4+ICsgIGNvbXBhdGlibGU6Cj4+ICsgICAgZW51
bToKPj4gKyAgICAgIC0gbnhwLHMzMmctc3RtCj4gCj4gUHJldmlvdXNseSBpdCB3YXMgdG9sZCB0
byBtZSB0aGVyZSBpcyBubyBzdWNoIHNvYyBhcyBzMzJnIGJ1dCB0aGV5IGFyZQo+IG5hbWVkIGRp
ZmZlcmVudGx5LCBlLmcuIHMzMmcyLiBTZWUgb3RoZXIgYmluZGluZ3MuCj4gCj4gUGxlYXNlIGNv
bnN1bHQgaW50ZXJuYWxseSBhbmQgY29tZSB3aXRoIG9uZSB1bmlmaWVkIGFwcHJvYWNoIHRvIGFs
bCBOWFAKPiBiaW5kaW5ncy4gT3RoZXJ3aXNlLCBpZiB0aGlzIGlzIGEgcmVhbCBzb2MsIGZpeCB0
aGlzIGZvciB0b3AgbGV2ZWwKPiBjb21wYXRpYmxlcywgYmVjYXVzZSB0aGVyZSBpcyBubyBzMzJn
IHRoZXJlIGVpdGhlci4KPiAKPiBUaGlzIGFwcGxpZXMgdG8gYWxsIE5YUC1yZWxhdGVkIHBhdGNo
ZXMgKHdoaWNoIEkgYW0gc3VyZSB3YXMgcHJldmlvdXNseQo+IGRpc2N1c3NlZCBvbiB0aGUgbGlz
dHMpLgo+IAo+IFdoYXQgaXMgY29uZnVzaW5nOiBwcmV2aW91cyBjb21wYXRpYmxlIHdhcyBjb3Jy
ZWN0IGFuZCBJIGRpZCBub3QgYXNrIHRvCj4gY2hhbmdlIGl0LgoKWWVhaCwgSSB0aGluayB0aGUg
YW5zd2VyIGlzIHN0cmFpZ2h0Zm9yd2FyZC4gSXQgaXMgczMyZzIgYW5kIHMzMmczLCB0aGUgCnR3
byBwbGF0Zm9ybXMgaGF2aW5nIHRoZSBTVE0uIEknbGwgd2lsbCBmaXggdGhlIGNvbXBhdGlibGVz
LgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJj
ZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNl
Ym9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEv
bGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+
IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
