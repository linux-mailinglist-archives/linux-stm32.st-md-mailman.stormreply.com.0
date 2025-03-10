Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C74BA59AA8
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Mar 2025 17:08:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5F5FC78F9A;
	Mon, 10 Mar 2025 16:08:31 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80951C7802E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 16:08:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2A77AA43B09;
 Mon, 10 Mar 2025 16:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038EDC4CEE5;
 Mon, 10 Mar 2025 16:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741622909;
 bh=oM+2QBv/osZc1Qu+Ovbzjhd1SaqoUCdnlpJ4kblzwJk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aUqSZF2qUxl/E2FvXVyVCYnyS5+E44suSL/KlyOFEVylO0oH6zpkYfOOhYgPbx+g8
 I0jkecRJErsGGLi354YBzZH/OAK0YDz0ELoAwGDC+EOJPUbrvoLwQuzVzYsdssX6f6
 qbWI/ou0wFT/SrWfwZqfaZLunnQybIEcz87WRWRkurh85p/EEwb0gFd/hPzvRHwDmm
 THJmI7f8BOKJq/nsvo8PgzsB2ak46pVuLlS/c8jB9majbm+bGzh9gXVq7v0jIWnPga
 k0wv8i9WuZKhv5xK/CW3BSaMC6Yn5ZQa9xrjOXLI6vQVqbg/pd0K6OCwRnM/ClSSuw
 bKbJD/QT1D65Q==
Message-ID: <6af3a9fe-0c0b-497d-b143-77edc12f0c1e@kernel.org>
Date: Mon, 10 Mar 2025 17:08:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?R29yYW4gUmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?B?R29yYW4gUmHEkWVub3ZpxIc=?= <gradenovic@ultratronik.de>,
 =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <bstruempfel@ultratronik.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20250310154804.326943-1-goran.radni@gmail.com>
 <20250310154804.326943-5-goran.radni@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250310154804.326943-5-goran.radni@gmail.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMTAvMDMvMjAyNSAxNjo0OCwgR29yYW4gUmHEkWVub3ZpxIcgd3JvdGU6Cj4gKyZncGlvaiB7
Cj4gKwlncGlvLWxpbmUtbmFtZXMgPQo+ICsJIiIsICIiLCAiIiwgIiIsICIiLCAiIiwgIiIsICIi
LAo+ICsJIiIsICIiLCAiIiwgIiIsICIiLCAiIiwgIiIsICIiOwo+ICt9Owo+ICsKPiArJmdwaW9r
IHsKPiArCWdwaW8tbGluZS1uYW1lcyA9Cj4gKwkiIiwgIiIsICIiLCAiIiwgIiIsICIiLCAiIiwg
IiIsCj4gKwkiIiwgIiIsICIiLCAiIiwgIiIsICIiLCAiIiwgIiI7Cj4gK307Cj4gKwo+ICsmZ3Bp
b3ogewo+ICsJZ3Bpby1saW5lLW5hbWVzID0KPiArCSIiLCAiIiwgIiIsICIjU1BJX0NTMiIsICIi
LCAiIiwgIiIsICIiLAo+ICsJIiIsICIiLCAiIiwgIiIsICIiLCAiIiwgIiIsICIiOwo+ICt9Owo+
ICsKPiArJmdwdSB7Cj4gKwlzdGF0dXMgPSAib2theSI7Cj4gK307Cj4gKwo+ICsmaTJjMSB7Cj4g
KwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCAic2xlZXAiOwo+ICsJcGluY3RybC0wID0gPCZp
MmMxX3V4X3BpbnNfYT47Cj4gKwlwaW5jdHJsLTEgPSA8JmkyYzFfdXhfcGluc19zbGVlcF9hPjsK
PiArCWkyYy1zY2wtcmlzaW5nLXRpbWUtbnMgPSA8MTAwPjsKPiArCWkyYy1zY2wtZmFsbGluZy10
aW1lLW5zID0gPDc+Owo+ICsJc3RhdHVzID0gIm9rYXkiOwo+ICsJL2RlbGV0ZS1wcm9wZXJ0eS9k
bWFzOwo+ICsJL2RlbGV0ZS1wcm9wZXJ0eS9kbWEtbmFtZXM7Cj4gKwo+ICsJcnRjQDMyIHsKPiAr
CQljb21wYXRpYmxlID0gImVwc29uLHJ4ODkwMCI7Cj4gKwkJcmVnID0gPDB4MzI+Owo+ICsJCWVw
c29uLHZkZXQtZGlzYWJsZTsKPiArCQl0cmlja2xlLWRpb2RlLWRpc2FibGU7Cj4gKwl9Owo+ICt9
Owo+ICsKPiArJmkyYzQgewo+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IiwgInNsZWVwIjsK
PiArCXBpbmN0cmwtMCA9IDwmaTJjNF91eF9waW5zX2E+Owo+ICsJcGluY3RybC0xID0gPCZpMmM0
X3V4X3BpbnNfc2xlZXBfYT47Cj4gKwlpMmMtc2NsLXJpc2luZy10aW1lLW5zID0gPDE4NT47Cj4g
KwlpMmMtc2NsLWZhbGxpbmctdGltZS1ucyA9IDwyMD47Cj4gKwlzdGF0dXMgPSAib2theSI7Cj4g
KwkvZGVsZXRlLXByb3BlcnR5L2RtYXM7Cj4gKwkvZGVsZXRlLXByb3BlcnR5L2RtYS1uYW1lczsK
PiArCj4gKwlwbWljOiBzdHBtaWNAMzMgewoKTm9kZSBuYW1lcyBzaG91bGQgYmUgZ2VuZXJpYy4g
U2VlIGFsc28gYW4gZXhwbGFuYXRpb24gYW5kIGxpc3Qgb2YKZXhhbXBsZXMgKG5vdCBleGhhdXN0
aXZlKSBpbiBEVCBzcGVjaWZpY2F0aW9uOgpodHRwczovL2RldmljZXRyZWUtc3BlY2lmaWNhdGlv
bi5yZWFkdGhlZG9jcy5pby9lbi9sYXRlc3QvY2hhcHRlcjItZGV2aWNldHJlZS1iYXNpY3MuaHRt
bCNnZW5lcmljLW5hbWVzLXJlY29tbWVuZGF0aW9uCgpwbWljPwoKPiArCQljb21wYXRpYmxlID0g
InN0LHN0cG1pYzEiOwo+ICsJCXJlZyA9IDwweDMzPjsKPiArCQlpbnRlcnJ1cHRzLWV4dGVuZGVk
ID0gPCZleHRpIDAgSVJRX1RZUEVfRURHRV9GQUxMSU5HPjsKPiArCQlpbnRlcnJ1cHQtY29udHJv
bGxlcjsKPiArCQkjaW50ZXJydXB0LWNlbGxzID0gPDI+Owo+ICsJCXN0YXR1cyA9ICJva2F5IjsK
CkRvZXMgbm90IGxvb2sgZGlzYWJsZWQKCgouLi4KCgo+ICsJZGFjX3V4X2NoMl9waW5zX2E6IGRh
Y191eC1jaDItMCB7CgpObyB1bmRlcnNjb3JlcyBpbiBub2RlIG5hbWVzLgoKPiArCQlwaW5zIHsK
PiArCQkJcGlubXV4ID0gPFNUTTMyX1BJTk1VWCgnQScsIDUsIEFOQUxPRyk+Owo+ICsJCX07Cj4g
Kwl9Owo+ICsKCgoKCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
