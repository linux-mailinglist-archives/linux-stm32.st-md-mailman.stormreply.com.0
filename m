Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 644C5440E69
	for <lists+linux-stm32@lfdr.de>; Sun, 31 Oct 2021 13:29:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02DECC5A4FF;
	Sun, 31 Oct 2021 12:29:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0268EC23E53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 Oct 2021 12:29:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF57660FC2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 Oct 2021 12:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635683350;
 bh=ph3gBE0UwLAlyx3ipLRKhIarn/rc9a7pyxJUqyXnYE8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=usE8+qRTvJpP2yse/64Lo3Y95bBTZOSbybWVCe/z6i/VN9YxpGpT3jfz498VeY9Nj
 F+yz9QH1YiCG0kZfB8iYvyZ5Urn69rYXmh+XH/ymgj4wqCcc1713qVr17IYMqTnaXk
 8PQHebb2OQ4Hv9Ka1DHq+ik86BqFI13JmBQOzHR2KFeu5ru9lYsu9RzToXK4pjq3vO
 wnAk9HDnNYU4k+KZ6ME1MN1zpbt76wLMFmisi3jtxN0LwLKlF5rbGMsegMAHuJyr5t
 i8WuGy4gLiKvtwxtgsybrjpwkNsAlRbBt0yVZK+WG623uk3zIgPcEh2XeRk89OaDS4
 agunQIVu7fEmw==
Received: by mail-ot1-f54.google.com with SMTP id
 71-20020a9d034d000000b00553e24ce2b8so16586571otv.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 Oct 2021 05:29:10 -0700 (PDT)
X-Gm-Message-State: AOAM5321QLSoVRBwtgHD1RD3QfqtA7Z7mzHvd7WHJU5djsrSwAMrIrG5
 p0ub1RW3sEYNt50VRFfjI+eclP7StBANfRe8HMI=
X-Google-Smtp-Source: ABdhPJwgPIx5Ajj0S1T2KjyV/1WG7VBWyhFaagI5h0bGfEPDwtYo8G+a8GQ77xOCXiUmzae1g2e9z77AEw4JstfixnE=
X-Received: by 2002:a05:6830:1d6e:: with SMTP id
 l14mr16396459oti.147.1635683350134; 
 Sun, 31 Oct 2021 05:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211029135454.4383-1-nicolas.toromanoff@foss.st.com>
 <20211029135454.4383-4-nicolas.toromanoff@foss.st.com>
In-Reply-To: <20211029135454.4383-4-nicolas.toromanoff@foss.st.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 31 Oct 2021 13:28:58 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF5_2AnQH8pjgzbeq63iSkdkUVq3wZM_NURotoHj0sJMw@mail.gmail.com>
Message-ID: <CAMj1kXF5_2AnQH8pjgzbeq63iSkdkUVq3wZM_NURotoHj0sJMw@mail.gmail.com>
To: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Herbert Xu <herbert@gondor.apana.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 3/8] crypto: stm32/cryp - fix CTR counter
	carry
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

On Fri, 29 Oct 2021 at 16:01, Nicolas Toromanoff
<nicolas.toromanoff@foss.st.com> wrote:
>
> Fix issue in CTR counter overflow, the carry-over is now properly
> managed.
> Fixes: bbb2832620ac ("crypto: stm32 - Fix sparse warnings")
>
> Signed-off-by: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
> ---
>  drivers/crypto/stm32/stm32-cryp.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/crypto/stm32/stm32-cryp.c b/drivers/crypto/stm32/stm32-cryp.c
> index 7b55ad6d2f1a..6eeeca0d70ce 100644
> --- a/drivers/crypto/stm32/stm32-cryp.c
> +++ b/drivers/crypto/stm32/stm32-cryp.c
> @@ -163,7 +163,7 @@ struct stm32_cryp {
>         struct scatter_walk     in_walk;
>         struct scatter_walk     out_walk;
>
> -       u32                     last_ctr[4];
> +       __be32                  last_ctr[4];
>         u32                     gcm_ctr;
>  };
>
> @@ -1219,25 +1219,26 @@ static void stm32_cryp_check_ctr_counter(struct stm32_cryp *cryp)
>
>         if (unlikely(cryp->last_ctr[3] == 0xFFFFFFFF)) {
>                 cryp->last_ctr[3] = 0;
> -               cryp->last_ctr[2]++;
> +               cryp->last_ctr[2] = cpu_to_be32(be32_to_cpu(cryp->last_ctr[2]) + 1);
>                 if (!cryp->last_ctr[2]) {
> -                       cryp->last_ctr[1]++;
> +                       cryp->last_ctr[1] = cpu_to_be32(be32_to_cpu(cryp->last_ctr[1]) + 1);
>                         if (!cryp->last_ctr[1])
> -                               cryp->last_ctr[0]++;
> +                               cryp->last_ctr[0] = cpu_to_be32(be32_to_cpu(cryp->last_ctr[0]) + 1);
>                 }
>

crypto_inc() ??

>                 cr = stm32_cryp_read(cryp, CRYP_CR);
>                 stm32_cryp_write(cryp, CRYP_CR, cr & ~CR_CRYPEN);
>
> -               stm32_cryp_hw_write_iv(cryp, (__be32 *)cryp->last_ctr);
> +               stm32_cryp_hw_write_iv(cryp, cryp->last_ctr);
>
>                 stm32_cryp_write(cryp, CRYP_CR, cr);
>         }
>
> -       cryp->last_ctr[0] = stm32_cryp_read(cryp, CRYP_IV0LR);
> -       cryp->last_ctr[1] = stm32_cryp_read(cryp, CRYP_IV0RR);
> -       cryp->last_ctr[2] = stm32_cryp_read(cryp, CRYP_IV1LR);
> -       cryp->last_ctr[3] = stm32_cryp_read(cryp, CRYP_IV1RR);
> +       /* The IV registers are BE  */
> +       cryp->last_ctr[0] = cpu_to_be32(stm32_cryp_read(cryp, CRYP_IV0LR));
> +       cryp->last_ctr[1] = cpu_to_be32(stm32_cryp_read(cryp, CRYP_IV0RR));
> +       cryp->last_ctr[2] = cpu_to_be32(stm32_cryp_read(cryp, CRYP_IV1LR));
> +       cryp->last_ctr[3] = cpu_to_be32(stm32_cryp_read(cryp, CRYP_IV1RR));
>  }
>
>  static bool stm32_cryp_irq_read_data(struct stm32_cryp *cryp)
> --
> 2.17.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
