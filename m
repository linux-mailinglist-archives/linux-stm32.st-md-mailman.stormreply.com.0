Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF234EB519
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 23:17:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A192C5EC6B;
	Tue, 29 Mar 2022 21:17:07 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B103BC5EC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 21:17:04 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id t11so33782276ybi.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 14:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1NmdHbhnl/vRItSEWqZfS578eYz0Ln76M7w3+17SBng=;
 b=nnNp2K9C0PhtBCZ9DlF+5HkNtJtSFxGCTe+rj/yzMLI7t8hiUYwTIqIX7DjUb2Ej+l
 YZJn4iEApNAcehGis3mzjUOYIlnzVRouSbGMm6iXFNxUZ+KoTMHAVElD+A4wwZmCd/B0
 eEEbLLsLZFZEcsXXT0Lo5ktPGfgsMiW2ylL9g+GOabkqDWyMZ1h1SM1Pf4lmXgs/D+7I
 gXS3N7nI5IDy0LRBZ4AehTCJ1hAF298ax1wzj0Ii9zBxM8U3GjQ0lFRhOsj8guh34ZnJ
 wCCDM9vUrfgM5TSoshOYj3qBD4m2Ny8MZNGXo+h+RQmlgcxRSkD4XP6KR3exbwSYnVXH
 m04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1NmdHbhnl/vRItSEWqZfS578eYz0Ln76M7w3+17SBng=;
 b=O+CjNHv5bxoHLoKs2su/dT7hE3ioNc9IyArYxqyox0q4g9vKXwvYlvEHD38Q422TwW
 Ha2VEYCJ4bfpzZKfQqOVP+uioad5ROa5S6kTB7WI5kybfNbJjbVrvNl/U3wFlR/LOnmT
 57PKeD1bJRGRMQ8vYSQ2q8m0h8/pIZAi9N9Iix4oDT5/TClvPA5KPlLY/DfrOfLkoHrU
 y3Yt1hsNnNJdRF/Td37cvoTvFDloCFkf1rGxlM2eDcOmm8e55FGCEaGsTdgyeBRzYI2b
 o6zH0/NXgekJZf+dKBBKxdfmOpLO3PGQnHsIh/ROzRSXRNc8bJ7RxUU7FYo6YATbZNnN
 Chxw==
X-Gm-Message-State: AOAM532usOzXR+89xPKQO6CHKZRW9roxHd82RbcN1cau5s5PjoZQrGu8
 /p+DnjA68wGLXeRDSGg+F+YOvgtSkVrh+G26fXuTwg==
X-Google-Smtp-Source: ABdhPJykJ5Ut7PIceBwZraoLzJOYrOlgWf2VUP56VuJtpRcHz881r39za7FgGIqkZzFEF9YvREaj+sXPJsynCiusvbw=
X-Received: by 2002:a25:2497:0:b0:633:c1d0:e7bb with SMTP id
 k145-20020a252497000000b00633c1d0e7bbmr30780376ybk.291.1648588623439; Tue, 29
 Mar 2022 14:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220304135134.47827-1-yann.gautier@foss.st.com>
 <20220304135134.47827-2-yann.gautier@foss.st.com>
 <CACRpkdYQz+-im3n-r0_8RKL7so2bHS=aZobty4BbzixmPzms-Q@mail.gmail.com>
 <0bc53018-fce4-4104-fa47-6e60d2367d69@foss.st.com>
 <20220329153114.GA58120@thinkpad>
 <71b10ce2-7b87-14d5-c8e4-3a4598c889e0@foss.st.com>
 <20220329173322.GC58120@thinkpad>
In-Reply-To: <20220329173322.GC58120@thinkpad>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Mar 2022 23:16:51 +0200
Message-ID: <CACRpkdaiOhMGzuWPwoRLZ05HyM8BO_-cZt4TiAqAYQvDaJA-mA@mail.gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Ludovic Barre <ludovic.barre@foss.st.com>, devicetree@vger.kernel.org,
 ulf.hansson@linaro.org, Marek Vasut <marex@denx.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Grzegorz Szymaszek <gszymaszek@short.pl>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@dh-electronics.com,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: mmc: mmci: add a
	property to disable DMA LLI
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

On Tue, Mar 29, 2022 at 7:33 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> [Yann]
> > As for Prabhakar's answer, the IDMA here is inside our IP, and not used in
> > any other IP. So I'm not sure it is really relevant to move that to another
> > dmaengine driver.
>
> Okay, I think this justification makes sense. I was worried of DMA IPs that get
> sandwiched into many peripherals like the one on Renesas platforms. It turned
> out that each subsystem has to add internal DMA support for it :/

That is a justified worry.

Qualcomm has "BAM DMA" (I think it is called?) which is added to each IP
that needs DMA. drivers/mmc/host/mmci_qcom_dml.c
It's for older Qualcomm platforms but I *think* it is actually not just used
for the MMCI, just noone ever got around to adding it to any other
peripheral? Srini do you know?

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
