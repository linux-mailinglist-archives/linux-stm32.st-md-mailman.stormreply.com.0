Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79930928BEB
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 17:40:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1774EC71282;
	Fri,  5 Jul 2024 15:40:17 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EC0CC6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 15:40:10 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-36786081ac8so1069949f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jul 2024 08:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720194010; x=1720798810;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rWJsmVbnxMDiuFLY+fOlqn//TXBBmUogobIIxAviZlc=;
 b=SLQuUbtw1CBkgO+i/DyP9vsLn++rztjl/qkEcv6SIWjzYdjGSGrg+Vmz94YRMO8UOP
 K5w4iB/rmLk9Mum/boO4qKB4ZWTpiUtvZ7x7sF/5ebLnDtX6EyFb0XJNWe1vaSRyS5IS
 Abw42Wpxw06/PfPHee9aQfhtUW+J1LefqGQM5UqkdDO9K6Rsz+giXY0FfJ3ORqBbDAZy
 dhVnbv1XZX9FCrX6T2OA7xkE1zdbxbsFD7divmJV3dWq8zOdtQtPn5JonvjENOb2yJRd
 Vd3/qiRf5UF7F8kGlGT/p5y02Fr6EOJ0dQwS2qRmXD5fvmbepd7F0L5x49q+Li5RM8xj
 /y6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720194010; x=1720798810;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rWJsmVbnxMDiuFLY+fOlqn//TXBBmUogobIIxAviZlc=;
 b=MGwVC0Pr0PPlmrquO6yNzWcfI0GBOj6o3UA6lgwXbZML3oK3zOZAF3vafra401c8BN
 Z+YvVnuGhmLODsVY9oCkVm7RdXRYl6pUKL17D3TcNHdaDdan8/t/JyhVjwZcK/L6Gycq
 KXWWKqmO8GXEerbJtMQYo4+QVNSAwjbUKBptiUbfPlPPQ6fHo10tth7JRo0nFWWbewiP
 94qVuImke12UscX2fkx4f3MtQA6HYeOwAKIPt37yFuujFOZ8LTgQT44cpcXsP73pS+HY
 sz5T7JG+CSokqSfy1VzmDPY5GOkyN81m9+z0MMqz3ZH4DTJNcGBPUbXgM0ErcQBqf99L
 +VnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKBUXREBrtDz65/+sM9GWNiPx3Ivl1ZiyQokaN/OrirBJbhsu+cw4ldpZbx9oIG/oOPCuGgNsfL7JKkl2yvDLXVTNC8Oh4zy6KAATnrbVA/yYyXJEnwJix
X-Gm-Message-State: AOJu0YwyCP87RARgK0Dg5MLTbgraWHeaOKPHVzjCARE9H8lh/og9MkIT
 agnJ4TS+X981Ns13hNLklEhTpO+YiSwDeneHqF5LLQvpOVZ8T7/4LWyPfEYRzbw=
X-Google-Smtp-Source: AGHT+IFZ5tZcHjh9afQQV6N+UDpsdiCgwUbQuOPcHUbDQTq2FuqnU3hsZXAXDh/UpS3fDJuMgQV8qw==
X-Received: by 2002:adf:a18f:0:b0:366:f469:a8d with SMTP id
 ffacd0b85a97d-3679dd35e71mr3543623f8f.35.1720194009828; 
 Fri, 05 Jul 2024 08:40:09 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0?
 ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-36795d1fc9csm6559538f8f.83.2024.07.05.08.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jul 2024 08:40:09 -0700 (PDT)
Message-ID: <c7c78d7d-c920-415f-b97b-c3b7c61eb9fe@linaro.org>
Date: Fri, 5 Jul 2024 17:40:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Fabio Estevam <festevam@gmail.com>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
Cc: imx@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>,
 Amit Kucheria <amitk@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Linux-stm32] [PATCH RESEND 00/22] dt-bindings: thermal: few
	cleanups
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

T24gMDUvMDcvMjAyNCAxMTo1MSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBIaSwKPiAK
PiBSZXNlbmRpbmcgKHdpdGggYWRkZWQgdGFncykgYmVjYXVzZSBwYXRjaHNldCB3YXMgc3RpbGwg
bm90IGFwcGxpZWQuCj4gRGFuaWVsLCBjYW4geW91IHBpY2sgaXQgdXA/CgpBcHBsaWVkLCB0aGFu
a3MKCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZh
Y2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8j
IS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9n
Lz4gQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
