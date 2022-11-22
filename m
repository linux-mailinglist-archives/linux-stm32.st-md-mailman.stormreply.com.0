Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C12EF63421A
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Nov 2022 18:03:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87D69C6504B;
	Tue, 22 Nov 2022 17:03:06 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8054C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 17:03:05 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id x17so12221804wrn.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 09:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o2ESf2ffEWNtfVyM0ZPvb6Y0s026dxSYBpFrwcaZ3J0=;
 b=jYH5L4jwO3/d+gHzNoEfN+SNyVccGsviLt9pM8GecpnpvqZNCOeanh91XhU9KlIWTa
 Bt6yU12pdtmPRaYodwRAFupLAk80R4xeJedy9BnqAWYbi+2IlgQ1IIQ6+Wg5ddg+xZPg
 Ne1X8dT2ltDivCtWGr1pN61s4Y5AN+S/DHlMq/+avsQLfAmXN8OX6XrzYMqC85/DYSgu
 pyzckN2+ZJ4vRprzLunP04BTAZx7zqpINeHK41p7vDkE1Qc33XKR8wxcZAzoMl9XhnP8
 ttx2giyAp2NdtLntxKdENItCv8OXzHTlqGOyTSCowzAoy20dgxe/3YcgnU0KNP8hZ9Kk
 z43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o2ESf2ffEWNtfVyM0ZPvb6Y0s026dxSYBpFrwcaZ3J0=;
 b=Uv7lHRNKcCM+FHFVTN+u/xCP16v0OYs0o2Dee8l3c7bHSLTZep7DGYR8AwY12E8ba1
 ILxRnBgAWz7Nrlk9OYQJsEt3oKrNl1vJ2bbaXbAbtCkIi/JwJt29e6QlKkhEfRx5cNNr
 igdO3p8hXnuRNPZUp8wpc/2xjqDvLSjIBoAaYdgob54VfhucAYUfL5KJbe4JkvBL+Zfu
 a6Yq305xjptpRc2SzEtu1nGgdPtTiy/LjnY66vLGj7dYt14gooGqHKYPuq1U1sW9vzNs
 aoJ5sHYkm3ZA0crmqd9s2hDbiK+bYbdx9ZmfNg8Z9HuWfHL50X7jGDjhVNE0XVf8+fbD
 h2pw==
X-Gm-Message-State: ANoB5pnKBfxyGQb+1WdPKdwDmaq5bxjQS2uqflC7kj2DyMfWM9HcAZoX
 FNUMZv7zr6OQhM47FWzyu35wKs14XOmFTA==
X-Google-Smtp-Source: AA0mqf5AAB2WpZpQrxG/QW1P9YfLF2voM76+7M892xh+AKLCme4WOa5olE+MEanw9+a/FkosbhcpOw==
X-Received: by 2002:adf:ed8e:0:b0:241:d7ce:4395 with SMTP id
 c14-20020adfed8e000000b00241d7ce4395mr6251645wro.553.1669136584924; 
 Tue, 22 Nov 2022 09:03:04 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
 by smtp.gmail.com with ESMTPSA id
 c4-20020adfe704000000b00241cfe6e286sm8503223wrm.98.2022.11.22.09.03.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 09:03:03 -0800 (PST)
Message-ID: <16774569-6dbe-3bc9-7471-f238e04e6050@gmail.com>
Date: Tue, 22 Nov 2022 18:03:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
References: <20221122010753.3126828-1-bero@baylibre.com>
 <20221122010753.3126828-5-bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221122010753.3126828-5-bero@baylibre.com>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH v2 4/7] dt-bindings: pinctrl: st,
 stm32: Deprecate pins-are-numbered
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

CgpPbiAyMi8xMS8yMDIyIDAyOjA3LCBCZXJuaGFyZCBSb3Nlbmtyw6RuemVyIHdyb3RlOgo+IERl
cHJlY2F0ZSB0aGUgcGlucy1hcmUtbnVtYmVyZWQgcHJvcGVydHkKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBCZXJuaGFyZCBSb3Nlbmtyw6RuemVyIDxiZXJvQGJheWxpYnJlLmNvbT4KClJldmlld2VkLWJ5
OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPgoKPiAtLS0KPiAgIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvc3Qsc3RtMzItcGluY3RybC55YW1sICAgICAg
fCA3ICsrKy0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9waW5jdHJsL3N0LHN0bTMyLXBpbmN0cmwueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9waW5jdHJsL3N0LHN0bTMyLXBpbmN0cmwueWFtbAo+IGluZGV4IDlkNTkyMDhk
ODNjMTguLmVlYjI5YjRhZDRkMWEgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BpbmN0cmwvc3Qsc3RtMzItcGluY3RybC55YW1sCj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvc3Qsc3RtMzItcGluY3RybC55YW1s
Cj4gQEAgLTM0LDcgKzM0LDkgQEAgcHJvcGVydGllczoKPiAgICAgICBjb25zdDogMQo+ICAgCj4g
ICAgIHJhbmdlczogdHJ1ZQo+IC0gIHBpbnMtYXJlLW51bWJlcmVkOiB0cnVlCj4gKyAgcGlucy1h
cmUtbnVtYmVyZWQ6Cj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9u
cy9mbGFnCj4gKyAgICBkZXByZWNhdGVkOiB0cnVlCj4gICAgIGh3bG9ja3M6IHRydWUKPiAgIAo+
ICAgICBpbnRlcnJ1cHRzOgo+IEBAIC0yMDYsNyArMjA4LDYgQEAgcmVxdWlyZWQ6Cj4gICAgIC0g
JyNhZGRyZXNzLWNlbGxzJwo+ICAgICAtICcjc2l6ZS1jZWxscycKPiAgICAgLSByYW5nZXMKPiAt
ICAtIHBpbnMtYXJlLW51bWJlcmVkCj4gICAKPiAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxz
ZQo+ICAgCj4gQEAgLTIyMCw3ICsyMjEsNiBAQCBleGFtcGxlczoKPiAgICAgICAgICAgICAgICAg
I3NpemUtY2VsbHMgPSA8MT47Cj4gICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic3Qsc3Rt
MzJmNDI5LXBpbmN0cmwiOwo+ICAgICAgICAgICAgICAgICByYW5nZXMgPSA8MCAweDQwMDIwMDAw
IDB4MzAwMD47Cj4gLSAgICAgICAgICAgICAgcGlucy1hcmUtbnVtYmVyZWQ7Cj4gICAKPiAgICAg
ICAgICAgICAgICAgZ3Bpb2E6IGdwaW9AMCB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgZ3Bp
by1jb250cm9sbGVyOwo+IEBAIC0yMzgsNyArMjM4LDYgQEAgZXhhbXBsZXM6Cj4gICAgICAgICAg
ICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0g
InN0LHN0bTMyZjQyOS1waW5jdHJsIjsKPiAgICAgICAgICAgICAgICAgcmFuZ2VzID0gPDAgMHg1
MDAyMDAwMCAweDMwMDA+Owo+IC0gICAgICAgICAgICAgIHBpbnMtYXJlLW51bWJlcmVkOwo+ICAg
Cj4gICAgICAgICAgICAgICAgIGdwaW9iOiBncGlvQDEwMDAgewo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGdwaW8tY29udHJvbGxlcjsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
