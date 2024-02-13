Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD9E852CDA
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 10:47:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05B30C6C83D;
	Tue, 13 Feb 2024 09:47:59 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7608FC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 09:47:57 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-55f50cf2021so5407398a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 01:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707817677; x=1708422477;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nMaXfRaZB1Ui4wig/pjd3aNv6fO2xjtyP225zQQw8a4=;
 b=eLzwbe4isU+ja57GfX3CKdTLlcngAGAW6v7nEBcJ3bS/7vlrra9mP6RByM5XjV6ZQR
 bAgzfGzA696dLnfMAnE6ZVctgo5/ERItxc69mCl/2bnfmaITbtahLd7ycAKvAxgnGzMs
 UCsBDsMY9aYfqoDnWKEih7HoFn9uauFeEEdsAQz4WYAf49U1zfi3hgDIsfJE4McyrZRN
 np+QLuH2h89sp4BtPKr8LTZQBMz+zcUjpBuQRUDWSptlpE6v2w8z0p8a+FcRaVNY+n/E
 LpmVHu6VU1T6SrrG9+wWNzgCrElajXHS71ip1PRck7iO22656Is03C83vd1YzIQ6dl6E
 8ZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707817677; x=1708422477;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nMaXfRaZB1Ui4wig/pjd3aNv6fO2xjtyP225zQQw8a4=;
 b=Jpma3r8ixRbwczp0LD5aVyVdaL8jO7Ou2owhrxTnDXTChJA8jACpu3AR8ye7bS8n/N
 PEicTEzeHkSN8+Ibhe1gPabTyDurtrk2/b2XgngxNaBYnqrCcG2sxIMqfjS6YExhNfLx
 1Bl3T4mU4mm9V9Ytpapo2fw1y6tJfMnHAxZPV+iwWFMhxkLxAdNz1JBB4+KX2GfD50Lq
 JTC1Sd7ENFJWhSUtMQTIVJ45r6sQX6p9LURDpZ+kOg8dUpe1b1DP2fTwSZjae98HxFJo
 veBmFBRGm1b8eIna65D5+Lqfbgl4HKAaetRZndzeQUpes0Y1OYVoJfNRJGXKiGvi1OsN
 /4SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3UpD5QxyPu4A+Wqlbu2udHSm3TVgH+ir4xmPgrB3ruXK6Y6gIiNVn2/ycoAoINx8oNJ0mfKuQm0Kkt07IjnpAYn/LQXa1K1CAmI1IZfdoV88VE/YwikFW
X-Gm-Message-State: AOJu0Yyj8jNJKskISPO36SEnWKuTgWx2jn1vF/Nm9rYmo0jToHLGKMW4
 3Qdx9iEn1St2iyQUGa/R/ot3ibruB5jFouNxg2vW011oJTuxJ/J/
X-Google-Smtp-Source: AGHT+IEY9GonQD/xWOqpsBEOt4y93Mfor49QxCWI0jOVlg6uODaZXNkzggCVUKUwtT/B8Oo/+cxXbQ==
X-Received: by 2002:a17:906:7116:b0:a3c:e436:d114 with SMTP id
 x22-20020a170906711600b00a3ce436d114mr1728171ejj.30.1707817676549; 
 Tue, 13 Feb 2024 01:47:56 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX+fiCsGVuZsVyYFzEaTqEywRi/vEqX6uvvUXD5siGAuywmoKLuGLqrtXTJZPhmuJpuyDfTa3K819AQwa581QG5A7+X0D30FgXRRYMbxfGczms7fdBB0PR1uQEsDpkIrdWHXqLqdq8hhSseC0v4+BY85Dckwiyk/0eYQq8eoOHySjxeAjfMZg3z+HOB4g4F+7Xll1+sLgf1zgD6GeV90HbP/PqJucQzX2zd5cLnlWBpUhYqaiyjrJqnRCp3kuAzUFG2f3ty7pRuY4YPp4lT5w5nRFjbaNaVv4mc4d6oKFSUfuQZQ2pxyGHVJJTe6CipGDn3hn91pc1V6V0x7wpaxOKMpMmcBe7qBdz+TIvtC19Wh3xjXeAwrzLuyUEaMvWocCeX7iLJ/pJ3CeLkEoWXtp3v1MbNQfTcDqu2A6hjsIuPcNW4KFOMz788IflOqYkjDEDlz60lOgFF3UH8SoQfGEdyIn+CQE1q2rd/FjtQeopa4QkfywxEArM+OMVRAJRZd4s7/oH8Ucc+kNUtYrxLeFX5
