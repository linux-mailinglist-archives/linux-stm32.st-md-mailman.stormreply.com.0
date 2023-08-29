Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 108BB78C831
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Aug 2023 17:01:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C021CC65E4C;
	Tue, 29 Aug 2023 15:01:27 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B8BEC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Aug 2023 15:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693321286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6h9pTCs0QqfZaahhz4vtRzmjxLiM0cNxR6bc6DX4y54=;
 b=a63gWi1WTne/CTO8AExtG+Fe0p5+wPH1Xwkp+J0nAc2lusnXRFe2O8nOiQZkVnEDCgzVL6
 E3mmBnwkMFhBYaislfsx3TY3s5DsYtivpQT5luUMjMbs3sv3N56bnj8RKimzWgDTopSLa+
 DSjsfCXqE457MdM0CBgf7EHEFNJ2+xo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-Qo6N4xXIMuOIxuJcni47ng-1; Tue, 29 Aug 2023 11:01:24 -0400
X-MC-Unique: Qo6N4xXIMuOIxuJcni47ng-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-76da52a42bcso563800585a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Aug 2023 08:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693321284; x=1693926084;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6h9pTCs0QqfZaahhz4vtRzmjxLiM0cNxR6bc6DX4y54=;
 b=fzpo7KVKqvTfmor9yc33/87GOI0F5XpG0epGVCx8wo1f429+5f/IgSBkI8qWyIGVR5
 kJPct4Ny6xBh5EgjOqrfBcRHy0OyzAxS3sy7NikU3S5Kf+v8v8/s+MIAif3o6sq/LFgN
 Wsvb6dh7sFcTQ5aNfmLo0o4pc0ayyTx/ljCvcYfpTrw2u0BM6ooQQgKXImvECk7RG9U1
 /WEvTwMQ3TwGReo9LeqGkBzVO8nay5cKfNR8IhSGBdW0hvQxVrdVZA94s0O18v2SNzD6
 GwY24gM/Vw7Vm7JiXZzRdISc8BMGpvBtgRyeYu+po/1jQ3QU/sprZlpo/boNFnizJODA
 7mSw==
X-Gm-Message-State: AOJu0YwbI7ouNjA3wGbFnnjfYrO68G/MZrUwI11GO6Q9cGjQ2gT+5ltf
 cbw6CaaWii3Wew4uN/Z97mSd8JKrFGogkfW+xFrRBtlbgwkoLLYTIYrso/2uEtNpK7xO64PKZ1r
 WsUsGn0dxOYtgpmz/klVHqdON93CZPkKvuFzveSbr
X-Received: by 2002:a05:620a:40c5:b0:765:a89b:ce04 with SMTP id
 g5-20020a05620a40c500b00765a89bce04mr36037768qko.59.1693321283652; 
 Tue, 29 Aug 2023 08:01:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0jqm5RvEJS18dC9OLaTz6lha6Ba+n8aGLpLZK8QizD0gPmS2lHt0o0jo32ccmdIMtiV6xSg==
X-Received: by 2002:a05:620a:40c5:b0:765:a89b:ce04 with SMTP id
 g5-20020a05620a40c500b00765a89bce04mr36037732qko.59.1693321283363; 
 Tue, 29 Aug 2023 08:01:23 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::49])
 by smtp.gmail.com with ESMTPSA id
 ow30-20020a05620a821e00b0076c701c3e71sm3133005qkn.121.2023.08.29.08.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 08:01:22 -0700 (PDT)
Date: Tue, 29 Aug 2023 10:01:20 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <matyki35liqllsiokgn4xrfxabk4wzelif56vtlkvauhkpssor@ohy5a25yk6ja>
References: <20230824-stmmac-subsecond-inc-cleanup-v1-0-e0b9f7c18b37@redhat.com>
 <20230824-stmmac-subsecond-inc-cleanup-v1-6-e0b9f7c18b37@redhat.com>
 <krvdz4filnpzhdy7tjkaisa2uzeh2sjzc2krno2rns24ldka37@abay33wdcck4>
