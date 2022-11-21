Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E7263223F
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 13:35:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC49BC65065;
	Mon, 21 Nov 2022 12:35:33 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F39D1C6504A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 12:35:32 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id l8so14310385ljh.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 04:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5Jxn+RBGVERxukoZ0CuXSdveFCdESK0kHT4i7qD/8lo=;
 b=avTYR9olrnBS5pqSQmPHd3LPji94CnINQOtQsHzD/a+P0PPDtjb7NtjWXQa97kE2vK
 fk3AK8/yOUIXdoDjgYWT3cYk7YXlSbWrYLT+PWH/3xN8Euwi8N1xwjIOZWHXZlFlE03R
 cBGPWwUdWnvNGqruZU3mkCNmhGTZEJ7TtRIJRMVH8LHN59VBmHBRas0nz96tmNjVspYY
 ptAgVFOC6j/i/Ae1DFAVFQ23BX3fi6QGMm9nF+5eUikDw5eD6OBm+CFF8zXRYz1WWPAn
 bFUxrG11c+fveNxp8F1qc8rdv5bgJxfQ99Spzob3tH6r8NSjp8eMS9EsSwkk4dfTlw2z
 90lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Jxn+RBGVERxukoZ0CuXSdveFCdESK0kHT4i7qD/8lo=;
 b=eP5JhsjXE85jinEcZNvkTm4yorc5O10nxLJ0BK9a1UK6xeIdxdALCBmc1waui8CGry
 5BUzZuxUsXQJcYbAttAp5/oeZr3wZZXIljWGT5GRNT6kRbTdWiFRe+sBLQPD4AwnJSDc
 IMbLYw84eiCZqixi2cyrbEKokGqN32slas5dniVqZzjtxKIaHhJ8ctWOjEBt6l8MwOCw
 4zzNDDGcI6KxqybGevkycqEhaYVxQGxClpztJouD8ItL9KJWM3qKK8KmkUAWKjqzNNYB
 HfHPcwAnsLdeQLdZFE9zUPJJt29W8YusgV467I/okwX+huy5QD1L9+uYC/o22Fg5UgU+
 0pfQ==
X-Gm-Message-State: ANoB5plhEw6dCXNN0B+EgADgkF21GQ7aM+ZUUUPao6QGhzr+syWJENb9
 yRFacKD9V9XkM1jFKnBS8BxxwA==
X-Google-Smtp-Source: AA0mqf7v4KL+NRJmcW0UYDlYDyKz+pQ9NEJ+GlFkjY0ap9YTKo5dYcob7MHvqYFoPtRRPIYpyxeGHg==
X-Received: by 2002:a05:651c:1ce:b0:278:a696:2781 with SMTP id
 d14-20020a05651c01ce00b00278a6962781mr5482892ljn.401.1669034132326; 
 Mon, 21 Nov 2022 04:35:32 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a196905000000b004996fbfd75esm1980456lfc.71.2022.11.21.04.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 04:35:31 -0800 (PST)
Message-ID: <b97059c0-1ec5-cd66-f55b-0203dc9eba70@linaro.org>
Date: Mon, 21 Nov 2022 13:35:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-3-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221121015451.2471196-3-bero@baylibre.com>
Cc: khilman@baylibre.com, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMjEvMTEvMjAyMiAwMjo1NCwgQmVybmhhcmQgUm9zZW5rcsOkbnplciB3cm90ZToKPiBSZW1v
dmUgdGhlIGNoZWNrIGZvciB0aGUgdW5uZWNlc3NhcnkgcGlucy1hcmUtbnVtYmVyZWQKPiBEZXZp
Y2VUcmVlIHByb3BlcnR5Cj4gCj4gU2lnbmVkLW9mZi1ieTogQmVybmhhcmQgUm9zZW5rcsOkbnpl
ciA8YmVyb0BiYXlsaWJyZS5jb20+Cj4gLS0tCgpGV0lXOgoKQWNrZWQtYnk6IEtyenlzenRvZiBL
b3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KCkJlc3QgcmVnYXJkcywK
S3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
