Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C80F23BC6C
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 21:06:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91990C6DD6C
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 19:06:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D09EC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 19:06:09 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B11CA2145D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 19:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560193567;
 bh=lFanuHHBuVtWmR4kNCQeWkLeEoh91z4m5hAe5ZQ4DbU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=malhWk+aXGmFn7xlbapoaYjAsgdVnmFbzkgSvGw0kc+GIQJrOplOwNsMHPji8gIzL
 dSSjOwoaDHOK2hUN7pN5pqmYOIZ8ZTayZAst9xcPOz2gJ41J9s7/ZObABpcRBXNTXP
 Fauk2eleAbfyMWXdGZn0KuOXVaNS0khxSXsxHViQ=
Received: by mail-qk1-f175.google.com with SMTP id s22so6114132qkj.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 12:06:07 -0700 (PDT)
X-Gm-Message-State: APjAAAX91/kZf4F77aEYlnLMEw1I2H/joKnMQEZhc5HvKVnk64yBDxC/
 rZXPhOIXozKmq+zi/hktGN+Lx30j4m3olbY9IQ==
X-Google-Smtp-Source: APXvYqyqk00u+A1I2mS4USQPJYej70C5KhglxD5XOZevDO5oC+8Y4Q68pL8HBKtqIMa/xiZnnWfM+2EIi1Wpb/mCRBA=
X-Received: by 2002:ae9:f801:: with SMTP id x1mr14400814qkh.151.1560193567005; 
 Mon, 10 Jun 2019 12:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
 <19f160b6edf5a11171cea249305b7458c96a7187.1560158667.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <19f160b6edf5a11171cea249305b7458c96a7187.1560158667.git-series.maxime.ripard@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 10 Jun 2019 13:05:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJtzBwx57_EHwCrSpiFwve8ec2osK0ZXc_cMzD+5dW7FQ@mail.gmail.com>
Message-ID: <CAL_JsqJtzBwx57_EHwCrSpiFwve8ec2osK0ZXc_cMzD+5dW7FQ@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev <netdev@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 04/11] dt-bindings: net: phy: The
 interrupt property is not mandatory
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

On Mon, Jun 10, 2019 at 3:26 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Unlike what was initially claimed in the PHY binding, the interrupt
> property of a PHY can be omitted, and the OS will turn to polling instead.
>
> Document that.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/net/ethernet-phy.yaml | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
