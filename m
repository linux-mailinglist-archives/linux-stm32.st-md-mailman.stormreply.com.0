Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B578AAB02
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Apr 2024 10:58:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D65BC6DD66;
	Fri, 19 Apr 2024 08:58:46 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAADCC6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 08:58:45 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-51ac5923ef6so226883e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 01:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713517125; x=1714121925;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NkPkWZD+fDDhemy2LIDiT55F/PO/TI//Q041lLZQk+c=;
 b=Sn/xTTMQtdXntPapVo2epiRsYdMpPKfPc+lmn1sZazQ1of25sg4YsiQDM7ldsLYG6s
 8B1DyFg6t0zVbCKJWQnKltpm56RLhoOMXC9c3W9+X1WM4HK05LHCpRBcJna7tqSXItGH
 e2P/367Su69pA8PC6e0tfqraAWHK45X9sVoyiRbyPcZZZb9bFZIF4XveKDuirqet0APL
 lyVQknxg1SpBTLjaZiAM5KU3aW8E3Jame7U8tS6C+GI7F6Jjlu4nI/Vuz9oU1G3vatzP
 QqXlHdXsk1hvBVesBhMR8jfpAdFe4nwTvJQ4DKqNsyTH62JItmyqlP/ZBf+flcYcRJ5Z
 dN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713517125; x=1714121925;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NkPkWZD+fDDhemy2LIDiT55F/PO/TI//Q041lLZQk+c=;
 b=jubUAzuFvbIxl5cLS6frgYbERLT6nYwujMPy+b0omQkH6gL2VnnMOqS5oPKy5BPmoy
 h5c5IYnJdlZMeh9DhzxzOGHvmWgp4TuwCAi2esBaEvC7P1DQCueWeP7HVtfhC8Gyt26A
 nM8ag4hmqdc74nF8AzjtwdB5k3tP+Cyuws3IrXcW9bls1RWMgvQc6zX7wGZMCFxxApHa
 /mFgmbUYuSMtpPkk3+oSRLx/9APXRbuUPZbWnJDgUt3eGWpXVfdqX66rMwjFSMTDAFeU
 rPeCCFZZMfP4kXiBojJbCes2u1/+t89KTan9Ypr991mLbiuKARtQEJroSZI4wkhKWyl8
 AlkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlqFdW2cQmizSfXELW5WtJTYqTiAAJWPrhz3i1T+w5Imozphbz3dubqYoutY9ATbBMKHPn2YaBcEB1+rcfNIsZTmkRrprGTXomSF5ryD1tP2HcDar/Umfj
X-Gm-Message-State: AOJu0Ywzyiq5dO6XdfSuafbrSsj3OuSlC6l3qgy5wtcr+KzyrRvOEi4K
 h73KOimSCNISCxoUky5NK1tCUjrnc15ZEVprXk2K6h16Lov6Rad4
X-Google-Smtp-Source: AGHT+IG9jaQLQRx7GI8egozbRcyQnR4eJjjPqvTksThvItCQ/0Y3ypRISV37b291kfO+3oDXaYzPfw==
X-Received: by 2002:a19:6442:0:b0:51a:ae0a:26dd with SMTP id
 b2-20020a196442000000b0051aae0a26ddmr786111lfj.28.1713517124659; 
 Fri, 19 Apr 2024 01:58:44 -0700 (PDT)
Received: from mobilestation.baikal.int (srv1.baikalchip.ru. [87.245.175.227])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a056512359800b0051950b8252asm606303lfr.240.2024.04.19.01.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 01:58:44 -0700 (PDT)
Date: Fri, 19 Apr 2024 11:58:42 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <axq6v6ya7nuov6x6vdjlp45i7bjdo2tkmmiuytye456fszycal@bkixd6ruplr7>
References: <20240417140013.12575-1-fancer.lancer@gmail.com>
 <20240418185328.79c38358@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240418185328.79c38358@kernel.org>
Cc: Yanteng Si <siyanteng@loongson.cn>, linux-kernel@vger.kernel.org,
 Simon Horman <horms@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>,
 netdev@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/2] net: stmmac: Fix
 MAC-capabilities procedure
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

On Thu, Apr 18, 2024 at 06:53:28PM -0700, Jakub Kicinski wrote:
> On Wed, 17 Apr 2024 17:00:06 +0300 Serge Semin wrote:
> > The series got born as a result of the discussions around the recent
> > Yanteng' series adding the Loongson LS7A1000, LS2K1000, LS7A2000, LS2K2000
> > MACs support:
> > Link: https://lore.kernel.org/netdev/fu3f6uoakylnb6eijllakeu5i4okcyqq7sfafhp5efaocbsrwe@w74xe7gb6x7p
> > 
> > In particular the Yanteng' patchset needed to implement the Loongson
> > MAC-specific constraints applied to the link speed and link duplex mode.
> > As a result of the discussion with Russel the next preliminary patch was
> > born:
> > Link: https://lore.kernel.org/netdev/df31e8bcf74b3b4ddb7ddf5a1c371390f16a2ad5.1712917541.git.siyanteng@loongson.cn
> > 
> > The patch above was a temporal solution utilized by Yanteng for further
> > developments and to move on with the on-going review. This patchset is a
> > refactored version of that single patch with formatting required for the
> > fixes patches.
> > 
> > The main part of the series has already been merged in on v1 stage. The
> > leftover is the cleanup patches which rename
> > stmmac_ops::phylink_get_caps() callback to stmmac_ops::update_caps() and
> > move the MAC-capabilities init/re-init to the phylink MAC-capabilities
> > getter.
> 

> According to the build bot it didn't apply at the time of posting :S

Most likely it happened because the first three patches
https://lore.kernel.org/netdev/20240412180340.7965-1-fancer.lancer@gmail.com/
hadn't been merged in yet back then. They are now.

> It does apply now but the bot doesn't have a "retry now" button.
> Could you repost?

Sure. I'll do that in an instant.

-Serge(y)

> -- 
> pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
