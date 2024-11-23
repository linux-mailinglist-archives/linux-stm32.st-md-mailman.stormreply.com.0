Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 660D19D6BB4
	for <lists+linux-stm32@lfdr.de>; Sat, 23 Nov 2024 23:05:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23EB8C78F69;
	Sat, 23 Nov 2024 22:05:13 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91CECC78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Nov 2024 22:05:06 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-460dce6fff9so24339961cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Nov 2024 14:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732399505; x=1733004305;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EkSO0ae1qgqzPLe+fBXvhHl1eDnIeDZzwTeg6SCFQSc=;
 b=ee9zlAUCbrPYDuNTTRar1ewy659NhvcSxE2cftVLub/64VLOp94vXY3erMKGFN/0fK
 eRfRQNmzvuc1IdVL4G77IzzOi7zhexssC68PG2P6ReVd10ic03rxYRroSxu15w2UFEE+
 2Tbr5HxFgPy7JeU1Wq3cvgQjDuYJRCwZwVfuVU3WNvqZ53aieEs7sC1nXzxurs2RPQNz
 +GvXiY0q7XmeP5W3VONHnAe+3Cf5zEkhdWg9ejt0pi+h+aVBsKA3Q0O1WV/qvdwOFzxV
 UJkGh+umaGcCGNM1GqTAYncFUmdZv2nXVJ6nfhNWGdmDtapMn8whJpuTla68rbAUlmLb
 kznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732399505; x=1733004305;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EkSO0ae1qgqzPLe+fBXvhHl1eDnIeDZzwTeg6SCFQSc=;
 b=wfQXiMtoQ3b6laqUrLOJCPQc/dIhLMzF5l1vkl568ol0Ijs88pesdYmDeootztWshl
 wcOnC274LnL96r3wJ6Z6wYlLZRE/qtwSYngJsMRIDRcCJ/uRHMe0OFr/RKCvNPUgcGRE
 HNOgnRDT1fX/6PMJ/GcCk2vYdnit2W9GQbKM+tnwS/uS31xQOxodQXSn58q83AuYPB5N
 8WV+8F+fjglEtKSRF/oNgx9ErE0Fe6isLDgfy9XKpJJfjXopCNhl76BVOuAwQHpK8nGF
 wkIUtkIyCuTQILW+1AUFMNhbVTyVsGKARhTTrzjg6HnZkmLVtH1Tsf627tK8sDVrAtup
 h8YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHlT5vI4u8cLMOV93ZBv6nuDoyjodipgC4YqvNzV1ZXxTRPowXuo9s269CbEoRllXZ6UIFiYGZvwoHLw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyeyRd9tMEhxZEXy+yCOu+pi0d+j0OV1kVrwmSBQSy1rtMU6Mcz
 4o2r7OBr2HhrbNwSy3KrlYIOTvPE9SO03dX1kRz5I/jb0RIyOAKPDlTGvZp6Ug7/3Hu52wJP5wh
 0gsDt4b1rhv1PgqR2Z3a3TwBQ6Kc=
X-Gm-Gg: ASbGncsHNhveRDm8KlkV6pFiPGlBZJYFsaUbgVexf2a++O2lZhWnLZ3LHIAOpHi6R8j
 ayLD/JAnxJzL/zSHVCiz/eRXeYyDYkwqN
X-Google-Smtp-Source: AGHT+IEDHw6BpJXxtWPVqade1NgtWHuCJEZszqIDMX8X2Z8ZsSkxcHVPRBOEeAJKY7783cobYOMI6sXBGxrZqXJvc10=
X-Received: by 2002:a05:622a:1a1b:b0:461:1c54:5bd5 with SMTP id
 d75a77b69052e-4653d52276emr93948991cf.9.1732399505536; Sat, 23 Nov 2024
 14:05:05 -0800 (PST)
MIME-Version: 1.0
References: <20241111222310.12339-1-jiashengjiangcool@gmail.com>
 <20241123150808.1426c6f8@jic23-huawei>
In-Reply-To: <20241123150808.1426c6f8@jic23-huawei>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Sat, 23 Nov 2024 17:04:55 -0500
Message-ID: <CANeGvZUZw3hxVGAUDhWjbWwVgfDnB33KfzitYwQ73YjLQYeqng@mail.gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: tgamblin@baylibre.com, lars@metafoo.de, benjamin.gaignard@linaro.org,
 fabrice.gasnier@st.com, linux-iio@vger.kernel.org, lee@kernel.org,
 linux-kernel@vger.kernel.org, u.kleine-koenig@baylibre.com,
 mcoquelin.stm32@gmail.com, dlechner@baylibre.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4] iio: trigger: stm32-timer-trigger: Add
	check for clk_enable()
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

