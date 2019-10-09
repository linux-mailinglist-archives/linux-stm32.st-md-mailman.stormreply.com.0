Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0714D0A9E
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Oct 2019 11:12:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 762D1C36B0C;
	Wed,  9 Oct 2019 09:12:53 +0000 (UTC)
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC25CC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2019 09:12:52 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id d3so1052229vsr.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Oct 2019 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DnaMjWPHRTxP2HwHozaEda4iUBnS+Mgb8NeafSlvJXU=;
 b=yKNY9SGcN2UsFvhR61yYb/jrlCVKgel12IYbR40rpV44lcbYSBZBivKCyQa3goz2oi
 wVn3L9kPGJF9gxBuLeJ34zX2+mGkfp28ZbQrzgrGx653cBpNaahPfaGFn/7zIN1RLXzR
 N9d9Glovn5NceLF76IOJ8fuPAyYZHS4PO6Hp6PUO1I/Y5PtLaqHiOpDeqVejYagbTlau
 AOiiySye8tVrQ7tMtrxJ4JTu0nNgQRdmTllW/3qJsQa/aV2UQw8hG9CBM6b6JwfIbyaQ
 MqKF6DODn7ifaUKjsfyiAna4yN7hfctndvK63mGetiRedO0K8Ct7Ym3KXmbe/EroZtSU
 zejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DnaMjWPHRTxP2HwHozaEda4iUBnS+Mgb8NeafSlvJXU=;
 b=H3oGz6rWR4CbXPVLqaI9wGoi2XKcQa0aJefv8Gdb5BGweLE9DvzAjKcZD+h6GaQ0wB
 T/ge5YKER6JIxAsI3OgjvLkq05RUuWhosLpiv+w0u6Kd1soAacqEW+tlS8kPMafuFRtL
 9ytgOKafOGHy6LJ52cUfRy7C9ctLRPiCWFlHvY24BNXAcas4lwV0LnWvWzvyclGnmtYH
 unS8EPtckzqe9jgisYV7aVYMBk8Ng+A9oH7FajTt4ugb0xathJiTwm1NuHQmzFD47MP9
 DXJoiOV2h1VFlkiYK5XgFn7kN+xWdX/V+iKeypyI5/XzgKh+GsjtQuMmyzm5QQyIr/CN
 IVtg==
X-Gm-Message-State: APjAAAXELDftElTkq3DDa5xzqEorTpeAHgLVaOLi2zcET3Y5ou8Q89v4
 IeWTgA7fWn52bXt0PZxbWUJxG8KnuTCu5Hc36b0KEQ==
X-Google-Smtp-Source: APXvYqwgsztQiejuumwMxLuyf8Ws3mo/ua2qL5BsBkseZLgZ/7p7G5FLcbikY8xut9BZ+djUlLpEqm30PBOLplnZkwU=
X-Received: by 2002:a05:6102:5e1:: with SMTP id
 w1mr1211701vsf.191.1570612371638; 
 Wed, 09 Oct 2019 02:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <20191008095604.20675-1-ludovic.Barre@st.com>
In-Reply-To: <20191008095604.20675-1-ludovic.Barre@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Oct 2019 11:12:14 +0200
Message-ID: <CAPDyKFrKrV3e6WmrgzUA0OV4VGm0BMXr0=orogAhHQM3nRpxqQ@mail.gmail.com>
To: Ludovic Barre <ludovic.Barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V7 0/3] mmc: mmci: add busy detect for
	stm32 sdmmc variant
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

On Tue, 8 Oct 2019 at 11:56, Ludovic Barre <ludovic.Barre@st.com> wrote:
>
> From: Ludovic Barre <ludovic.barre@st.com>
>
> This patch series adds busy detect for stm32 sdmmc variant.
> Some adaptations are required:
> -On sdmmc the data timer is started on data transfert
> and busy state, so we must add hardware busy timeout support.
> -Add busy_complete callback at mmci_host_ops to allow to define
> a specific busy completion by variant.
> -Add sdmmc busy_complete callback.
>
> V7:
> -Patch 1/3: rephrasing like proposed (thx ulf)
> -If busy timeout is undefined => increase to 10s
> -Keep busy_detect.
> -Patch 3/3: rephrasing comment header
> -Avoid twice read of status register
> -Avoid writing in MMCIMASK0 & MMCICLEAR if not modified
>

Applied for next, thanks!

[...]

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