Received: from ?IPv6:2003:f6:ef1b:2000:944c:cbc7:1e1c:2c47?
 (p200300f6ef1b2000944ccbc71e1c2c47.dip0.t-ipconnect.de.
 [2003:f6:ef1b:2000:944c:cbc7:1e1c:2c47])
 by smtp.gmail.com with ESMTPSA id
 br18-20020a170906d15200b00a38a868bcf7sm1112046ejb.41.2024.02.13.01.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 01:47:56 -0800 (PST)
Message-ID: <c06dfa1ecf88b07ef467ad7c08667d0cab400613.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: David Lechner <dlechner@baylibre.com>, Mark Brown <broonie@kernel.org>
Date: Tue, 13 Feb 2024 10:51:15 +0100
In-Reply-To: <20240212-mainline-spi-precook-message-v1-5-a2373cd72d36@baylibre.com>
References: <20240212-mainline-spi-precook-message-v1-0-a2373cd72d36@baylibre.com>
 <20240212-mainline-spi-precook-message-v1-5-a2373cd72d36@baylibre.com>
User-Agent: Evolution 3.50.3 
MIME-Version: 1.0
Cc: Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Jander <david@protonic.nl>,
 Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Sperl <kernel@martin.sperl.org>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 5/5] iio: adc: ad7380: use
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

