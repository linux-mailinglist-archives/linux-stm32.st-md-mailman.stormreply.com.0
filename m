Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECF05F49E2
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Oct 2022 21:51:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03637C63327;
	Tue,  4 Oct 2022 19:51:57 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8E72C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Oct 2022 19:51:55 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id s2so9681959edd.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Oct 2022 12:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=7dAFZ0Dv74viOjab/o6SdVduwwf4JhWfgRlUOHBIw8s=;
 b=p1Rf07UZ6nQSCG9E2dB1vRGVLdfDE6pwCDbvEiwzmXiNm8hJsNPkwiXVEXblsgcTMO
 VD7elVi7Im7+BdHJKgOrYhC1xTHRHa6v75jV+Cj5KYkTaf2vqtTXohDgNbX5xUavrV0+
 oR+j5h3G4GJaGr+QCRnFqEuAr95AIRhOWnhGhQH3PG3JdXHqZ6uUcn0icJxqTCJ8TWSN
 W2NrDXPLKkw+1VBcphQbF2Q9Esii2ytqFi+A1ZJ8qPHSczRAp2pkyS3+7nRmsbflYICs
 DKyBZrrJfVWF6hfc0ESiJYhiqC3TGVY99zj+NP/9rudqbBJeXwvQ8/mLhg+Zr6/c9SFU
 Mbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=7dAFZ0Dv74viOjab/o6SdVduwwf4JhWfgRlUOHBIw8s=;
 b=05MctPeZycrg3uirhI+s+Uku/IRPKFyconv8c+9/X9uQTsuTQG0Ge/enUcJtiA9PDN
 cXaTnsg+pbIBJN+aot/3jdYo3ov9EUn8bjXQgzlKa7/8g9fFo2HdIkEk5IXK/iiwb+MW
 FMymANOYz8qhD1flRM2wgqsuYhgbWxPulGQVpvpDKd+NLlOOlkEZMqpdPnie7BOFc+xC
 LRvOXsxqfzogwU8cLqPsiq0NS6gTw7P+Lm6DSUQwyyn4otaOr0vULBRIv3ifRT9KXtD+
 pzx3kST8K2MsiS2lPhAG20JQ41mnv9KvL7fNIMZ1HH47oxQDlB3zp1g8gw89HFMYKoYV
 h2HQ==
X-Gm-Message-State: ACrzQf3wDpzE2reXkic26X/GBS0/c5awEv55JkedkCBNIlub9Z+mZ0L0
 tzlJfovkaWk4Qzgq17hrUOCTGKEDJH99Mvl+zK7uPg==
X-Google-Smtp-Source: AMsMyM7tp161kPhb3d8RhOwSScAFsLy++rlzF6dUMDcpt01r082kRDSLrp9nYObjuNioSwTIh1BPKNN1kU8tq6QyjKY=
X-Received: by 2002:a05:6402:40d1:b0:44f:e974:f981 with SMTP id
 z17-20020a05640240d100b0044fe974f981mr25889439edb.222.1664913115282; Tue, 04
 Oct 2022 12:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221004174018.3319712-1-arnaud.pouliquen@foss.st.com>
In-Reply-To: <20221004174018.3319712-1-arnaud.pouliquen@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 4 Oct 2022 13:51:44 -0600
Message-ID: <CANLsYkw357ajx8BnbykKiVD+BVv21VwAaYjvFDwqbvEw7cBDHQ@mail.gmail.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] remoteproc: virtio: Fix warning on
 bindings by removing the of_match_table
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

On Tue, 4 Oct 2022 at 11:40, Arnaud Pouliquen
<arnaud.pouliquen@foss.st.com> wrote:
>
> The checkpatch tool complains that "virtio,rproc" is not documented.
> But it is not possible to probe the device "rproc-virtio" by declaring
> it in the device tree. So documenting it in the bindings does not make
> sense.
> This commit solves the checkpatch warning by suppressing the useless
> of_match_table.
>
> Fix-suggested-by: Rob Herring <robh@kernel.org>

I'll change that for "Suggested-by:"

> Fixes: 1d7b61c06dc3 ("remoteproc: virtio: Create platform device for the remoteproc_virtio")
>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index a29e3b8ff69c..26a7d8c498bc 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -593,17 +593,11 @@ static int rproc_virtio_remove(struct platform_device *pdev)
>  }
>
>  /* Platform driver */
> -static const struct of_device_id rproc_virtio_match[] = {
> -       { .compatible = "virtio,rproc" },
> -       {},
> -};
> -
>  static struct platform_driver rproc_virtio_driver = {
>         .probe          = rproc_virtio_probe,
>         .remove         = rproc_virtio_remove,
>         .driver         = {
>                 .name   = "rproc-virtio",
> -               .of_match_table = rproc_virtio_match,

Yes, this is quite simple and slick.  Rob - is this what you meant earlier on?

>         },
>  };
>  builtin_platform_driver(rproc_virtio_driver);
> --
> 2.24.3
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
