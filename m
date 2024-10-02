Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB1898E739
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Oct 2024 01:43:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B084C78023;
	Wed,  2 Oct 2024 23:43:45 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E27D3C78022
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Oct 2024 23:43:37 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2fac3f1287bso3881291fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Oct 2024 16:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727912617; x=1728517417;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZnZ6IwF/C3++VtFHyrIQYmghfA5xDJeKUO+7mIqPveY=;
 b=ivmgHvlQJHiL9tx/A5Bt8Q3BSfP4vuyTlak2HmG7b2aql8SZ44VT4riWAfW7OkrU6w
 /4TXelRdT02wsYgZ0vWTa3n/iMhVZwK5e/mZJic5wHL9hN82ELRpXn54r63eQvFYaO+T
 YsmVZEPId0gxLUBMOK/scDEM1y7/sBwxgCrPAEH/RudEbkCbowHyGMncVxtmOzqKmeop
 /pGAI1QKlNXNwONQSSZzfAi0KPS5gdGOQxvn3b7nhyyidaAI2Tc9zxoXYWgCyPGkZywX
 Nj5WGJjsD+lC/GmrPhpypizr4se51SQIxGCS1SgEvG7GLVfDBvTRLW/A0pkKw8QGCNMq
 aOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727912617; x=1728517417;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZnZ6IwF/C3++VtFHyrIQYmghfA5xDJeKUO+7mIqPveY=;
 b=hTUfg1/ZOmon5J0+8tsPgTfyIMaXn7+b+rxc+MpuHHr8jEzulJWE8Fsq2yocgzBo8t
 NGN6SYs5qUXqQvSq9ULqOtCUhStyY6Mb6AWBIHBxVHt95wlxHeN2m2nFn6t5AlUTUyxk
 iW9y68MeNg8SrxP62dJIYUHJo6Qe0uDH1F0qTVYZIvTA0Thwu5F8UoEKn19db5PSEviz
 CmZujL2NcKA50Ml6Ll+1ulkJU5V+4voO4K527Mh2FeHWbPxrxfgErLE2ikQuEGfW2uwI
 u1ymkLrrIam+444Ta1lSjq6dSx2x5RNh1bHSXQDVkppAjbGazuLTlARyRAAOCYYWPLqj
 y63A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaaP5BxB3H4OPnYJZYLrmlfm+/7ih32bHU7+1G53/4sb41ZqVCWKN2uWGC9wwlhDFo3u6g18CDWo0QaA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy2k1dRx4G7wf7lp1UYUvwZywIw4usfcNb3FyCB2SjmGLXL++qq
 9BuRSiU2gcuNb/zFKmo1bk4mNCRxzVGpUY9k46vjHJmuUH0ZKlnT
X-Google-Smtp-Source: AGHT+IFlhPtoXyWwwkC4XoQdBs124sv8hczhDcjgycjM3CLHUAqSnF2DitEc8Uys/qoWEBuYT6cd7Q==
X-Received: by 2002:a2e:a9a3:0:b0:2fa:cf82:a1b2 with SMTP id
 38308e7fff4ca-2fae107dc8cmr34805691fa.31.1727912616682; 
 Wed, 02 Oct 2024 16:43:36 -0700 (PDT)
Received: from mobilestation ([95.79.225.241])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faecc9900dsm270151fa.112.2024.10.02.16.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 16:43:35 -0700 (PDT)
Date: Thu, 3 Oct 2024 02:43:32 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <zghybnunit6o3wq3kpb237onag2lycilwg5abl5elxxkke4myq@c72lnzkozeun>
References: <ZvwdKIp3oYSenGdH@shell.armlinux.org.uk>
 <E1svfMA-005ZI3-Va@rmk-PC.armlinux.org.uk>
 <fp2h6mc2346egjtcshek4jvykzklu55cbzly3sj3zxhy6sfblj@waakp6lr6u5t>
 <ZvxxJWCTD4PgoMwb@shell.armlinux.org.uk>
 <68bc05c2-6904-4d33-866f-c828dde43dff@lunn.ch>
 <pm7v7x2ttdkjygakcjjbjae764ezagf4jujn26xnk7driykbu3@hfh4lwpfuowk>
 <84c6ed98-a11a-42bf-96c0-9b1e52055d3f@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84c6ed98-a11a-42bf-96c0-9b1e52055d3f@lunn.ch>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 01/10] net: pcs: xpcs: move PCS
 reset to .pcs_pre_config()
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

On Thu, Oct 03, 2024 at 01:12:58AM GMT, Andrew Lunn wrote:
> > But if my reasoning haven't been persuasive enough anyway, then fine by
> > me. I'll just add a new patch (as described in 2.1y) to my series.
> > But please be ready that it will look as a reversion of the Russell'
> > patches 2.1 and 2.3.
> 
> Note what Russell said in patch 0/X:
> 
> > First, sorry for the bland series subject - this is the first in a
> > number of cleanup series to the XPCS driver.
> 

> I suspect you need to wait until all the series have landed before
> your patches can be applied on top.

Of course I have no intention to needlessly over-complicate the
review/maintenance process by submitting a new series interfering with
the already sent work. That's what I mentioned on the RFC-stage of
this series a few days ago:
https://lore.kernel.org/netdev/mykeabksgikgk6otbub2i3ksfettbozuhqy3gt5vyezmemvttg@cpjn5bcfiwei/

But for the reason that I've already done some improvements too, why
not to use some of them to simplify the Russell' and further changes
if they concern the same functionality?.. That's why I originally
suggested my patch as a pre-requisite change.

Anyway the Russell' patch set in general looks good to me. I have no
more comments other than regarding the soft-reset change I described in
my previous message.

-Serge(y)

> 
> 	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
