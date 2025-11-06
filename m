Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5B9C3A4A7
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 11:35:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8343BC36B3C;
	Thu,  6 Nov 2025 10:35:37 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FF17C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 10:35:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0E3E81A18F3;
 Thu,  6 Nov 2025 10:35:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CDD4F6068C;
 Thu,  6 Nov 2025 10:35:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 988AA11850A7B; Thu,  6 Nov 2025 11:35:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762425334; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=QiGYWWa5Rp57nAs3YvpKkmsJ3R0ZczKe27XnYzkP11E=;
 b=La2lMt1p6x8Hb9C4Zb4UsCRLtRjgSDQHG9SACtaJZuGR23DTZhxooUqS9qjaVzHyC7jOaX
 suv+nt5QbHKOuV/VUnyBeSYA5k0qUp4NPOc2C1KCKAsUGA6qs6HUCQUaCIb4UqABCOKywe
 0kQeR+bC75XuNIhEjn5YEIL9eJx2+6Ee+sik2osTtpfd/ieJfXpySlTRNNd3bvT+hQQ+cn
 QV1WqssONxwiGELNS4B73AVTErYGREFXWE3JHli3VQSE3N/tChz06EzHuvYD7up65CExoM
 V6icAliw9KsXZIi65dH80n45Ol2jByhS8t9HOJRIsIbmJS0s7UdEhtG0KuK4Ig==
Message-ID: <88e8b9c9-16b5-4f8e-a2ea-3ce14555c731@bootlin.com>
Date: Thu, 6 Nov 2025 11:35:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
 <6ad7667a-f2be-4674-99a2-2895a82b762a@bootlin.com>
 <aQx3Brj6t48O6wPg@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aQx3Brj6t48O6wPg@shell.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/11] net: stmmac: ingenic:
 convert to set_phy_intf_sel()
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

>>> Convert ingenic to use the new ->set_phy_intf_sel() method that was
>>> recently introduced in net-next.
>>>
>>> This is the largest of the conversions, as there is scope for cleanups
>>> along with the conversion.
>>>
>>> v2: fix build warnings in patch 9 by rearranging the code
>>>
>>>  .../net/ethernet/stmicro/stmmac/dwmac-ingenic.c    | 165 ++++++---------------
>>>  1 file changed, 45 insertions(+), 120 deletions(-)
>>>
>>
>> Damned, missed that V2 and started reviewing V1... I'll resend the tags
>> for V2.
> 
> Yes, Jakub reported build warnings on patch 9 last night, followed by
> the kernel build bot reporting the same thing. The dangers of not
> building with W=1, but then W=1 is noisy which makes spotting new
> warnings difficult.
> 

I had the same issue, I have recently started using the nipa infra locally for
that, which comes with a way to compare the number of warnings before/after for
each patch to help sift through these :

https://github.com/linux-netdev/nipa

The setup was actually way easier than I would've thought, and testing
a series boils down to running :

cd $nipa
./ingest_mdir.py --mdir /tmp/my-series/ --tree $linux

it still takes a while to run on my workstation though, but at least it
doubles as a nice way to heat-up my living room with all the compiling
going on :)

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
