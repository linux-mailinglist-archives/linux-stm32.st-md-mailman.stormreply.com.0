Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75953A702DE
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Mar 2025 14:54:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2796EC78F7F;
	Tue, 25 Mar 2025 13:54:30 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC57FC78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 13:54:28 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so4812302f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 06:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742910868; x=1743515668;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ijCZlw8abnNdrfWlLDyC8qGCl0jM46CNzFHxUo7UrwI=;
 b=uy2RoFRzy91f7LzJ+b8+4GDBY+ocHRBQz5C3q2TiyQGajwsBaygfG3vm/+pMGk3Wbo
 PZA+TfuuyHFlXbURmfvkiKwRTVtWkc61z+dOVF9BsA4qkxItPudZaa+mAdgwurNhgSDv
 9/Ke8TQAZrDuHNYJI8qZZmx41XatuUzSeYOqoWAmfSSkCzvphAnOY5WVn3dEInKNzv0H
 /IDM2uWBsnWENu1lqyZPWFDEqgjhzHh8TrY1exCTKnvz6BbEH6gpXThOMLm38zBML1ZV
 SRHHtIpbC5eTKADIE0NpVPWgTrGWGKNOT/8A5tvwDKry083IEVdwHUp4Tvld1gx5kDua
 37LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742910868; x=1743515668;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ijCZlw8abnNdrfWlLDyC8qGCl0jM46CNzFHxUo7UrwI=;
 b=dju02S8dWB2HfSsOcDVIo4rtbYWCBtwaYGjM0hBgmByTDq/Nmib3ZKXXM0m7qX4gjm
 2ZCCBTIyokOKNzxgrbtHlCMFfYLzJEJzUG9FpyBZUKLF0AnADQkm7llEY4di66Y7zE8u
 GfNtjdvQq8dWktaldaWP5wCqWxf6gM/v116gKr+vyMCQSXmvzVL2bAI9MMLbeeiKbkts
 X5Vl9j3MKCPYHd2piyZ+46nRp4OC1BZFH5Q2OblXLcwEwQmGLEzWYOorm6E4/90lpJm5
 kKlDmAQRT4qmijvkGLZbbWonjsl01IUulywUFD9X4eLuMTkhHd2d4K/N9Zo9aUjL7Pco
 wmuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc0/SAmtUNw6xPfG8kYgGq7knxdeEfHp3WQejnj1cc3OqD79DjEPYCdPDw9W/kAYieJSLFYM+zJtKHLA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzNYi8P09h0YugBiJZ+vcvmarJRLq9Bi6SLPAWES0K3k7gSgEE2
 XAOGyP/rE3rvkEOpaEDyb/mM5+1WYxSXm60aOHqTIxTmCULwG9aqYPs7h7qBjrw=
X-Gm-Gg: ASbGncurNHFTUL6L1wJORcCz7ebqm9UeeLNgtw0b8InoY8wqvrDOl895LYLJN2N0Ro0
 c073g3B7q7yytEkX4j+SoJxS+uGWS276oYc1DJBtHJFUWTes0wPZo5Ty5jg/0Uot/hfA8BU063Y
 YlLliQMrfWuk3x9zO9itiA/Mj7T6mnl4iIDEr5Y/1jhrIuhxJHqT1WpR/A3OwIoU618kCv55Fw8
 hoTh9rv/07gnA9GCWZkf65aR85rXIWHjtpv8K+9QGODiMOY4OcazWUKz4lyYk3o1FQmTik4APSA
 tR8IgyPtfG16HEMV89n71Z9o7SyYsLZz1el9ljEtjuZVmVJXC3jvl4KiDTbL72lm2KxxEKgoQTU
 b20GeEsPxoFvaB+PbZng=
X-Google-Smtp-Source: AGHT+IFxtTjkR1rjlcOGc3o02TWz8/EihwAEdC3O1L0fXu9zmvxKQn66+P0PWx+0RFvFRJ5mc4A03Q==
X-Received: by 2002:a05:6000:1fa4:b0:391:952:c758 with SMTP id
 ffacd0b85a97d-3997f8f78a9mr13996895f8f.6.1742910868103; 
 Tue, 25 Mar 2025 06:54:28 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43d4fd18505sm150051955e9.11.2025.03.25.06.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 06:54:27 -0700 (PDT)
