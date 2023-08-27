Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D77C37899E4
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Aug 2023 02:02:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 755B4C6B44F;
	Sun, 27 Aug 2023 00:02:14 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FD30C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Aug 2023 00:02:12 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2bcb54226e7so25020291fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Aug 2023 17:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693094532; x=1693699332;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BziPzk/8G2vrhw0dTzUPnWi0alpCUqJuRBn4AMK0kR4=;
 b=nK37IzwmvriZafI4FIa2ZgTvT3CKTqlP6hYXNdsqJI4wFHhOp6arHRMlM0phDZtN94
 kXSLn/EkKzn7IrePD1qEsG2LRXkNBN3HLY0Z9U0dnEfqvQUdt55MPdusO9Q3Sgj2qXd5
 uAraNFigMPGSqaJXFFLDEiwFEv7wkj5kvfCB2OkGIxdpUUGSQ1LxtF3QOtSJBsi82pnY
 8YIf/IBrOb8egt8CbOQl0xXKeUVFMOxl6aV5i71EFsmbS6NybYBy7j45y3D/ZBzmNp8y
 EHUUBSG/Deft/TK+zQ4UlRPSz61QQr81IbrXMlGg8xjzgyVfcdWqz9zBFUrBRu3UG8fK
 pPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693094532; x=1693699332;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BziPzk/8G2vrhw0dTzUPnWi0alpCUqJuRBn4AMK0kR4=;
 b=BeT2n8idw5KfFzwfN41v532oZeJeOnVoUanR5TP1DCYEvgSB1mWQUSpyA9Es5TAVxA
 uQqrwEjem8nJZ3kcQ+ZCidBQEeLWga6AP1E+eFPaS8kqD7PZqPyyx5nqPrCxzA24bKuD
 3tl4o9nIxWLi+k7bhKufggF9PokG02/lnMRww0wt78sRab+6G5DhS76it90IJp6CkjGW
 xQDH/+jVSPgJoq8M+aM8CVIWYVEJpnn+vInHcBUU0knQav+SJVoPmyuJc/ptza8pCrhF
 +5Wr1m3TWA6VzZjjmARbnUMuZJzsXGpROrss3yHnKgsp+kRvZeaxdROCInN9a08ZF3lk
 QRkA==
X-Gm-Message-State: AOJu0YzlbB91drUmzZDtY4osHjZlCScu1WUl25P2txEiTDC0A3ygkLPm
 AZLy3TM8sUSte2UU/7Gc2Mo=
X-Google-Smtp-Source: AGHT+IE2r5rN7h92pC+cHwPeAN0O1FLIbwZJPfB5AgA6RIX/BYsntyBApHOHFklOdIwCOoyhkmXXuA==
X-Received: by 2002:a2e:b537:0:b0:2bc:d993:5a58 with SMTP id
 z23-20020a2eb537000000b002bcd9935a58mr4747127ljm.17.1693094531471; 
 Sat, 26 Aug 2023 17:02:11 -0700 (PDT)
Received: from mobilestation ([95.79.200.178])
 by smtp.gmail.com with ESMTPSA id
 b26-20020a2e989a000000b002bb99bd0865sm1002035ljj.38.2023.08.26.17.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Aug 2023 17:02:10 -0700 (PDT)
Date: Sun, 27 Aug 2023 03:02:07 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <krvdz4filnpzhdy7tjkaisa2uzeh2sjzc2krno2rns24ldka37@abay33wdcck4>
References: <20230824-stmmac-subsecond-inc-cleanup-v1-0-e0b9f7c18b37@redhat.com>
 <20230824-stmmac-subsecond-inc-cleanup-v1-6-e0b9f7c18b37@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230824-stmmac-subsecond-inc-cleanup-v1-6-e0b9f7c18b37@redhat.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 6/7] net: stmmac: Fix comment
 about default addend calculation
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

Hi Andrew

On Thu, Aug 24, 2023 at 01:32:57PM -0500, Andrew Halaney wrote:
> The comment neglects that freq_div_ratio is the ratio between
> the subsecond increment frequency and the clk_ptp_rate frequency.
> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index dfead0df6163..64185753865f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -853,10 +853,12 @@ int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags)
>  	/* Store sub second increment for later use */
>  	priv->sub_second_inc = sub_second_inc;
>  

> -	/* calculate default addend value:
> -	 * formula is :
> -	 * addend = (2^32)/freq_div_ratio;
> -	 * where, freq_div_ratio = 1e9ns/sub_second_inc
> +	/* Calculate default addend so the accumulator overflows (2^32) in
> +	 * sub_second_inc (ns). The addend is added to the accumulator
> +	 * every clk_ptp cycle.
> +	 *
> +	 * addend = (2^32) / freq_div_ratio
> +	 * where, freq_div_ratio = (1e9ns / sub_second_inc) / clk_ptp_rate
>  	 */
>  	temp = div_u64(NSEC_PER_SEC, sub_second_inc);
>  	temp = temp << 32;

I am not well familiar with the way PTP works but at my naked eyes the
calculation implemented here looks a bit different than what is
described in the comment.

Basically config_sub_second_increment(clk_ptp_rate, sub_second_inc)
returns clk_ptp_rate period in nanoseconds or twice that period, or have it
scaled up on 0.465. So we have one of the next formulae:
X1 = NSEC_PER_SEC / clk_ptp_rate
X2 = 2 * NSEC_PER_SEC / clk_ptp_rate
X3 = X1 / 0.465
X4 = X2 / 0.465

Then stmmac_init_tstamp_counter() handles the retrieved period in the
next manner:
temp = div_u64(NSEC_PER_SEC, sub_second_inc);     // Convert back to frequency
temp = temp << 32;                                // multiply by 2^32
addend = div_u64(temp, priv->plat->clk_ptp_rate); // Divide by clk_ptp_rate

The code above is equivalent:

addend = ((NSEC_PER_SEC / X) * 2^32 ) / clk_ptp_rate = 
         (2^32 * NSEC_PER_SEC / X) / clk_ptp_rate = 
         2^32 / (clk_ptp_rate / (NSEC_PER_SEC / X))

AFAICS this doesn't match to what is in the comment (X = sub_second_inc).
freq_div_ratio gets to be inverted. Does it?

Substituting X to the formulae above we'll have just four possible results:
addend1 = 2^32
addend2 = 2^32 / 2
addend3 = 0.465 * 2^32
addend4 = 0.465 * 2^32 / 2

So basically clk_ptp_rate is irrelevant (neglecting all the
integer divisions rounding). Is that what implied by the implemented
algo?

Am I missing something? (it's quite possible since it's long past
midnight already.)

-Serge(y)

> 
> -- 
> 2.41.0
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
