Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96480CADEC
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Oct 2019 20:16:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3ED6DC36B0B;
	Thu,  3 Oct 2019 18:16:04 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52B13C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Oct 2019 18:16:02 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D6F22070B;
 Thu,  3 Oct 2019 18:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570126560;
 bh=nY0LFXVk/SNSsj/nGuYEk8lLimBHZ/kip/5QktLE30M=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
 b=2gRfkDNay4GQ8GVL40xt/FVRFNW/T6303w/jbXj7QQJVtdz7LzvfbC54mYR4mS8r6
 KQrbne3Qg2j5ZURd8qpfR/Rh1gEJ2uKXn/h1RYTKEuhbn9SwE6Q8jFz72JIOLIqf2W
 RxAgIOfeWXuJqXwwCg4HHAy4gJrGQtAqfIWHrd38=
MIME-Version: 1.0
In-Reply-To: <20191002164047.14499-1-krzk@kernel.org>
References: <20191002164047.14499-1-krzk@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
User-Agent: alot/0.8.1
Date: Thu, 03 Oct 2019 11:15:59 -0700
Message-Id: <20191003181600.7D6F22070B@mail.kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: pwm: Convert PWM
	bindings to json-schema
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

Quoting Krzysztof Kozlowski (2019-10-02 09:40:46)
> Convert generic PWM bindings to DT schema format using json-schema.  The
> consumer bindings are split to separate file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. Change also pwm-sprd.txt
> 
> Changes since v1:
> 1. Indent example with four spaces (more readable),
> 2. Change pattern for pwm nodes,
> 3. Remove $ref from #cells.
> ---
>  .../devicetree/bindings/clock/pwm-clock.txt   |  2 +-

Acked-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
