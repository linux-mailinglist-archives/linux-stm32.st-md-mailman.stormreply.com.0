Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 679E485358C
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 17:05:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19E2BC6C83D;
	Tue, 13 Feb 2024 16:05:03 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0884FC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 16:05:01 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a3cb228b90bso228537566b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 08:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707840301; x=1708445101;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rM3rrsxmVIGD8Xdy2RSGGo3eRi8719tCkmvzDLLsESI=;
 b=hleZ3wCeLEPGh+eyWch/qC/2QLPRF30P7GrYSJXUREiDGCsNqD9ArDDcFzg687a4YZ
 tY+GArK/l5RiO3bqPm1hrz6DRTkJR1nqAZuRE3TKFflXMsT2nlvLPdWTRzMHogufd55B
 TNgBonLpbFrppUZZHu94Ih1viY6ChHQoIRN09aG/94xEJiBThoV6bCVnMhFOs5fI9KPF
 wc/Ij9OfmzqcvIWZoxKwOoWW1w10uezsKIAyn9o5QgxlBf5Tx1VvQLcFLemNjH4+UXuX
 tIe6/CaPd6wWZ2fKU36zyhuiLTyuHb6vEA8rvRNZLP1IESLyjok70BtR+ZQtSa2FftrS
 HPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707840301; x=1708445101;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rM3rrsxmVIGD8Xdy2RSGGo3eRi8719tCkmvzDLLsESI=;
 b=gnHPSVmNCWepiHaW3U0gt8C/CZsh4XUSWAXOlGwsam7FZoT2CMwwDjmXY6vXBctCDE
 n6RN68J9H497inR6YcqZ6ouyzStDK/xjvehvtHxtRmp86g1npgYmSdfGJzXWC5i4UQMO
 bz+y0/kQGneHzAHvO3E2IA5A4gvasEUMbFZKnDkT3xKTQE60BdqtISwdRkFK8CJfAWTU
 Wlp4jpWGT/o9sQmIdU7LsqDFALGE8bT5GRXW08gs8H1xLlLt26GizBoqzRkqJi+9Fkpg
 ctC+FS40HEhcnTWZbfIDisgDLLZHLY5Fd46sgDb3maYyzprDERNv8LPiE+sgyejmVsDv
 NY5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV70nQkYPAc/pE5xrOmaFLt4LrcoqvcyE50Mb/ybkVPxxRbb226+oC4gKEIMlcqXC3LToCif1GXeywMNFzQF0QQiuTmmNr0B3svXzMwsYrtQuKn5JqU2aL
X-Gm-Message-State: AOJu0YyVIilfJDL1ZupmL7RUgn20gIGl+6xWOXnZUq1OD4fGmwDVbxar
 bti1RJqNTk5K1/8ZY0fByR5EvQZ9OM/6swEwiQgVzlJhOHS3yCof
X-Google-Smtp-Source: AGHT+IF0X1AhH4lpy6+KVf4MfxbDEkJ0MKQzmIDYPCoJ0rkSRG8av0+qslITqO7b5iBHSxehOS9+Lg==
X-Received: by 2002:a17:906:80b:b0:a3c:771:a97a with SMTP id
 e11-20020a170906080b00b00a3c0771a97amr7821530ejd.73.1707840301135; 
 Tue, 13 Feb 2024 08:05:01 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUtLWfPHGLeQOMOCOpurgmOWvVQm0yGHwp2Gp+OpYptWmZush47c4TmCLi5f3fjS7IMNTsyCLXIyD0n9yv8oaWKCMUgXq6MC5CFdl1gPwHyZl7hzAuQG+zUKzQ+yq0jaT4a/012vwpBVcQZq8Z3zGDax35nhIXppxJQv9ed19HY1EdiTr1k0GQCOpxvsAqf1rSoffKNhTXO3VD5NnqAb3ebLPR55bOoYDICJwPMhap9drcriuLaRbX3VqYyZmVIIfLJHX3gmYAmhRWo5pDx5OU7GjCWlAF1+cpgW4Ae25p1arZ7fvXBmr2KFAyp4x+QZkfcxbFWGp8UdM3FexW4FQrhak67rFjsOlfXgJRcXydt6S4b9+0frLP4FptO2Kt40lsHcnnZhVq65PgPmyd+Lsjr6xLkmMZFux5ZH6I53JF0c8fm16Px/d/j9OUDoAqfkWhUrwREwWBEl44ZK+fi+OOKR6PRKs1Z1Dr1WfwZGwRXS8mRWN5LNcvv2QoCTn/galthSzaHJzSkvf0g32eKFSHaz/Ro4wI=
