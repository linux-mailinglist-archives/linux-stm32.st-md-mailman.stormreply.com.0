Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C95254DFC
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 21:06:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 896ABC32EA6;
	Thu, 27 Aug 2020 19:06:59 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FAC9C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 19:06:56 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id d26so9168609ejr.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 12:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kX9eyuUyhq2QFDZPTT8K+fKfXv//9k/lun1Oefq69vQ=;
 b=H0BNNYGCKVDReSBzqseiIDQzuuqFX2bFfxlZGwrdTvTF7jUwhb3NZBliQdfhHgphss
 bZF2ldxnL0m5vm/UudeMfT9Wk8nSQYSoy/G1bUeIhEdmZOuniv74SUIoodGTBeSYJwnR
 pr5WEArBXCodS5/1dbOYTa8+RJYP1fuRt1httbzW+jULmBrFwEBLbyuQ8QkitBmYjnFw
 A0sKmvAvTosmR335UpbBZ7GiaD7f/1a0XcS+K+vC4yX+wDy/mbdhnpbI+2SuvgXMqkrE
 nmCgpRLrTXTzo1lW5X4EVbKviel8SBquxVPqfaG85xzP9i8+Zpy5Rag020o6uOgqSH1U
 KX0w==
X-Gm-Message-State: AOAM531Q46Z8rBR3sOOpzN2ajJeIi2uyXPWAvYaPw5oFxjwigtLB2edR
 DZbzLOOCrLHpAGuYlADhNxw=
X-Google-Smtp-Source: ABdhPJwErb1TPe6yej5LwLYtNxfx1kujrjSq4jsHJ5VaVSvbdjyWgjoSXSM2n9G+Y0DfBXVTqlVBtw==
X-Received: by 2002:a17:906:37c1:: with SMTP id
 o1mr22299708ejc.279.1598555215565; 
 Thu, 27 Aug 2020 12:06:55 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id w20sm2629985ejc.77.2020.08.27.12.06.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Aug 2020 12:06:54 -0700 (PDT)
Date: Thu, 27 Aug 2020 21:06:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <20200827190652.GD6196@kozik-lap>
References: <20200826161818.20969-1-krzk@kernel.org>
 <CAHp75Vf3s0+RrHnBoO4y4+t4Egth4uyYwtO5iPt9DbLJcunL6g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75Vf3s0+RrHnBoO4y4+t4Egth4uyYwtO5iPt9DbLJcunL6g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Etienne Carriere <etienne.carriere@st.com>,
 Lars-Peter Clausen <lars@metafoo.de>, linux-iio <linux-iio@vger.kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32: Simplify with
	dev_err_probe()
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

On Thu, Aug 27, 2020 at 11:27:12AM +0300, Andy Shevchenko wrote:
> On Wed, Aug 26, 2020 at 7:19 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Common pattern of handling deferred probe can be simplified with
> > dev_err_probe().  Less code and also it prints the error value.
> 
> 
> 
> 
> 
> 
> >         priv->aclk = devm_clk_get(&pdev->dev, "adc");
> >         if (IS_ERR(priv->aclk)) {
> >                 ret = PTR_ERR(priv->aclk);
> > -               if (ret != -ENOENT) {
> > -                       if (ret != -EPROBE_DEFER)
> > -                               dev_err(&pdev->dev, "Can't get 'adc' clock\n");
> > -                       return ret;
> > -               }
> > +               if (ret != -ENOENT)
> > +                       return dev_err_probe(&pdev->dev, ret, "Can't get 'adc' clock\n");
> > +
> >                 priv->aclk = NULL;
> >         }
> >
> >         priv->bclk = devm_clk_get(&pdev->dev, "bus");
> >         if (IS_ERR(priv->bclk)) {
> >                 ret = PTR_ERR(priv->bclk);
> > -               if (ret != -ENOENT) {
> > -                       if (ret != -EPROBE_DEFER)
> > -                               dev_err(&pdev->dev, "Can't get 'bus' clock\n");
> > -                       return ret;
> > -               }
> > +               if (ret != -ENOENT)
> > +                       return dev_err_probe(&pdev->dev, ret, "Can't get 'bus' clock\n");
> > +
> >                 priv->bclk = NULL;
> >         }
> 
> Again, devm_clk_get_optional() and even, if it exists,
> devm_clk_bulk_get_optional().

Sure.

> 
> Please, revisit all patches on this topic.

I'll check them.


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
