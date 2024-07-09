Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9BD92AE17
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2024 04:14:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92961C6DD72;
	Tue,  9 Jul 2024 02:14:28 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 637EFC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2024 02:14:21 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1fb8781ef1bso9900355ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jul 2024 19:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720491260; x=1721096060;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tUJk5cdd3SYgBT6mXktVY0iylI5j6aUAHw71DNobdU8=;
 b=Z+EHRn2/GaWVThnJ/4pRIFTvfitU3u5Pisrpz/tS4zAlCWW7lR5kReEMHDUkSv8aK5
 CzmsqKgGUfOVDhsUE5EWGAj1daEdiUM6T+it1fyOz0S7ChwdQNdIY1sk4ftGyECacr9U
 tGIL0ilEQ35upFuJw8vzAPHviZSGHvaJskLyZsXknw/CDtfZ1/kiq/e3yvwN0drfaSIO
 ckbXd/mIoYvrm2kmrkHPYL6D1B8R0lF+C81DrMvkECRahhTM0LFx1EOJBsChEGrbrmGp
 RgEOtDtYEpn9pu4D6VOdsvap7Cf6LVj3tJnQWNGCbOdvtabiCD+FRmJD5l8sYfxUObIu
 UknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720491260; x=1721096060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tUJk5cdd3SYgBT6mXktVY0iylI5j6aUAHw71DNobdU8=;
 b=InbKQY+M0UjieZJl0uana6/D1GpdSir/nex+vg7+ZaBwY+b6/PCifjIOxcJNTTsVVT
 XUja9j67PgeB96foeo1u/IBnLUCYMBufQVj5dzIcb4/ydynu8rQpp2NmefTiNH6yVWXT
 HU+7q30CxDimo0Nmos59xt5xAXov6AUWcwNW6zD+UmF1/LP3HT4Gd8uDQZL6wegXo5mG
 7OCOoaT2hA1/sbp7roUDo2IbEP323tyNHnuLiq7Dv22saLu/d2KOTiVBRTKnV9ZUY82i
 1IPGTerzq000Bt6uVV6TKadN7CQC2+8sl090CLbsGC8RIBmxBRMRI+Fyd6BEmwQKCOwk
 4VYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtOv9vbtaZ1QocAU+jX9d+//3naAsZZu9Dqd7muyMCbAZnRWPjIvem3tyMhm5ck0UdYYGD7gI+xH3MyBRhGgLF3rHYUAyzGPnjqR1HDT93M4+vqA+PWU++
X-Gm-Message-State: AOJu0YxuYW1OwpDUtkrqUImO3PgznneDBS9/QEnKClAdHFA+bl0Q8t0J
 pexOypxefukM61fo5ijMMm71nv4R/RSiN52FKKYqSWpFIoZI3QWH
X-Google-Smtp-Source: AGHT+IGifYCUjDlpdABP2FmVQ9Uu47bpzw+e6ONUof7UeA6cbyy75OUBvdWUMp43MfpzKyh1ULJeBQ==
X-Received: by 2002:a17:903:2308:b0:1fb:8c35:6036 with SMTP id
 d9443c01a7336-1fbb6cda8e5mr9793955ad.5.1720491259723; 
 Mon, 08 Jul 2024 19:14:19 -0700 (PDT)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6a28f8esm5179775ad.64.2024.07.08.19.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 19:14:19 -0700 (PDT)
Date: Tue, 9 Jul 2024 10:14:07 +0800
From: Furong Xu <0x1207@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20240709101407.00005199@gmail.com>
In-Reply-To: <7cde7743-2a8c-4d12-aecb-d1e50d5099ea@lunn.ch>
References: <20240708082220.877141-1-0x1207@gmail.com>
 <7cde7743-2a8c-4d12-aecb-d1e50d5099ea@lunn.ch>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, rock.xu@nio.com,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: Refactor Frame
 Preemption(FPE) implementation
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

On Mon, 8 Jul 2024 20:44:31 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > +static void fpe_configure(struct stmmac_priv *priv, struct stmmac_fpe_cfg *cfg,
> > +			  u32 num_txq, u32 num_rxq, bool enable)
> > +{
> > +	u32 value;
> > +
> > +	if (enable) {
> > +		cfg->fpe_csr = FPE_CTRL_STS_EFPE;
> > +		if (priv->plat->has_xgmac) {
> > +			value = readl(priv->ioaddr + XGMAC_RXQ_CTRL1);
> > +			value &= ~XGMAC_FPRQ;
> > +			value |= (num_rxq - 1) << XGMAC_FPRQ_SHIFT;
> > +			writel(value, priv->ioaddr + XGMAC_RXQ_CTRL1);
> > +		} else if (priv->plat->has_gmac4) {
> > +			value = readl(priv->ioaddr + GMAC_RXQ_CTRL1);
> > +			value &= ~GMAC_RXQCTRL_FPRQ;
> > +			value |= (num_rxq - 1) << GMAC_RXQCTRL_FPRQ_SHIFT;
> > +			writel(value, priv->ioaddr + GMAC_RXQ_CTRL1);
> > +		}  
> 
> Since you are using a structure of function pointers, it would seem
> more logical to have a fpe_xgmac_configure() and a
> fpe_gmac4_configure(), and then xgmac_fpe_ops and gmac4_fpe_ops.
> 
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -974,8 +974,7 @@ static void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
> >  	bool *hs_enable = &fpe_cfg->hs_enable;
> >  
> >  	if (is_up && *hs_enable) {
> > -		stmmac_fpe_send_mpacket(priv, priv->ioaddr, fpe_cfg,
> > -					MPACKET_VERIFY);
> > +		stmmac_fpe_send_mpacket(priv, priv, fpe_cfg, MPACKET_VERIFY);  
> 
> passing priv twice looks very odd! It makes me think the API is
> designed wrong. This could be because of the refactoring changes you
> made? Maybe add another patch cleaning this up?

Hi Andrew

Thanks for your comments.
This patch is almost a clone of "net: stmmac: Refactor EST implementation"
https://github.com/torvalds/linux/commit/c3f3b97238f6fd87b9d90b9a995ee5e69f751a74
Many decisions were made based on that patch.

I will submit a new patchset with splited patches and make function callbacks more logical.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
