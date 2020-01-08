Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5083E13441E
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2020 14:44:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 054F9C36B0B;
	Wed,  8 Jan 2020 13:44:06 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8ABA5C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2020 13:44:03 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id w62so1651324pfw.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Jan 2020 05:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Gmq+OYn2q2vGsfM0iTs4x3raT2eS8sck0M2TsL5zr/w=;
 b=WxYhqAW0LDM6dq7oo5G4VIPflo6uRiAjBhblX0puDGyW4xnq/8ivEYcT9bVSz6xxrE
 FR/XWh1F0bBBGJN55zLYpVNAJCu76npUZXsKDPBiS+1YpTJcWbfu+481eGiMWydBj3ri
 Nci4adeZCACFHxC3E+L4t5mnFT6sarelSITx+auPC7MfBTpQWyZDCEI0oZTuEzy166Ff
 JMDCExuR/+QiNMMgMI1lYEYVuoiFRFY7yWK1UBLRMh2vTwatsSedI07einwflhh7VInE
 KLVWdkAnYoqwmW+QjQSh2351/H+//ZwWKHcpjcGgSWjKNK5hFbDnE7xm45asJNmHFR54
 Fapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Gmq+OYn2q2vGsfM0iTs4x3raT2eS8sck0M2TsL5zr/w=;
 b=IbRC5n/xIEfzOAVp6OaKUYbeKtBlpJmQMjpAspKAs0Gq64FfT6tMc6KQeNydhe7yrx
 27y/gIYEpePWtFlxJrVyuyMtxqv0QzpLuwjZR8dQirdmqGdp5i/MgMmQ8NA2AzebMHKR
 IEwZxfi43ZEjAAEQ1c3E+ZXZrP6dReA4Rb+iOU8k2rcUOOs0udzl6hs10gDAhjS+4gyf
 +xO0hiDtUX+zNxeMObA5fpPzAdfMpPIbwPKsKZrejMegv9E2fHmPssDdpuSvO8oE1Tky
 OBYu8fpqgD8OitOwiqKI5i2fwyDWuPvdB3kJlktO7QW3lBEntSRtvl1iiNF8lBMDCY9n
 6p+A==
X-Gm-Message-State: APjAAAWteIApyAJA4kW1Uocb9kz+GCPXpNw+x6hBEKwc3IRbvcsphkhg
 Acj80yS8w9SkA8xFm+holZg=
X-Google-Smtp-Source: APXvYqxyjp0TG2gDqFgwVwFZ3d4b7bobaDPhrkaSTx0R0mEy2MZXSHeB475CA+IzwA8FQge9svwPUw==
X-Received: by 2002:a63:2d44:: with SMTP id t65mr5578887pgt.112.1578491042039; 
 Wed, 08 Jan 2020 05:44:02 -0800 (PST)
Received: from localhost (199.168.140.36.16clouds.com. [199.168.140.36])
 by smtp.gmail.com with ESMTPSA id z6sm3788961pfa.155.2020.01.08.05.44.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 Jan 2020 05:44:01 -0800 (PST)
Date: Wed, 8 Jan 2020 21:43:59 +0800
From: Dejin Zheng <zhengdejin5@gmail.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20200108134359.GA5909@nuc8i5>
References: <20200108072550.28613-1-zhengdejin5@gmail.com>
 <BN8PR12MB326627D0E1F17AE7515B78E4D33E0@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20200108112652.GA5316@nuc8i5>
 <BN8PR12MB3266601BC7BA0F414BD60E19D33E0@BN8PR12MB3266.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN8PR12MB3266601BC7BA0F414BD60E19D33E0@BN8PR12MB3266.namprd12.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "weifeng.voon@intel.com" <weifeng.voon@intel.com>,
 "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "treding@nvidia.com" <treding@nvidia.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 0/2] net: stmmac: remove useless code
	of phy_mask
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

On Wed, Jan 08, 2020 at 01:25:21PM +0000, Jose Abreu wrote:
> From: Dejin Zheng <zhengdejin5@gmail.com>
> Date: Jan/08/2020, 11:26:52 (UTC+00:00)
> 
> > On Wed, Jan 08, 2020 at 07:57:14AM +0000, Jose Abreu wrote:
> > > From: Dejin Zheng <zhengdejin5@gmail.com>
> > > Date: Jan/08/2020, 07:25:48 (UTC+00:00)
> > > 
> > > > Changes since v1:
> > > > 	1, add a new commit for remove the useless member phy_mask.
> > > 
> > > No, this is not useless. It's an API for developers that need only 
> > > certain PHYs to be detected. Please do not remove this.
> > >
> > Hi Jose:
> > 
> > Okay, If you think it is a feature that needs to be retained, I will
> > abandon it. since I am a newbie, after that, Do I need to update the
> > other commit in this patchset for patch v3? Thanks!
> 
> Your first commit (1/2) looks okay so you can submit that stand-alone in 
> my opinion.
>
Jose, thanks for your suggestions, You are so nice! I will do it.
> ---
> Thanks,
> Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
