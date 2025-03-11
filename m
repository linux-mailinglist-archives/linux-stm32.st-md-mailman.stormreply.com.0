Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBFDA5BAD6
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Mar 2025 09:30:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8C6AC78F97;
	Tue, 11 Mar 2025 08:30:24 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7351CC78F80
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Mar 2025 08:30:23 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ac29af3382dso316901666b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Mar 2025 01:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741681823; x=1742286623;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/wBUIzbfRjL8cYbjpKbIUr1nM3k/ZT4ERi+YMbxa2AA=;
 b=hsRzW5uQFZ8dlcZ2mSQ83yq6z3WMnqVUlQHY5GC8fPXfIIj2klUzl/eHTOfMJHZPPB
 UOO6e6hkzYbXNpE6d4uos+fsrStuYJB8mHBUf5/ukGiitCRUAG/8XNSczCTnTSdDpnwH
 KppUZ0Npccdlj4xDOWSesn7HEgkf9FbRysnwM+iXiFlC07SbnA2pBt2uEP9Q/GLT3zWT
 7NaXm72XLx0Ts6WWIv0hmR6t4rrEo+aoP0+1sdP0p/ECNlaaoTvMnzAdrvrPovDDKOQJ
 g3XRZYHDp+vhqlSkVPZTkRzZhNKLU9rCPo6iuVk8HHnvrMVMQkXvBLktSHrXeBCB6H2n
 Endg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741681823; x=1742286623;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/wBUIzbfRjL8cYbjpKbIUr1nM3k/ZT4ERi+YMbxa2AA=;
 b=A+NruRMsggZlVPBubp3sqNbeCklBOVt7AkGk10/zJ1sq6C9ErLZZCaAqr0z/FZkiFb
 kB1pw10os+Q88hbmpVpy0bJh0HXF1aXA6A+OLsPELXnqeuA4nrsFhqAdjyzFf12PRsJt
 +ousVQTfX5WAd/8/cIQxy1F+8iomDUvhRgoP9Tn/GurlhLVSQB3JlGsRyS8Y8urrG9fC
 5JnCy9Lugmo/hSjVYdtG74MngWQ1pBFdAIHuITvG2xr29BJ9BDgjPQOU4eSLBAf8IrGw
 TxOj32SRv1T3p3o5Zm3IBwghATPabIWxDkjTpQEpTzBZ9C5aJgP+QUATcbGFVsu2SPT6
 4dmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPH7IhgLrAJZeoKkhP4kCXoCDf9Usq3BFITzJCFfhD0EcPe6n4LgY8foZG5eStxbW6eL2LUFf4FrEzgQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzRHZStDu0rxmdur3ig3yewhmEOZbRveMqhzT3r5SlqBT+bJ5rq
 +tIem1I5fKeF+AcC+xSF4qGTWgiMXkl5xvtKhGU/fXiyulcvQzOE
X-Gm-Gg: ASbGncsYlf+L5DMhCrdoh2ELh+4bcoqxrFIsq1Z/+lrIpG+kTQvw3o21v2Eye5M3AG4
 3chcgXEiKtUXWqqHog/TH/1PVdP3xWz36DUmHfbdcn9E3nHBS1B+OiIXcOGHlkJ1cbue4LfhqHd
 Vhpqz7VGJsoKzI85kQMDSvpgYLAdUq5zYdy+Nlmd1igvBhoUFa2/CNar1WwsNow5k+AOAx1b/7o
 CzG7RKaeOmLmMz7R/PgL38V03wH/L971qHETiAzaIo+nJsZXxQo6vmqOEwhHOh5nJZ8QBtDU3sX
 v+Hxv1e4Ruh5YeXsafJR1H1fJrITRiFvP6Y4LadsH3BMFd9+cs2f5A==
