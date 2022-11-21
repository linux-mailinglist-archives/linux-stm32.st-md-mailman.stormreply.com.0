Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEC863222F
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 13:34:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CB5FC65065;
	Mon, 21 Nov 2022 12:34:08 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57DA2C6504A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 12:34:07 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 o7-20020a05600c510700b003cffc0b3374so8735345wms.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 04:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VOlTSrmRtbUCBfz8gCz4WOvdg96YJQdXKVBz3QHx9bs=;
 b=V8siZQDFyD/hT3Om+NOj7hhswdGA7duSCrWm61KEQ/mP6nhbGLe+pX5cO4Hiv1aC06
 SGgQNBp7orlIKTRM5cxRhiv3KzMQbDKPOa9hbcF3WeO4Jxegg6R08UoCINuxKi/agRb1
 REO7D9+ZzE+0xXwc7/L7hj8R0XLsxWUqxHMDWjYNr82OMiWjExLT5SHTwfJEmgufx72t
 DQ6vJs5A6lBut1ePzFui5MR86Qqc0dczNfJT4uX/O5ZF2xARBS01lEvdFcVrfe9DJKtW
 IFUSN7HjfWpjb04GqXsFglT1LSsj37zJ7nrjX3EFM+f6M5HpE+DbBc/2iG2lm4LaJxmH
 dIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VOlTSrmRtbUCBfz8gCz4WOvdg96YJQdXKVBz3QHx9bs=;
 b=1AcMXmMWEkEaTgFlUI7FSUS149JSaRlhpKmTc5mj/IjYhlb3bM5XTbmGWnB2QwMQQ8
 l1DQyFbnC8cdLJuph7KbTetTSWC7AP4PRPR4KIsyDj6g/9M6nTM7viXFi7h1Yw2s9tFN
 6ZJBJAilbyhNg/+u2T8ztRqrzRh3Xs9IVlCLv+it4DfHQH4GiQfs7mIX9Vo7WHPa9SaH
 4s+5cfoQQ/o+lb20ez/A0ragPGfSXjrdiT8NLIlRYcpM50d0KkOOyZYOnNPgHBnLGx+I
 K//VzH2SDMo925uhgls+vkHzzl4eVcGR+MiH2EyMEwwRcbyl/Bs+6vasooEZ12PKz5NK
 dorg==
X-Gm-Message-State: ANoB5pmXqxMZCFzjgj/nQFJXRewbZaiADGYta19dC/ubJfUmiNDgygNx
 SjtyjjejB0euHjjcnAa9pVQhkItfW3E=
X-Google-Smtp-Source: AA0mqf6heJdZ9/M6W4IHJWOvjmp4NclZNoZVkaQ1Z+boxuga0PuFE6uaHa6xFt9cYsPIr036klryoQ==
X-Received: by 2002:a05:600c:4e50:b0:3d0:bda:f2c with SMTP id
 e16-20020a05600c4e5000b003d00bda0f2cmr3600512wmq.117.1669034046972; 
 Mon, 21 Nov 2022 04:34:06 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 q125-20020a1c4383000000b003c6cd82596esm18130468wma.43.2022.11.21.04.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 04:34:05 -0800 (PST)
Message-ID: <8572b192-bab4-645c-4046-3e5586178312@gmail.com>
Date: Mon, 21 Nov 2022 13:34:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-3-bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221121015451.2471196-3-bero@baylibre.com>
Cc: khilman@baylibre.com, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/9] pinctrl: stm32: Remove check for
	pins-are-numbered
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
bW92ZSB0aGUgY2hlY2sgZm9yIHRoZSB1bm5lY2Vzc2FyeSBwaW5zLWFyZS1udW1iZXJlZAo+IERl
dmljZVRyZWUgcHJvcGVydHkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBCZXJuaGFyZCBSb3Nlbmtyw6Ru
emVyIDxiZXJvQGJheWxpYnJlLmNvbT4KCgpSZXZpZXdlZC1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8
bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KCgo+IC0tLQo+ICAgZHJpdmVycy9waW5jdHJsL3N0bTMy
L3BpbmN0cmwtc3RtMzIuYyB8IDUgLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0z
Mi5jIGIvZHJpdmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzIuYwo+IGluZGV4IGNjOTQ3
MmIyODQwNDcuLjFjZGRjYTUwNmFkN2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3N0
bTMyL3BpbmN0cmwtc3RtMzIuYwo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9zdG0zMi9waW5jdHJs
LXN0bTMyLmMKPiBAQCAtMTQ5OSwxMSArMTQ5OSw2IEBAIGludCBzdG0zMl9wY3RsX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAJaWYgKCFtYXRjaF9kYXRhKQo+ICAgCQly
ZXR1cm4gLUVJTlZBTDsKPiAgIAo+IC0JaWYgKCFkZXZpY2VfcHJvcGVydHlfcHJlc2VudChkZXYs
ICJwaW5zLWFyZS1udW1iZXJlZCIpKSB7Cj4gLQkJZGV2X2VycihkZXYsICJvbmx5IHN1cHBvcnQg
cGlucy1hcmUtbnVtYmVyZWQgZm9ybWF0XG4iKTsKPiAtCQlyZXR1cm4gLUVJTlZBTDsKPiAtCX0K
PiAtCj4gICAJcGN0bCA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqcGN0bCksIEdGUF9LRVJO
RUwpOwo+ICAgCWlmICghcGN0bCkKPiAgIAkJcmV0dXJuIC1FTk9NRU07Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
