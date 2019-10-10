Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F6BD3348
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Oct 2019 23:23:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50422C36B0C;
	Thu, 10 Oct 2019 21:23:49 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DA20C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2019 21:23:48 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id s22so6185960otr.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2019 14:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8fsaLFcYDAROH9HBoKC5Vafqp1MCH4HA/pJSglSZ4co=;
 b=e8tYsaOae1Euei70xhyB+wBNeQhcHIE8S7dQ8nHueYdwMt5eouzG4uEP6ykCzJY5va
 uYO+rnFBxNtnPPRif09wK5QM0xz83CFtUT03AQ7oS2U/NHeV4kc9NS00UZGpFotoCXLn
 86CkCqKbUwPzmGMucgtIZRHy+bDDeBvoOKfgVq++qckswX4Fr/UlJGC6AXhcDZlBh/80
 Pnhsfu0/iGy1wEgETFTqJerU1mrAimCHcc+dlucUwe0QtnejEfMf7bhdN+1nakk195rx
 P5Hz4ELc1LQokbL/TmC1VDb4h8oa7/sdn7EsccGoKRMyFtKrQksHyW5AKzZLKPrp8+pq
 6nzA==
X-Gm-Message-State: APjAAAWa2FTh9UtMTr65Z7SNjot9S43fvdIB3Zy7D0nmSAFDc2/+SUWZ
 GdL0j9fgq11CV9TU0gmR9w==
X-Google-Smtp-Source: APXvYqyIyxVe/QML8xBJW19srjEWY1fzMm01BIPfEyxogOHEBtnRrO0q0z3M7piA63qkH2laitZG7g==
X-Received: by 2002:a05:6830:13d8:: with SMTP id
 e24mr9348918otq.42.1570742627232; 
 Thu, 10 Oct 2019 14:23:47 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v132sm2027358oif.34.2019.10.10.14.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 14:23:46 -0700 (PDT)
Date: Thu, 10 Oct 2019 16:23:46 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20191010212346.GA7896@bogus>
References: <20190918173141.4314-1-krzk@kernel.org>
 <20190918173141.4314-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918173141.4314-4-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, linux-pwm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, Matt Mackall <mpm@selenic.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 4/8] dt-bindings: memory-controllers:
 Convert Samsung Exynos SROM bindings to json-schema
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

On Wed, 18 Sep 2019 19:31:37 +0200, Krzysztof Kozlowski wrote:
> Convert Samsung Exynos SROM controller bindings to DT schema format
> using json-schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Indent example with four spaces (more readable),
> 2. Split examples into two,
> 3. Fix pattern for subnode name,
> 4. Remove checks for #address-cells-ranges-#size-cells,
> 5. Add "additionalProperties" so the wrongly named subnodes would be
>    matched.
> ---
>  .../memory-controllers/exynos-srom.txt        |  79 -----------
>  .../memory-controllers/exynos-srom.yaml       | 128 ++++++++++++++++++
>  2 files changed, 128 insertions(+), 79 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/exynos-srom.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