X-Google-Smtp-Source: AGHT+IED4/BdBzDJtL90V4GvyA5vlzRx5/AdyTSCLrwu2fkiBvJHxCgGCstqtAFDn9HSo6VY65AMJw==
X-Received: by 2002:a17:907:6d08:b0:abf:742e:1fd7 with SMTP id
 a640c23a62f3a-ac253096a6amr2126965266b.57.1741681822638; 
 Tue, 11 Mar 2025 01:30:22 -0700 (PDT)
Received: from [192.168.1.130] ([188.193.103.108])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac2394825efsm877216566b.45.2025.03.11.01.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 01:30:22 -0700 (PDT)
Message-ID: <23c708ef-c52d-40c1-a9e8-b05555b21667@gmail.com>
Date: Tue, 11 Mar 2025 09:30:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?B?R29yYW4gUmHEkWVub3ZpxIc=?=
 <gradenovic@ultratronik.de>, =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?=
 <bstruempfel@ultratronik.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20250310154804.326943-1-goran.radni@gmail.com>
 <20250310154804.326943-5-goran.radni@gmail.com>
 <6af3a9fe-0c0b-497d-b143-77edc12f0c1e@kernel.org>
Content-Language: en-US
From: Goran Radenovic <goran.radni@gmail.com>
In-Reply-To: <6af3a9fe-0c0b-497d-b143-77edc12f0c1e@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 4/4] ARM: dts: stm32: add initial support
 for stm32mp157-ultra-fly-sbc board
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