Received: from ?IPv6:2003:f6:ef1b:2000:944c:cbc7:1e1c:2c47?
 (p200300f6ef1b2000944ccbc71e1c2c47.dip0.t-ipconnect.de.
 [2003:f6:ef1b:2000:944c:cbc7:1e1c:2c47])
 by smtp.gmail.com with ESMTPSA id
 ps8-20020a170906bf4800b00a3ca744438csm1407182ejb.213.2024.02.13.08.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 08:05:00 -0800 (PST)
Message-ID: <e03968102b92b3711808eb532685bc9e05fc3c8d.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: David Lechner <dlechner@baylibre.com>
Date: Tue, 13 Feb 2024 17:08:19 +0100
In-Reply-To: <CAMknhBEU=iMzpE_P0KePL4cZZktBOGHRXaEox5a7XcVjXDT+Dg@mail.gmail.com>
References: <20240212-mainline-spi-precook-message-v1-0-a2373cd72d36@baylibre.com>
 <20240212-mainline-spi-precook-message-v1-5-a2373cd72d36@baylibre.com>
 <c06dfa1ecf88b07ef467ad7c08667d0cab400613.camel@gmail.com>
 <CAMknhBEU=iMzpE_P0KePL4cZZktBOGHRXaEox5a7XcVjXDT+Dg@mail.gmail.com>
User-Agent: Evolution 3.50.3 
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
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

