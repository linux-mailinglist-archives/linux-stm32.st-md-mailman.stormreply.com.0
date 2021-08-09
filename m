Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A533E3DFA
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Aug 2021 04:36:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C403C5719E;
	Mon,  9 Aug 2021 02:36:59 +0000 (UTC)
Received: from mx-lax3-3.ucr.edu (mx-lax3-3.ucr.edu [169.235.156.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8C2EC5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Aug 2021 02:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1628476618; x=1660012618;
 h=mime-version:references:in-reply-to:from:date:message-id:
 subject:to:cc; bh=S5CPTabNoTndrACQMK6Rmlxzof5oq7hgo1skvEPN0Y8=;
 b=SPzu2HyZ7HpUnBOpOP/SLvkUGgkEagJLnNK3SE4BW2V8GUmQk4jHUVGM
 YDsMTwmED2B/Z62QYfkbKMWkILMBq/M9pSqFPS0EBUKYAZmPsYVTMQxRG
 gcsj/Gl7tS+nrmKw/q+t2CyV6RWuA2pxs4jq1JCXvTCnuXhwbAlnwYVa9
 Ouj3FsfyTx0997QTXll+oKWDrpTmpysSw5AdI/JnlJh4TkhirtgCmbABy
 6ZqB6BvON4JN/d/z2hPNReygILv64CmMyEFtRN9711J6YI1olY5EaCF/L
 cAIHX3EltUjD+qnlIZEUKY+VoYwB/1qdPiyx2je6CQOoJslxGv7TugllD A==;
IronPort-SDR: I/YbEf5GqolmJbQYvh0SDdvZaxxQnysYzDUDI7LrpnbMzAlJaM+vwbC3hyG4U5ics8D4bl53Q/
 R3qZxU3aPlMdVlA48ZtfSW4msWd7Ol132F9GpeBgLIizi0ABdQDeVRaVquNAJG4x5jrADNzC/V
 es4MK8vg3Q6Q8bTSkcS1gIGy2aAS6FO7P1v03e3Zc7TMD2VXJBkcFSnSBrSOCNqpW49/wQHNr7
 1BqmHL6I7sKmDneOwpbfpr1/zgE6fhgfcD1DiKSJemekR5YrOCDFeCkNZrxP6vcODbDa4xYb5y
 KojIlI3fXsXZvl/OcFv21IQg
X-IPAS-Result: =?us-ascii?q?A2EeAgBjlBBhhUbYVdFaHgEBCxIMQIFOC4N4bIRIkW0Di?=
 =?us-ascii?q?lmRCYF8AgkBAQEPQQQBAYRYAoMFAiU0CQ4BAgQBAQEBAwIDAQEBAQEBAwEBB?=
 =?us-ascii?q?gEBAQEBAQUEAQECEAEBAQGBIAtZC2OBT4F5BgQ9gjUpAYNtAQEBAxIRBFIQC?=
 =?us-ascii?q?wsDCgICJgICIQESAQUBHAYTIoJPglYDL5xfgQQ9izJ/MoEBh1YNTgEJDYFjE?=
 =?us-ascii?q?n4qhwuGZCeCKYFLgQWBMzc+giCFO4JkBIIsYwcBFScWKBMcMgcGaS09ESoRf?=
 =?us-ascii?q?wEBAZNbAYtQnDxbAQYCgw4ckkqFGQl8hWMrg2WLYIYAQ5BnLZAslSiVQhAjg?=
 =?us-ascii?q?T2CFTMaJX8GZ4FLTQECAQIBDAIBAgECAQIBAggBAQKOKA0JFY44JC84AgYLA?=
 =?us-ascii?q?QEDCYpQAQE?=
IronPort-PHdr: A9a23:hdzjjBdlu60TMu1Gc5GzlDYAlGM+U97LVj580XLHo4xHfqnrxZn+J
 kuXvawr0AWRG9qFoK8dw8Pt8InYEVQa5piAtH1QOLdtbDQizfssogo7HcSeAlf6JvO5JwYzH
 cBFSUM3tyrjaRsdF8nxfUDdrWOv5jAOBBr/KRB1JuPoEYLOksi7ze+/94PPbwlShjewYLx+I
 RWroQ7MqsQYnIxuJ7orxBDUuHVIYeNWxW1pJVKXgRnx49q78YBg/SpNpf8v7tZMXqrmcas2S
 7xYFykmPHsu5ML3rxnDTBCA6WUaX24LjxdHGQnF7BX9Xpfsriv3s/d21SeGMcHqS70/RC+v5
 Ll3RhD2lCgHNiY58GDJhcx2kKJbuw+qqxhmz4LJfI2ZKP9yc6XAdt0YWGVBRN5cWCNPAoy+b
 4UBAekPM/tGoYbhvFYOsQeyCBOwCO/z1jNFhHn71rA63eQ7FgHG2RQtENAPsHXVrNX1KaASW
 v22w6nI1zrDbu5d1DD96YnJchAuu/CMUa5sfcff0kQvCh/Kjk+KpYP7IjyVy/0Avm6G5OVvS
 eyhkXQoqx1tojex3McsjJHEi40Rx13A9Sh3zpg5KNK8RUB0YtOpH5VduiGUOoZqQ84vX2Blt
 Sg5x7EbpJO3YSsHxYopyhPQaPGKboaG7w//WeuXPDx2h2pldaqhixqu9UWs0O7xW8mu3FpUs
 yZIk8PAu3IR2xHV98OJUOFy/l271jaKzw3T7+ZELl0qmqfDMJ4hx6IwloIUsUTeAi/6gEX2g
 7GSdkUj4uWo7v7oYrTippOFL490iBzyPr0gmsG9Heg0KAcOX2+c+eSz0L3s41f1T6lNjv0zi
 qXZsZbaKtoHpqOhHQNZzoIu5wy8AjqmytgUg2QLIVNfdB+Fk4TlI1TOL+r5Dfe7jVSsijBrx
 /XeM7zhA5TNLmLMkLb9cbph5UNR0xczwsxF555OFL4OPe/zVlfrtNPEFh85LxC0w+H/BdV51
 4MeX3+PA6CAPKPJrV+I4+wiL/eXaY8OpDbxMv0l6OP3gX88g1AdfK2p3Z4NZ3C+BPhmOFmZY
 X32gtcEC2cFoBI+TOjqiVGYTTFTYHOyDOoA4WQZD4SvEYfKQMiGibmMxiC9VslUZ2scUXiPH
 G3ueoHCXO0DPnG8OMhkxw0FR7i8TMcT1Riv/Fvr2bpuL7KMoQUFvoil2dRosb6A3Sou/CB5W
 pzOm1qGSHt5yyZRH2de4Q==
IronPort-HdrOrdr: A9a23:DYnlja44W+wQ7YgnMgPXwPPXdLJyesId70hD6qm+c20tTiX4rb
 HXoB11726QtN98YgBDpTnEAtjifZq+z/9ICOsqTNOftWDd0QPCEGgh1+vfKlbbakrDH4BmpM
 FdmmtFZeEYz2IRsS832maF+h8brLe6zJw=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,305,1620716400"; d="scan'208";a="62362303"
Received: from mail-pj1-f70.google.com ([209.85.216.70])
 by smtp-lax3-3.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Aug 2021 19:36:56 -0700
Received: by mail-pj1-f70.google.com with SMTP id
 y3-20020a17090a8b03b02901787416b139so4278543pjn.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 08 Aug 2021 19:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TXT+reKNAAdaXSEr1r6kToV8qtLfQIdGnpz4v9GHBhI=;
 b=rWZW/T80+eygjqg8zdYufoP4yxd/PPQKUpfFQEkyrV50owPeKqin3efF1EU8Bc7fXC
 RYNsevKmf/GoCRCMQvig8/YTpjVez38+DoPeTv6GjrA6Fj4zqhCUfx7H78SA34UbnGXd
 puZ1HBfzOXGNCc9C4befxpImGXL/Q8eNq5hhXc06oFOrjFH6SwGnoHZnj1/OWhBOlkRB
 Ob5MwlX24PViO3z37yNS3jYMUKRwOU7ggPUqsN60UkVCLBVjYtuiRMa7dQnIQupoLdMe
 vxh9dOnVqYHn/Oi0PPduKEXvhJ8EGaosTgdsny67QJq9XiF2jwx3gyDtlLFqTZM/VnZJ
 O+kw==
X-Gm-Message-State: AOAM53053eCOMZalJF2cksT8a5nsI2fDfQZgqOW3i026c21fp2OSVbkI
 Wbq73SHwe6dQ0oCWNVCMZIwlVQe+WzNCuiQT1cN1KxSVDT7exZS/pO17GEvd0BIO1GAFzBSoS9n
 JcPDDPzo5jkTQrT6egVv/S617RoJOdDMd9oi37WU/nG+hVj1vR9Emh2PSqQ==
X-Received: by 2002:a17:90a:448f:: with SMTP id
 t15mr22860888pjg.21.1628476615286; 
 Sun, 08 Aug 2021 19:36:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmi7KyD7gC/LNsTSN7LbNllZcAdD362fcg3154hLUGjINb7m4IUt/iss0EBAvzX9fyKwU+IE1XNo2+BlsUz3s=
X-Received: by 2002:a17:90a:448f:: with SMTP id
 t15mr22860872pjg.21.1628476615053; 
 Sun, 08 Aug 2021 19:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210719195313.40341-1-yzhai003@ucr.edu>
 <20210724164840.7381053b@jic23-huawei>
 <20210808183243.70619aa8@jic23-huawei>
In-Reply-To: <20210808183243.70619aa8@jic23-huawei>
From: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Sun, 8 Aug 2021 19:36:44 -0700
Message-ID: <CABvMjLRHs61AAYqTeRWV0DHciLBoqHwJ5Djg7ZseYkjE=JhbQg@mail.gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Mugilraj Dhavachelvan <dmugil2000@gmail.com>,
 linux-iio <linux-iio@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-dfsdm: Fix the
 uninitialized use if regmap_read() fails
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

Hi Jonathan:
Thanks for your effort, and yes please take a look just in case.
FYI, I made the modifications align with Alexandru's help, this is the
original reply:

On Mon, Jul 19, 2021 at 12:47 AM Alexandru Ardelean
<ardeleanalex@gmail.com> wrote:
>
> On Mon, Jul 19, 2021 at 2:39 AM Yizhuo Zhai <yzhai003@ucr.edu> wrote:
> >
> > Hi All:
> > Inside function stm32_dfsdm_irq(), the variable "status", "int_en"
> > could be uninitialized if the regmap_read() fails and returns an error
> > code.  However, they are directly used in the later context to decide
> > the control flow, which is potentially unsafe. However,
> > stm32_dfsdm_irq() returns the type irqreturn_t and I could not return
>
> Just curious: are you seeing any issues with these variables being
> uninitialized?
>
> > the error code directly. Could you please advise me here?
>
> The correct way to do it, would be:
>
> ret = regmap_read(regmap, DFSDM_ISR(adc->fl_id), &status);
> if (ret)
>     return IRQ_HANDLED;
>
> IRQ handlers should return one of
> enum irqreturn {
>     IRQ_NONE        = (0 << 0),
>     IRQ_HANDLED     = (1 << 0),
>     IRQ_WAKE_THREAD     = (1 << 1),
> };
>
> If you want to fully optimize/correct this, then it may be something like:
>
>         ret = regmap_read(regmap, DFSDM_ISR(adc->fl_id), &status);
>         if (ret)
>                 return IRQ_HANDLED;
>
>         if (status & DFSDM_ISR_REOCF_MASK) {
>                 /* Read the data register clean the IRQ status */
>                 regmap_read(regmap, DFSDM_RDATAR(adc->fl_id), adc->buffer);
>
> // in this point, we could check for regmap_read(), but it won't make
> sense; we should call the complete() handler, either way
>
>                 complete(&adc->completion);
>         }
>
>         if (status & DFSDM_ISR_ROVRF_MASK) {
>                 ret = regmap_read(regmap, DFSDM_CR2(adc->fl_id), &int_en);
>                 if (ret)
>                         return IRQ_HANDLED;
>                 if (int_en & DFSDM_CR2_ROVRIE_MASK)
>                         dev_warn(&indio_dev->dev, "Overrun detected\n");
>                 regmap_update_bits(regmap, DFSDM_ICR(adc->fl_id),
>                                    DFSDM_ICR_CLRROVRF_MASK,
>                                    DFSDM_ICR_CLRROVRF_MASK);
>
> // in this point, we could also check the ret code; but we still need
> to call IRQ_HANDLED anyway;
>         }
>
>
> Quite often, when regmap_read() returns errors, then something is
> seriously wrong in the system.
> Something else would usually fail or crash worse than this interrupt handler.
> That being said, properly handling regmap_read() here is a good idea.
>
> >
> > The related code:
> >
> > static irqreturn_t stm32_dfsdm_irq(int irq, void *arg) {
> >     unsigned int status, int_en;
> >
> >     regmap_read(regmap, DFSDM_ISR(adc->fl_id), &status);
> >     regmap_read(regmap, DFSDM_CR2(adc->fl_id), &int_en);
> >
> >     if (status & DFSDM_ISR_REOCF_MASK) {}
> >     if (status & DFSDM_ISR_ROVRF_MASK) {}
> > }
> >
> >
> > --
> > Kind Regards,
> >
> > Yizhuo Zhai
> >
> > Computer Science, Graduate Student
> > University of California, Riverside


On Sun, Aug 8, 2021 at 10:29 AM Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Sat, 24 Jul 2021 16:48:40 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
>
> > On Mon, 19 Jul 2021 19:53:11 +0000
> > Yizhuo <yzhai003@ucr.edu> wrote:
> >
> > > Inside function stm32_dfsdm_irq(), the variable "status", "int_en"
> > > could be uninitialized if the regmap_read() fails and returns an error
> > > code.  However, they are directly used in the later context to decide
> > > the control flow, which is potentially unsafe.
> > >
> > > Fixes: e2e6771c64625 ("IIO: ADC: add STM32 DFSDM sigma delta ADC support")
> > >
> > > Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> >
> > Hi Yizhou
> >
> > I want to get some review of this from people familiar with the
> > hardware as there is a small possibility your reordering might have
> > introduced a problem.
>
> To stm32 people, can someone take a look at this?
>
> Thanks,
>
> Jonathan
>
> >
> > > ---
> > >  drivers/iio/adc/stm32-dfsdm-adc.c | 9 +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> > > index 1cfefb3b5e56..d8b78aead942 100644
> > > --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> > > +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> > > @@ -1292,9 +1292,11 @@ static irqreturn_t stm32_dfsdm_irq(int irq, void *arg)
> > >     struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> > >     struct regmap *regmap = adc->dfsdm->regmap;
> > >     unsigned int status, int_en;
> > > +   int ret;
> > >
> > > -   regmap_read(regmap, DFSDM_ISR(adc->fl_id), &status);
> > > -   regmap_read(regmap, DFSDM_CR2(adc->fl_id), &int_en);
> >
> > Moving this later is only valid if there aren't any side effects.
> > The current ordering is strange enough it makes me wonder if there might be!
> >
> > Jonathan
> >
> > > +   ret = regmap_read(regmap, DFSDM_ISR(adc->fl_id), &status);
> > > +   if (ret)
> > > +           return IRQ_HANDLED;
> > >
> > >     if (status & DFSDM_ISR_REOCF_MASK) {
> > >             /* Read the data register clean the IRQ status */
> > > @@ -1303,6 +1305,9 @@ static irqreturn_t stm32_dfsdm_irq(int irq, void *arg)
> > >     }
> > >
> > >     if (status & DFSDM_ISR_ROVRF_MASK) {
> > > +           ret = regmap_read(regmap, DFSDM_CR2(adc->fl_id), &int_en);
> > > +           if (ret)
> > > +                   return IRQ_HANDLED;
> > >             if (int_en & DFSDM_CR2_ROVRIE_MASK)
> > >                     dev_warn(&indio_dev->dev, "Overrun detected\n");
> > >             regmap_update_bits(regmap, DFSDM_ICR(adc->fl_id),
> >
>


--
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
