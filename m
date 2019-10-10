Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68906D3104
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Oct 2019 20:58:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EFCFC36B0C;
	Thu, 10 Oct 2019 18:58:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D86AC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2019 18:58:43 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 03A76206B6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2019 18:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570733922;
 bh=C3qJQMyjD9A/GMvJ52P6U8GDKE7BNVgB4aq0nJUK3Tc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=x9hnp5Xo4bB1M1JWF8/BAZab4UX1ziPUvnFgk/cPG/ZALiC2ezbfWSIK9WfrWnqxU
 Be8N6AeS7oihMOahkrPHOI0whlDuASFXutW+vuKo6b1R/NAzZ/WsV5JfutdIEk6dPX
 j9KYoQjQg6HQBC03nBIRN41NzOebPx9rSvB/Ja9M=
Received: by mail-qt1-f181.google.com with SMTP id o12so10266556qtf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2019 11:58:41 -0700 (PDT)
X-Gm-Message-State: APjAAAWAnY/JUEFAcrC9Gw4d3ttYzFcyzyZcUi36C456H2jOBu4Eo6wZ
 A4Md2fAoH2JGAnN9aT2sEd18f1kwpsos3jeW/Q==
X-Google-Smtp-Source: APXvYqzB5TzRKwoOcFcNVQukkGMmMU2iFIhyKCekwRBNJHWn3GTHP/CmHznLTqw+AnmCr8x0PiE1VBXV/9mGgldc2YU=
X-Received: by 2002:ad4:5044:: with SMTP id m4mr12009044qvq.85.1570733921147; 
 Thu, 10 Oct 2019 11:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191002164047.14499-1-krzk@kernel.org>
 <20191002164047.14499-2-krzk@kernel.org>
In-Reply-To: <20191002164047.14499-2-krzk@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 10 Oct 2019 13:58:30 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Fa1+epSvDpSx4NdzOUohoJR+qR3-xyMTTw4LaOK7AbQ@mail.gmail.com>
Message-ID: <CAL_Jsq+Fa1+epSvDpSx4NdzOUohoJR+qR3-xyMTTw4LaOK7AbQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-clk <linux-clk@vger.kernel.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 2/2] dt-bindings: pwm: Convert Samsung
	PWM bindings to json-schema
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, Oct 2, 2019 at 11:41 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Convert Samsung PWM (S3C, S5P and Exynos SoCs) bindings to DT schema
> format using json-schema.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Changes since v2:
> 1. Add additionalProperties: false.
>
> Changes since v1:
> 1. Indent example with four spaces (more readable),
> 2. Fix samsung,pwm-outputs after review,
> 3. Remove double-quotes from clock names.
> ---
>  .../devicetree/bindings/pwm/pwm-samsung.txt   |  51 --------
>  .../devicetree/bindings/pwm/pwm-samsung.yaml  | 109 ++++++++++++++++++
>  2 files changed, 109 insertions(+), 51 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-samsung.txt
>  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-samsung.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