MIME-Version: 1.0
In-Reply-To: <krvdz4filnpzhdy7tjkaisa2uzeh2sjzc2krno2rns24ldka37@abay33wdcck4>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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

On Sun, Aug 27, 2023 at 03:02:07AM +0300, Serge Semin wrote:
> Hi Andrew
> 
> On Thu, Aug 24, 2023 at 01:32:57PM -0500, Andrew Halaney wrote:
> > The comment neglects that freq_div_ratio is the ratio between
> > the subsecond increment frequency and the clk_ptp_rate frequency.
> > 
> > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index dfead0df6163..64185753865f 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -853,10 +853,12 @@ int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags)
> >  	/* Store sub second increment for later use */
> >  	priv->sub_second_inc = sub_second_inc;
> >  
> 
> > -	/* calculate default addend value:
> > -	 * formula is :
> > -	 * addend = (2^32)/freq_div_ratio;
> > -	 * where, freq_div_ratio = 1e9ns/sub_second_inc
> > +	/* Calculate default addend so the accumulator overflows (2^32) in
> > +	 * sub_second_inc (ns). The addend is added to the accumulator
> > +	 * every clk_ptp cycle.
> > +	 *
> > +	 * addend = (2^32) / freq_div_ratio
> > +	 * where, freq_div_ratio = (1e9ns / sub_second_inc) / clk_ptp_rate
> >  	 */
> >  	temp = div_u64(NSEC_PER_SEC, sub_second_inc);
> >  	temp = temp << 32;
> 
> I am not well familiar with the way PTP works but at my naked eyes the
> calculation implemented here looks a bit different than what is
> described in the comment.
> 
> Basically config_sub_second_increment(clk_ptp_rate, sub_second_inc)
> returns clk_ptp_rate period in nanoseconds or twice that period, or have it
> scaled up on 0.465. So we have one of the next formulae:
> X1 = NSEC_PER_SEC / clk_ptp_rate
> X2 = 2 * NSEC_PER_SEC / clk_ptp_rate
> X3 = X1 / 0.465
> X4 = X2 / 0.465

X5 = PTP_SSIR_SSINC_MAX (0xFF) is a case as well to consider
> 
> Then stmmac_init_tstamp_counter() handles the retrieved period in the
> next manner:
> temp = div_u64(NSEC_PER_SEC, sub_second_inc);     // Convert back to frequency
> temp = temp << 32;                                // multiply by 2^32
> addend = div_u64(temp, priv->plat->clk_ptp_rate); // Divide by clk_ptp_rate
> 
> The code above is equivalent:
> 
> addend = ((NSEC_PER_SEC / X) * 2^32 ) / clk_ptp_rate = 
>          (2^32 * NSEC_PER_SEC / X) / clk_ptp_rate = 
>          2^32 / (clk_ptp_rate / (NSEC_PER_SEC / X))
> 
> AFAICS this doesn't match to what is in the comment (X = sub_second_inc).
> freq_div_ratio gets to be inverted. Does it?

You're right, my comment needs to be inverted to match all of the above
(which is a great recap, thank you!).

> 
> Substituting X to the formulae above we'll have just four possible results:
> addend1 = 2^32
> addend2 = 2^32 / 2
> addend3 = 0.465 * 2^32
> addend4 = 0.465 * 2^32 / 2

addend5 = 2^32 / (clk_ptp_rate / (NSEC_PER_SEC / 0xFF))

I think that would be the PTP_SSIR_SSINC_MAX case (X5) I inserted above

> 
> So basically clk_ptp_rate is irrelevant (neglecting all the
> integer divisions rounding). Is that what implied by the implemented
> algo?
> 
> Am I missing something? (it's quite possible since it's long past
> midnight already.)

I believe you've captured everything, minus the one conditional I added.

I think because of that conditional we can't just nicely code up some
contants here independent of sub_second_inc. Now I can blame the morning
and not enough coffee, do you see anything wrong with that thought
process? I'm all ears for suggestions for cleaning this up, especially
since others like Richard have indicated that it could use some love,
but right now I'm hung up thinking the best I can do is fix the bad
comment in this patch.

Thanks for the review!
- Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
