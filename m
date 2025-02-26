Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC11A4568E
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 08:23:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 539E2C7A82F;
	Wed, 26 Feb 2025 07:23:45 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B93EFC7A82E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 07:23:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 635456113A;
 Wed, 26 Feb 2025 07:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E0CC4CED6;
 Wed, 26 Feb 2025 07:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740554622;
 bh=Q64DmIbjnhSAJoyXLUs8wPCadWvD3Btqmi/ZGNhV9EU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BLua4mmOguzXo7StKiFtMbPs7fffOFcemIKuolz8jNQQkZybna8A73uDvbgeUh0bk
 zVAtRHACQxnDHR2UfGU8KH3Xra1X6aF6nhPhTzfT1SNYoBNKFy5FEjs/MUI7uPCwoC
 IzduqHbH0zWiHAVbG4v7oWi7B2TjthIM2gUWIh3OJxuWihk5rY0IK1577yrUlC7jIS
 2d3czeVxIlhBPxqtM0uExFMxxXP/EgZj5VRuHAPjcY2P69OL+b7jpzU6CFW1zH69yH
 uO/ftH00J0Wv9c/hjLn8HqBQBhQhHN7bSpKa7xx02TyOkjSzP9zDzV+eFni5GeRnmz
 ZWEL4r1CjKKbg==
Message-ID: <b57e3c9e-244e-435b-8a7b-cf90f3a973b3@kernel.org>
Date: Wed, 26 Feb 2025 08:23:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
 <20250225-hdp-upstream-v1-7-9d049c65330a@foss.st.com>
 <418a80a9-8c08-4dd1-bf49-1bd7378321aa@kernel.org>
 <b257aa79-6ca9-4f57-988a-ec00225992ab@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <b257aa79-6ca9-4f57-988a-ec00225992ab@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 7/9] ARM: dts: stm32: add Hardware debug
 port (HDP) on stm32mp25
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

T24gMjUvMDIvMjAyNSAxNzowOSwgQ2xlbWVudCBMRSBHT0ZGSUMgd3JvdGU6Cj4gT24gMi8yNS8y
NSAxNDowNSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24gMjUvMDIvMjAyNSAwOTo0
OCwgQ2zDqW1lbnQgTGUgR29mZmljIHdyb3RlOgo+Pj4gQWRkIHRoZSBoZHAgZGV2aWNldHJlZSBu
b2RlIGZvciBzdG0zMm1wMjUgU29DIGZhbWlseQo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IENsw6lt
ZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KPj4+IC0tLQo+Pj4g
ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaSB8IDcgKysrKysrKwo+Pj4g
ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0
cy9zdC9zdG0zMm1wMjUxLmR0c2kKPj4+IGluZGV4IGYzYzZjZGZkNzAwOC4uNDNhYWVkNGZjZjEw
IDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kK
Pj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpCj4+PiBAQCAt
OTE4LDYgKzkxOCwxMyBAQCBwYWNrYWdlX290cEAxZTggewo+Pj4gICAJCQl9Owo+Pj4gICAJCX07
Cj4+PiAgIAo+Pj4gKwkJaGRwOiBwaW5jdHJsQDQ0MDkwMDAwIHsKPj4+ICsJCQljb21wYXRpYmxl
ID0gInN0LHN0bTMybXAtaGRwIjsKPj4KPj4gU28gaGVyZSBhZ2FpbiAtIHlvdSBoYXZlIHN0bTMy
bXAyNTEgU29DLCBidXQgdXNlIGVudGlyZWx5IGRpZmZlcmVudAo+PiBjb21wYXRpYmxlLgo+IAo+
IE9rIHNvIEkgd2lsbCB1c2UgInN0LHN0bTMybXAxNS1oZHAiCgoKVGhpcyBtZWFucyB0aGlzIGlz
IHN0bTMybXAxNSBTb0MuIEkgZG8gbm90IHNlZSBzdWNoIFNvQyBvbiBsaXN0IG9mIHlvdXIKU29D
cyBpbiBiaW5kaW5ncy4gV2hhdCdzIG1vcmUsIHRoZXJlIGFyZSBubyBiaW5kaW5ncyBmb3Igb3Ro
ZXIgU29DCmNvbXBvbmVudHMgZm9yIHN0bTMybXAxNSEKClNvbWV0aGluZyBpcyBoZXJlIG5vdCBt
YXRjaGluZyAtIHRoaXMgY2hhbmdlLCB0aGlzIERUU0ksIHRvcCBsZXZlbApiaW5kaW5ncyBvciBh
bGwgb2YgeW91ciBTb0MgZGV2aWNlL2Jsb2NrcyBiaW5kaW5ncy4KCgoKQmVzdCByZWdhcmRzLApL
cnp5c3p0b2YKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
