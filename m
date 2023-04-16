Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB926E463A
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Apr 2023 13:18:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CB72C6B456;
	Mon, 17 Apr 2023 11:18:34 +0000 (UTC)
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F167C6B446
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Apr 2023 19:00:23 +0000 (UTC)
Received: from [192.168.100.237] (cust-58-62-110-94.dyn.as47377.net
 [94.110.62.58])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: sander@svanheule.net)
 by polaris.svanheule.net (Postfix) with ESMTPSA id 31B6A3A3B6B;
 Sun, 16 Apr 2023 21:00:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
 s=mail1707; t=1681671620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KbiAlrrOOyRd9nSswntO2EM/kuhEbC2Dui2D0jg8mhE=;
 b=yJTuA2IM1/ouSfmFU4g81QYz/Qs036N+Xgao0Ath/i9vW1OlzLPaQPSs5Z/cwJgY+mB5Yt
 9frXAammof4cYeKT3YVKBBWuJmf5TlBYeZdPZpxvHm/UkuLToAfxBulAuQ/nfQnJU4gl/N
 knaWX+2Bmwu0hShO8EBylOfwdt4HsidJ6JVG8BFAGRPK8fnJHUS7eltyRhN2MTg3ab2WE1
 UgpwApF4MwfWTnKCtGazcW0/+MWrMm5ofGGKOhMMnVk7OADQ+R6e9jhHvt6dGh4OC2H0oK
 b9tPCUEGwBSgAzSOzEjLJfpJWZ4oWq8P1U6FwFMzQAju74a9ESqS7tOiZHvUhQ==
Message-ID: <75148300a158ceb0f86043535b089838e1d1bb61.camel@svanheule.net>
From: Sander Vanheule <sander@svanheule.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Julius Werner
 <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@microchip.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>, NXP Linux
 Team <linux-imx@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy
 Gross <agross@kernel.org>,  Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Nobuhiro Iwamatsu
 <nobuhiro1.iwamatsu@toshiba.co.jp>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Fu Wei
 <fu.wei@linaro.org>, Viresh Kumar <vireshk@kernel.org>, Eugen Hristev
 <eugen.hristev@collabora.com>, Justin Chen <justinpopo6@gmail.com>, ?ecki
 <rafal@milecki.pl>, Linus Walleij <linus.walleij@linaro.org>, Corentin
 Labbe <clabbe@baylibre.com>, Anson Huang <Anson.Huang@nxp.com>, Robert
 Marko <robert.marko@sartura.hr>, Sergio Paracuellos
 <sergio.paracuellos@gmail.com>, Sai Prakash Ranjan
 <quic_saipraka@quicinc.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Jamie Iles <jamie@jamieiles.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, Christophe Roullier
 <christophe.roullier@foss.st.com>,  Shubhrajyoti Datta
 <shubhrajyoti.datta@xilinx.com>, Srinivas Neeli
 <srinivas.neeli@xilinx.com>,  linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,  linux-renesas-soc@vger.kernel.org
Date: Sun, 16 Apr 2023 21:00:17 +0200
In-Reply-To: <20230415095112.51257-6-krzysztof.kozlowski@linaro.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <20230415095112.51257-6-krzysztof.kozlowski@linaro.org>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Apr 2023 11:18:33 +0000
Subject: Re: [Linux-stm32] [PATCH 6/6] dt-bindings: watchdog: realtek,
 otto-wdt: simplify requiring interrupt-names
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

SGkgS3J6eXN6dG9mLAoKT24gU2F0LCAyMDIzLTA0LTE1IGF0IDExOjUxICswMjAwLCBLcnp5c3p0
b2YgS296bG93c2tpIHdyb3RlOgo+IFJlcXVpcmVkIHByb3BlcnRpZXMgc2hvdWxkIGJlIGxpc3Rl
ZCBpbiAicmVxdWlyZWQ6IiBibG9jay7CoCBTaW5jZQo+IGludGVycnVwdHMgYXJlIGFscmVhZHkg
dGhlcmUsIHRoZSBkZXBlbmRlbmN5IG9mIGludGVycnVwdC1uYW1lcyBvbiB0aGUKPiBpbnRlcnJ1
cHRzIGNhbiBiZSBzaW1wbGlmaWVkLgoKTWF5YmUgSSdtIG5vdCByZWFkaW5nIHRoaXMgcmlnaHQs
IGJ1dCBpc24ndCB0aGUgZGVwZW5kZW5jeSBzdGF0ZWQgaW4gdGhlIGJpbmRpbmcKImludGVycnVw
dHMgcmVxdWlyZXMgaW50ZXJydXB0LW5hbWVzIHRvIGJlIHByZXNlbnQiPyByZXNvdXJjZS1uYW1l
cy50eHQKZGVzY3JpYmVzIHRoZSByZXZlcnNlIGRlcGVuZGVuY3kgKCJpbnRlcnJ1cHQtbmFtZXMg
aXMgb25seSBtZWFuaW5nZnVsIHdpdGggYW4KYXNzb2NpYXRlZCBpbnRlcnJ1cHRzIikuCgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lA
bGluYXJvLm9yZz4KPiAtLS0KCkluIGFueSBjYXNlLCBJJ20gT0sgd2l0aCBhIGZsYXR0ZW5lZCBy
ZXF1aXJlbWVudHMgbGlzdDoKCkFja2VkLWJ5OiBTYW5kZXIgVmFuaGV1bGUgPHNhbmRlckBzdmFu
aGV1bGUubmV0PgoKCkJlc3QsClNhbmRlcgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