T24gVHVlLCAyMDI0LTAyLTEzIGF0IDA5OjI3IC0wNjAwLCBEYXZpZCBMZWNobmVyIHdyb3RlOgo+
IE9uIFR1ZSwgRmViIDEzLCAyMDI0IGF0IDM6NDfigK9BTSBOdW5vIFPDoSA8bm9uYW1lLm51bm9A
Z21haWwuY29tPiB3cm90ZToKPiA+IAo+ID4gT24gTW9uLCAyMDI0LTAyLTEyIGF0IDE3OjI2IC0w
NjAwLCBEYXZpZCBMZWNobmVyIHdyb3RlOgo+ID4gPiBUaGlzIG1vZGlmaWVzIHRoZSBhZDczODAg
QURDIGRyaXZlciB0byB1c2Ugc3BpX29wdGltaXplX21lc3NhZ2UoKSB0bwo+ID4gPiBvcHRpbWl6
ZSB0aGUgU1BJIG1lc3NhZ2UgZm9yIHRoZSBidWZmZXJlZCByZWFkIG9wZXJhdGlvbi4gU2luY2Ug
YnVmZmVyZWQKPiA+ID4gcmVhZHMgcmV1c2UgdGhlIHNhbWUgU1BJIG1lc3NhZ2UgZm9yIGVhY2gg
cmVhZCwgdGhpcyBjYW4gaW1wcm92ZQo+ID4gPiBwZXJmb3JtYW5jZSBieSByZWR1Y2luZyB0aGUg
b3ZlcmhlYWQgb2Ygc2V0dGluZyB1cCBzb21lIHBhcnRzIHRoZSBTUEkKPiA+ID4gbWVzc2FnZSBp
biBlYWNoIHNwaV9zeW5jKCkgY2FsbC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IERhdmlk
IExlY2huZXIgPGRsZWNobmVyQGJheWxpYnJlLmNvbT4KPiA+ID4gLS0tCj4gPiA+IMKgZHJpdmVy
cy9paW8vYWRjL2FkNzM4MC5jIHwgNTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLQo+ID4gPiAtLS0tCj4gPiA+IC0KPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNDUg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2lpby9hZGMvYWQ3MzgwLmMgYi9kcml2ZXJzL2lpby9hZGMvYWQ3MzgwLmMKPiA+ID4g
aW5kZXggYWJkNzQ2YWVmODY4Li41YzVkMjY0MmE0NzQgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZl
cnMvaWlvL2FkYy9hZDczODAuYwo+ID4gPiArKysgYi9kcml2ZXJzL2lpby9hZGMvYWQ3MzgwLmMK
PiA+ID4gQEAgLTEzMyw2ICsxMzMsNyBAQCBzdHJ1Y3QgYWQ3MzgwX3N0YXRlIHsKPiA+ID4gwqDC
oMKgwqDCoCBzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpOwo+ID4gPiDCoMKgwqDCoMKgIHN0cnVjdCBy
ZWd1bGF0b3IgKnZyZWY7Cj4gPiA+IMKgwqDCoMKgwqAgc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+
ID4gPiArwqDCoMKgwqAgc3RydWN0IHNwaV9tZXNzYWdlICptc2c7Cj4gPiA+IMKgwqDCoMKgwqAg
LyoKPiA+ID4gwqDCoMKgwqDCoMKgICogRE1BICh0aHVzIGNhY2hlIGNvaGVyZW5jeSBtYWludGVu
YW5jZSkgcmVxdWlyZXMgdGhlCj4gPiA+IMKgwqDCoMKgwqDCoCAqIHRyYW5zZmVyIGJ1ZmZlcnMg
dG8gbGl2ZSBpbiB0aGVpciBvd24gY2FjaGUgbGluZXMuCj4gPiA+IEBAIC0yMzEsMTkgKzIzMiw1
NSBAQCBzdGF0aWMgaW50IGFkNzM4MF9kZWJ1Z2ZzX3JlZ19hY2Nlc3Moc3RydWN0IGlpb19kZXYK
PiA+ID4gKmluZGlvX2RldiwgdTMyIHJlZywKPiA+ID4gwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+
ID4gPiDCoH0KPiA+ID4gCj4gPiA+ICtzdGF0aWMgaW50IGFkNzM4MF9idWZmZXJfcHJlZW5hYmxl
KHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYpCj4gPiA+ICt7Cj4gPiA+ICvCoMKgwqDCoCBzdHJ1
Y3QgYWQ3MzgwX3N0YXRlICpzdCA9IGlpb19wcml2KGluZGlvX2Rldik7Cj4gPiA+ICvCoMKgwqDC
oCBzdHJ1Y3Qgc3BpX3RyYW5zZmVyICp4ZmVyOwo+ID4gPiArwqDCoMKgwqAgaW50IHJldDsKPiA+
ID4gKwo+ID4gPiArwqDCoMKgwqAgc3QtPm1zZyA9IHNwaV9tZXNzYWdlX2FsbG9jKDEsIEdGUF9L
RVJORUwpOwo+ID4gPiArwqDCoMKgwqAgaWYgKCFzdC0+bXNnKQo+ID4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+ID4gPiArCj4gPiA+ICvCoMKgwqDCoCB4ZmVy
ID0gbGlzdF9maXJzdF9lbnRyeSgmc3QtPm1zZy0+dHJhbnNmZXJzLCBzdHJ1Y3Qgc3BpX3RyYW5z
ZmVyLAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgdHJhbnNmZXJfbGlzdCk7Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgIHhmZXIt
PmJpdHNfcGVyX3dvcmQgPSBzdC0+Y2hpcF9pbmZvLT5jaGFubmVsc1swXS5zY2FuX3R5cGUucmVh
bGJpdHM7Cj4gPiA+ICvCoMKgwqDCoCB4ZmVyLT5sZW4gPSA0Owo+ID4gPiArwqDCoMKgwqAgeGZl
ci0+cnhfYnVmID0gc3QtPnNjYW5fZGF0YS5yYXc7Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgIHJl
dCA9IHNwaV9vcHRpbWl6ZV9tZXNzYWdlKHN0LT5zcGksIHN0LT5tc2cpOwo+ID4gPiArwqDCoMKg
wqAgaWYgKHJldCkgewo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNwaV9tZXNzYWdl
X2ZyZWUoc3QtPm1zZyk7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJl
dDsKPiA+ID4gK8KgwqDCoMKgIH0KPiA+ID4gKwo+ID4gPiArwqDCoMKgwqAgcmV0dXJuIDA7Cj4g
PiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBpbnQgYWQ3MzgwX2J1ZmZlcl9wb3N0ZGlzYWJs
ZShzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2KQo+ID4gPiArewo+ID4gPiArwqDCoMKgwqAgc3Ry
dWN0IGFkNzM4MF9zdGF0ZSAqc3QgPSBpaW9fcHJpdihpbmRpb19kZXYpOwo+ID4gPiArCj4gPiA+
ICvCoMKgwqDCoCBzcGlfdW5vcHRpbWl6ZV9tZXNzYWdlKHN0LT5tc2cpOwo+ID4gPiArwqDCoMKg
wqAgc3BpX21lc3NhZ2VfZnJlZShzdC0+bXNnKTsKPiA+ID4gKwo+ID4gPiArwqDCoMKgwqAgcmV0
dXJuIDA7Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+IAo+ID4gTm90IHN1Y2ggYSBiaWcgZGVhbCBidXQg
dW5sZXNzIEknbSBtaXNzaW5nIHNvbWV0aGluZyB3ZSBjb3VsZCBoYXZlIHRoZQo+ID4gc3BpX21l
c3NhZ2UgKCsgdGhlIHRyYW5zZmVyKSBzdGF0aWNhbGx5IGFsbG9jYXRlZCBpbiBzdHJ1Y3QgYWQ3
MzgwX3N0YXRlIGFuZAo+ID4gZG8KPiA+IHRoZSBvcHRpbWl6ZSBvbmx5IG9uY2UgYXQgcHJvYmUg
KG5hdHVyYWxseSB3aXRoIHByb3BlciBkZXZtIGFjdGlvbiBmb3IKPiA+IHVub3B0aW1pemUpLiBU
aGVuIHdlIHdvdWxkIG5vdCBuZWVkIHRvIHRoaXMgZm9yIGV2ZXJ5IGJ1ZmZlciBlbmFibGUgKwo+
ID4gZGlzYWJsZS4gSQo+ID4ga25vdyBpbiB0ZXJtcyBvZiBwZXJmb3JtYW5jZSBpdCB3b24ndCBt
YXR0ZXIgYnV0IGl0IHdvdWxkIGJlIGxlc3MgY29kZSBJCj4gPiBndWVzcy4KPiA+IAo+ID4gQW0g
SSBtaXNzaW5nIHNvbWV0aGluZz8KPiAKPiBObywgeW91ciB1bmRlcnN0YW5kaW5nIGlzIGNvcnJl
Y3QgZm9yIHRoZSBjdXJyZW50IHN0YXRlIG9mIGV2ZXJ5dGhpbmcKPiBpbiB0aGlzIHNlcmllcy4g
U28sIHdlIGNvdWxkIGRvIGFzIHlvdSBzdWdnZXN0LCBidXQgSSBoYXZlIGEgZmVlbGluZwo+IHRo
YXQgZnV0dXJlIGFkZGl0aW9ucyB0byB0aGlzIGRyaXZlciBtaWdodCByZXF1aXJlIHRoYXQgaXQg
Z2V0cwo+IGNoYW5nZWQgYmFjayB0aGlzIHdheSBldmVudHVhbGx5LgoKSG1tLCBub3QgcmVhbGx5
IHN1cmUgYWJvdXQgdGhhdCBhcyBjaGlwX2luZm8gc3R1ZmYgaXMgYWx3YXlzIG91ciBmcmllbmQg
OikuIEFuZApJJ20gYW55d2F5cyBvZiB0aGUgb3BpbmlvbiBvZiBrZWVwaW5nIHRoaW5ncyBzaW1w
bGVyIGFuZCBzdGFydCB0byBldm9sdmUgd2hlbgpyZWFsbHkgbmVlZGVkIChiZWNhdXNlIG9mdGVu
IHdlIG5ldmVyIHJlYWxseSBuZWVkIHRvIGV2b2x2ZSkuIEJ1dCBiYWgsIGFzIEkKc2FpZC4uLiB0
aGlzIGlzIHJlYWxseSBub3QgYSBiaWcgZGVhbC4KCi0gTnVubyBTw6EKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
