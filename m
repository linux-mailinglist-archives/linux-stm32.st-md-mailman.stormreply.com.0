Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6F36D93FB
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Apr 2023 12:28:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 603E0C6A61D;
	Thu,  6 Apr 2023 10:28:08 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5958C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Apr 2023 10:28:06 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-54601d90118so575339207b3.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Apr 2023 03:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680776885;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RoXgglZIfQhudHLJxv0A5RSgyPp/erNGMXhuk4PLJ9Q=;
 b=E8acmpg9nF7ySxUb63bohkgR17wqLcBO5mZL8MDeJmfeTt+vrDCsKUp745NhtHne7l
 iuovXZefAm4Z6m31J48ecxlIkZleXZ/8YoDHZpxAVaIessCxZFby40gr4xJIwzTjsLvC
 H0tUsdsOTzhs+4sQBXZuMcaZCvhbksIx69/u7AoEtweGVn7t4GXZokx5sftK6yzFO4QJ
 S0Q5kf1HhFuLrHQ0pINp31GbcpFrxTYtz3ncl7/TbXOLbz86K/9lxYZ1Onzao+RB7Wk8
 gSQk8i6UlmEwVR+aJ7qz4lH9Qoyr9qalIJ0HZpWgKJYHCz0AyosqBIQzFC8nSVFYEWxP
 q+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680776885;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RoXgglZIfQhudHLJxv0A5RSgyPp/erNGMXhuk4PLJ9Q=;
 b=Iqdgt5rsqq4KzFqQS0dYVIVZ0maPeSPw6o0/tQqcPs+QGxnTwHgQN+w3Nwtqzyt2oU
 UecDp1qFWEB5qkqyq2fCn2VYHzlOODmOaXqb11qTaHuKcpG7pLF2OoR5/hCGd4acdbvu
 S7u0SAuAuEZZotJrE16Hg0fLpsT8E6XT4mdOZo4ySet5JU1+MCSOR4ORPOUZN8csTLhH
 3vzkh7iTsi2fnkQq/SZyf1HyGPWSKfYHC0EsedSBOzEBdFuDpCEX2Ng/wpgFTyNxC5XZ
 122J7/wAAJPHMtQy3IdNKQNZLqaxImMDqTAkZLi51JUxBFqc1bQAtQjjREG68BV43lt5
 OYgA==
X-Gm-Message-State: AAQBX9eoNJxIWagG6KtEsgXUOn5DlmWceB36TxqJEi1VOeEzrJbQlG31
 lYQmnqiQMeEF/ToX9HCYzugf5Do8WtFEyfQV2Tf25J3tWLApQY8GRPg=
X-Google-Smtp-Source: AKy350aNbMwkykd0tG0ybDsA1+cKD4wjl7c4OcpaxCNaRs8g/3LeLfgy0rHGfUqI6S0TMvtDqQmS1blm/8gkiwyEwJc=
X-Received: by 2002:a05:690c:714:b0:54c:88:64a1 with SMTP id
 bs20-20020a05690c071400b0054c008864a1mr2198949ywb.0.1680776885459; Thu, 06
 Apr 2023 03:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
 <20230405-pl180-busydetect-fix-v1-2-28ac19a74e5e@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v1-2-28ac19a74e5e@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 6 Apr 2023 12:27:29 +0200
Message-ID: <CAPDyKFp0x9y-eQDACpessg55R3MMjqHeOCVbEtFMZ1-bSANXhQ@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stefan Hansson <newbyte@disroot.org>, linux-mmc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 02/13] mmc: mmci: Clear busy_status when
	starting command
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

On Wed, 5 Apr 2023 at 08:50, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> If we are starting a command which can generate a busy
> response, then clear the variable host->busy_status
> if the variant is using a ->busy_complete callback.
>
> We are lucky that the member is zero by default and
> hopefully always gets cleared in the ->busy_complete
> callback even on errors, but it's just fragile so
> make sure it is always initialized to zero.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mmc/host/mmci.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index bc150c0d5eed..3e08b2e95550 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -1238,17 +1238,22 @@ mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
>                         c |= host->variant->cmdreg_srsp;
>         }
>
> -       if (host->variant->busy_timeout && cmd->flags & MMC_RSP_BUSY) {
> -               if (!cmd->busy_timeout)
> -                       cmd->busy_timeout = 10 * MSEC_PER_SEC;
> +       if (cmd->flags & MMC_RSP_BUSY) {
> +               if (host->ops->busy_complete)
> +                       host->busy_status = 0;

I think it would be even more safe to clear host->busy_status, even if
"cmd->flags & MMC_RSP_BUSY" isn't set.  Don't you think?

>
> -               if (cmd->busy_timeout > host->mmc->max_busy_timeout)
> -                       clks = (unsigned long long)host->mmc->max_busy_timeout * host->cclk;
> -               else
> -                       clks = (unsigned long long)cmd->busy_timeout * host->cclk;
> +               if (host->variant->busy_timeout) {
> +                       if (!cmd->busy_timeout)
> +                               cmd->busy_timeout = 10 * MSEC_PER_SEC;
> +
> +                       if (cmd->busy_timeout > host->mmc->max_busy_timeout)
> +                               clks = (unsigned long long)host->mmc->max_busy_timeout * host->cclk;
> +                       else
> +                               clks = (unsigned long long)cmd->busy_timeout * host->cclk;
>
> -               do_div(clks, MSEC_PER_SEC);
> -               writel_relaxed(clks, host->base + MMCIDATATIMER);
> +                       do_div(clks, MSEC_PER_SEC);
> +                       writel_relaxed(clks, host->base + MMCIDATATIMER);
> +               }
>         }
>
>         if (host->ops->pre_sig_volt_switch && cmd->opcode == SD_SWITCH_VOLTAGE)

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
