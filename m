Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BC885B949
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Feb 2024 11:41:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8763C6A61D;
	Tue, 20 Feb 2024 10:41:32 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72A01C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 10:41:31 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-33d6f1f17e5so212954f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 02:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708425691; x=1709030491;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1ffOH1itwl3Z/6WXt9S5kShMdP0MfLLwhwAMSm7CnAc=;
 b=gzPwAFpup1luY342YiwsN4LFwd8k6a3GQSnxNXnYYgrlWF32vFAHov8+HQtJTbhKlT
 +ymaJOUcgVuhsu8Jm0hoUzZnY+BkykLvEWmug5tG2qGnOjw2MAgCENTH9qjkEM6S1Eyo
 pjbyLtuUExE8BbsfisqRdJ2RxtDfQCm1nmh/GNuPi9hYt5/ygHIOCQPIvrTt35p8wOe2
 4rXCuRZsvoe6jysKA2EwlpROGmM6iDEJLgFjJ/4YEOTVOSaLqaxTKhekQuKVdc4VDmIz
 SuoG3eQDARTGKjgHmZ9DnVQGykJibDHCKbDocSXSccZirT2qceYmShLstIEigxTQoXau
 bvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708425691; x=1709030491;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1ffOH1itwl3Z/6WXt9S5kShMdP0MfLLwhwAMSm7CnAc=;
 b=aKr/DGP1e12bbYsLOpPktOQQv9OGd3OogJ1s+PbyIkS0JZwEZd7SV1XoRAgI8E5OOM
 6tHBb9QQFNnLWWAJuH35iW6yN45GZCnEvZFSPYcb2aLnmF0gy5SEeMmQQywh86Uio3/C
 qpNalzWkAmPZXhrhQA7fctkhY/Rsa/lbsKU4/bQK08QnpH+lvZPud944BqrQgDHEeZOf
 OAEPFWIkY/1r/qFe9d5M1FPWGSBgovSBMg+aRIqu8LeEfJniOf/WrJil6xz8uIhAIhTQ
 aC+Ejlm+QgvzM30AVps/4csHfKKvaFaGGJorONczp5UMnJ2ieA4qz5yRT267cF8LYbyl
 Afbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVt7NvEX6GFVBZeqtDTdPcFdhuAjKI2biaZ8HJKIBEcMUmMQ5u3rkPXUljXPYC84+zQSDfEOGQI8AqxAI9Gc+arrGNkojQ+V0t8DVyR3+Qgyk7PuHtiQNw
X-Gm-Message-State: AOJu0YyFD/cI+YVvLdCHw8dSTEse1JofH95Eswnt4ABkKKZvI4Im95Oy
 f4O9/hMRJs4A8abiWZjG/K/ZyIu+V4BWFtx+zy10WZoeQ9deFcbG
X-Google-Smtp-Source: AGHT+IFDrhQX32VSUY+dvsggxvJw3807349WRgyk55H4GHmP6zw0T6olauNngu8d77E6a61PPbdeog==
X-Received: by 2002:a05:6000:1a8a:b0:33d:3a00:554d with SMTP id
 f10-20020a0560001a8a00b0033d3a00554dmr6111440wry.8.1708425690688; 
 Tue, 20 Feb 2024 02:41:30 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc?
 ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
 by smtp.gmail.com with ESMTPSA id
 b7-20020adfe647000000b0033b406bc689sm13193409wrn.75.2024.02.20.02.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 02:41:30 -0800 (PST)
Message-ID: <0ec567d7df3632a9c8104485c4207a47e159fdb9.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: David Lechner <dlechner@baylibre.com>, Mark Brown <broonie@kernel.org>
Date: Tue, 20 Feb 2024 11:41:29 +0100
In-Reply-To: <20240219-mainline-spi-precook-message-v2-5-4a762c6701b9@baylibre.com>
References: <20240219-mainline-spi-precook-message-v2-0-4a762c6701b9@baylibre.com>
 <20240219-mainline-spi-precook-message-v2-5-4a762c6701b9@baylibre.com>
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
Cc: Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Julien Stephan <jstephan@baylibre.com>,
 David Jander <david@protonic.nl>,
 Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Sperl <kernel@martin.sperl.org>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 5/5] iio: adc: ad7380: use
	spi_optimize_message()
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

