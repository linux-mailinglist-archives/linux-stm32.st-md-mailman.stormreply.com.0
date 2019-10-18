Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F18DC33F
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Oct 2019 12:58:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88133C36B0B;
	Fri, 18 Oct 2019 10:58:58 +0000 (UTC)
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
 [209.85.222.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FC69C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2019 10:58:57 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id j5so1578030uak.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2019 03:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tt8K7w3x8HTdPRqv2Fif3/U/rG1clDpwhUCuSLxR4V4=;
 b=ZT9bTUQ6OC5ou55VS9YQx/QBwxnwJMBR+sIN7NFLM0HxkoGrTSe8tT/Qt4JdHA2MMU
 DjId+FAIoU6fIeDoczEOErcFlOkcO+e8JNfl+TwJnF8jmbJIA+R6bZeyFK+oI6B44p93
 E2RKRQ+DqQGymqV+LjeAfkgyr/whnziPddKzcnq8Je0axdhhYXq4F8eMAkP8neG8FZxA
 Wl39/ai8CQcsHWTOzgQd5b6m4y/3Ts3GeWQSCsdZ5NjYQCswurxqeHCvmgNVCB/nNl/8
 v79pFsn/eqHdYlCzLlLczwlxIhh27cCNPny1X6S1N8A4G3XTEPqXUydW08tTHR+s/eFI
 UNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tt8K7w3x8HTdPRqv2Fif3/U/rG1clDpwhUCuSLxR4V4=;
 b=TxOUAcP9CTigoEAkCDF8JeB7NVdjwwXeQuRe7jxR0PO+7E7pQk7/Kbb7fglfUwwIAg
 spmylwD/g8VRqufr+mOohIwr84WXqn8EDg8F9bej3fPUNbshoFKO3d9yB+PEGZbyItnr
 lY6uno32fkqAYISJC70kzDMdGZs4A+p4w/I7GtELcGH/aurQI0CYl5gTjruyEeiEAXWJ
 ScuQxVL76/sreVDpzbXH3mQCuDUusv8zWWYEiqD5FM1AazOzGWK5s45uihSGEdSeBp7E
 eiQXU2j44rRohTqdsncOs5awpcOAlWPtZA6dblVzLJqIc4mXcrLNJi0vD0RuczJtpqcW
 +uiQ==
X-Gm-Message-State: APjAAAVoYVwGek+EZRIrSfj488gmAA7LQCZzOKiEbebmraKdrzxsDgvJ
 4b5x3t5BZ1V/NhzKVPcQ4FY62kcq/tUZ1vRiGtAR0A==
X-Google-Smtp-Source: APXvYqzqXgy001fV5A91b+YnpXgC21Z0PLOBh1lckmLIHtwrkfn/IGdZxxUOfwEtNWIE5nn72WMV3aVXXjO/z8yggnw=
X-Received: by 2002:ab0:708c:: with SMTP id m12mr5080226ual.15.1571396336167; 
 Fri, 18 Oct 2019 03:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191009115415.15691-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20191009115415.15691-1-ben.dooks@codethink.co.uk>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 18 Oct 2019 12:58:20 +0200
Message-ID: <CAPDyKFqGwB2uo5dVqL3nbBpch1FBO2D-TG+yXo0R0hFiCL0Tfg@mail.gmail.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] mmc: mmci: stm32: make
	sdmmc_idma_validate_data static
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

On Wed, 9 Oct 2019 at 13:54, Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> Make sdmmc_idma_validate_data to avoid the following warning
> from sparse:
>
> drivers/mmc/host/mmci_stm32_sdmmc.c:28:5: warning: symbol 'sdmmc_idma_validate_data' was not declared. Should it be static?
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Applied for next, thanks!

Kind regards
Uffe



> ---
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/mmc/host/mmci_stm32_sdmmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
> index 8e83ae6920ae..296be8a060a6 100644
> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> @@ -25,8 +25,8 @@ struct sdmmc_priv {
>         void *sg_cpu;
>  };
>
> -int sdmmc_idma_validate_data(struct mmci_host *host,
> -                            struct mmc_data *data)
> +static int sdmmc_idma_validate_data(struct mmci_host *host,
> +                                   struct mmc_data *data)
>  {
>         struct scatterlist *sg;
>         int i;
> --
> 2.23.0
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
