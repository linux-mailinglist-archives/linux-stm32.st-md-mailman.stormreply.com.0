Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FC67246DD
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Jun 2023 16:53:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13138C65E70;
	Tue,  6 Jun 2023 14:53:04 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 392C2C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jun 2023 14:53:03 +0000 (UTC)
X-GND-Sasl: maxime.chevallier@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686063182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1nWvmzDxkh9OccWxqcWuPVSP3S+KkgZMKouYOFSnOoQ=;
 b=KFIa1Sv7Y5D32xjDjhpnj6Nlqa0AtFJiHuZf8TBvJaks65m+1dEDAA87gyJBSYEoVH6Oof
 2xd2Wy64nbhjuFVFxSaeyWo0So5Bgza8Lcby8GKbLVBg0mnFlOkBJp0L8M0AKEpVpuDEgk
 DNjY2yeR422Qi6LMQ+jTIYkYqw24UR+gzxk1xIyrgkb2m+MFctG7JytTp6sox8KuQp4VHM
 XQSs67Zh6T513xz8mgp1vk0PisRHfSayVYiRx6m/KuJW9u+TPJTBqeIzkyBj45vPrKUe5U
 BI+WAyHMOv5RJdHS+3am7TpkKKVKS6kesr/kkVpWMJIVXVaokQHu2n9qwzcn9w==
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF9A440003;
 Tue,  6 Jun 2023 14:52:58 +0000 (UTC)
Date: Tue, 6 Jun 2023 16:52:52 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20230606165252.34a1593c@pc-7.home>
In-Reply-To: <ZH9DlUqwm3YsNPu6@shell.armlinux.org.uk>
References: <20230606142144.308675-1-maxime.chevallier@bootlin.com>
 <ZH9DlUqwm3YsNPu6@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, alexis.lothore@bootlin.com,
 thomas.petazzoni@bootlin.com, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Simon Horman <simon.horman@corigine.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/3] Followup fixes for the
 dwmac and altera lynx conversion
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

Hello Russell,

On Tue, 6 Jun 2023 15:32:53 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Tue, Jun 06, 2023 at 04:21:41PM +0200, Maxime Chevallier wrote:
> > Following the TSE PCS removal and port of altera_tse and dwmac_socfpga,
> > this series fixes some issues that slipped through the cracks.
> > 
> > Patch 1 fixes an unitialized struct in altera_tse
> > 
> > Patch 2 uses the correct Kconfig option for altera_tse
> > 
> > Patch 3 makes the Lynx PCS specific to dwmac_socfpga. This patch was
> > originally written by Russell, my modifications just moves the
> > #include<linux/pcs-lynx.h> around, to use it only in dwmac_socfpga.  
> 
> Hi Maxime,
> 
> I'm sorry, but I think you need an extra patch added to this series.

Gosh you're right... The same this also goes for altera_tse... 

> Other than that, the series looks good. Thanks.

I'll followup shortly then. Nice catch !

Thanks,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