T24gTW9uLCAyMDI0LTAyLTE5IGF0IDE2OjMzIC0wNjAwLCBEYXZpZCBMZWNobmVyIHdyb3RlOgo+
IFRoaXMgbW9kaWZpZXMgdGhlIGFkNzM4MCBBREMgZHJpdmVyIHRvIHVzZSBzcGlfb3B0aW1pemVf
bWVzc2FnZSgpIHRvCj4gb3B0aW1pemUgdGhlIFNQSSBtZXNzYWdlIGZvciB0aGUgYnVmZmVyZWQg
cmVhZCBvcGVyYXRpb24uIFNpbmNlIGJ1ZmZlcmVkCj4gcmVhZHMgcmV1c2UgdGhlIHNhbWUgU1BJ
IG1lc3NhZ2UgZm9yIGVhY2ggcmVhZCwgdGhpcyBjYW4gaW1wcm92ZQo+IHBlcmZvcm1hbmNlIGJ5
IHJlZHVjaW5nIHRoZSBvdmVyaGVhZCBvZiBzZXR0aW5nIHVwIHNvbWUgcGFydHMgdGhlIFNQSQo+
IG1lc3NhZ2UgaW4gZWFjaCBzcGlfc3luYygpIGNhbGwuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGF2
aWQgTGVjaG5lciA8ZGxlY2huZXJAYmF5bGlicmUuY29tPgo+IC0tLQo+IAoKUmV2aWV3ZWQtYnk6
IE51bm8gU2EgPG51bm8uc2FAYW5hbG9nLmNvbT4KCj4gdjIgY2hhbmdlczoKPiAtIFJlbW92ZWQg
ZHluYW1pYyBhbGxvY2F0aW9uIG9mIHNwaSB4ZmVyL21zZwo+IC0gTW92ZWQgc3BpIG1lc3NhZ2Ug
b3B0aW1pemF0aW9uIHRvIHByb2JlIGZ1bmN0aW9uCj4gLSBEcm9wcGVkIGJ1ZmZlciBwcmUvcG9z
dCBjYWxsYmFja3MKPiAKPiDCoGRyaXZlcnMvaWlvL2FkYy9hZDczODAuYyB8IDM2ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDMwIGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2Fk
Yy9hZDczODAuYyBiL2RyaXZlcnMvaWlvL2FkYy9hZDczODAuYwo+IGluZGV4IGFiZDc0NmFlZjg2
OC4uNmIzZmQyMGM4ZjFmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaWlvL2FkYy9hZDczODAuYwo+
ICsrKyBiL2RyaXZlcnMvaWlvL2FkYy9hZDczODAuYwo+IEBAIC0xMzMsNiArMTMzLDkgQEAgc3Ry
dWN0IGFkNzM4MF9zdGF0ZSB7Cj4gwqAJc3RydWN0IHNwaV9kZXZpY2UgKnNwaTsKPiDCoAlzdHJ1
Y3QgcmVndWxhdG9yICp2cmVmOwo+IMKgCXN0cnVjdCByZWdtYXAgKnJlZ21hcDsKPiArCS8qIHhm
ZXIgYW5kIG1zZyBmb3IgYnVmZmVyIHJlYWRzICovCj4gKwlzdHJ1Y3Qgc3BpX3RyYW5zZmVyIHhm
ZXI7Cj4gKwlzdHJ1Y3Qgc3BpX21lc3NhZ2UgbXNnOwo+IMKgCS8qCj4gwqAJICogRE1BICh0aHVz
IGNhY2hlIGNvaGVyZW5jeSBtYWludGVuYW5jZSkgcmVxdWlyZXMgdGhlCj4gwqAJICogdHJhbnNm
ZXIgYnVmZmVycyB0byBsaXZlIGluIHRoZWlyIG93biBjYWNoZSBsaW5lcy4KPiBAQCAtMjM2LDE0
ICsyMzksOSBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgYWQ3MzgwX3RyaWdnZXJfaGFuZGxlcihpbnQg
aXJxLCB2b2lkICpwKQo+IMKgCXN0cnVjdCBpaW9fcG9sbF9mdW5jICpwZiA9IHA7Cj4gwqAJc3Ry
dWN0IGlpb19kZXYgKmluZGlvX2RldiA9IHBmLT5pbmRpb19kZXY7Cj4gwqAJc3RydWN0IGFkNzM4
MF9zdGF0ZSAqc3QgPSBpaW9fcHJpdihpbmRpb19kZXYpOwo+IC0Jc3RydWN0IHNwaV90cmFuc2Zl
ciB4ZmVyID0gewo+IC0JCS5iaXRzX3Blcl93b3JkID0gc3QtPmNoaXBfaW5mby0+Y2hhbm5lbHNb
MF0uc2Nhbl90eXBlLnJlYWxiaXRzLAo+IC0JCS5sZW4gPSA0LAo+IC0JCS5yeF9idWYgPSBzdC0+
c2Nhbl9kYXRhLnJhdywKPiAtCX07Cj4gwqAJaW50IHJldDsKPiDCoAo+IC0JcmV0ID0gc3BpX3N5
bmNfdHJhbnNmZXIoc3QtPnNwaSwgJnhmZXIsIDEpOwo+ICsJcmV0ID0gc3BpX3N5bmMoc3QtPnNw
aSwgJnN0LT5tc2cpOwo+IMKgCWlmIChyZXQpCj4gwqAJCWdvdG8gb3V0Owo+IMKgCj4gQEAgLTMz
NSw2ICszMzMsMjggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpaW9faW5mbyBhZDczODBfaW5mbyA9
IHsKPiDCoAkuZGVidWdmc19yZWdfYWNjZXNzID0gJmFkNzM4MF9kZWJ1Z2ZzX3JlZ19hY2Nlc3Ms
Cj4gwqB9Owo+IMKgCj4gK3N0YXRpYyB2b2lkIGFkNzM4MF91bm9wdGltaXplX3NwaV9tc2codm9p
ZCAqbXNnKQo+ICt7Cj4gKwlzcGlfdW5vcHRpbWl6ZV9tZXNzYWdlKG1zZyk7Cj4gK30KPiArCj4g
K3N0YXRpYyBpbnQgZGV2bV9hZDczODBfc2V0dXBfc3BpX21zZyhzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCBhZDczODBfc3RhdGUgKnN0KQo+ICt7Cj4gKwlpbnQgcmV0Owo+ICsKPiArCXN0LT54
ZmVyLmJpdHNfcGVyX3dvcmQgPSBzdC0+Y2hpcF9pbmZvLT5jaGFubmVsc1swXS5zY2FuX3R5cGUu
cmVhbGJpdHM7Cj4gKwlzdC0+eGZlci5sZW4gPSA0Owo+ICsJc3QtPnhmZXIucnhfYnVmID0gc3Qt
PnNjYW5fZGF0YS5yYXc7Cj4gKwo+ICsJc3BpX21lc3NhZ2VfaW5pdF93aXRoX3RyYW5zZmVycygm
c3QtPm1zZywgJnN0LT54ZmVyLCAxKTsKPiArCj4gKwlyZXQgPSBzcGlfb3B0aW1pemVfbWVzc2Fn
ZShzdC0+c3BpLCAmc3QtPm1zZyk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiBkZXZfZXJyX3By
b2JlKGRldiwgcmV0LCAiZmFpbGVkIHRvIG9wdGltaXplIG1lc3NhZ2VcbiIpOwo+ICsKPiArCXJl
dHVybiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCBhZDczODBfdW5vcHRpbWl6ZV9zcGlf
bXNnLCAmc3QtPm1zZyk7Cj4gK30KPiArCj4gwqBzdGF0aWMgaW50IGFkNzM4MF9pbml0KHN0cnVj
dCBhZDczODBfc3RhdGUgKnN0KQo+IMKgewo+IMKgCWludCByZXQ7Cj4gQEAgLTQxMSw2ICs0MzEs
MTAgQEAgc3RhdGljIGludCBhZDczODBfcHJvYmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkKPiDC
oAkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnNwaS0+ZGV2LCBQVFJfRVJSKHN0LT5yZWdtYXApLAo+
IMKgCQkJCcKgwqDCoMKgICJmYWlsZWQgdG8gYWxsb2NhdGUgcmVnaXN0ZXIgbWFwXG4iKTsKPiDC
oAo+ICsJcmV0ID0gZGV2bV9hZDczODBfc2V0dXBfc3BpX21zZygmc3BpLT5kZXYsIHN0KTsKPiAr
CWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiArCj4gwqAJaW5kaW9fZGV2LT5jaGFubmVscyA9
IHN0LT5jaGlwX2luZm8tPmNoYW5uZWxzOwo+IMKgCWluZGlvX2Rldi0+bnVtX2NoYW5uZWxzID0g
c3QtPmNoaXBfaW5mby0+bnVtX2NoYW5uZWxzOwo+IMKgCWluZGlvX2Rldi0+bmFtZSA9IHN0LT5j
aGlwX2luZm8tPm5hbWU7Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
