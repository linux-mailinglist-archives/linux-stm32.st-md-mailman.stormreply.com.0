Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B716853497
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 16:28:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C245C6DD69;
	Tue, 13 Feb 2024 15:28:12 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 635D9C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 15:28:10 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2d0f1ec376bso30676281fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 07:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707838089; x=1708442889;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ygk6/cDOkwUw/NJeAB8ipuDaGxiTdarNFVMbQnymP4=;
 b=RB0cG65MnuBxVybqWKUwS1ZN4ey1vHyjgjnAJ6ZCBoBo9qjb8vzEuhoNBMHmmC38eT
 252DACn0Q3R3Q4ewUcqEX1ZRj4/2qG+uITj3A9S7Xet+Cc/CAuXM4QHciw4MR8qQZod3
 ugHlGYnUddtjgE7FSv+TUg0wMsVO5WKGgw9/sCpSCtMXGET76knBW4pOvjOUBWC99R86
 576/vybu2srOtAefVxKuAbHgJgRpYTijymUZQzMqybjHn4oSBOJPQBBNnseHFNg+XsQV
 mTl7oFl2pRMiLmcqlWPUCV3OCyVOcEVoeR/lxUIlklRlv4YQimfN3nm0hopuMGxSlquR
 mZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707838089; x=1708442889;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ygk6/cDOkwUw/NJeAB8ipuDaGxiTdarNFVMbQnymP4=;
 b=BsmWEZ2NrJ8ftU+DS8Zf+FBrOaPopTcP5yOMC5k1EVlfEkO6bnpOMg7/dfn3CPqlVG
 YE60EqCxmP1Lwkiw4z6BvcxZiPs7r4cDN6p/5rl4pnXfUfgiwIOHimWocs85e2CzVQFF
 zyFLL1Fw/E4O2XyAsNxeaKxZgWHqmeLscAmeShZrmGJ9u4570xGEiR0I7U4hHBbk8iTQ
 eWlvS9Sdtm3VXVjiDvUSo/6VRALVFIc13Uv9vsosQ8s4GnRc0VG3nGsYyGj0KKzzflB5
 1AAQNuQkmIbHq6jEY1dj9CNXO/MXS+7Vd3AscbYlgGijVKap4lnnQ9/k421NjALKWi17
 wgCQ==
X-Gm-Message-State: AOJu0YwRkhS0HZw00AfmJH/mXcJIBA7WQZza8BMcvxOMHGohE/OSkHP2
 +Dxq1zcOBsYbuA4wDxg+y8I9rwYuUIW98RauIr5f+QCTc9s3OyxUmf8tpvEckhbcTqJDEifub4O
 RAt5tgaiZje5Y7sqn/TGvtSYNzDBNZic9m0IA/w==
X-Google-Smtp-Source: AGHT+IG01ij/IVy0hSByNzSy26iGI4SuB13+tw+QvBXX+3JkeX51jqeUndyf9KdenM1FhyxlUzQas9cWZ1padoUdZB8=
X-Received: by 2002:a2e:8755:0:b0:2d0:a6ef:651d with SMTP id
 q21-20020a2e8755000000b002d0a6ef651dmr6311505ljj.47.1707838089550; Tue, 13
 Feb 2024 07:28:09 -0800 (PST)
MIME-Version: 1.0
References: <20240212-mainline-spi-precook-message-v1-0-a2373cd72d36@baylibre.com>
 <20240212-mainline-spi-precook-message-v1-5-a2373cd72d36@baylibre.com>
 <c06dfa1ecf88b07ef467ad7c08667d0cab400613.camel@gmail.com>
In-Reply-To: <c06dfa1ecf88b07ef467ad7c08667d0cab400613.camel@gmail.com>
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 13 Feb 2024 09:27:58 -0600
Message-ID: <CAMknhBEU=iMzpE_P0KePL4cZZktBOGHRXaEox5a7XcVjXDT+Dg@mail.gmail.com>
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Cc: linux-kernel@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
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

