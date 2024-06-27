Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 206DF91AF96
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 21:24:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C59C7C71280;
	Thu, 27 Jun 2024 19:24:39 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D242EC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 19:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=MIJerN91KOAahfx//F9cleyCTP+2uS5vcbZ0p363Ojc=; b=jqZY+usY9iPuJpXu55zsW+kvaJ
 ikF+PmQHCkXwNKbFueAJfrQ/SJ/gbKnlDTRECR6vCQevb2rChvhqfEJ3mUgspq5VOpBsPjCEJx0T2
 jdin0vKrxJ5BxL1twXhIqC6OwVgALQbDDiE7ts5FUZa31S9yAx9bs+FM8B6VKp9GdKGk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sMujE-001CdD-L2; Thu, 27 Jun 2024 21:24:20 +0200
Date: Thu, 27 Jun 2024 21:24:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <4f642463-3a8c-4412-a007-42fb65c4276e@lunn.ch>
References: <20240627113948.25358-1-brgl@bgdev.pl>
 <20240627113948.25358-3-brgl@bgdev.pl>
 <td5jbseo7gtu6d4xai6q2zkfmxw4ijimyiromrf52he5hze3w3@fd3kayixf4lw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <td5jbseo7gtu6d4xai6q2zkfmxw4ijimyiromrf52he5hze3w3@fd3kayixf4lw>
Cc: linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 net-next 2/2] net: stmmac: qcom-ethqos:
 add a DMA-reset quirk for sa8775p-ride
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

> Its not clear to me though if the "2500basex" mentioned here supports
> any in-band signalling from a Qualcomm SoC POV (not just the Aquantia
> phy its attached to, but in general). So maybe in that case its not a
> concern?

True 2500BaseX does have inband signalling, for the results of pause
negotiation.

However, in this case, this is not true 2500BaseX, but a hacked SGMII
overclocked to 2.5GHz. There is no inband signalling, because SGMII
signalling makes no sense when over clocked. So out of band signalling
will be used.

My understanding is that both ends of this link are not using true
2500BaseX, and this Qualcomm SoC is incapable of true 2500BaseX. So we
don't need to worry about it in the Qualcomm glue code.

However, what these patches should not block is some other vendors SoC
with true 2500BaseX from working correctly.

     Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
