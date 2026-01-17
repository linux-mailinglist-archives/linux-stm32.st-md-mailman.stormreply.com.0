Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C2CD38D53
	for <lists+linux-stm32@lfdr.de>; Sat, 17 Jan 2026 10:26:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AD19C8F28F;
	Sat, 17 Jan 2026 09:26:39 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79A76C8F276
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Jan 2026 09:26:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E9EA24E42138;
 Sat, 17 Jan 2026 09:26:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A339660708;
 Sat, 17 Jan 2026 09:26:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D6AB010B68FE3; Sat, 17 Jan 2026 10:26:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768641995; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=22dRL6sLaeQXaep6GKzfTNrZ7nA1X2tU2tpqpgJzvfg=;
 b=Pug73uwebtcwYIIE9dsy+u5IlfETxLEgM1AUb92W+79v5ZcNuuhxnX36awql6T5cthXcds
 8EzXzI8xCLcS6RgZxTdnFg8PfajoTszCLifFWWzezKQNqZU3+UNnJHbFbNCOig0/hTdyX7
 NQObUlzy5DTbbmk+XF0xixUd2G6FR6UPf0+s0vbsbLalcdpUYUyY14d8ICGI5svHAR/Guf
 F1qLTCS3ATYW7cEOWXHClvK64+Dsh7BrKhSafsBEabhvDZriv944Q7lFe/CSy7R6rwfn6m
 5lvACW0+hZwrUBejSGBLymE0GtpLrl9Q6L0Cjlmtnq7BoUuUYqOw6D+Vx3oNTA==
Message-ID: <afbac1ba-43b4-4c0a-84fd-87866e954fa2@bootlin.com>
Date: Sat, 17 Jan 2026 10:26:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <E1vgY1k-00000003vOC-0Z1H@rmk-PC.armlinux.org.uk>
 <ab2d7cc9-e7d9-47fb-95ad-90ae4f5f1f67@bootlin.com>
 <aWrH-FAuWnqmbSaJ@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aWrH-FAuWnqmbSaJ@shell.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: fix dwmac4 transmit
 performance regression
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

> I really give up with when fixes should be added or not, because it
> seems quite random when it's needed and when it isn't.
> 
> And no, don't quote the stable-kernel-rules nonsense that is
> meaningless ot stable kernel people, when they use AI to analyse
> commits and pick stuff completely randomly.

The rule I'm following is the one in the netdev-maintainer doc, that says:

	'for fixes the Fixes: tag is required, regardless of the tree'

> 
>> It would also have been nice to be in CC, I spent some time on the bisect...
> 
> I thought you were, but I see now it was a different Maxime!

Bah, no worries :)

Seems we have a bunch of french people with similar names working with
st platforms or stmmac on a regular basis, I understand the confusion :

Maxime Coquelin
Maxime Chevallier
Gatien Chevallier

Anyways, thanks for the quick fix on that !

Maxime

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