Message-ID: <e8054f85-2a23-4ceb-8e1c-7cdfe7c87628@linaro.org>
Date: Tue, 25 Mar 2025 14:54:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, tglx@linutronix.de
References: <20250324100008.346009-1-daniel.lezcano@linaro.org>
 <20250324100008.346009-2-daniel.lezcano@linaro.org>
 <d60fca36-0beb-2574-cb82-3969bbfb58a9@oss.nxp.com>
 <8c208e8c-2e1e-430c-916a-dbc6732881b0@linaro.org>
 <065d6f32-3161-8316-bbbd-4da18eef839b@oss.nxp.com>
 <098c5de8-9291-4f3e-a276-500825cac7c5@linaro.org>
 <068713cb-47ca-ae26-e113-9f5026be9196@oss.nxp.com>
 <cc2dd75c-e279-4e55-ab88-75498e93146a@linaro.org>
 <50d2c651-746e-4ddd-4036-f72742a622f8@oss.nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <50d2c651-746e-4ddd-4036-f72742a622f8@oss.nxp.com>
Cc: NXP S32 Linux Team <s32@nxp.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Larisa Grigore <Larisa.Grigore@nxp.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Fossati <thomas.fossati@linaro.org>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/2] clocksource/drivers/nxp-timer: Add
 the System Timer Module for the s32g platform
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

