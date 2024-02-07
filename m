Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4B684C38A
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 05:25:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61C12C6B476;
	Wed,  7 Feb 2024 04:25:22 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50B29C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Feb 2024 04:25:21 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1d8ef977f1eso2108635ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Feb 2024 20:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707279920; x=1707884720;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HMrlr7nZw5dCUAxbazVv9rYOkAKQRL0V1zpDd/IjA/w=;
 b=QYRM7ShHvcUJAH7Fvi6brAVmNA/N4VsxySOQegvnUPx0bixL1AZTjHOaRiXqRrAQ6j
 9bR3av0Oxb0cUgdtPC0+ZDUeLabnoroR64L8vh0UXcdgB3UdeYk50IpW2RyQvLCb2oXk
 ZE/nJMT80q2jCTk2odGhZYZjJ6j08d/MjZp7dr0jJUiIfb6R3+XtWn8IkiJwR1rZKmv8
 7DgwXqilfzpeAJLdJbivFIn4a7Fk5kkjf/t/+1UpTvu+POv3dR8JOGEH3YvSRXNEQ+pp
 8CTUF+HlsjaZefLe3pUH71sLah9DR0jFjtfeFI2ZkO80tWTDIdkYEq4H+CIawhJ+P2EF
 YOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707279920; x=1707884720;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HMrlr7nZw5dCUAxbazVv9rYOkAKQRL0V1zpDd/IjA/w=;
 b=o/yLNAL0R3r4sTyOMtOl8JnmHiCWfMAZkvvKlAPEiLi+5E0EORWjD36uPN9RVRr7Mz
 ACBAdwNXDhW7uSMU5Nlqa0iG4MY4XbjGgsK83GXEOX+558ug80LLtUMi89O3SCDAbmeb
 lFl6z0IThsKsg4egwbnyb3I1OtOrHvAx+F/E4wWH7IAz8MDnGIrTlLvAPpNCYvRJGD4C
 CSWmnKhRtLB3GDPohlvCosznq83TDndQTFrPEey8RVYgJEllnHo6oWHgav5QU465aL+/
 LFrYPUsZa5bvrd4a6wuCokySjMJfWG68+lRV/7O1KWLtj4HtOb5JI1Hk5Thvy9NUbm+c
 vYFw==
X-Gm-Message-State: AOJu0YyAsFwQlOhC2r5GFBl/eFtmQz1jYq0tlprSef9oI5CSuRXaS7kH
 HmYw2SjFyL3xf4c707c9m6OGwSUnZk5ilfGoFjUV1KvPn7w7LnC4
X-Google-Smtp-Source: AGHT+IG1DZr3LGFkUE2k+B+E34X6XrM6TPAN3drCI1YmumoFCqZR38zQwG26rMMUWss43/w1Ye+Lmw==
X-Received: by 2002:a17:903:4286:b0:1d4:e04b:3eea with SMTP id
 ju6-20020a170903428600b001d4e04b3eeamr3529877plb.31.1707279919709; 
 Tue, 06 Feb 2024 20:25:19 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWvfccdKYlKvU+hBjmZAQ9INqcyY5ToS/CHtFubvPLK9tdpGkqjKoiT4TuLRGMQeae/LdszWZNz1Wd7hVXGAEtu59DwJ/FCzlMtjna+B7HRMunLKWi3Pzln1pU7zvZEyN52DK5ETIujfc7r3sIzIUhtGR9NiRzgreUADGsovhmieURWqoxy1Zz2EhF5bpuwzeVf/M0siaQikBS+nIlIF33BBUcCjUQHqB2ya2d7YGnHfDqLVaaJAEB18Z2PJg7Wyh1eeocflQtsqF7jK+kx4dcz/+GTpRm5gK7DQgHGeeY0l7TQbXNysG8KCgSZfV7GDAM68x1S+DsUvuCrmnxu7EYtAv38TSJ1WpzFazsv3lTiCe9NzijijCieanpH2++WMkNCwdv9nn7fivxE4GWe1DsviLozDsLyVYGwZZHc23firDYL8ppxrtmR8CmVlV6jKubuwePZQoaflrowWHT3237giMTGOhghUtvmeIBLzdqguRnXvt5JXNmnadYoVvG1CGi24OJrX36++0OGqB9BRUL/zyKl4W36T0MloG6PxAHEz8oC5y+7klNfULZXxBZnhM3QXm6VllV3Tq77nNw1cRQtgPmFt/Si3Sr90NhpLtYANemzijjkbN5Adis3wqn6HAxFPAZxnKA5qDFvpSdmSbcdlpgCpdIcGMJpD/XaeHkc5QoUmWY3pIygQYKrEmJiNU7fErpsL2HdDOx/2le1xufkiJrWtw1RCyqfNJw=
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
 by smtp.gmail.com with ESMTPSA id
 iz6-20020a170902ef8600b001d95a70ee93sm357092plb.240.2024.02.06.20.25.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 20:25:19 -0800 (PST)
Message-ID: <57406055-ff3c-4788-bbf7-8476f63f90db@gmail.com>
Date: Tue, 6 Feb 2024 20:25:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <Zb9/O81fVAZw4ANr@shell.armlinux.org.uk>
 <E1rWbNI-002cCz-4x@rmk-PC.armlinux.org.uk>
 <20240206112024.3jxtcru3dupeirnj@skbuf>
 <ZcIwQcn3qlk0UjS4@shell.armlinux.org.uk>
 <20240206132923.eypnqvqwe3cga5tp@skbuf>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <20240206132923.eypnqvqwe3cga5tp@skbuf>
Cc: Andrew Lunn <andrew@lunn.ch>, Doug Berger <opendmb@gmail.com>,
 Byungho An <bh74.an@samsung.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Justin Chen <justin.chen@broadcom.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Clark Wang <xiaoning.wang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 6/6] net: dsa: b53: remove
 eee_enabled/eee_active in b53_get_mac_eee()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 2/6/2024 5:29 AM, Vladimir Oltean wrote:
> On Tue, Feb 06, 2024 at 01:12:33PM +0000, Russell King (Oracle) wrote:
>>> I know next to nothing about EEE and especially the implementation on
>>> Broadcom switches. But is the information brought by B53_EEE_LPI_INDICATE
>>> completely redundant? Is it actually in the system's best interest to
>>> ignore it?
>>
>> That's a review comment that should have been made when the original
>> change to phylib was done, because it's already ignored in kernels
>> today since the commit changing phylib that I've referenced in this
>> series - since e->eee_enabled and e->eee_active will be overwritten by
>> phylib.
> 
> That's fair, but commit d1420bb99515 ("net: phy: improve generic EEE
> ethtool functions") is dated November 2018, and my involvement with the
> kernel started in March 2019. So it would have been a bit difficult for
> me to make this observation back then.
> 
>> If we need B53_EEE_LPI_INDICATE to do something, then we need to have
>> a discussion about it, and decide how that fits in with the EEE
>> interface, and how to work around phylib's implementation.
> 
> Hopefully Florian or Doug can quickly clarify whether this is the case
> or not.

Russell's replacement is actually a better one because it will return a 
stable state. B53_EEE_LPI_INDICATE would indicate when the switch port's 
built-in PHY asserts the LPI signal to its MAC, which could be transient 
AFAICT.
-- 
Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
