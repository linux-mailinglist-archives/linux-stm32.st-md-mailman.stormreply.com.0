Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD8992670D
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 19:26:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F5B5C71280;
	Wed,  3 Jul 2024 17:26:22 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6918CC6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 17:26:15 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ee4ae13aabso59660661fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jul 2024 10:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720027574; x=1720632374;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=awH1SWyz5m9EzuY1Ye/qOXDti6nfQfIz3/fc3+URhls=;
 b=BoxEYy8oroRgPTQVcBtbLOh0q1tP4zZJvTwpUEUk2w3jI9frmQcN7Yw8IEZGlLwNVW
 /UK/S8A+NEIdt+ue82NQEneozZ9pWDmq/pCsTwsiSD2S/lOIGtjg3+m/r4/9RqkEbnCu
 mTJN896ADTe/hmquRNk8DYdoMyYKP3yxbkaakT93TuZ3aj3kvPiWtffMN2/yZG6mjy+G
 MzfULJIYeSCIcQxDXmBIMYppPNFO5zQ1VMcxavzpRcwQpGhZlTA0/xygCgfskGzW/j2Z
 pQWgEOHFnJhBthrx3J2zeRUP+gTpgptM1kQHaWcMWYyJBryOjmOcteVVEhcpAEjCaZ0Q
 u1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720027574; x=1720632374;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=awH1SWyz5m9EzuY1Ye/qOXDti6nfQfIz3/fc3+URhls=;
 b=NV1FvFQ3w5nrXGdhkvfGZmUKmd/85dUPWGnLk7GaITd0zB6telv6Fn/yTAdNMCHXpm
 kjgJWORMO5JVzKSPvY0Rp4xrOjLOqZ5eWoN2zSfyJ6B+lPsxGsegd7Ifxw811U8qhK09
 jzJOQ/5wQNTOh3/vCABeq89IxSdoO6APB6toqTdpJvS77aV1ldSv8Q2MljS3m/PY+xRs
 CMlxbP5cu7Xn1Qo/cV3u8tRv0A1Rh/KdUabDSVijKULsPVd2cqdfWVrba/Q55YViEUfP
 1y9mBIBIqP4FPMgapNCX6gd1NLvZxY+o01eIsnjuGaoKbbMKabLle4tVe5dcka3ltvTx
 XXIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf+jOgXUKDcV7LVeET6lBZlnqIIcojX2ZvrElOpPCDu8Mrrj8rL7pTxNd2mwTD1cq+rNMZTzyMBCfQN+vMwA0SRP/MXAAOlkaUORtdhpKcXcjjbIRFy1ar
X-Gm-Message-State: AOJu0YyJ302jw8F6M7iWw7bREhVBFa+7hBpuTXG0j+xdRTKzDApavrOF
 88mMzEEn7YQ40ao/+NKeByMSl49Q+0qURL95hzjBCnCXOJ28rHoy
X-Google-Smtp-Source: AGHT+IEfGmX259PPpjYgqeqmNjrrAOvOamyTRhyLKlXX3E3wq1o2xz6+Y6bmL/+OSPdFa1d/FzKziA==
X-Received: by 2002:a2e:8e81:0:b0:2ee:8644:8253 with SMTP id
 38308e7fff4ca-2ee864484e6mr13351641fa.22.1720027574343; 
 Wed, 03 Jul 2024 10:26:14 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee5168cf1fsm20223341fa.116.2024.07.03.10.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 10:26:13 -0700 (PDT)
Date: Wed, 3 Jul 2024 20:26:11 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <4sseitixno7uegbpufcqbutgqjywkmqi7tc3xoy5g6kr75be2w@zm3symrbpzcm>
References: <E1sOz2O-00Gm9W-B7@rmk-PC.armlinux.org.uk>
 <c26867af-6f8c-412a-bdd4-5ac9cc6a721c@lunn.ch>
 <xgqybykasoilqq2dufnffnlrqhph2w2tb7f3s4lnmh3urbx4jd@2e7nl2qkxtrb>
 <ZoVuVDhCDxr/wKKE@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZoVuVDhCDxr/wKKE@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 "Abhishek Chauhan \(ABC\)" <quic_abchauha@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Halaney <ahalaney@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwmac4: fix PCS duplex
	mode decode
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

On Wed, Jul 03, 2024 at 04:29:24PM +0100, Russell King (Oracle) wrote:
> On Wed, Jul 03, 2024 at 06:07:54PM +0300, Serge Semin wrote:
> > On Wed, Jul 03, 2024 at 04:06:54PM +0200, Andrew Lunn wrote:
> > > On Wed, Jul 03, 2024 at 01:24:40PM +0100, Russell King (Oracle) wrote:
> > > > dwmac4 was decoding the duplex mode from the GMAC_PHYIF_CONTROL_STATUS
> > > > register incorrectly, using GMAC_PHYIF_CTRLSTATUS_LNKMOD_MASK (value 1)
> > > > rather than GMAC_PHYIF_CTRLSTATUS_LNKMOD (bit 16). Fix this.
> > > 
> > > This appears to be the only use of
> > > GMAC_PHYIF_CTRLSTATUS_LNKMOD_MASK. Maybe it should be removed after
> > > this change?
> > 
> > There is a PCS-refactoring work initiated by Russell, which besides of
> > other things may eventually imply dropping this macro:
> > https://lore.kernel.org/netdev/20240624132802.14238-6-fancer.lancer@gmail.com/
> > So unless it is strongly required I guess there is no much need in
> > respinning this patch or implementing additional one for now.
> 
> Nevertheless, a respin is worth doing with Andrew's suggested change
> because this patch will impact the refactoring work even without that
> change. We might as well have a complete patch for this change.
> 
> (Besides, I've already incorporated Andrew's feedback!)

Ok. I just noted that that the respinning wasn't required due to the
same change implied by another patchset. But since you have already
implemented the change to make the patch more complete, then it's even
better than waiting for our STMMAC PCS discussions over.

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