T24gVHVlLCBGZWIgMTMsIDIwMjQgYXQgMzo0N+KAr0FNIE51bm8gU8OhIDxub25hbWUubnVub0Bn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCAyMDI0LTAyLTEyIGF0IDE3OjI2IC0wNjAwLCBE
YXZpZCBMZWNobmVyIHdyb3RlOgo+ID4gVGhpcyBtb2RpZmllcyB0aGUgYWQ3MzgwIEFEQyBkcml2
ZXIgdG8gdXNlIHNwaV9vcHRpbWl6ZV9tZXNzYWdlKCkgdG8KPiA+IG9wdGltaXplIHRoZSBTUEkg
bWVzc2FnZSBmb3IgdGhlIGJ1ZmZlcmVkIHJlYWQgb3BlcmF0aW9uLiBTaW5jZSBidWZmZXJlZAo+
ID4gcmVhZHMgcmV1c2UgdGhlIHNhbWUgU1BJIG1lc3NhZ2UgZm9yIGVhY2ggcmVhZCwgdGhpcyBj
YW4gaW1wcm92ZQo+ID4gcGVyZm9ybWFuY2UgYnkgcmVkdWNpbmcgdGhlIG92ZXJoZWFkIG9mIHNl
dHRpbmcgdXAgc29tZSBwYXJ0cyB0aGUgU1BJCj4gPiBtZXNzYWdlIGluIGVhY2ggc3BpX3N5bmMo
KSBjYWxsLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhdmlkIExlY2huZXIgPGRsZWNobmVyQGJh
eWxpYnJlLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvaWlvL2FkYy9hZDczODAuYyB8IDUyICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCj4gPiAtCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9hZDczODAuYyBiL2RyaXZlcnMvaWlvL2FkYy9h
ZDczODAuYwo+ID4gaW5kZXggYWJkNzQ2YWVmODY4Li41YzVkMjY0MmE0NzQgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2lpby9hZGMvYWQ3MzgwLmMKPiA+ICsrKyBiL2RyaXZlcnMvaWlvL2FkYy9h
ZDczODAuYwo+ID4gQEAgLTEzMyw2ICsxMzMsNyBAQCBzdHJ1Y3QgYWQ3MzgwX3N0YXRlIHsKPiA+
ICAgICAgIHN0cnVjdCBzcGlfZGV2aWNlICpzcGk7Cj4gPiAgICAgICBzdHJ1Y3QgcmVndWxhdG9y
ICp2cmVmOwo+ID4gICAgICAgc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+ID4gKyAgICAgc3RydWN0
IHNwaV9tZXNzYWdlICptc2c7Cj4gPiAgICAgICAvKgo+ID4gICAgICAgICogRE1BICh0aHVzIGNh
Y2hlIGNvaGVyZW5jeSBtYWludGVuYW5jZSkgcmVxdWlyZXMgdGhlCj4gPiAgICAgICAgKiB0cmFu
c2ZlciBidWZmZXJzIHRvIGxpdmUgaW4gdGhlaXIgb3duIGNhY2hlIGxpbmVzLgo+ID4gQEAgLTIz
MSwxOSArMjMyLDU1IEBAIHN0YXRpYyBpbnQgYWQ3MzgwX2RlYnVnZnNfcmVnX2FjY2VzcyhzdHJ1
Y3QgaWlvX2Rldgo+ID4gKmluZGlvX2RldiwgdTMyIHJlZywKPiA+ICAgICAgIHJldHVybiByZXQ7
Cj4gPiAgfQo+ID4KPiA+ICtzdGF0aWMgaW50IGFkNzM4MF9idWZmZXJfcHJlZW5hYmxlKHN0cnVj
dCBpaW9fZGV2ICppbmRpb19kZXYpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IGFkNzM4MF9zdGF0
ZSAqc3QgPSBpaW9fcHJpdihpbmRpb19kZXYpOwo+ID4gKyAgICAgc3RydWN0IHNwaV90cmFuc2Zl
ciAqeGZlcjsKPiA+ICsgICAgIGludCByZXQ7Cj4gPiArCj4gPiArICAgICBzdC0+bXNnID0gc3Bp
X21lc3NhZ2VfYWxsb2MoMSwgR0ZQX0tFUk5FTCk7Cj4gPiArICAgICBpZiAoIXN0LT5tc2cpCj4g
PiArICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4gKwo+ID4gKyAgICAgeGZlciA9IGxp
c3RfZmlyc3RfZW50cnkoJnN0LT5tc2ctPnRyYW5zZmVycywgc3RydWN0IHNwaV90cmFuc2ZlciwK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRyYW5zZmVyX2xpc3QpOwo+ID4gKwo+
ID4gKyAgICAgeGZlci0+Yml0c19wZXJfd29yZCA9IHN0LT5jaGlwX2luZm8tPmNoYW5uZWxzWzBd
LnNjYW5fdHlwZS5yZWFsYml0czsKPiA+ICsgICAgIHhmZXItPmxlbiA9IDQ7Cj4gPiArICAgICB4
ZmVyLT5yeF9idWYgPSBzdC0+c2Nhbl9kYXRhLnJhdzsKPiA+ICsKPiA+ICsgICAgIHJldCA9IHNw
aV9vcHRpbWl6ZV9tZXNzYWdlKHN0LT5zcGksIHN0LT5tc2cpOwo+ID4gKyAgICAgaWYgKHJldCkg
ewo+ID4gKyAgICAgICAgICAgICBzcGlfbWVzc2FnZV9mcmVlKHN0LT5tc2cpOwo+ID4gKyAgICAg
ICAgICAgICByZXR1cm4gcmV0Owo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIDA7
Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgYWQ3MzgwX2J1ZmZlcl9wb3N0ZGlzYWJsZShz
dHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2KQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBhZDczODBf
c3RhdGUgKnN0ID0gaWlvX3ByaXYoaW5kaW9fZGV2KTsKPiA+ICsKPiA+ICsgICAgIHNwaV91bm9w
dGltaXplX21lc3NhZ2Uoc3QtPm1zZyk7Cj4gPiArICAgICBzcGlfbWVzc2FnZV9mcmVlKHN0LT5t
c2cpOwo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiArfQo+ID4gKwo+Cj4gTm90IHN1Y2gg
YSBiaWcgZGVhbCBidXQgdW5sZXNzIEknbSBtaXNzaW5nIHNvbWV0aGluZyB3ZSBjb3VsZCBoYXZl
IHRoZQo+IHNwaV9tZXNzYWdlICgrIHRoZSB0cmFuc2Zlcikgc3RhdGljYWxseSBhbGxvY2F0ZWQg
aW4gc3RydWN0IGFkNzM4MF9zdGF0ZSBhbmQgZG8KPiB0aGUgb3B0aW1pemUgb25seSBvbmNlIGF0
IHByb2JlIChuYXR1cmFsbHkgd2l0aCBwcm9wZXIgZGV2bSBhY3Rpb24gZm9yCj4gdW5vcHRpbWl6
ZSkuIFRoZW4gd2Ugd291bGQgbm90IG5lZWQgdG8gdGhpcyBmb3IgZXZlcnkgYnVmZmVyIGVuYWJs
ZSArIGRpc2FibGUuIEkKPiBrbm93IGluIHRlcm1zIG9mIHBlcmZvcm1hbmNlIGl0IHdvbid0IG1h
dHRlciBidXQgaXQgd291bGQgYmUgbGVzcyBjb2RlIEkgZ3Vlc3MuCj4KPiBBbSBJIG1pc3Npbmcg
c29tZXRoaW5nPwoKTm8sIHlvdXIgdW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0IGZvciB0aGUgY3Vy
cmVudCBzdGF0ZSBvZiBldmVyeXRoaW5nCmluIHRoaXMgc2VyaWVzLiBTbywgd2UgY291bGQgZG8g
YXMgeW91IHN1Z2dlc3QsIGJ1dCBJIGhhdmUgYSBmZWVsaW5nCnRoYXQgZnV0dXJlIGFkZGl0aW9u
cyB0byB0aGlzIGRyaXZlciBtaWdodCByZXF1aXJlIHRoYXQgaXQgZ2V0cwpjaGFuZ2VkIGJhY2sg
dGhpcyB3YXkgZXZlbnR1YWxseS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
