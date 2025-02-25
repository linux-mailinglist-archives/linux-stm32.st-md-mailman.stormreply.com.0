Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A8AA43FDB
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 14:00:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97EA7C78F96;
	Tue, 25 Feb 2025 13:00:05 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C80B4C78F7D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 13:00:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A0DBB5C710F;
 Tue, 25 Feb 2025 12:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3456CC4CEE6;
 Tue, 25 Feb 2025 12:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740488402;
 bh=MIpWmATnHWUCuVfECKFeEj874VPeRJVVLzeFDtK35xw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VJriC2lMNCLIQ1ThvHdLSX03oyJ8xu3BNNoJY1+o7W36I7HVPZm7yz8lwZImyBLyq
 ph/FhIVsZNGsuuF1uPpgtd+Gkp4j8nS05DIPh8OyV4DKVNEq0GmC/lAX+zZClCVUCy
 qTlQXltHhWnDfYERKPx0s3cXKzQuGw69nVu2rbGmudt83LSRKApK06P0HnouTcNN/2
 9bbwdKM4Oyy1QefprDjb5eN6hoaGcN4kptol8MxDWRzMgRFBvv7sabkWU4XPngZFJF
 p5qIQ8H6tix6Has227bgRCYuHsdM0R/nOAjOUTL/xF2Ew+Q/a5biZMGoRooysLFUHv
 OD7GgJWGvGtHQ==
Message-ID: <1990c649-668e-4ae9-82b5-ed9931f41ec4@kernel.org>
Date: Tue, 25 Feb 2025 13:59:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
 <20250225-hdp-upstream-v1-3-9d049c65330a@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250225-hdp-upstream-v1-3-9d049c65330a@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 3/9] pinctrl: stm32: Introduce HDP driver
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

