Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AB1631ADD
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 09:00:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D11CC65065;
	Mon, 21 Nov 2022 08:00:04 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58AB9C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 08:00:03 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 84-20020a1c0257000000b003cfe48519a6so5865018wmc.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 00:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SJJG9l0YlRpzRi2ic2wvRcjJj5ylm1zWwiArlHuQKB4=;
 b=oE18FL5VHgWbAyFFPmov6vtUa2bJMuC11GB5JkjqW5Jbxj5zElsvEwPG3/jfgpGril
 sU765Y44rdBYa/ZdV8iEWAjAlOTGJDjgJU6ETrgQN2FtXa8d0aNNxrSgP9aKzK/WON32
 SXYO4NvV9d+EIy/sRuP12o5/8uFIe3JL+ymGBB1Th+Wb2I6tktZ4iL9ZjNlE/ZWywjnJ
 5Nzel8/OpcJfUehfvc4608imKFJPHvlhGvINes/oG3ffGDfsQyzinHw3EgKcpc+V0pUX
 JfpokARIyT7U4VLHXyBIJWl2E95Tt06WUUNhJkvOwlWkyGOMwobjegTRC5ZzwYBotfI5
 XceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SJJG9l0YlRpzRi2ic2wvRcjJj5ylm1zWwiArlHuQKB4=;
 b=pYRVCHtSam6Bp4ZCj2FKKPAB8aY5U+TxMN1frNobzEW7QSuQbbyTlNkmeSvnB5Vm7O
 owREPJRXmG12kO3rF/RWosyfH5LTvyT/omRihuYzxgsgZai1WX6MybcUL4GOUxAWtqAo
 OmQYe5gLL2SGCG7jywAz+pV9cOYW5mM65SpJ7eTFAGmbfgpd7uHQNV8uzE9+xslpJg+T
 F1SxBgavqoyEVIVWheDcAYHnCBijzSNC4e1qsSTT1PugUrnKwg1c1D1MNQTnmSexxezw
 0ijLaq6qFMLIz460UQa+M5sLOAADM7i5qJGVOHqKb/g4GaoDNymhL4MTNlVO58gh+V1Q
 EUMg==
X-Gm-Message-State: ANoB5pk/cjC6OqEMxEUKOyjHgkc9FGd4qY1A9/wY4ezXLYuVa5qM/7/x
 e1uNqxzi+LHqwDdRjYpk2ep9ZA==
X-Google-Smtp-Source: AA0mqf5VMxacEh78UTA0ugozKyhHLdY0czdV10scTdiqL1kFIrv/uHrklnqc9O5/QBvdoMRdoDoQlQ==
X-Received: by 2002:a05:600c:21c6:b0:3c7:19a6:8146 with SMTP id
 x6-20020a05600c21c600b003c719a68146mr11903688wmj.158.1669017602975; 
 Mon, 21 Nov 2022 00:00:02 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 y8-20020adfee08000000b0024194bba380sm10448991wrn.22.2022.11.21.00.00.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 00:00:02 -0800 (PST)
Message-ID: <8afd5100-9cef-50bd-2b53-e1a550973835@linaro.org>
Date: Mon, 21 Nov 2022 09:00:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-4-bero@baylibre.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221121015451.2471196-4-bero@baylibre.com>
Cc: khilman@baylibre.com, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/9] dt-bindings: pinctrl: mediatek,
 mt65xx: Make pins-are-numbered optional
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

T24gMjEvMTEvMjAyMiAwMjo1NCwgQmVybmhhcmQgUm9zZW5rcsOkbnplciB3cm90ZToKPiBEb24n
dCBsaXN0IHRoZSBwaW5zLWFyZS1udW1iZXJlZCBwcm9wZXJ0eSBhcyByZXF1aXJlZAo+IAo+IFNp
Z25lZC1vZmYtYnk6IEJlcm5oYXJkIFJvc2Vua3LDpG56ZXIgPGJlcm9AYmF5bGlicmUuY29tPgo+
IC0tLQoKQW5kIGhvdyBhYm91dCBtYWtpbmcgdGhlbSBkZXByZWNhdGVkPyAoZGVwcmVjYXRlZDog
dHJ1ZSkKCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
