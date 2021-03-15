Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED8C33C9BA
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Mar 2021 00:10:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CB7AC57B55;
	Mon, 15 Mar 2021 23:10:58 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2587C5662E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 23:10:56 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id v14so10955384ilj.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 16:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1/8bjLHF9FtwMFaIrmHVFR/MayJhXwBukDib3cdY7GY=;
 b=ArUXuTwfe8COX+YyUDzgYs7tL4IE2ubSbkRBYlCZOMSbT2GdqG1uj6sTeUJgdNdUJM
 oGbVsgw2CClsa0ULMBnC31/ovkbf0KM+xsdXHXFbejIHVahNiTyBN2h/XyAAaFWJfsDQ
 ZWtZ3yqz0G3PyIta1U77o9zaaz9DfA8P1maD8jBJWj5y/cRXJWKp87pj991BTyH+YeoD
 H45xdxbpOWQPlX+pyL/RdQd0+R6gVLdtCCfn8JCJTHOgsXWhLlvzL1+r60dSiYh+0KLp
 1wrIGnSRZgFFzTlkve80Ki7xdCVHajOvzs1RBurxDSQrTNP0LeInFHVRsghzj1WR8rVt
 JQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1/8bjLHF9FtwMFaIrmHVFR/MayJhXwBukDib3cdY7GY=;
 b=MXOz35DD9Pomou4/x75Ol5cBcT/DtZ7gZa7l1E8LBGCmr3fQYGXJizf5ClFI0MEKZb
 lVHmBb/dTRzocnC6I0KksNM1aKPXrQH7ZQQEp3pLOh6V5xSDF3hzpEtM2BE6wwR1DesC
 Rkk1YuGEN71N46QV4al89FYEmEUj4AQi8rGGMKuoDjktB9aUNbW4KBIkh8BLI4zs/dIf
 n6rvWSpjkMhisIEXcBjn4f8TuXg5UqmNhN852pIqF7U68/wNUGFJ0CyOYGUNlykch/cS
 +NcD+Vgz3+LRviKK9MubBeDWVhKL8wR+bcCdtMXknlZQGyy6jqCOHJqJjtEoPyTjgUJL
 EYfw==
X-Gm-Message-State: AOAM531688ynll+KAcNli2ksgSK5YtJ28vaLlr/2FD4tj1c4cRRF/CSl
 EVMtH3K84yuPicHg8wRgiEGgyUFBSbqJtbsa+68=
X-Google-Smtp-Source: ABdhPJyOYSFpXTa2hRSPkxFSDK+rvPWmRI8qKW6ZsEElM5ncKyvXcpmfHxslLd2IPthmEFnvRPuMpJPXT3yxupgu674=
X-Received: by 2002:a92:1e12:: with SMTP id e18mr1567010ile.270.1615849855463; 
 Mon, 15 Mar 2021 16:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
 <1615801436-3016-3-git-send-email-dillon.minfei@gmail.com>
 <20210315162645.GA981570@robh.at.kernel.org>
In-Reply-To: <20210315162645.GA981570@robh.at.kernel.org>
From: dillon min <dillon.minfei@gmail.com>
Date: Mon, 15 Mar 2021 23:10:19 +0800
Message-ID: <CAL9mu0+19AVE7NidQcRukUhBkrMQZ0J_Tw15oz-4WiZq9RZdig@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-serial@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux@armlinux.org.uk, Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, erwan.leray@st.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, gregkh@linuxfoundation.org,
 afzal.mohd.ma@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 2/9] dt-bindings: arm: stm32: Add
 compatible strings for ART-PI board
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

On Tue, Mar 16, 2021 at 12:26 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, 15 Mar 2021 17:43:49 +0800, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > Art-pi based on stm32h750xbh6, with following resources:
> >
> > -8MiB QSPI flash
> > -16MiB SPI flash
> > -32MiB SDRAM
> > -AP6212 wifi, bt, fm
> >
> > detail information can be found at:
> > https://art-pi.gitee.io/website/
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
>
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.
>
Sorry for that, i forgot to remove patch 2 from v2/v3 theris, there
are no changes in v2/v3. please just ignore it , thanks.

Dillon,
Best Regards.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