VGhhbmsgWW91IGZvciB0aGUgZmVlZGJhY2suIEkgd2lsbCBmaXggdGhpcy4gSSBoYXZlIHRvIHNv
bHZlIHRoZSBwcm9ibGVtIAp3aXRoIG15IGUtbWFpbHMgaW4gTUFJTlRBSU5FUlMgZmlyc3QsIGJl
Y2F1c2UgSSBjYW5ub3QgdXNlIHRoZW0gdG8gc2VuZCAKZS1tYWlscyAiaW5saW5lIi4KCkJlc3Qg
cmVnYXJkcwpHb3JhbgoKCk9uIDEwLjAzLjI1IDE3OjA4LCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+IE9uIDEwLzAzLzIwMjUgMTY6NDgsIEdvcmFuIFJhxJFlbm92acSHIHdyb3RlOgo+PiAr
JmdwaW9qIHsKPj4gKwlncGlvLWxpbmUtbmFtZXMgPQo+PiArCSIiLCAiIiwgIiIsICIiLCAiIiwg
IiIsICIiLCAiIiwKPj4gKwkiIiwgIiIsICIiLCAiIiwgIiIsICIiLCAiIiwgIiI7Cj4+ICt9Owo+
PiArCj4+ICsmZ3Bpb2sgewo+PiArCWdwaW8tbGluZS1uYW1lcyA9Cj4+ICsJIiIsICIiLCAiIiwg
IiIsICIiLCAiIiwgIiIsICIiLAo+PiArCSIiLCAiIiwgIiIsICIiLCAiIiwgIiIsICIiLCAiIjsK
Pj4gK307Cj4+ICsKPj4gKyZncGlveiB7Cj4+ICsJZ3Bpby1saW5lLW5hbWVzID0KPj4gKwkiIiwg
IiIsICIiLCAiI1NQSV9DUzIiLCAiIiwgIiIsICIiLCAiIiwKPj4gKwkiIiwgIiIsICIiLCAiIiwg
IiIsICIiLCAiIiwgIiI7Cj4+ICt9Owo+PiArCj4+ICsmZ3B1IHsKPj4gKwlzdGF0dXMgPSAib2th
eSI7Cj4+ICt9Owo+PiArCj4+ICsmaTJjMSB7Cj4+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IiwgInNsZWVwIjsKPj4gKwlwaW5jdHJsLTAgPSA8JmkyYzFfdXhfcGluc19hPjsKPj4gKwlwaW5j
dHJsLTEgPSA8JmkyYzFfdXhfcGluc19zbGVlcF9hPjsKPj4gKwlpMmMtc2NsLXJpc2luZy10aW1l
LW5zID0gPDEwMD47Cj4+ICsJaTJjLXNjbC1mYWxsaW5nLXRpbWUtbnMgPSA8Nz47Cj4+ICsJc3Rh
dHVzID0gIm9rYXkiOwo+PiArCS9kZWxldGUtcHJvcGVydHkvZG1hczsKPj4gKwkvZGVsZXRlLXBy
b3BlcnR5L2RtYS1uYW1lczsKPj4gKwo+PiArCXJ0Y0AzMiB7Cj4+ICsJCWNvbXBhdGlibGUgPSAi
ZXBzb24scng4OTAwIjsKPj4gKwkJcmVnID0gPDB4MzI+Owo+PiArCQllcHNvbix2ZGV0LWRpc2Fi
bGU7Cj4+ICsJCXRyaWNrbGUtZGlvZGUtZGlzYWJsZTsKPj4gKwl9Owo+PiArfTsKPj4gKwo+PiAr
JmkyYzQgewo+PiArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJzbGVlcCI7Cj4+ICsJcGlu
Y3RybC0wID0gPCZpMmM0X3V4X3BpbnNfYT47Cj4+ICsJcGluY3RybC0xID0gPCZpMmM0X3V4X3Bp
bnNfc2xlZXBfYT47Cj4+ICsJaTJjLXNjbC1yaXNpbmctdGltZS1ucyA9IDwxODU+Owo+PiArCWky
Yy1zY2wtZmFsbGluZy10aW1lLW5zID0gPDIwPjsKPj4gKwlzdGF0dXMgPSAib2theSI7Cj4+ICsJ
L2RlbGV0ZS1wcm9wZXJ0eS9kbWFzOwo+PiArCS9kZWxldGUtcHJvcGVydHkvZG1hLW5hbWVzOwo+
PiArCj4+ICsJcG1pYzogc3RwbWljQDMzIHsKPiBOb2RlIG5hbWVzIHNob3VsZCBiZSBnZW5lcmlj
LiBTZWUgYWxzbyBhbiBleHBsYW5hdGlvbiBhbmQgbGlzdCBvZgo+IGV4YW1wbGVzIChub3QgZXho
YXVzdGl2ZSkgaW4gRFQgc3BlY2lmaWNhdGlvbjoKPiBodHRwczovL2RldmljZXRyZWUtc3BlY2lm
aWNhdGlvbi5yZWFkdGhlZG9jcy5pby9lbi9sYXRlc3QvY2hhcHRlcjItZGV2aWNldHJlZS1iYXNp
Y3MuaHRtbCNnZW5lcmljLW5hbWVzLXJlY29tbWVuZGF0aW9uCj4KPiBwbWljPwo+Cj4+ICsJCWNv
bXBhdGlibGUgPSAic3Qsc3RwbWljMSI7Cj4+ICsJCXJlZyA9IDwweDMzPjsKPj4gKwkJaW50ZXJy
dXB0cy1leHRlbmRlZCA9IDwmZXh0aSAwIElSUV9UWVBFX0VER0VfRkFMTElORz47Cj4+ICsJCWlu
dGVycnVwdC1jb250cm9sbGVyOwo+PiArCQkjaW50ZXJydXB0LWNlbGxzID0gPDI+Owo+PiArCQlz
dGF0dXMgPSAib2theSI7Cj4gRG9lcyBub3QgbG9vayBkaXNhYmxlZAo+Cj4KPiAuLi4KPgo+Cj4+
ICsJZGFjX3V4X2NoMl9waW5zX2E6IGRhY191eC1jaDItMCB7Cj4gTm8gdW5kZXJzY29yZXMgaW4g
bm9kZSBuYW1lcy4KPgo+PiArCQlwaW5zIHsKPj4gKwkJCXBpbm11eCA9IDxTVE0zMl9QSU5NVVgo
J0EnLCA1LCBBTkFMT0cpPjsKPj4gKwkJfTsKPj4gKwl9Owo+PiArCj4KPgo+Cj4gQmVzdCByZWdh
cmRzLAo+IEtyenlzenRvZgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
