Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC76C577E83
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Jul 2022 11:20:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0649C0AA15;
	Mon, 18 Jul 2022 09:20:49 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7BE5C03FDA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jul 2022 09:20:48 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id x91so14413654ede.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jul 2022 02:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ekBvsCl8tLKRAhRxJqGXywTj2TNw0INMK1oBW7njZa8=;
 b=lUrC2exnFGAMhW9f1cEy3vN207RjeJWPpUMpCBlmirV9EVbL/aNuqLBe/50KhjVkJ2
 hci7HW+DoU6ROue1ds2Cw8EMPXd1OBACzPk9FHyAnk9Jwj1sJ5D/b5UcwaW8R7dl7bDz
 F2Umx9nNeoiMxxjr+/38cAf80XT/CQq8QwNdiJ7FpWCZWsTQ/cjk0p/0Bj1rHT2c1hEr
 N1gko1IQ39qLTWzkYTwnYJWyqcDTeuHm//NB665cMKDA/XpQcv1JZwO77gA4v86zow7F
 A2q9kak+EdVfAcSpam69LoeGeUr9gcuWSK9V+f102ohM89YS2klSmp6eOQykdZwzMY9X
 IFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ekBvsCl8tLKRAhRxJqGXywTj2TNw0INMK1oBW7njZa8=;
 b=xwN0qcENpSpKHQy9o78upeQVcpMQF05lVO2YVM/3p0YYvTZO3JvnHKlILQkPCgrjUA
 4eLiD2qeS/CdC0MTe/UWgfjWdVzxQnlltHmr/sagw5UibHzS2DkpKAwI8Zylp/cAlCpe
 rIx0+DoYNA2Tz1eNuak9NtfPUQhFQUcUpjogKq2lfyAMpI+fWGmBF34phQZyQZLpfsck
 NahEPzOa28dWI3knLmQKOBDgOW/0YlPrmkJwq9BK2mSEgDW+cLF468BCeZWN6P9/qJ+U
 2tJH3/z1kzJTMrlWZXOMOtwUmCYB1f8jRyyWKm80PicL35xCnhgoJW8x/neO+HFNv83u
 +wKw==
X-Gm-Message-State: AJIora/L4aE/uBJU69pVzUQlqKVgaYOcZ8eBsfNB8m43mPJ7sYRlR7Kp
 Jcteb8GyiUENKLrG6aTFhFn3n0iE9Cb9z5c0Lf4AFw==
X-Google-Smtp-Source: AGRyM1sKDeO3oY5retnedorjemb+XBD4ir+Vd2E8sIvSAqj2LxUEW9bOClUAgOnVKsx44I+9jjPR1B3irrU2VJnyqoU=
X-Received: by 2002:a05:6402:3307:b0:43a:826c:d8b4 with SMTP id
 e7-20020a056402330700b0043a826cd8b4mr36456660eda.32.1658136048498; Mon, 18
 Jul 2022 02:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220712163345.445811-1-francesco.dolcini@toradex.com>
 <20220712163345.445811-3-francesco.dolcini@toradex.com>
In-Reply-To: <20220712163345.445811-3-francesco.dolcini@toradex.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Jul 2022 11:20:37 +0200
Message-ID: <CACRpkdbSVOR6RA5Ji4qQm2OvMPjHHbe=hM5a6cv9M4tb21LALA@mail.gmail.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/5] mfd: stmpe: Probe sub-function by
	compatible
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

On Tue, Jul 12, 2022 at 6:36 PM Francesco Dolcini
<francesco.dolcini@toradex.com> wrote:

> Use sub-function of_compatible during probe, instead of using the node
> name. The code should not rely on the node names during probe, in
> addition to that the previously hard-coded node names are not compliant
> to the latest naming convention (they are not generic and they use
> underscores), and it was broken by mistake already once [1].
>
> [1] commit 56086b5e804f ("ARM: dts: imx6qdl-apalis: Avoid underscore in node name")
>
> Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> v2:
>  - remove define usage for compatible strings
>  - moved rotator removal from probe to a separate patch

v2 LGTM
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
