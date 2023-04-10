Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A48E6DCCC9
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Apr 2023 23:24:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14C40C69065;
	Mon, 10 Apr 2023 21:24:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6353C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Apr 2023 21:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681161868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=guIPUS4b/KI5jRIGt0RS4kaJQ4UcCDM9VQ9qZvewB+Q=;
 b=BfqpFF2zXOWyGwNcj8ooUjwRs1YtJGoVJRsmdR3oArqUOoZz9gXgiLZsMPbDuRA4/em/Lt
 OfBPnS7pCc1m9XcUG0bJgNKaj53zlQQ9Jvn8GOMfTdpOLWxFWhwySoPBYX9zzdf7m/xGKF
 Dp2QcdawAbR4X9ssld+7e+4nkHa2dK0=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-NKW9ipcGMNum6mIgk6lilA-1; Mon, 10 Apr 2023 17:24:26 -0400
X-MC-Unique: NKW9ipcGMNum6mIgk6lilA-1
Received: by mail-ot1-f70.google.com with SMTP id
 j17-20020a9d7691000000b006a36ae648cbso7465289otl.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Apr 2023 14:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681161866;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=guIPUS4b/KI5jRIGt0RS4kaJQ4UcCDM9VQ9qZvewB+Q=;
 b=FwL8zcOdp7iAD/IJ7LV+j0X8E7ZqK3R8RPN/syJzVt5WJZXZuRvJte78+Vh6dCpwAi
 HmYhk3OKHhaMGkvEUFhYK+gx4F+9qZTked6r3z5+20wC7WKhAv4QzTkchJD6XCv8mYcu
 tt8r30im0+0zltVcl4yOY92A3RX9pLZA1NIsOrgKcaz2+xqmOXNV7OwPqkFeFp2YBAQl
 OhQ0oWU9uJ0zVqBPNvG06a5/c/Qx3mjipl1yn7buEhEE4M1YqtHn1LZJJ90+Clwp+M+R
 jvw8KWK2/YpMph0xIjS5Ng21heddB+dwMVfwsCX1kp4/0l5Y8YKv+K6ndpXqvRC4aZE1
 SVSg==
X-Gm-Message-State: AAQBX9dN5CSi5j2tnvon0KgH1Tpn9Q4t0DuFxE+GnAWjMkYNl6wwRt5m
 QNeDhBippZw1zEKye360wJud28QbfyHdraCDVZHyvI7jGngZtXLjNUlWY3NWRlEt/XovEect32w
 Z8yCzRtqczcxRl7nfBKZsUNSIsTBGe8Wv0u0mTWxP
X-Received: by 2002:a05:6808:1a27:b0:38b:c1b4:6af9 with SMTP id
 bk39-20020a0568081a2700b0038bc1b46af9mr2735755oib.4.1681161866120; 
 Mon, 10 Apr 2023 14:24:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350bgc7ZX4XjpSwPu1lYDObg75z6mEqgIGHBCnCkz1NdyheSPE+5IoVPpSan2LLi+1tqeOtiR4Q==
X-Received: by 2002:a05:6808:1a27:b0:38b:c1b4:6af9 with SMTP id
 bk39-20020a0568081a2700b0038bc1b46af9mr2735718oib.4.1681161865851; 
 Mon, 10 Apr 2023 14:24:25 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net.
 [104.53.165.62]) by smtp.gmail.com with ESMTPSA id
 w127-20020a4a5d85000000b00525398a1144sm5117502ooa.32.2023.04.10.14.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 14:24:25 -0700 (PDT)
Date: Mon, 10 Apr 2023 16:24:22 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Simon Horman <simon.horman@corigine.com>
Message-ID: <20230410212422.2rztlqspw5vjtb4d@halaney-x13s>
References: <20230331214549.756660-1-ahalaney@redhat.com>
 <20230331214549.756660-9-ahalaney@redhat.com>
 <ZChIbc6TnQyZ/Fiu@corigine.com>
 <20230407173453.hsfhbr66254z57ym@halaney-x13s>
MIME-Version: 1.0
In-Reply-To: <20230407173453.hsfhbr66254z57ym@halaney-x13s>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-stm32@st-md-mailman.stormreply.com, tee.min.tan@linux.intel.com,
 samuel@sholland.org, linux@armlinux.org.uk, jernej.skrabec@gmail.com,
 veekhee@apple.com, wens@csie.org, joabreu@synopsys.com, agross@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, andrey.konovalov@linaro.org,
 ncai@quicinc.com, devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-kernel@vger.kernel.org, echanude@redhat.com,
 konrad.dybcio@linaro.org, vkoul@kernel.org, hisunil@quicinc.com,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v3 08/12] net: stmmac: Pass
 stmmac_priv in some callbacks
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

On Fri, Apr 07, 2023 at 12:34:53PM -0500, Andrew Halaney wrote:
> On Sat, Apr 01, 2023 at 05:06:21PM +0200, Simon Horman wrote:
> > On Fri, Mar 31, 2023 at 04:45:45PM -0500, Andrew Halaney wrote:
> > > Passing stmmac_priv to some of the callbacks allows hwif implementations
> > > to grab some data that platforms can customize. Adjust the callbacks
> > > accordingly in preparation of such a platform customization.
> > > 
> > > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > 
> > ...
> > 
> > >  #define stmmac_reset(__priv, __args...) \
> > > @@ -223,59 +240,59 @@ struct stmmac_dma_ops {
> > >  #define stmmac_dma_init(__priv, __args...) \
> > >  	stmmac_do_void_callback(__priv, dma, init, __args)
> > >  #define stmmac_init_chan(__priv, __args...) \
> > > -	stmmac_do_void_callback(__priv, dma, init_chan, __args)
> > > +	stmmac_do_void_callback(__priv, dma, init_chan, __priv, __args)
> > 
> > Hi Andrew,
> > 
> > Rather than maintaining these macros can we just get rid of them?
> > I'd be surprised if things aren't nicer with functions in their place [1].
> > 
> > f.e., we now have (__priv, ..., __priv, ...) due to a generalisation
> >       that seems to take a lot more than it gives.
> > 
> > [1] https://lore.kernel.org/linux-arm-kernel/ZBst1SzcIS4j+t46@corigine.com/
> > 
> 
> Thanks for the pointer. I think that makes sense, I'll take that
> approach for these functions (and maybe in a follow-up series I'll
> tackle all of them just because the lack of consistency will eat me up).
> 

I tried taking this approach for a spin, and I'm not so sure about it
now!

1. Implementing the functions as static inline requires us to know
   about stmmac_priv, but that's getting into circular dependency land
2. You could define them in hwif.c, but then they're not inlined
3. There's still a good bit of boilerplate that's repeated all over
   with the approach. Ignoring 1 above, you get something like this:

static inline int stmmac_init_chan(struct stmmac_priv *priv,
				   void __iomem *ioaddr,
				   struct stmmac_dma_cfg *dma_cfg, u32 chan)
{
	if (priv->hw->dma && priv->hw->dma->init_chan) {
		priv->hw->dma->init_chan(priv, ioaddr, dma_cfg, chan);
		return 0;
	}
	return -EINVAL;
}

that is then repeated for every function... which is making me actually
appreciate the macros some for reducing boilerplate.

Am I suffering from a case of holiday brain, and 1-3 above are silly
points with obvious answers, or do they make you reconsider continuing
with the current approach in hwif.h?

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