T24gMjUvMDIvMjAyNSAwOTo0OCwgQ2zDqW1lbnQgTGUgR29mZmljIHdyb3RlOgo+IFRoaXMgcGF0
Y2ggaW50cm9kdWNlIHRoZSBkcml2ZXIgZm9yIHRoZSBIYXJkd2FyZSBEZWJ1ZyBQb3J0IGF2YWls
YWJsZSBvbgoKUGxlYXNlIGRvIG5vdCB1c2UgIlRoaXMgY29tbWl0L3BhdGNoL2NoYW5nZSIsIGJ1
dCBpbXBlcmF0aXZlIG1vb2QuIFNlZQpsb25nZXIgZXhwbGFuYXRpb24gaGVyZToKaHR0cHM6Ly9l
bGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTcuMS9zb3VyY2UvRG9jdW1lbnRhdGlvbi9wcm9j
ZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QjTDk1Cgo+IFNUTTMyTVAgcGxhdGZvcm1zLiBUaGUg
SERQIGFsbG93cyB0aGUgb2JzZXJ2YXRpb24gb2YgaW50ZXJuYWwgU29DCj4gc2lnbmFscyBieSB1
c2luZyBtdWx0aXBsZXhlcnMuIEVhY2ggSERQIHBvcnQgY2FuIHByb3ZpZGUgdXAgdG8gMTYKPiBp
bnRlcm5hbCBzaWduYWxzIChvbmUgb2YgdGhlbSBjYW4gYmUgc29mdHdhcmUgY29udHJvbGxlZCBh
cyBhIEdQTykKCgoKLi4uLgoKPiArCj4gK3N0YXRpYyBpbnQgc3RtMzJfaGRwX3N1c3BlbmQoc3Ry
dWN0IGRldmljZSAqZGV2KQo+ICt7Cj4gKwlzdHJ1Y3Qgc3RtMzJfaGRwICpoZHAgPSBkZXZfZ2V0
X2RydmRhdGEoZGV2KTsKPiArCj4gKwloZHAtPmdwb3NldF9jb25mID0gcmVhZGxfcmVsYXhlZCho
ZHAtPmJhc2UgKyBIRFBfR1BPU0VUKTsKPiArCj4gKwlwaW5jdHJsX3BtX3NlbGVjdF9zbGVlcF9z
dGF0ZShkZXYpOwo+ICsKPiArCWNsa19kaXNhYmxlX3VucHJlcGFyZShoZHAtPmNsayk7Cj4gKwo+
ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgc3RtMzJfaGRwX3Jlc3VtZShzdHJ1
Y3QgZGV2aWNlICpkZXYpCj4gK3sKPiArCXN0cnVjdCBzdG0zMl9oZHAgKmhkcCA9IGRldl9nZXRf
ZHJ2ZGF0YShkZXYpOwo+ICsJaW50IGVycjsKPiArCj4gKwllcnIgPSBjbGtfcHJlcGFyZV9lbmFi
bGUoaGRwLT5jbGspOwo+ICsJaWYgKGVycikKPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShoZHAt
PmRldiwgZXJyLCAiRmFpbGVkIHRvIHByZXBhcmVfZW5hYmxlIGNsayIpOwoKClRoYXQncyB3cm9u
ZywgaXQgaXMgbm90IGEgcHJvYmUgcGF0aC4KCj4gKwo+ICsJd3JpdGVsX3JlbGF4ZWQoSERQX0NU
UkxfRU5BQkxFLCBoZHAtPmJhc2UgKyBIRFBfQ1RSTCk7Cj4gKwl3cml0ZWxfcmVsYXhlZChoZHAt
Pmdwb3NldF9jb25mLCBoZHAtPmJhc2UgKyBIRFBfR1BPU0VUKTsKPiArCXdyaXRlbF9yZWxheGVk
KGhkcC0+bXV4X2NvbmYsIGhkcC0+YmFzZSArIEhEUF9NVVgpOwo+ICsKPiArCXBpbmN0cmxfcG1f
c2VsZWN0X2RlZmF1bHRfc3RhdGUoZGV2KTsKPiArCj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiAr
REVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTKHN0bTMyX2hkcF9wbV9vcHMsIHN0bTMyX2hkcF9zdXNw
ZW5kLCBzdG0zMl9oZHBfcmVzdW1lKTsKPiArCj4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJp
dmVyIHN0bTMyX2hkcF9kcml2ZXIgPSB7Cj4gKwkucHJvYmUgPSBzdG0zMl9oZHBfcHJvYmUsCj4g
KwkucmVtb3ZlID0gc3RtMzJfaGRwX3JlbW92ZSwKPiArCS5kcml2ZXIgPSB7Cj4gKwkJLm5hbWUg
PSBEUklWRVJfTkFNRSwKPiArCQkucG0gPSBwbV9zbGVlcF9wdHIoJnN0bTMyX2hkcF9wbV9vcHMp
LAo+ICsJCS5vZl9tYXRjaF90YWJsZSA9IHN0bTMyX2hkcF9vZl9tYXRjaCwKPiArCX0KPiArfTsK
PiArCj4gK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoc3RtMzJfaGRwX2RyaXZlcik7Cj4gKwo+ICtN
T0RVTEVfQUxJQVMoInBsYXRmb3JtOiIgRFJJVkVSX05BTUUpOwoKCllvdSBzaG91bGQgbm90IG5l
ZWQgTU9EVUxFX0FMSUFTKCkgaW4gbm9ybWFsIGNhc2VzLiBJZiB5b3UgbmVlZCBpdCwKdXN1YWxs
eSBpdCBtZWFucyB5b3VyIGRldmljZSBJRCB0YWJsZSBpcyB3cm9uZyAoZS5nLiBtaXNzZXMgZWl0
aGVyCmVudHJpZXMgb3IgTU9EVUxFX0RFVklDRV9UQUJMRSgpKS4gTU9EVUxFX0FMSUFTKCkgaXMg
bm90IGEgc3Vic3RpdHV0ZQpmb3IgaW5jb21wbGV0ZSBJRCB0YWJsZS4KCgoKCkJlc3QgcmVnYXJk
cywKS3J6eXN6dG9mCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
