Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C9C632251
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 13:36:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B00FC65065;
	Mon, 21 Nov 2022 12:36:49 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 100D8C6504A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 12:36:48 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id r8so3744376ljn.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 04:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JVqUBkccUO74jpGwRk+0I2DcnpQP7VCCZIkeNtWiOpE=;
 b=Y3eucGiwI5BVrLdmmJzatUGPxjEd3oJ1t1nz+gZ4K/4gRhFqPcdaJgSvBSMGcT1oHV
 5ZBhd0iUdOussRJrrxVZ77aNXBzP8F5MbvhmCrTnucPu1+0MbfSIIZjzN93koqHiv/xE
 0E9JZQWkVjVThQpQHxltHws0FT4cNnEJssF6ojqXVdQqv71JwdcFkdi+r+s9q4/Ta2Vs
 lX3R1PtMd1uKRsbhMo8Z7gwJIy8NBrdVzAL4eKc1Y4Nukgrp0cwB0elHeXSCPGJQu7Nw
 X/oK/I94pMpEVIx0GsZmLa9scghtzDFxf72aLPAcP2NwroB+/4Q6S2c4tcCBsB/cdFDs
 9RBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JVqUBkccUO74jpGwRk+0I2DcnpQP7VCCZIkeNtWiOpE=;
 b=1C+GaGcknbY848SWxxI56BAqDiJTmRtLtjMkNPglFH39+USnhLOnrlci2kGhdGU9ht
 WAg7X6Bkm3OTocktWs7t9bkI2R9qYGCZj4wyG+qsV6xi1A8D2Ca/wZwmkHA5V2OQdlVg
 clu5xHHY/jG8sSoRJAlWw8o13xbgygy0DttlOlcs46Fil/mlGVZZPiUyoT90uWsx2wan
 Mp0KjmrQv284yZRwJRZAuEdse1Carj0Gvpnj7DVmxrHmPoQwvsA49Cxyw2Rv2Fdxtrgt
 FceOsPBQxFsYNGKmT76co1MV1jKQDXGo3LZxQFSBhO0LWZzIOdIjOHuZht1RMihXBQI1
 68cg==
X-Gm-Message-State: ANoB5pmJk3WAcUK9j1xv3qvrb8W6J3Lv1xuAbLuTjlOelbc5uayfd/ah
 8kP4yeoaKZM18rNlZ9r2whOBPg==
X-Google-Smtp-Source: AA0mqf73fnJYF1Gt8sIJLcnzF17Iqsr/0vCWKscbqba1N6/1xq+5yLwMROsV8eqspQPv1DmynkHwZA==
X-Received: by 2002:a2e:97d7:0:b0:278:f437:9c43 with SMTP id
 m23-20020a2e97d7000000b00278f4379c43mr5201339ljj.342.1669034207437; 
 Mon, 21 Nov 2022 04:36:47 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 dt27-20020a0565122a9b00b00492e3c8a986sm2004197lfb.264.2022.11.21.04.36.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 04:36:47 -0800 (PST)
Message-ID: <48a64598-5140-1949-8e93-7257ccadaf63@linaro.org>
Date: Mon, 21 Nov 2022 13:36:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-9-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221121015451.2471196-9-bero@baylibre.com>
Cc: khilman@baylibre.com, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 8/9] dt-bindings: pinctrl: mediatek,
 mt65xx: Drop the pins-are-numbered property
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

T24gMjEvMTEvMjAyMiAwMjo1NCwgQmVybmhhcmQgUm9zZW5rcsOkbnplciB3cm90ZToKPiBEcm9w
IHRoZSBwaW5zLWFyZS1udW1iZXJlZCBwcm9wZXJ0eSBmcm9tIHRoZSBNZWRpYXRlayBNVDY1eHgg
RGV2aWNlVHJlZQo+IHNjaGVtYQo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5oYXJkIFJvc2Vua3LD
pG56ZXIgPGJlcm9AYmF5bGlicmUuY29tPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvcGluY3RybC9t
ZWRpYXRlayxtdDY1eHgtcGluY3RybC55YW1sICAgICAgICAgICB8IDYgLS0tLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9tZWRpYXRlayxtdDY1eHgtcGluY3RybC55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvbWVkaWF0ZWssbXQ2
NXh4LXBpbmN0cmwueWFtbAo+IGluZGV4IGNjYTljYzU4YTY5MzQuLmNiNDUwZGE0OWU2ZTkgMTAw
NjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvbWVk
aWF0ZWssbXQ2NXh4LXBpbmN0cmwueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVrLG10NjV4eC1waW5jdHJsLnlhbWwKPiBAQCAtMjgs
MTEgKzI4LDYgQEAgcHJvcGVydGllczoKPiAgICByZWc6Cj4gICAgICBtYXhJdGVtczogMQo+ICAK
PiAtICBwaW5zLWFyZS1udW1iZXJlZDoKPiAtICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL2ZsYWcKPiAtICAgIGRlc2NyaXB0aW9uOiB8Cj4gLSAgICAgIFNwZWNpZnkg
dGhlIHN1Ym5vZGVzIGFyZSB1c2luZyBudW1iZXJlZCBwaW5tdXggdG8gc3BlY2lmeSBwaW5zLgoK
T2gsIEkgbWlzc2VkIHRoYXQgcGF0Y2guIFRoZXJlIGlzIG5vIG5lZWQgdG8gc3BsaXQgaXQuIFNx
dWFzaCBpdCB3aXRoCnlvdXIgZmlyc3QgYW5kIHJhdGhlciBtYXJrIGl0IGFzICJkZXByZWNhdGVk
OiB0cnVlIgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
