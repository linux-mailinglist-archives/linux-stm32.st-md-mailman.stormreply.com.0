Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AF76C0554
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Mar 2023 22:16:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD449C6A5E7;
	Sun, 19 Mar 2023 21:16:21 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DE27C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Mar 2023 21:16:20 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id j7so10869708ybg.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Mar 2023 14:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679260579;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=umIKUZ29cWxRGLpplScGRMR85hsAlE3Adfx/LlasVhM=;
 b=CPgf7pIk/Lnkd8dmhIq8WFWJ6BLyq6+kGzIfKmtwXfzlt6kxOq+vyAL8X4bCK1iR3Q
 iI3bTgb55U+aMHk1J0DgzxXKaavtjILeOujbhHokL2gZ/DGhvklPkLQorKzCM8cKXNSX
 mH8IdtmZzoE0UjJlfkmvQ5ZzynMQW3xYlqNCjEGJbb5nfq6GYkbuiRcPcc3AutwclR21
 FSxDUsCtHWw9ulreB79I49s9OO/yykd220i5H/7eLfkuJeFqCB78ZslFFxwGWUtQIAMu
 7ttFNZM+NUfJoUwRduR6Iu0sohA7gqSwv+/dkMrlBLqqPMcaBKKmLc3GgvjMI3QRK3fD
 JC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679260579;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=umIKUZ29cWxRGLpplScGRMR85hsAlE3Adfx/LlasVhM=;
 b=FamMfLr2ciwbw8RGBHG480em1lgDXZJRIn8u/sbKayWGTMu2oTw5GDIPnUzKnPAOw5
 Cd5/tnsrsOUPrgMW7uVwHFMicZwEFmC5ztq0g38F47P7MMq8M1fENtNDOJV7F1wUgeD8
 dAEHseMiwWJ/yTlGiDn2Q/0WaLZ+Kgh+91dMcbyF9RyFDw+XdU1vPvYw5g6r1bmaxAe5
 DS6WpgUjDohNegCkZyMQ8iN24VDAUx+uKAAtQqorNikvUhj+NVC7e3cc5lEi7mucKIS+
 bwcWJB6TbNXDd36ovqlRIZvWJcMZ1Ws13/1XYMOt2qV6yQo0NHd7ZZyY/bIWfZA712WT
 bpHA==
X-Gm-Message-State: AO0yUKVV5tKCdynPqYW3ZVT4eCPDtmicJew49til9Z4wGaWMqq0Yq0SN
 1Hx6E7kBDoWKECsiaudC9vs6QQ+atcBD4RBwiA89UA==
X-Google-Smtp-Source: AK7set/LQSqDHQohlcpzt0xizcE65fZwUUP3xQclwBlvRoXqfTwlv5UpIYbuGW13MOMcV9w5zxaHwatEJucTRxSnE5c=
X-Received: by 2002:a25:9786:0:b0:b61:14c8:90fd with SMTP id
 i6-20020a259786000000b00b6114c890fdmr4033253ybo.4.1679260579212; Sun, 19 Mar
 2023 14:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230317233634.3968656-1-robh@kernel.org>
In-Reply-To: <20230317233634.3968656-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 19 Mar 2023 22:16:07 +0100
Message-ID: <CACRpkdbn=B1O2AyOq9DhgQ4Kw-mSytkj0rpJCKVGC51_rTeAHA@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
X-Topics: 
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rtc@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>, Samuel Holland <samuel@sholland.org>,
 openbmc@lists.ozlabs.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: rtc: Drop unneeded quotes
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

T24gU2F0LCBNYXIgMTgsIDIwMjMgYXQgMTI6MzbigK9BTSBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKCj4gQ2xlYW51cCBiaW5kaW5ncyBkcm9wcGluZyB1bm5lZWRlZCBxdW90
ZXMuIE9uY2UgYWxsIHRoZXNlIGFyZSBmaXhlZCwKPiBjaGVja2luZyBmb3IgdGhpcyBjYW4gYmUg
ZW5hYmxlZCBpbiB5YW1sbGludC4KPgo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+CgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBs
aW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
