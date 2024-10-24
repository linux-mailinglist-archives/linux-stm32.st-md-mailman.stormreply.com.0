Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 267999AE5FC
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 15:23:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0FD3C78F69;
	Thu, 24 Oct 2024 13:22:59 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2251FC78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 13:22:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6077FA453B3;
 Thu, 24 Oct 2024 13:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF83C4CEE3;
 Thu, 24 Oct 2024 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729776171;
 bh=kc1ZQ4MosC46ZBz5uzN1Bxee3AY7JHIMK7ZbiVyBQw8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cVJ1uujs3gqDg34e0qGqig8v+exShDKLedXA4/XRuFTRPqTraBc8zB3cKN6wyZtVU
 7qvSckk7X16ERyKJ25ail3z6Or7DNI0Q5BEwzBCtqEACjZ9qqzTkI63/xBYVvL/OzV
 eznrFwBW2v/AQ0R/7JNS7FxzJQP8wsmLP7rXfst2FfLo50q7+RXrrjllF8yfB5i0Y6
 KYHT6BNId9USHmBQd1lK0nw5vrO+BO9CzRHgn1xjqvUwAhunyXs0fGi87H8KqCX4U5
 iKALZjAlFzuM1UC0iIQjiWlVm9Lw+HwfS1C9YAmXGbOyRNEovyF5WLpqs54PyA5FD0
 3AOk6jVnrwsjA==
Message-ID: <53f2e315-1a80-4d03-96a6-30604a96d3ad@kernel.org>
Date: Thu, 24 Oct 2024 15:22:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Antonio Borneo <antonio.borneo@foss.st.com>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
 <20241022155658.1647350-5-antonio.borneo@foss.st.com>
 <swbppwzpavktjpyb6piayzzht6ta75w3g36oyndmim54oztar5@svb4452yob7g>
 <680f3e0b7458015d5b909200342a623eb55f907d.camel@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <680f3e0b7458015d5b909200342a623eb55f907d.camel@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 04/14] dt-bindings: pinctrl: stm32: add
	RSVD mux function
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

T24gMjMvMTAvMjAyNCAxMDo1NiwgQW50b25pbyBCb3JuZW8gd3JvdGU6Cj4gT24gV2VkLCAyMDI0
LTEwLTIzIGF0IDEwOjQ3ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+PiBPbiBU
dWUsIE9jdCAyMiwgMjAyNCBhdCAwNTo1Njo0OFBNICswMjAwLCBBbnRvbmlvIEJvcm5lbyB3cm90
ZToKPj4+IEZyb206IEZhYmllbiBEZXNzZW5uZSA8ZmFiaWVuLmRlc3Nlbm5lQGZvc3Muc3QuY29t
Pgo+Pj4KPj4+IERvY3VtZW50IHRoZSBSU1ZEIChSZXNlcnZlZCkgbXV4IGZ1bmN0aW9uLCB1c2Vk
IHRvIHJlc2VydmUgcGlucwo+Pj4gZm9yIGEgY29wcm9jZXNzb3Igbm90IHJ1bm5pbmcgTGludXgu
Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRmFiaWVuIERlc3Nlbm5lIDxmYWJpZW4uZGVzc2VubmVA
Zm9zcy5zdC5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEJvcm5lbyA8YW50b25pby5i
b3JuZW9AZm9zcy5zdC5jb20+Cj4+PiAtLS0KPj4+IMKgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
cGluY3RybC9zdCxzdG0zMi1waW5jdHJsLnlhbWzCoMKgwqDCoCB8IDggKysrKysrKysKPj4+IMKg
aW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL3N0bTMyLXBpbmZ1bmMuaMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfCAxICsKPj4+IMKgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KykKPj4+Cj4+Cj4+IEJUVywgd2hpY2ggKmV4aXN0aW5nKiBTb0NzIHVzZSBpdD8gQXJlbid0IHlv
dSBhZGRpbmcgaXQgZm9yIHRoZSBuZXcKPj4gcGxhdGZvcm0/Cj4+Cj4gCj4gVGhpcyBpcyBhbHJl
YWR5IHVzZWQgaW4gU1QgZG93bnN0cmVhbSBrZXJuZWwgZm9yIFNUTTMyTVAxNXgKPiBJbiB0aGlz
IGV4YW1wbGUKPiBodHRwczovL2dpdGh1Yi5jb20vU1RNaWNyb2VsZWN0cm9uaWNzL2xpbnV4L2Js
b2IvdjYuMS1zdG0zMm1wL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdmLWRrMi1tNC1leGFt
cGxlcy5kdHMjTDExMgo+IAo+IHRoZSBHUElPcyBmb3IgTEVEIGFuZCBmb3IgUFdNIGFyZSBhc3Np
Z25lZCB0byB0aGUgQ29ydGV4LU00IGFuZCBMaW51eCAob24gQ29ydGV4LUE3KSBpcyBub3Qgc3Vw
cG9zZWQgdG8gdG91Y2ggdGhlbS4KCkkgd2Fzbid0IGNsZWFyLiBXaGljaCB1cHN0cmVhbSB1c2Vz
IGl0PyBXZSByZWFsbHkgY291bGQgbm90IGNhcmUgbGVzcwphYm91dCBkb3duc3RyZWFtIHZlbmRv
ciBjb2RlLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