T24gMjUvMDMvMjAyNSAxNDoyMSwgR2hlbm5hZGkgUHJvY29wY2l1YyB3cm90ZToKPiBPbiAzLzI1
LzIwMjUgMjo1MSBQTSwgRGFuaWVsIExlemNhbm8gd3JvdGU6Cj4gWyAuLi4gXQo+Pj4+Pj4+PiAr
c3RhdGljIGludCBfX2luaXQgbnhwX3N0bV90aW1lcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQo+Pj4+Pj4+PiArewo+Pj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBkZXZpY2UgKmRl
diA9ICZwZGV2LT5kZXY7Cj4+Pj4+Pj4+ICvCoMKgwqAgc3RydWN0IGRldmljZV9ub2RlICpucCA9
IGRldi0+b2Zfbm9kZTsKPj4+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3Qgc3RtX2luc3RhbmNlcyAqc3Rt
X2luc3RhbmNlczsKPj4+Pj4+Pj4gK8KgwqDCoCBjb25zdCBjaGFyICpuYW1lID0gb2Zfbm9kZV9m
dWxsX25hbWUobnApOwo+Pj4+Pj4+PiArwqDCoMKgIHZvaWQgX19pb21lbSAqYmFzZTsKPj4+Pj4+
Pj4gK8KgwqDCoCBpbnQgaXJxLCByZXQ7Cj4+Pj4+Pj4+ICvCoMKgwqAgc3RydWN0IGNsayAqY2xr
Owo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICvCoMKgwqAgc3RtX2luc3RhbmNlcyA9Cj4+Pj4+Pj4+ICh0
eXBlb2Yoc3RtX2luc3RhbmNlcykpb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRldik7Cj4+Pj4+
Pj4+ICvCoMKgwqAgaWYgKCFzdG1faW5zdGFuY2VzKSB7Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCBkZXZfZXJyKGRldiwgIk5vIFNUTSBpbnN0YW5jZXMgYXNzb2NpYXRlZCB3aXRoIGEgY3B1Iik7
Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4+Pj4+Pj4gK8KgwqDC
oCB9Cj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gK8KgwqDCoCBiYXNlID0gZGV2bV9vZl9pb21hcChkZXYs
IG5wLCAwLCBOVUxMKTsKPj4+Pj4+Pj4gK8KgwqDCoCBpZiAoSVNfRVJSKGJhc2UpKSB7Cj4+Pj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBpb21hcCAlcE9Gblxu
IiwgbnApOwo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIoYmFzZSk7Cj4+
Pj4+Pj4+ICvCoMKgwqAgfQo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICvCoMKgwqAgaXJxID0gaXJxX29m
X3BhcnNlX2FuZF9tYXAobnAsIDApOwo+Pj4+Pj4+PiArwqDCoMKgIGlmIChpcnEgPD0gMCkgewo+
Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gcGFyc2UgYW5k
IG1hcCBJUlE6ICVkXG4iLCBpcnEpOwo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1F
SU5WQUw7Cj4+Pj4+Pj4+ICvCoMKgwqAgfQo+Pj4+Pj4+Cj4+Pj4+Pj4gIMKgwqDCoEZyb20gY29t
bWl0IGRlc2NyaXB0aW9uOgo+Pj4+Pj4+Cj4+Pj4+Pj4+IFRoZSBmaXJzdCBwcm9iZWQgU1RNIGlz
IHVzZWQgYXMgYSBjbG9ja3NvdXJjZSwgdGhlIHNlY29uZCB3aWxsIGJlCj4+Pj4+Pj4+IHRoZQo+
Pj4+Pj4+PiBicm9hZGNhc3QgdGltZXIgYW5kIHRoZSByZXN0IGFyZSB1c2VkIGFzIGEgY2xvY2tl
dmVudCB3aXRoIHRoZQo+Pj4+Pj4+PiBhZmZpbml0eSBzZXQgdG8gYSBDUFUuCj4+Pj4+Pj4KPj4+
Pj4+PiBXaHkgaXMgdGhlIGludGVycnVwdCBtYW5kYXRvcnkgd2hlbiB0aGUgbm9kZSBpcyBwcm9i
ZWQgYXMgYQo+Pj4+Pj4+IGNsb2Nrc291cmNlPwo+Pj4+Pj4KPj4+Pj4+IEl0IHJlbGllcyBvbiB0
aGUgRFQgZGVzY3JpcHRpb24gYW5kIGl0IGRvZXMgbm90IGh1cnQgdG8gaGF2ZSBhCj4+Pj4+PiBj
b25zaXN0ZW50IGNvZGUgcGF0aCBmb3IgY2xvY2tldmVudCAvIGNsb2Nrc291cmNlIGV2ZW4gaWYg
dGhlCj4+Pj4+PiBpbnRlcnJ1cHQKPj4+Pj4+IGlzIG5vdCByZXF1ZXN0ZWQgZm9yIHRoZSBjbG9j
a3NvdXJjZSBsYXRlci4KPj4+Pj4+Cj4+Pj4+Cj4+Pj4+IElmIHNvLCBpbiBteSBvcGluaW9uLCBp
dCB3b3VsZCBtYWtlIHNlbnNlIHRvIHVzZSB0aGUgc2FtZSBTVE0gaW5zdGFuY2UKPj4+Pj4gZm9y
IGJvdGggdGhlIGNsb2Nrc291cmNlIGFuZCBicm9hZGNhc3QgY2xvY2tldmVudCwgYXMgYm90aCBm
dW5jdGlvbnMKPj4+Pj4gY2FuCj4+Pj4+IGJlIGFjY29tbW9kYXRlZCB3aXRoaW4gYSBzaW5nbGUg
U1RNIGluc3RhbmNlLCB3aGljaCB3aWxsIGhlbHAgcmVkdWNlCj4+Pj4+IHRoZQo+Pj4+PiBudW1i
ZXIgb2YgU1RNIGluc3RhbmNlcyB1c2VkLgo+Pj4+Cj4+Pj4gVGhlIGJyb2FkY2FzdCB0aW1lciBp
cyBzdG9wcGVkIHdoZW4gaXQgaXMgdW51c2VkIHdoaWNoIGlzIHRoZSBjYXNlIGZvcgo+Pj4+IHRo
ZSBzMzIgYmVjYXVzZSB0aGVyZSBhcmUgbm8gaWRsZSBzdGF0ZSBwb3dlcmluZyBkb3duIHRoZSBs
b2NhbCB0aW1lcnMuCj4+Pj4gVGhleSBoYXZlIHRvIGhhdmUgYmUgc2VwYXJhdGVkLgo+Pj4+Cj4+
Pgo+Pj4gVGhpcyB3b3VsZG4ndCBiZSB0aGUgY2FzZSBpZiB0aGUgU1RNIGlzIGtlcHQgcnVubmlu
Zy9jb3VudGluZyBkdXJpbmcgdGhlCj4+PiBjbG9jayBldmVudCBzZXR1cCwgd2l0aCBvbmx5IHRo
ZSBjbG9jayBldmVudCBpbnRlcnJ1cHQgYmVpbmcgZGlzYWJsZWQKPj4+IChDQ1IuQ0VOKS4KPj4K
Pj4gQXJlIHlvdSBhc2tpbmcgdG8gdXNlIHR3byBkaWZmZXJlbnQgY2hhbm5lbHMgZm9yIHRoZSBz
YW1lIFNUTSBpbnN0YW5jZSwKPj4gb25lIGZvciB0aGUgY2xvY2tzb3VyY2UgYW5kIG9uZSBmb3Ig
dGhlIGNsb2NrZXZlbnQgPwo+Pgo+IAo+IEkgc3VnZ2VzdGVkIHVzaW5nIHRoZSBDTlQgcmVnaXN0
ZXIgdG8gb2J0YWluIHRoZSBjb3VudCBmb3IgdGhlIGNsb2NrCj4gc291cmNlLCB3aGlsZSB1c2lu
ZyBvbmUgb2YgdGhlIFNUTSBjaGFubmVscyBmb3IgdGhlIGNsb2NrIGV2ZW50LgoKQWgsIG9rLgoK
SSB0aGluayBpdCBpcyBwcmVmZXJhYmxlIHRvIGtlZXAgdGhlbSBzZXBhcmF0ZWQgdG8ga2VlcCB0
aGUgY29kZSAKbW9kdWxhci4gR2l2ZW4gdGhlIG51bWJlciBvZiBTVE0gb24gdGhlIHBsYXRmb3Jt
LCBpdCBkb2VzIG5vdCBodXJ0CgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5v
cmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzog
IDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6
Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8u
b3JnL2xpbmFyby1ibG9nLz4gQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
