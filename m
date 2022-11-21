Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 018CE63223D
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 13:35:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9A70C65065;
	Mon, 21 Nov 2022 12:35:25 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D117BC6504A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 12:35:24 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id c1so18611428lfi.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 04:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vffrhK9Te14ot6nrYXwRIs5s8kqJmNUxCSUFhBsYZp0=;
 b=IdjFTWo+w7W5Kqok9Bj6Sg9Mynfi5Qr/hfkjR0FhAtf1kq+nVcXgiGMQE1bAxE/xuY
 9+s6dWhb8EOV9i0+3j0XYvPIOpRymM1ulkucc1SiruWu71tGr+XHhh0d0EE/J1aNMLkF
 CVOuAU/h6vyI3M0iSXxfqtlnAKUTgwD7xL3Ms017hU1PkrpMNH/mRo/YceeeFdSfEPh/
 jRa04svBQA1FEnXywXPtF5Nt5AZU2MKBoHiWCik2zWGHM0zkecOhni7MfvBlTCl/8Hav
 ccrguLTqYxxmyJJ7+BjdkyqRlr2GwOmPhIPG7yV2WSpH/siApqF1+7xELNwc5IhKoLWz
 4C/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vffrhK9Te14ot6nrYXwRIs5s8kqJmNUxCSUFhBsYZp0=;
 b=EDV2lBX7g+009PPAIgM1g4W3zdR+IWeJAkoj3pCgevxFksLP1lKKjSHVPgf/Wn3z4u
 S65XeNuC/YuW5CXDHKILV1Ypgc9abJFCN/RcVBvbyjBTfig4ApjnbFnzvoK8UvE0fbcd
 2ipLX3ZYE7UnM1zXXsDnItabnpP/jaHaXoPZwl7/ph5Kq9sIKG7P0aXkcoUpYa6pBtv2
 VUke1QEWdddtl+uBIh59t7vM18x++igiBEd3uPjbS/DI/ZvgBdW5CzxToG3ZspijDuKG
 7XVnh3NOsa+zf/My0/FCbFiTMDvDHiWxg4c/DB6y8qx6A8HCQVgMonH72dWnadTOssbv
 R/NA==
X-Gm-Message-State: ANoB5pnD5AdY19Dj221pMvXa9YGEhma/y0LELa/Da7Mp5r2zaiYe0qRo
 cXKZHhKiKnlcCLlnqvMt2wcOBA==
X-Google-Smtp-Source: AA0mqf4gmSRKmaoGoiytSGboomRjNdwUktarWK9tIMFu4H+Qm4luOiIDR+475AFqNgf6pDTMP86Nrw==
X-Received: by 2002:a19:7708:0:b0:4a2:6b44:d742 with SMTP id
 s8-20020a197708000000b004a26b44d742mr6536562lfc.191.1669034124151; 
 Mon, 21 Nov 2022 04:35:24 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a19ca4e000000b0048b0696d0b1sm2009320lfj.90.2022.11.21.04.35.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 04:35:23 -0800 (PST)
Message-ID: <b07930c1-6ce8-3fa2-aa54-134aad673ebf@linaro.org>
Date: Mon, 21 Nov 2022 13:35:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-2-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221121015451.2471196-2-bero@baylibre.com>
Cc: khilman@baylibre.com, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMjEvMTEvMjAyMiAwMjo1NCwgQmVybmhhcmQgUm9zZW5rcsOkbnplciB3cm90ZToKPiBSZW1v
dmUgdGhlIGNoZWNrIGZvciB0aGUgdW5uZWNlc3NhcnkgcGlucy1hcmUtbnVtYmVyZWQgRGV2aWNl
dHJlZSBwcm9wZXJ0eS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCZXJuaGFyZCBSb3Nlbmtyw6RuemVy
IDxiZXJvQGJheWxpYnJlLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3Bp
bmN0cmwtbXRrLWNvbW1vbi5jIHwgNiAtLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRp
b25zKC0pCj4gCgpGV0lXOgoKQWNrZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRv
Zi5rb3psb3dza2lAbGluYXJvLm9yZz4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
