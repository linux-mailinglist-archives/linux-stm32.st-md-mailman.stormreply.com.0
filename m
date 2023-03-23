Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCC16C67AB
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Mar 2023 13:08:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DC29C6A602;
	Thu, 23 Mar 2023 12:08:58 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64384C69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 12:08:57 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id c29so9925291lfv.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 05:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679573336;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xzgI+B9ASfOGNYBH0IR4jXCQ7CKwmiqjpGUIbZHwnnc=;
 b=LFKNwiWKSW7Ndn5zWY0V3TIVkQO7LGJoUbnGfHAzF6WG24W5M+VIvRUapx+q+WFgqu
 SiyZaq1BBzTjpH26yZ1+BD5RLXxCxh8nNjMJnF+CGTYpFdCpXcRkYajpbGkw1zfSivqo
 5IbuF/edaVAQ5qWwJFUnXpaJhfGHvvtuN3Idj9qkPciVMZV3kF20JpRrP/irEPtV356v
 YTIncCqa+BiKhDPKRbdtpvbYACV7gZI35YJAvAl+ch2HBhVuntntMdOtTX6Nz6EXUFm7
 +TzPJp7JG42UcAAjUTqqvbbhAuK3aC9XyJgPsXIeicQ66tAIUXpg+pjastRoG67dkUgj
 f+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679573336;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xzgI+B9ASfOGNYBH0IR4jXCQ7CKwmiqjpGUIbZHwnnc=;
 b=o6sKIdN9Va2qDGIKW2po1hot9aH/2rYULVuXoJ4Jgw9wNRfiR+4dRkfvLSQhLkqSSM
 Hl3qUv5rPK/QjkvdHUJrSj2S9UtuttelSIywjc9Vvt2b3cRJhHj/BzIyUhgWJeQqm6YL
 mlzTkPHvVX/MEQv0vJZ+nGdaJ0jgpqkL0hkP1kG/Ro1GHlxCQ3/1AeoMWIrLOMCH6WvA
 sDRxalgThtLb6I0d2ck84DwrrDCosvhvN38Xgl50QC2XoqloeWw6T40uKznLGr501vUd
 cOEdelpbMsz7TziEUiYYx4M1VErSCCXDyJJf2EWEdV+UI519p/YQjZGu0+almGLSEML4
 9/Xw==
X-Gm-Message-State: AO0yUKUZh/ieVp326ztHheqDCAHtoS/xsSJNg6vckUGl9RkKZww1h+ul
 jyCPkOx4e8LSH10kZ23HcVM=
X-Google-Smtp-Source: AK7set+84k7eBxJAPoHl2JzEu70ox/d+Ysoy3SdQ5Tz3UrPm6eVSvg55ypTOmhgj5bq6t2O+AVvFgA==
X-Received: by 2002:a05:6512:249:b0:4b4:e14a:ec7d with SMTP id
 b9-20020a056512024900b004b4e14aec7dmr3143131lfo.17.1679573336526; 
 Thu, 23 Mar 2023 05:08:56 -0700 (PDT)
Received: from mobilestation ([95.79.133.202])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a19f013000000b004eaf9ef5e7asm422577lfc.226.2023.03.23.05.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 05:08:56 -0700 (PDT)
Date: Thu, 23 Mar 2023 15:08:53 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20230323120853.wse2pvknvznawxpk@mobilestation>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
 <20230313225103.30512-15-Sergey.Semin@baikalelectronics.ru>
 <faf70823-f87b-ba50-ac72-3552de1cc7e3@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <faf70823-f87b-ba50-ac72-3552de1cc7e3@linaro.org>
Cc: Eric Dumazet <edumazet@google.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Yang Yingliang <yangyingliang@huawei.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Christian Marangi <ansuelsmth@gmail.com>,
 devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 14/16] dt-bindings: net: dwmac:
 Use flag definition instead of booleans
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

On Thu, Mar 16, 2023 at 09:09:37AM +0100, Krzysztof Kozlowski wrote:
> On 13/03/2023 23:51, Serge Semin wrote:
> > Currently some of the boolean properties defined in the DT-schema are
> > marked to have the basic boolean type meanwhile the rest referencing the
> > /schemas/types.yaml#/definitions/flag schema. For the sake of unification
> > let's convert the first group to referencing the pre-defined flag schema.
> > Thus bindings will look a bit more coherent and the DT-bindings
> > maintainers will have a better control over the booleans defined in the
> > schema (if ever needed).
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   | 45 ++++++++++++-------
> >  1 file changed, 30 insertions(+), 15 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 69be39d55403..a863b5860566 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -120,11 +120,13 @@ properties:
> >          maximum: 12
> >  
> >        snps,rx-sched-sp:
> > -        type: boolean
> > +        $ref: /schemas/types.yaml#/definitions/flag
> >          description: Strict priority
> 

> If ever touching this, it should be other way -> boolean.

Ok. I'll drop the patch then.

-Serge(y)

> 
> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
