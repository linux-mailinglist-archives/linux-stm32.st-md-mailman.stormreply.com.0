Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DA0752193
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jul 2023 14:47:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 092BFC6B452;
	Thu, 13 Jul 2023 12:47:25 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54DF7C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 12:47:23 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8ceso5795345e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 05:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689252443; x=1691844443;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BQ3qFqjqaXg+xhPM/OfBCqCifetSEr6v0qh2wFRe3uY=;
 b=i92G8JKNvparwYPbnBagAXWtkyNe6OrAoGY9MTlkldD3dcYsmXZ3Bt9jlIdwM2BXw8
 y7VwQuUjzVfo2hn/Z4OmMX5D4XvCfjpmVWf0+sN7AhHmbLD1K7WWAcxUskC/EWIteL8z
 pgwUmWYhX8oZBy3/z3S3eTV3rj9qdeF+eLnSaryryK2Fn2XtSu1bcxYL6zRfHFZcWQbj
 o95SzvzKnzTUxrsIQTRwhPZDtDeOX3bI0wN+8BVAJtYu5K496kx8UGOBm5TXXoXPyfxj
 ahgWHaBBmBLhBgcffwYFyZzltxlkgbx/Ofx9KG2EfQV3SNejzzzEUu1cmN1xW095yUcD
 p+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689252443; x=1691844443;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BQ3qFqjqaXg+xhPM/OfBCqCifetSEr6v0qh2wFRe3uY=;
 b=dX6MYWKgvzmKj56/F5bmUkGTAOyHxNKk54/0IvXvC8U4jQq0mQiVTkoogBG3CRFxu7
 OzcBwjhfSG31Bapu6Zm5qhLUc0ELLXmLGLc67OwAHK6rigb7+XtOiZGjmB41/SZ8lq0O
 ha/UuKJImWBBGUEhpUVn0unw4x4roe3j2rzTRgOuSKRC+RN2mgj93Bfx1cpmKRd6Pabl
 r5gJyDok8F/kxzdlvDCfx/l3gV2/NyFb2tV5QsxJB37bfTCl//rUjzVME9yf6m0QLcbK
 GZuMz8TWYYqmbQv+SLa/4E3VezDRe0OATTqgRL/BfkehQ76nx9BhuSNeNZabTAUAWr3S
 w1hQ==
X-Gm-Message-State: ABy/qLacNmvOZVr7/tU7ZBi1fcDr7aEehtPSxF1RMv1qZGd5d4DIk3QR
 kN5RB0ZlrmkNI16UgKcJGE7rLg==
X-Google-Smtp-Source: APBJJlFv2JV2cNu6AAcxonI8NW8JRqwtxih4OqWDpmqP+QB4MCgD6qwhTqxWsmWLF+OTALNCxkZ9hQ==
X-Received: by 2002:a7b:cd95:0:b0:3f7:3699:c294 with SMTP id
 y21-20020a7bcd95000000b003f73699c294mr1277212wmj.29.1689252442663; 
 Thu, 13 Jul 2023 05:47:22 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
 by smtp.googlemail.com with ESMTPSA id
 fa16-20020a05600c519000b003fbb1ce274fsm5488171wmb.0.2023.07.13.05.47.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 05:47:22 -0700 (PDT)
Message-ID: <2ddb2042-a654-bc60-2060-b21e3acd6f31@linaro.org>
Date: Thu, 13 Jul 2023 14:47:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Marc Zyngier <maz@kernel.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-3-fb6ab3dea87c@linaro.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-3-fb6ab3dea87c@linaro.org>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>,
 linux-oxnas@groups.io, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 03/15] clksource: timer-oxnas-rps:
 remove obsolete timer driver
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

T24gMzAvMDYvMjAyMyAxODo1OCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gRHVlIHRvIGxhY2sg
b2YgbWFpbnRlbmFuY2UgYW5kIHN0YWxsIG9mIGRldmVsb3BtZW50IGZvciBhIGZldyB5ZWFycyBu
b3csCj4gYW5kIHNpbmNlIG5vIG5ldyBmZWF0dXJlcyB3aWxsIGV2ZXIgYmUgYWRkZWQgdXBzdHJl
YW0sIHJlbW92ZSBzdXBwb3J0Cj4gZm9yIE9YODEwIGFuZCBPWDgyMCB0aW1lci4KPiAKPiBBY2tl
ZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+IEFja2VkLWJ5
OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IEFja2VkLWJ5OiBEYW5pZWwgR29sbGUg
PGRhbmllbEBtYWtyb3RvcGlhLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8
bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KPiAtLS0KCkFwcGxpZWQsIHRoYW5rcwoKLS0gCjxo
dHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2Fy
ZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20v
cGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3Jn
PiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
