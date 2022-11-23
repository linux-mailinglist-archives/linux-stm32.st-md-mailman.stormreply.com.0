Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA0C635218
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Nov 2022 09:18:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1987FC640FF;
	Wed, 23 Nov 2022 08:18:17 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C31D9C0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 08:18:15 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id d3so20584885ljl.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 00:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fL0RQ9V3lsCHjFuI9X5q3hTnnfNaNlsOWbPGogwO7Tk=;
 b=lgfpAulgNwQyAsUYf92b42NDgYv4N76VOGD/OP/HSSTSBJcxgrReakyMNG+pVkl61t
 9DGBRp5UkjtO4P0q1WDFvUtAe5WlNEYHeSBa6GhXVhoE1+Tr8lt1CGUmNdXv4fRKIMWH
 JbX3V42YRa44xrUiHrH4rZmABG5PpWrxUta/nniWfk/LrKvfAbYwToDFB7lPDlJtchc0
 gQqR3Sr8VfS+mRRfmcXEAlwH/U/MPC3NM0pFspbpOgXNuV+6RQ+FrmMLxuRBNqS+Zqbt
 SUn82DCoy2dD5pLdHTmHjlrCH2aPpgTAs9OgPSB2U5sBqShu4QbKnOFsQRiNY8FGf6gs
 +I5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fL0RQ9V3lsCHjFuI9X5q3hTnnfNaNlsOWbPGogwO7Tk=;
 b=vyIm+oIwORRNRGE6TcjssUdMlbYPjULg8G4yZVynDmrwe1OQ42aMnX7x0BXoLSThRC
 30qL87tG9qg8NFUQOzsCy4VEf3Ju+ic7LmQg4OpJgwAIvmgSXsfx0DAC74/J6bbP6DUx
 NWVyWrN6XFLnxpcUW/Fy0JT7PjmlqtDIX9ws011kX65+WcsZ+JQ/24iwK1aMDOpQYBPa
 Md45rzKUkD0J3BXG2pjwoRUU0dEg2ugz71QoPeBuG3gNopVRRgXUwhcOYkpUYf7fLIct
 ppa/hD/TAKxEXFKzpw+Gwj14Fyt/reT1B+lqu4fYx6pAMWkc9S0itsgXQY1xXqnalLWw
 OlIw==
X-Gm-Message-State: ANoB5pmCt5h5KEv0nJ/j4Xd3OM5aJVfB09o5FNEJoOTdU9+4GkB2MfkV
 ZsQAcPioi9ktXTtDNfE8mi5YIg==
X-Google-Smtp-Source: AA0mqf6qdnORHkVtPLBs2odty+zr62ZdV3b3E3AHmbLeJ/v/hIe3N/3e/3cwDklJV2X74Rt7spHKmw==
X-Received: by 2002:a05:651c:205d:b0:26f:b445:8c8a with SMTP id
 t29-20020a05651c205d00b0026fb4458c8amr2918141ljo.156.1669191494829; 
 Wed, 23 Nov 2022 00:18:14 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a056512358600b0049468f9e697sm2766578lfr.236.2022.11.23.00.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 00:18:14 -0800 (PST)
Message-ID: <51389853-35db-5162-e488-f5b3cfc25f27@linaro.org>
Date: Wed, 23 Nov 2022 09:18:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
References: <20221122010753.3126828-1-bero@baylibre.com>
 <20221122010753.3126828-4-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221122010753.3126828-4-bero@baylibre.com>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH v2 3/7] dt-bindings: pinctrl: mediatek,
 mt65xx: Deprecate pins-are-numbered
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

T24gMjIvMTEvMjAyMiAwMjowNywgQmVybmhhcmQgUm9zZW5rcsOkbnplciB3cm90ZToKPiBNYWtl
IHBpbnMtYXJlLW51bWJlcmVkIG9wdGlvbmFsIGFuZCBkZXByZWNhdGUgaXQKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBCZXJuaGFyZCBSb3Nlbmtyw6RuemVyIDxiZXJvQGJheWxpYnJlLmNvbT4KPiAtLS0K
PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9tZWRpYXRlayxtdDY1eHgtcGluY3Ry
bC55YW1sIHwgNSArKwoKCkFja2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yu
a296bG93c2tpQGxpbmFyby5vcmc+CgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
