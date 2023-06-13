Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA4D72E280
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 14:08:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A66E7C6A61A;
	Tue, 13 Jun 2023 12:08:37 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9070BC6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 12:08:36 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-56d0d574964so28495567b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 05:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686658115; x=1689250115;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OPJzuW0ixM9ZYI29kAN8WxQgl/GV1/FsHCF7gaVnK78=;
 b=r8T7q0eWqU+jx8bkFiitMspo6hRJX+2Y3SinRe2ydRHu8y3+aXBVewA6Rgj4i+F07O
 3dQexa539cgwhkOtEevmfMo5O/4dLZnqOGI9c3mF9IIvzqCv9edD/r7+ZMudcRqWYGEe
 hKRzS6KjDWJR8TaA0QLprELgc1ZIYBbUCz52Ma12gqq6kbfm7zA6CD+Dh2pQG//TGPJo
 +TnPCH9t6OtpHC5cjVy17hE40wLZtEOZ1d2r2HhzI/TDGWPzWFMZ9uRtiS3qkgPt/S/+
 YWy4uuu1ymnnuLzn+TV4PTT/DyCwSibeNrjWOfTHIS3md7dj3HSQH5xFwU62HAALEh2P
 +SvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686658115; x=1689250115;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OPJzuW0ixM9ZYI29kAN8WxQgl/GV1/FsHCF7gaVnK78=;
 b=j2igd+N41ORxHmfS03y29s5dZI5nbc3RvaS83U7GObmIBXDNUtUaE2nufpE1fZEsfq
 ENuTnHlnHHTmKGmrid7tZeyBz/gHRU04KVMahwjM9cLPtd2IY8UmuAinzHYHWCrs1NLF
 fldexNcddDfmaYxwkOPdbTMllmybzII1zhDz5f17hVngRfbKrd8hcFsQCiZSqQEHh2IH
 UngyEvXKee1xMxlx7MwFRT57vT1tbFK66fHPEJYVAfZAdywjnczz1YVtUWmvYqgiJafb
 PgD5PQ1FfhEbeFWc669dqtBv66SEkpHTQRQuYvdS+E+hSv1B/se6WtKrBK0i+YnmklwP
 J+Pg==
X-Gm-Message-State: AC+VfDxFhcO8/c+Y3P8PXuKpfog2TCCTU9dqT9GhRlcNfr91ESQbT9Md
 DZTD9qleoZqNpMMWxRKYu1nuRl8DJO3GQK+Hht3YbA==
X-Google-Smtp-Source: ACHHUZ6bgansim4ozu5bUy2SkFCG4cPQlj+TA60nsFrF7CF14y/MUSUJ3z8OP1rqhakkO9yReUk76ztVjDLIGqhpno4=
X-Received: by 2002:a25:8e92:0:b0:ba7:9c6f:e2de with SMTP id
 q18-20020a258e92000000b00ba79c6fe2demr1352064ybl.27.1686658115562; Tue, 13
 Jun 2023 05:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
 <20230405-pl180-busydetect-fix-v3-1-cd3d5925ae64@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v3-1-cd3d5925ae64@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 13 Jun 2023 14:07:59 +0200
Message-ID: <CAPDyKFoWnt+MO1yoXqxjDGKvUL6Cfu7GkggTPjv+WeKQrts6fA@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mmc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 01/10] mmc: mmci: Clear busy_status
	when starting command
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

On Sun, 11 Jun 2023 at 21:41, Linus Walleij <linus.walleij@linaro.org> wrote:
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
> ChangeLog v2->v3:
> - Clear host->busy_status no matter if the MMC_RSP_BUSY flag
>   is set or not.
> - Now we have an if inside an if left, so combine these into
>   one singel conditional.
> - Resulting re-flow the if-clause.
> ChangeLog v1->v2:
> - Unconditionally clear host->busy_status if we get a
>   busy response.
> ---
>  drivers/mmc/host/mmci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index f2b2e8b0574e..14d639872952 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -1238,7 +1238,8 @@ mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
>                         c |= host->variant->cmdreg_srsp;
>         }
>
> -       if (host->variant->busy_timeout && cmd->flags & MMC_RSP_BUSY) {
> +       host->busy_status = 0;
> +       if ((cmd->flags & MMC_RSP_BUSY) && (host->variant->busy_timeout)) {

Why are you changing this line? There is no need to add the extra
parentheses, right?

>                 if (!cmd->busy_timeout)
>                         cmd->busy_timeout = 10 * MSEC_PER_SEC;
>
>

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
