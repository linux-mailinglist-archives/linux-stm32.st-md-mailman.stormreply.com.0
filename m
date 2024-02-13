Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E31853AE1
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 20:26:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D88BC6DD69;
	Tue, 13 Feb 2024 19:26:16 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B292FC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 19:26:14 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2d0f1ec376bso33843851fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 11:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707852374; x=1708457174;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NeIn4TTu9vCR66Yqi85vfwq7rwhNbFFNwfgKW6lLC1s=;
 b=RlVorZkHqCR4vmT5uH1CuwmwbWaLJUwD5ShQ0o4wjH0njCacGa4nwtt6QzRvoW2RCH
 xaMdLCnLExZb6djHrSH/8WpVvEfdD2PxAR+tNjpyzmaaXo0eeJW30dq6h4W62IAFOxyb
 CwqNnE6EM02PY/U7BX5NAXMxSMSzLNDvE/DXJoTolnaOZ94nOPY6AEsxC4FwN388vGTk
 kgrnxBeR6vpJkSO3B9dUpX2vUphE7vy/Uu+6Cgn6P5rYmLtNYPNlkgMDfjiHahSC8Fit
 LC5CuMzyqRMuGDL2GVUiJDVkCEebTparIEG6wZmr/pHwhCE+3QpE3xek4w0e5fHbafdF
 eTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707852374; x=1708457174;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NeIn4TTu9vCR66Yqi85vfwq7rwhNbFFNwfgKW6lLC1s=;
 b=cjVF4kOncMdyvPOXEIRDejvgQyZD7RVD7x8duv3vfLlFI7/IybAapXfC000W9QpkMF
 JMtTaETucqB7WK0E0y0CFLxfVaSKGIhwNlTzcd/PbUs5yq982vcfmMGIdfm16mbkeRgd
 Kx7pcvidXzf8BLdLVlycuRQwI3vTR6Q2ebK3y097mZu8jvsx7+QsJvJE8Jbgm2TzHRQv
 aCfkUBn61/llwPtBIrovXEevDrYvZyWNLEa2vvuu0+l8TPTEO56bNF5OmVyVZs66w88H
 hSoj8W4nENG9HQkWCDAwcOUEgMPk/r9ZgrZXFya8RgwTGlA9EDAHiw3kyS8mCfaKV9qk
 8ZXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdv0oLk1RzgUa0yLoaxWrW15mjep815I3UD+MfzVHuFj4EsOkHfiURrFlTVpt7fR8mTamLika5Od5FK+3fDjQg56iY5VENkYfZ9BUu0CIKXgQ4tEVvVP6i
X-Gm-Message-State: AOJu0YwbJHcCOoL0p5dvfmiI5NKnPFrKoyCxZi1BmDrcnbnTqomjsn7N
 fuPjsMe9mK21OuTDIFSX8Kob5Xs+CTQCXonUBgZK7V3RYyQ90dQbXQ2bxbNT4RsbIMLFvpv0Qt1
 hBoUt9mwT7QEAgIm6Z25kpiR65dxb8seuIzeteA==
X-Google-Smtp-Source: AGHT+IE+m+Xi/dgb97e63/2F5Xl8+lxhih+9in0RcqGziZ5Ue+ulbC6JY4e+xfOXYEfnyTe7a0nKHshr37VCCQ3ysW4=
X-Received: by 2002:a2e:88cf:0:b0:2d0:cfe6:4364 with SMTP id
 a15-20020a2e88cf000000b002d0cfe64364mr500467ljk.36.1707852373843; Tue, 13 Feb
 2024 11:26:13 -0800 (PST)
MIME-Version: 1.0
References: <20240212-mainline-spi-precook-message-v1-0-a2373cd72d36@baylibre.com>
 <20240212-mainline-spi-precook-message-v1-1-a2373cd72d36@baylibre.com>
 <54623b74-872a-41dc-992f-71a586d145ec@sirena.org.uk>
In-Reply-To: <54623b74-872a-41dc-992f-71a586d145ec@sirena.org.uk>
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 13 Feb 2024 13:26:02 -0600
Message-ID: <CAMknhBGt0EyA_FcpXbmT-PStZqmZ_PUENHbVfgDFOwWcv5gTAw@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Jander <david@protonic.nl>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Sperl <kernel@martin.sperl.org>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 1/5] spi: add spi_optimize_message() APIs
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

T24gVHVlLCBGZWIgMTMsIDIwMjQgYXQgMTI6NTXigK9QTSBNYXJrIEJyb3duIDxicm9vbmllQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBGZWIgMTIsIDIwMjQgYXQgMDU6MjY6NDFQTSAt
MDYwMCwgRGF2aWQgTGVjaG5lciB3cm90ZToKPgo+ID4gK3N0YXRpYyBpbnQgX19zcGlfb3B0aW1p
emVfbWVzc2FnZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpLAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3Qgc3BpX21lc3NhZ2UgKm1zZywKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYm9vbCBwcmVfb3B0aW1pemVkKQo+ID4gK3sKPiA+ICsgICAgIHN0
cnVjdCBzcGlfY29udHJvbGxlciAqY3RsciA9IHNwaS0+Y29udHJvbGxlcjsKPiA+ICsgICAgIGlu
dCByZXQ7Cj4gPiArCj4gPiArICAgICByZXQgPSBfX3NwaV92YWxpZGF0ZShzcGksIG1zZyk7Cj4g
PiArICAgICBpZiAocmV0KQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKwo+ID4g
KyAgICAgaWYgKGN0bHItPm9wdGltaXplX21lc3NhZ2UpIHsKPiA+ICsgICAgICAgICAgICAgcmV0
ID0gY3Rsci0+b3B0aW1pemVfbWVzc2FnZShtc2cpOwo+ID4gKyAgICAgICAgICAgICBpZiAocmV0
KQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiArICAgICB9Cj4gPiAr
Cj4gPiArICAgICBtc2ctPnByZV9vcHRpbWl6ZWQgPSBwcmVfb3B0aW1pemVkOwo+Cj4gSXQgd291
bGQgcHJvYmFibHkgYmUgY2xlYXJlciB0byBuYW1lIHRoZSBwYXJhbWV0ZXIgcHJlX29wdGltaXNp
bmcgcmF0aGVyCj4gdGhhbiBwcmVfb3B0aW1pemVkLCBhcyBpdCBpcyB0aGUgbG9naWMgaXMgYSBi
aXQgY29uZnVzaW5nLiAgRWl0aGVyIHRoYXQKPiBvciBzb21lIGNvbW1lbnRzLiAgQSBzaW1pbGFy
IGlzc3VlIGFwcGxpZXMgb24gdGhlIGNsZWFudXAgcGF0aC4KClBlciBKb25hdGhhbidzIHN1Z2dl
c3Rpb24sIEkgcGxhbiB0byByZW1vdmUgdGhlIHBhcmFtZXRlciBmcm9tIHRoaXMKZnVuY3Rpb24g
YW5kIGhhbmRsZSB0aGlzIGZsYWcgYXQgdGhlIGNhbGwgc2l0ZSBpbnN0ZWFkLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
