Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 941EB80941D
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Dec 2023 22:30:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 335E2C65E4F;
	Thu,  7 Dec 2023 21:30:39 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 605A2C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Dec 2023 21:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=8OvmBG1BbR/bHyNih1YR4dH1zldxx7EatEh9gKyCn3k=; b=W0la2bgTJsrmJjTtn/9/EBX5W1
 G5mWQDTF2TQkuG9W0WswYE6as9kBIlUYP1DiJ7vdkqBMFMFlI70X2zViRx1u+34aMaQdR7zD2kJU5
 lWgBhSiW28BFCD6A2Z3txUSGyw9yjASO3Oc+U2SvpWhFrnkDUnIr403116fEideov2oc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rBLwt-002MAB-2H; Thu, 07 Dec 2023 22:30:23 +0100
Date: Thu, 7 Dec 2023 22:30:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <e64b14c3-4b80-4120-8cc4-9baa40cdcb75@lunn.ch>
References: <20231206-stmmac-no-mdio-node-v2-1-333cae49b1ca@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231206-stmmac-no-mdio-node-v2-1-333cae49b1ca@redhat.com>
Cc: linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: don't create a
 MDIO bus if unnecessary
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

On Wed, Dec 06, 2023 at 05:46:09PM -0600, Andrew Halaney wrote:
> The stmmac_dt_phy() function, which parses the devicetree node of the
> MAC and ultimately causes MDIO bus allocation, misinterprets what
> fixed-link means in relation to the MAC's MDIO bus. This results in
> a MDIO bus being created in situations it need not be.

Please extend that with something like....

This is bad, because ....

Most 'clean' driver unconditionally create the MDIO bus. But stmmac is
not that clean, and has to keep backwards compatibility to some old
usage. I'm just wondering what this patch actually brings us, and is
it worth it. Is it fixing a real bug, or just an optimisation?

   Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
