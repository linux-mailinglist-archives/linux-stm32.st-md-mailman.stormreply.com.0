Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AAA5F3E7C
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Oct 2022 10:37:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78203C6334A;
	Tue,  4 Oct 2022 08:37:45 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FEC9C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Oct 2022 08:37:44 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id kg6so11954862ejc.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Oct 2022 01:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ThMntxlZppC84O+euxA4gZxiDNeTMFwKEQEGon7lVMM=;
 b=ZySceW4Li9TnmqGFLeuD55ZYytpi0m7IVagTsKxhEo2chhtGAI4pAT3psweDlyou4H
 AeRs9Chjr8RSdNqIIQFpYBhjvThI5qZwxTvm6M4Hq2yfxxj7Nfsj+e3tW8XcQnGDvkcn
 WSXby8/jbNIFBC+TMJ8xpx8+BGWShWPNp6xg1vpMryIyMLSAvdaJkuqLMxzUSstz6tyz
 b2RHpTQsQX+JbZl//vLi2FHsLQ62L/PzryAI3ibCVR0Tt8BdpzgCut4FyVxWsCjoVFXM
 yPXI+YDC0/aWoGlfxCTPB71UTqBo9X9UkpD6y65zlYUUrqlTbLV8X6h+zLRQDu0by2Sv
 1IOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ThMntxlZppC84O+euxA4gZxiDNeTMFwKEQEGon7lVMM=;
 b=KK5GRtBt6qrOJeDIMLrO+sSYdOOpdUpzYAI9Qyt5Cm9VIvIOPQ6EElnTf+c4ctNpcV
 wApJk2tZ/9/SXUCXl+lw0F47ZGs1BBidKjaQUrkE8NsrpA7HnJUT3KI7UlP0isv7pnTE
 lIXZrBobVDdj500ITs5i0BL8ljJxTsOB/wYnQFO0UUml7Cfr8aRkSfwyef89yKTmHXqF
 Bq7ptWxlzpazL7SxT7lrRCG2yAYkN3bnO+iZIIVQVY+2dGzT9XrLfM6L/RbpPB5iVLr/
 zwLYsqYWLvVENbgyjhtTbMqUmQNwPLg55T3da7rVjXdCos+EWSuCdQQmZxyZ5sTRBHUh
 8u4g==
X-Gm-Message-State: ACrzQf1Wa3HLkX5qyYLC2sr14OeZ0h2W4A6ZWIPZYx3cfi8tAIgAxM25
 BDrCIZLH+FAwRvxzPFR3A5+7Z1PBeHDlnCiM9EtgEg==
X-Google-Smtp-Source: AMsMyM7V85zjAFnelVm/Nxv7BMiXqOOKajfzBkVDFOrfn7T3xv44/Rtfb/yh+SIcsFZKWmW01f0Om4dqeaEQrijhz1Q=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr18596049ejs.190.1664872663739; Tue, 04
 Oct 2022 01:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220926204724.381760-1-marex@denx.de>
In-Reply-To: <20220926204724.381760-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Oct 2022 10:37:31 +0200
Message-ID: <CACRpkdbpuQY+yjHuNiFuAJogTzE1QAAgmHfGBLyL4gCsd9Wprw@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: st,
	stm32: Document gpio-line-names
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

On Mon, Sep 26, 2022 at 10:47 PM Marek Vasut <marex@denx.de> wrote:

> Document gpio-line-names property as valid property.
> This fixes dtbs_check warnings when building current Linux DTs:
>
> "
> arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dtb: pinctrl@50002000: gpio@50009000: 'gpio-line-names' does not match any of the regexes: 'pinctrl-[0-9]+'
> "
>
> Signed-off-by: Marek Vasut <marex@denx.de>

Patch applied.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
