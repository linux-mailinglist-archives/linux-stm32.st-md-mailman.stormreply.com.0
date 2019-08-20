Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E185E964B6
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2019 17:39:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3186C35E01;
	Tue, 20 Aug 2019 15:39:55 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C985C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2019 15:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UrZPMCqJMHdP7J4z6kRN/Pg74Win9kev4rEIRPJuYrg=; b=lon6YRZc0uv6oxr9A3V4P3CajP
 Kgjkttxfyd1SiOYcgq8D17AUnolYIEFVPcitpLNhCsLJICvxFxEquuT65jXRtrGhCFImvbj0JisEn
 OxOpjQsqkciwEZSes77TRY1zgy3B2saD27QabCW94Vkn019I0oL767zrfoOVkaD6P8fU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1i06EV-0006VL-FQ; Tue, 20 Aug 2019 17:39:39 +0200
Date: Tue, 20 Aug 2019 17:39:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: megous@megous.com
Message-ID: <20190820153939.GL29991@lunn.ch>
References: <20190820145343.29108-1-megous@megous.com>
 <20190820145343.29108-4-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820145343.29108-4-megous@megous.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Mark Rutland <mark.rutland@arm.com>, Jose Abreu <joabreu@synopsys.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/6] net: stmmac: sun8i: Use
 devm_regulator_get for PHY regulator
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

On Tue, Aug 20, 2019 at 04:53:40PM +0200, megous@megous.com wrote:
> From: Ondrej Jirman <megous@megous.com>
> 
> Use devm_regulator_get instead of devm_regulator_get_optional and rely
> on dummy supply. This avoids NULL checks before regulator_enable/disable
> calls.

Hi Ondrej

What do you mean by a dummy supply? I'm just trying to make sure you
are not breaking backwards compatibility.

     Thanks
	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