T24gTW9uLCAyMDI0LTAyLTEyIGF0IDE3OjI2IC0wNjAwLCBEYXZpZCBMZWNobmVyIHdyb3RlOgo+
IFRoaXMgbW9kaWZpZXMgdGhlIGFkNzM4MCBBREMgZHJpdmVyIHRvIHVzZSBzcGlfb3B0aW1pemVf
bWVzc2FnZSgpIHRvCj4gb3B0aW1pemUgdGhlIFNQSSBtZXNzYWdlIGZvciB0aGUgYnVmZmVyZWQg
cmVhZCBvcGVyYXRpb24uIFNpbmNlIGJ1ZmZlcmVkCj4gcmVhZHMgcmV1c2UgdGhlIHNhbWUgU1BJ
IG1lc3NhZ2UgZm9yIGVhY2ggcmVhZCwgdGhpcyBjYW4gaW1wcm92ZQo+IHBlcmZvcm1hbmNlIGJ5
IHJlZHVjaW5nIHRoZSBvdmVyaGVhZCBvZiBzZXR0aW5nIHVwIHNvbWUgcGFydHMgdGhlIFNQSQo+
IG1lc3NhZ2UgaW4gZWFjaCBzcGlfc3luYygpIGNhbGwuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGF2
aWQgTGVjaG5lciA8ZGxlY2huZXJAYmF5bGlicmUuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9paW8v
YWRjL2FkNzM4MC5jIHwgNTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0KPiAtCj4gwqAxIGZpbGUgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgNyBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRjL2FkNzM4MC5jIGIvZHJp
dmVycy9paW8vYWRjL2FkNzM4MC5jCj4gaW5kZXggYWJkNzQ2YWVmODY4Li41YzVkMjY0MmE0NzQg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9paW8vYWRjL2FkNzM4MC5jCj4gKysrIGIvZHJpdmVycy9p
aW8vYWRjL2FkNzM4MC5jCj4gQEAgLTEzMyw2ICsxMzMsNyBAQCBzdHJ1Y3QgYWQ3MzgwX3N0YXRl
IHsKPiDCoAlzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpOwo+IMKgCXN0cnVjdCByZWd1bGF0b3IgKnZy
ZWY7Cj4gwqAJc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+ICsJc3RydWN0IHNwaV9tZXNzYWdlICpt
c2c7Cj4gwqAJLyoKPiDCoAkgKiBETUEgKHRodXMgY2FjaGUgY29oZXJlbmN5IG1haW50ZW5hbmNl
KSByZXF1aXJlcyB0aGUKPiDCoAkgKiB0cmFuc2ZlciBidWZmZXJzIHRvIGxpdmUgaW4gdGhlaXIg
b3duIGNhY2hlIGxpbmVzLgo+IEBAIC0yMzEsMTkgKzIzMiw1NSBAQCBzdGF0aWMgaW50IGFkNzM4
MF9kZWJ1Z2ZzX3JlZ19hY2Nlc3Moc3RydWN0IGlpb19kZXYKPiAqaW5kaW9fZGV2LCB1MzIgcmVn
LAo+IMKgCXJldHVybiByZXQ7Cj4gwqB9Cj4gwqAKPiArc3RhdGljIGludCBhZDczODBfYnVmZmVy
X3ByZWVuYWJsZShzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2KQo+ICt7Cj4gKwlzdHJ1Y3QgYWQ3
MzgwX3N0YXRlICpzdCA9IGlpb19wcml2KGluZGlvX2Rldik7Cj4gKwlzdHJ1Y3Qgc3BpX3RyYW5z
ZmVyICp4ZmVyOwo+ICsJaW50IHJldDsKPiArCj4gKwlzdC0+bXNnID0gc3BpX21lc3NhZ2VfYWxs
b2MoMSwgR0ZQX0tFUk5FTCk7Cj4gKwlpZiAoIXN0LT5tc2cpCj4gKwkJcmV0dXJuIC1FTk9NRU07
Cj4gKwo+ICsJeGZlciA9IGxpc3RfZmlyc3RfZW50cnkoJnN0LT5tc2ctPnRyYW5zZmVycywgc3Ry
dWN0IHNwaV90cmFuc2ZlciwKPiArCQkJCXRyYW5zZmVyX2xpc3QpOwo+ICsKPiArCXhmZXItPmJp
dHNfcGVyX3dvcmQgPSBzdC0+Y2hpcF9pbmZvLT5jaGFubmVsc1swXS5zY2FuX3R5cGUucmVhbGJp
dHM7Cj4gKwl4ZmVyLT5sZW4gPSA0Owo+ICsJeGZlci0+cnhfYnVmID0gc3QtPnNjYW5fZGF0YS5y
YXc7Cj4gKwo+ICsJcmV0ID0gc3BpX29wdGltaXplX21lc3NhZ2Uoc3QtPnNwaSwgc3QtPm1zZyk7
Cj4gKwlpZiAocmV0KSB7Cj4gKwkJc3BpX21lc3NhZ2VfZnJlZShzdC0+bXNnKTsKPiArCQlyZXR1
cm4gcmV0Owo+ICsJfQo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IGFk
NzM4MF9idWZmZXJfcG9zdGRpc2FibGUoc3RydWN0IGlpb19kZXYgKmluZGlvX2RldikKPiArewo+
ICsJc3RydWN0IGFkNzM4MF9zdGF0ZSAqc3QgPSBpaW9fcHJpdihpbmRpb19kZXYpOwo+ICsKPiAr
CXNwaV91bm9wdGltaXplX21lc3NhZ2Uoc3QtPm1zZyk7Cj4gKwlzcGlfbWVzc2FnZV9mcmVlKHN0
LT5tc2cpOwo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwoKTm90IHN1Y2ggYSBiaWcgZGVhbCBi
dXQgdW5sZXNzIEknbSBtaXNzaW5nIHNvbWV0aGluZyB3ZSBjb3VsZCBoYXZlIHRoZQpzcGlfbWVz
c2FnZSAoKyB0aGUgdHJhbnNmZXIpIHN0YXRpY2FsbHkgYWxsb2NhdGVkIGluIHN0cnVjdCBhZDcz
ODBfc3RhdGUgYW5kIGRvCnRoZSBvcHRpbWl6ZSBvbmx5IG9uY2UgYXQgcHJvYmUgKG5hdHVyYWxs
eSB3aXRoIHByb3BlciBkZXZtIGFjdGlvbiBmb3IKdW5vcHRpbWl6ZSkuIFRoZW4gd2Ugd291bGQg
bm90IG5lZWQgdG8gdGhpcyBmb3IgZXZlcnkgYnVmZmVyIGVuYWJsZSArIGRpc2FibGUuIEkKa25v
dyBpbiB0ZXJtcyBvZiBwZXJmb3JtYW5jZSBpdCB3b24ndCBtYXR0ZXIgYnV0IGl0IHdvdWxkIGJl
IGxlc3MgY29kZSBJIGd1ZXNzLgoKQW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KCi0gTnVubyBTw6EK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
