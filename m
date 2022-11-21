Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C414C63222B
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 13:33:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 874B6C65065;
	Mon, 21 Nov 2022 12:33:47 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02B3FC6504A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 12:33:46 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso8896679wmp.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 04:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZvYOJ7mjGZt2sFpHqF+LZA5k69lV+Vn24RY4TlLt1N4=;
 b=SCz7aRwoP9trV3qSF8SVLaZgUfTKYE2NARsIggbXxNvrhR9dHOcL/yo8gAimbe//Yw
 C5SOkZks30dbzjrJzHHSFE07QW0FaVrFaiU676w53C/FRDJ8YFN4Pk5YdyopBpWB/4G2
 X6dZS58cacMsVQWUr9uYcFeLxYy8mCx2u88Lrux1NcaExEPqgTQO2Qeluvl+OszhZXdw
 Db0VLwCEruzSNj8ndz+guqCWvc/0CyHXuV/zYpl26JayChz7bKNz3Jw5uwx2GdhWPywB
 jpB47N5X79l34W7B8zPlmStAVIC86HhH5BAaZZZPH1EHlLyp/zH3iIdZhan3Lb4NoSFg
 TfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZvYOJ7mjGZt2sFpHqF+LZA5k69lV+Vn24RY4TlLt1N4=;
 b=hG2ef0rqLz9fnAUXycU8Vd6iGBzMVwF8ufxIcc6FhpTCvlfjZxdGx69Usm8bcNgzJ2
 4JaQ1Qv48YeZkkso8anrCQgmkses82his6ptrjeyVQQ1ufiNUPlxdvlsipmkTQKEvepB
 PSdol6AyOEu8z13MVhxK+5qxEZDA58AD5KFHeXOy0UiRf5NORiHZ0zVjDcx8399krz0l
 UuUU9ebX7x8VNdt3mKVtgZLMm7qbd4Ac5Yavf8fkt8k4j5cBA87sB3/l3YAnn7fROSwf
 Bm2jlpOeNOwMQVV2WNfRgpZgqHnY7GdUT1jBgWpXlErIH76/KRGj1Q2393Y+gNdS2QM2
 L08A==
X-Gm-Message-State: ANoB5pkBPxuB3nqERn5JtJktePfVzz9nCY0fUPcNV7yO0GzJ2T30mJW8
 GLxNaD61T9LFOxRhEE8pYfE=
X-Google-Smtp-Source: AA0mqf6FNGvoMt+llsc388PlfovbuF1W+XnNVzY03ZWRBukvUhJ9UgdZfu7k50CwD+43rBE7Gz7H3A==
X-Received: by 2002:a05:600c:3acd:b0:3cf:550e:d7a2 with SMTP id
 d13-20020a05600c3acd00b003cf550ed7a2mr4931505wms.97.1669034026550; 
 Mon, 21 Nov 2022 04:33:46 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a5d6291000000b0022e66749437sm11196458wru.93.2022.11.21.04.33.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 04:33:45 -0800 (PST)
Message-ID: <e0a35381-0ef3-c134-e1ef-b073a28458c9@gmail.com>
Date: Mon, 21 Nov 2022 13:33:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-2-bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221121015451.2471196-2-bero@baylibre.com>
Cc: khilman@baylibre.com, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/9] pinctrl: mediatek: common: Remove
 check for pins-are-numbered
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

CgpPbiAyMS8xMS8yMDIyIDAyOjU0LCBCZXJuaGFyZCBSb3Nlbmtyw6RuemVyIHdyb3RlOgo+IFJl
bW92ZSB0aGUgY2hlY2sgZm9yIHRoZSB1bm5lY2Vzc2FyeSBwaW5zLWFyZS1udW1iZXJlZCBEZXZp
Y2V0cmVlIHByb3BlcnR5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5oYXJkIFJvc2Vua3LDpG56
ZXIgPGJlcm9AYmF5bGlicmUuY29tPgoKUmV2aWV3ZWQtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1h
dHRoaWFzLmJnZ0BnbWFpbC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9waW5jdHJsL21lZGlhdGVr
L3BpbmN0cmwtbXRrLWNvbW1vbi5jIHwgNiAtLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGlu
Y3RybC1tdGstY29tbW9uLmMgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGst
Y29tbW9uLmMKPiBpbmRleCAwNzZhZTBiMzhlM2Q3Li41NTNkMTY3MDM0NzViIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1jb21tb24uYwo+ICsrKyBi
L2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1jb21tb24uYwo+IEBAIC0xMDU3
LDcgKzEwNTcsNiBAQCBpbnQgbXRrX3BjdHJsX2luaXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldiwKPiAgIAlzdHJ1Y3QgcGluY3RybF9waW5fZGVzYyAqcGluczsKPiAgIAlzdHJ1Y3QgbXRr
X3BpbmN0cmwgKnBjdGw7Cj4gICAJc3RydWN0IGRldmljZV9ub2RlICpucCA9IHBkZXYtPmRldi5v
Zl9ub2RlLCAqbm9kZTsKPiAtCXN0cnVjdCBwcm9wZXJ0eSAqcHJvcDsKPiAgIAlpbnQgcmV0LCBp
Owo+ICAgCj4gICAJcGN0bCA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKnBjdGwp
LCBHRlBfS0VSTkVMKTsKPiBAQCAtMTA2NiwxMSArMTA2NSw2IEBAIGludCBtdGtfcGN0cmxfaW5p
dChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+ICAgCj4gICAJcGxhdGZvcm1fc2V0X2Ry
dmRhdGEocGRldiwgcGN0bCk7Cj4gICAKPiAtCXByb3AgPSBvZl9maW5kX3Byb3BlcnR5KG5wLCAi
cGlucy1hcmUtbnVtYmVyZWQiLCBOVUxMKTsKPiAtCWlmICghcHJvcCkKPiAtCQlyZXR1cm4gZGV2
X2Vycl9wcm9iZShkZXYsIC1FSU5WQUwsCj4gLQkJCQkgICAgICJvbmx5IHN1cHBvcnQgcGlucy1h
cmUtbnVtYmVyZWQgZm9ybWF0XG4iKTsKPiAtCj4gICAJbm9kZSA9IG9mX3BhcnNlX3BoYW5kbGUo
bnAsICJtZWRpYXRlayxwY3RsLXJlZ21hcCIsIDApOwo+ICAgCWlmIChub2RlKSB7Cj4gICAJCXBj
dGwtPnJlZ21hcDEgPSBzeXNjb25fbm9kZV90b19yZWdtYXAobm9kZSk7Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