SGkgSm9uYXRoYW4sCgpPbiBTYXQsIE5vdiAyMywgMjAyNCBhdCAxMDowOOKAr0FNIEpvbmF0aGFu
IENhbWVyb24gPGppYzIzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCAxMSBOb3YgMjAy
NCAyMjoyMzoxMCArMDAwMAo+IEppYXNoZW5nIEppYW5nIDxqaWFzaGVuZ2ppYW5nY29vbEBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gPiBBZGQgY2hlY2sgZm9yIHRoZSByZXR1cm4gdmFsdWUgb2YgY2xr
X2VuYWJsZSgpIGluIG9yZGVyIHRvIGNhdGNoIHRoZQo+ID4gcG90ZW50aWFsIGV4Y2VwdGlvbi4K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKaWFzaGVuZyBKaWFuZyA8amlhc2hlbmdqaWFuZ2Nvb2xA
Z21haWwuY29tPgo+IEhpIEppYXNoZW5nLAo+Cj4KPiBTaG91bGQgZGVmaW5pdGVseSBtZW50aW9u
IHRoZSBjaGFuZ2VzIHRvIHVzZSBndWFyZCgpIHRvIHNpbXBsaWZ5Cj4gdGhlIHJlc3VsdGluZyBj
b2RlLgoKVGhhbmtzLCBJIGhhdmUgcmV2aXNlZCB0aGUgInYyIC0+IHYzIiBpbiB0aGUgQ2hhbmdl
bG9nIHRvIGNsYXJpZnkgdGhlIGNoYW5nZXMuCgo+IE9uZSBtaW5vciBjb21tZW50IG9uIHRoZSBj
b2RlIGlubGluZS4gT3RoZXJ3aXNlIGxvb2tzIGdvb2QgdG8gbWUuCj4KPiBUaGFua3MsCj4KPiBK
b25hdGhhbgo+Cj4gPiAtLS0KPiA+IENoYW5nZWxvZzoKPiA+Cj4gPiB2MyAtPiB2NDoKPiA+Cj4g
PiAxLiBQbGFjZSBicmFjZXMgYXJvdW5kIHRoZSBjYXNlIGJvZHkuCj4gPgo+ID4gdjIgLT4gdjM6
Cj4gPgo+ID4gMS4gU2ltcGxpZnkgY29kZSB3aXRoIGNsZWFudXAgaGVscGVycy4KPiA+Cj4gPiB2
MSAtPiB2MjoKPiA+Cj4gPiAxLiBSZW1vdmUgdW5zdWl0YWJsZSBkZXZfZXJyX3Byb2JlKCkuCj4K
PiA+IEBAIC00ODIsNiArNDg0LDcgQEAgc3RhdGljIGludCBzdG0zMl9jb3VudGVyX3dyaXRlX3Jh
dyhzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaW50IHZhbCwgaW50IHZhbDIsIGxvbmcgbWFzaykKPiA+ICB7Cj4gPiAgICAgICBz
dHJ1Y3Qgc3RtMzJfdGltZXJfdHJpZ2dlciAqcHJpdiA9IGlpb19wcml2KGluZGlvX2Rldik7Cj4g
PiArICAgICBpbnQgcmV0Owo+ID4KPiA+ICAgICAgIHN3aXRjaCAobWFzaykgewo+ID4gICAgICAg
Y2FzZSBJSU9fQ0hBTl9JTkZPX1JBVzoKPiA+IEBAIC00OTEsMTIgKzQ5NCwxNCBAQCBzdGF0aWMg
aW50IHN0bTMyX2NvdW50ZXJfd3JpdGVfcmF3KHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCj4g
PiAgICAgICAgICAgICAgIC8qIGZpeGVkIHNjYWxlICovCj4gPiAgICAgICAgICAgICAgIHJldHVy
biAtRUlOVkFMOwo+ID4KPiA+IC0gICAgIGNhc2UgSUlPX0NIQU5fSU5GT19FTkFCTEU6Cj4gPiAt
ICAgICAgICAgICAgIG11dGV4X2xvY2soJnByaXYtPmxvY2spOwo+ID4gKyAgICAgY2FzZSBJSU9f
Q0hBTl9JTkZPX0VOQUJMRTogewo+ID4gKyAgICAgICAgICAgICBndWFyZChtdXRleCkoJnByaXYt
PmxvY2spOwo+ID4gICAgICAgICAgICAgICBpZiAodmFsKSB7Cj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKCFwcml2LT5lbmFibGVkKSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwcml2LT5lbmFibGVkID0gdHJ1ZTsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNsa19lbmFibGUocHJpdi0+Y2xrKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJldCA9IGNsa19lbmFibGUocHJpdi0+Y2xrKTsKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGlmIChyZXQpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiByZXQ7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgfQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgIHJlZ21hcF9zZXRfYml0cyhwcml2LT5yZWdtYXAsIFRJTV9DUjEsIFRJTV9D
UjFfQ0VOKTsKPiA+ICAgICAgICAgICAgICAgfSBlbHNlIHsKPiA+IEBAIC01MDYsOSArNTExLDEw
IEBAIHN0YXRpYyBpbnQgc3RtMzJfY291bnRlcl93cml0ZV9yYXcoc3RydWN0IGlpb19kZXYgKmlu
ZGlvX2RldiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsa19kaXNhYmxlKHBy
aXYtPmNsayk7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgfQo+ID4gICAgICAgICAgICAgICB9
Cj4gPiAtICAgICAgICAgICAgIG11dGV4X3VubG9jaygmcHJpdi0+bG9jayk7Cj4gPiArCj4gPiAg
ICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gICAgICAgfQo+IEFkZCBhIGRlZmF1bHQgZm9yIHJl
YXNvbnMgRGF2aWQgbWVudGlvbmVkIGFuZCBpdCBhbHNvIG1ha2VzIGl0IHZpc3VhbGx5IGNsZWFy
Cj4gdGhhdCB3ZSBleHBlY3QgdG8gZ2V0IGluIGhlcmUgZm9yIG90aGVyIGNhc2VzIGJ1dCB0aGV5
IGFyZSBhbGwgZXJyb3JzLgo+ICAgICAgICAgZGVmYXVsdDoKPiAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4gPiArICAgICB9Cj4gPgo+IEFuZCBkcm9wIHRoaXMgcmV0dXJuIGFzIHVu
cmVhY2hhYmxlLgo+Cj4gPiAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ICB9CgpUaGFua3MsIEkg
aGF2ZSBzdWJtaXR0ZWQgdjUgdG8gaW5jbHVkZSBhIGRlZmF1bHQgYW5kIHJlbW92ZSB0aGUgcmV0
dXJuLgoKLUppYXNoZW5nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
