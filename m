Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0D44768A3
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 04:23:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEC47C5E2C6;
	Thu, 16 Dec 2021 03:23:48 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D021C5E2C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 03:23:47 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 v15-20020a9d604f000000b0056cdb373b82so27376020otj.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 19:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tu2NGSrgJfVwTrxV5gAyRVtFDdQnC1eWVUu1iP8zEN8=;
 b=BlF8OZZXcAlTD9yavJ/2Edp4bspRnEAudkBYiMjp27yXG0WM3UUR+WX7lrDx86g/r1
 1cF4LKNGY4eWGWN1q/+PQI32Xz/2UD9dyaH00o1Bz4yMSYof1gowQ25Tve05nMhwtSon
 wop7AtGlpomNS+xRb6S1LeTK1QzpnQW3IZsWf9wKeNNGmbThmoUzPGUrtYtVyJDWXZVt
 wU7Bn4o+5eYSEuG2glrrrM4VsVYeYQEZ8TlgZpzjNORHL/x4mK2tb55jxY3gxCfSOJPE
 y4DBlM7lzB+0PXsWSV0TlytbpgTRzp0ft0QMpIsyiDFnjweiDywaO4sraUrApVDXMWZx
 aLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tu2NGSrgJfVwTrxV5gAyRVtFDdQnC1eWVUu1iP8zEN8=;
 b=OIsHEiqSzBSew123DDqmM2pucQ5QvZj3EEVWNoDhrtAsoKkIEORXFDR4FLKtmx49u3
 +w9UcIKaWp2dl+rz19FuUvsBplILFf6z06IIkCszkhzE10GqRB+O22rAnwT3iED9dNlf
 veYbABCSAo+eFsVXp2leB+Q3EefC8JFm5PZMUEnvN9gXx4oE6yND6O7eGRELZOUi7wYi
 XawvxvccgVBAgvppbLnOk71zWitPD9kSLHUpSrYSVtDDjyRT53RSk0eS3FZaAODC/G1Q
 XSdg+5H4ufQLc7oU6mFP4nex1+wFwXsipZ43OAhtkTYqoWQdWw9UIykQadmlkYa6Xn/g
 bE1Q==
X-Gm-Message-State: AOAM530Sy3M3676SSrlxcLJ+yWjoL/e1Kp82jJjOQhndBTfD71Tz1ANQ
 Dui4baFGpEDVJ/+2outz2nYSsV7n6Q/+fko4IK5YSQ==
X-Google-Smtp-Source: ABdhPJyY+kaKouB91L9mIADgugdeKmhVXLKaMwoLSKVdKhTyrm1W05U50db4LhIhM9NZuvZLM8U0AIG+vZRgFzXO658=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr10939446otl.237.1639625026377; 
 Wed, 15 Dec 2021 19:23:46 -0800 (PST)
MIME-Version: 1.0
References: <20211215141727.4901-1-yann.gautier@foss.st.com>
In-Reply-To: <20211215141727.4901-1-yann.gautier@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Dec 2021 04:23:34 +0100
Message-ID: <CACRpkdagP-UoSyWeOVoxitaMJru+Z_rRa-V3RbLg2jHOnq=_hQ@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Ludovic Barre <ludovic.barre@foss.st.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Vladimir Zapolskiy <vz@mleia.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 u.kleine-koenig@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/4] mmc: mmci: updates for STM32MP13
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

On Wed, Dec 15, 2021 at 3:18 PM Yann Gautier <yann.gautier@foss.st.com> wrote:

> The new STmicroelectronics STM32MP13 SoC embeds a new version
> of the SDMMC peripheral (v2.2).
> It supports SDR104 and HS200 modes.

Patches look good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
