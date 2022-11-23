Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D95863521A
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Nov 2022 09:18:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3582FC640FF;
	Wed, 23 Nov 2022 08:18:33 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9611C0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 08:18:31 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id b9so20556924ljr.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 00:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1Q69gDnyivpymFGK0Sd4Z0oFYEil0+SQlh0vDf2ji4M=;
 b=XtMrpoWyvn3cnzL27g22jgXDVQ04ezHV5Jv6xIZYgEY/2N9Hsw9aXIPZbUtLkiqLRj
 UU6tSufpFQsR+FZiAQKrVH8qGyOg8UuGWz0MPKjRGz6HuzgvVoc+txyBkscWSh+DG6S7
 KP1wiUjOxcgj6ud9wpEF/ekxThrIiLyJZ8gLhWGSFdDE0kPDT6Nlcp/bJwWjDxrNwxQR
 YmrizrHQR+hNOa82phbI1MXa5PTx90gqoArGByVIvXEb4PuMHKed8hKtGVzRNAa0H3um
 v3KeIT070EcWVACvPooH8KEF468Wn5sO8WnoroLm1B29uEF7gWYWJyI3QL4XJZK99O0G
 e0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Q69gDnyivpymFGK0Sd4Z0oFYEil0+SQlh0vDf2ji4M=;
 b=ZEOjvk4lI8EuWj5TsjmIPpKjHWgRMMfNz8dzVT4nek6vWtuvwhlLVpYFfoLsVweVz2
 TghnhFRPPgUJxUQB+xNVVDNIhGuHVHqEGmbpLKcYk27EN3BtSdhaI7c6KjQRrF8mveMN
 u8j2zxIVQ0gX18E9cMyCIIxKCJP6f7ZkA7VOUgBvwTbMVqGNYFx39BVN1au2EFHC8IoL
 P4JHSvqeH56dOdiwg+3wEib2PPUY8P47u4Zpbk0U9qZZIGpHrSXD3hDPXv6D5pij9F4M
 enEGbPiMjKzB6FWRbQ8bMkmlNfKyviBCyzyxn333jdaDteudB/ufYLrVJ1/lFpe2Aykz
 LuLw==
X-Gm-Message-State: ANoB5pl8DGITzsaYJEz4PqGDrL+k0lTKv0+Us/vR7Evoxudtu3Vq4byd
 sl4hnqb7oK9o8hUf9m7n+j4mww==
X-Google-Smtp-Source: AA0mqf4Cv6SWGcVth3Vs6EVyMwqJvulw8RX9FsThcyK0W0bvw/KrzybZNWjmXpwJ855YvfP9H0sPwQ==
X-Received: by 2002:a2e:824e:0:b0:26f:be8e:5298 with SMTP id
 j14-20020a2e824e000000b0026fbe8e5298mr4042117ljh.418.1669191511108; 
 Wed, 23 Nov 2022 00:18:31 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a056512202600b0047f7722b73csm2784810lfs.142.2022.11.23.00.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 00:18:30 -0800 (PST)
Message-ID: <3e7d045d-7416-d26f-1578-be83a82cc124@linaro.org>
Date: Wed, 23 Nov 2022 09:18:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
References: <20221122010753.3126828-1-bero@baylibre.com>
 <20221122010753.3126828-5-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221122010753.3126828-5-bero@baylibre.com>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMjIvMTEvMjAyMiAwMjowNywgQmVybmhhcmQgUm9zZW5rcsOkbnplciB3cm90ZToKPiBEZXBy
ZWNhdGUgdGhlIHBpbnMtYXJlLW51bWJlcmVkIHByb3BlcnR5Cj4gCj4gU2lnbmVkLW9mZi1ieTog
QmVybmhhcmQgUm9zZW5rcsOkbnplciA8YmVyb0BiYXlsaWJyZS5jb20+Cj4gLS0tCgoKQWNrZWQt
Ynk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4K
CkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
