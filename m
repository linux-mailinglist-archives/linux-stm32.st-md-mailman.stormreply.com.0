Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FDC14AA72
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jan 2020 20:28:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 794E5C36B0B;
	Mon, 27 Jan 2020 19:28:35 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1106CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2020 19:28:32 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a5so8036540wmb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2020 11:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nVpNgKJkF9tkji59pMJrNk0LvUKK5aYZzAaELznZEIo=;
 b=EOPSnOhcgaq1gVIt4MtWAnnjLhta8bYIS1juX1koiLs8kPKtUS+C8v+HIVkCGlcxuA
 j8v+OFcxiedIi+GPnp5ZjC6mMCb6f67Hw33ayz55aUpmhj+57sMXUmUn41UfqE9NT7Ad
 drQiejNjHnpG3hwUF9zSRsVq4AOqdhYv2HScIj99eoD1IyoQ7ILWYjt+L3c5E7DDWxl+
 81ojPuXLQN+n84E4lL1zuKsyOwkRHIDS3tEAjpZ5Po6ufowof5o/OZwe6BZwAUGFHB+A
 w84W02xMdaIqsZEa6jlyiTL0M7TJUEW8IpyO6D8RBZdVTZ/D9pO8UNjhHy60bWEhbU94
 +yTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nVpNgKJkF9tkji59pMJrNk0LvUKK5aYZzAaELznZEIo=;
 b=aPcbGNKpz/p3XhqPgAn2K940v5mCbV6d1GXIl+5etz0WfNwc1SToa5o8Pib8oNUDdE
 ZFClEKtPyhGfNLJUJeHYFYtEPnYJdXDcV+AH6UN+CtAo1KTV+lb9+TCZdCPmJWI7wF8T
 esJ3+6fWTM+w87aaPnuX7OEWtNDWpyOOjcoTog5DAiA7VzY8PlB9wsm6gW2ojjTpVfOk
 zFtAw9kI4CR+ELq6XeL6Ol4KsgzxSsPfdZiAzzr1Yr0YmZV7MOZ/ZZ21NTCdH0/bW16i
 jlmeDspT+1163qyeux8wSDJLu2mRj5Dz7/qCtCEyAqiazNrxjx/277JMp8VHRlYUFETD
 kfUw==
X-Gm-Message-State: APjAAAXjVGPcqJIxIA0lLPzw6f+0ICHw6mrTIroOqkDPW97HV2O4r3AG
 aWcZ51e2dGSB07BESzNEmU8=
X-Google-Smtp-Source: APXvYqxoCNMBFRKbINc2j745ycYNdqyYUaS3O3hsaHm6/siwUXdgo2uba0UD5gd43Kd/W8rSqHHk3w==
X-Received: by 2002:a1c:9c87:: with SMTP id f129mr235606wme.26.1580153311807; 
 Mon, 27 Jan 2020 11:28:31 -0800 (PST)
Received: from ?IPv6:2003:ea:8f36:6800:3496:17d5:1b2b:bee1?
 (p200300EA8F366800349617D51B2BBEE1.dip0.t-ipconnect.de.
 [2003:ea:8f36:6800:3496:17d5:1b2b:bee1])
 by smtp.googlemail.com with ESMTPSA id e6sm22981852wru.44.2020.01.27.11.28.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2020 11:28:31 -0800 (PST)
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>
References: <cover.1580122909.git.Jose.Abreu@synopsys.com>
 <9a2136885d9a892ff170be88fdffeda82c778a10.1580122909.git.Jose.Abreu@synopsys.com>
 <20200127112102.GT25745@shell.armlinux.org.uk>
 <BN8PR12MB3266714AE9EC1A97218120B3D30B0@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20200127114600.GU25745@shell.armlinux.org.uk>
 <20200127140038.GD13647@lunn.ch>
 <20200127140834.GW25745@shell.armlinux.org.uk>
 <20200127145107.GE13647@lunn.ch>
 <20200127161132.GX25745@shell.armlinux.org.uk>
 <20200127162206.GJ13647@lunn.ch>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <c3e863b8-2143-fee3-bb0b-65699661d7ab@gmail.com>
Date: Mon, 27 Jan 2020 20:28:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200127162206.GJ13647@lunn.ch>
Content-Language: en-US
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [RFC net-next 6/8] net: phylink: Configure
 MAC/PCS when link is up without PHY
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

On 27.01.2020 17:22, Andrew Lunn wrote:
>>> Heiner has another device which has an Aquantia PHY running in an odd
>>> mode so that it does 1G over a T2 link. It uses SGMII for this, and
>>> that is where we first noticed the issue of the MAC and PCS having
>>> different configurations.
>>
>> Do you know when the issue appeared?
> 
> As far as i understand, it never worked, it is not a regression as
> such. But Heiner probably knows more.
> 
I think you're referring to the issue that was fixed with following
commit: 72d8b4fdbfb6 ("net: dsa: mv88e6xxx: support in-band signalling
on SGMII ports with external PHYs"). The commit description also has a
link to the discussion we had about the issue. If I read it correctly
the issue is independent of this proprietary 1000BaseT2 mode having
been used.

>       Andrew
> .
> 
Heiner
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
