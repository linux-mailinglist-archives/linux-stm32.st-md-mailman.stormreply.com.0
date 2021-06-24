Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 500D63B3043
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Jun 2021 15:40:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 032E4C57196;
	Thu, 24 Jun 2021 13:40:41 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9743BC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jun 2021 13:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=kJoNj9EV1XTA3nOzVNZZ5d15uvZW2jJVc5PSAJpiypM=; b=niF93v22kDwoh3YOc+RIXkezY3
 Yfa1uVichJuoJb6DQzSf+5cCFhhk/qibdhVqv6VqWLUiozFRA40y3NLKPFyTFrmgmO7YDUZmM9mzn
 iE1sg6CaSuLwuIjEb+uQTwX04CAa4DVit6fNjGEx3NSdHdhnqtB5YRGNwO7HX9hT4sOg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1lwPac-00AycZ-7y; Thu, 24 Jun 2021 15:40:18 +0200
Date: Thu, 24 Jun 2021 15:40:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Voon, Weifeng" <weifeng.voon@intel.com>
Message-ID: <YNSLQpNsNhLkK8an@lunn.ch>
References: <20210621094536.387442-1-pei.lee.ling@intel.com>
 <20210621094536.387442-4-pei.lee.ling@intel.com>
 <YNCOqGCDgSOy/yTP@lunn.ch>
 <CH0PR11MB53806E2DC74B2B9BE8F84D7088089@CH0PR11MB5380.namprd11.prod.outlook.com>
 <YNONPZAfmdyBMoL5@lunn.ch>
 <CH0PR11MB538084AFEA548F4B453C624F88079@CH0PR11MB5380.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH0PR11MB538084AFEA548F4B453C624F88079@CH0PR11MB5380.namprd11.prod.outlook.com>
Cc: Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>, "Wong,
 Vee Khee" <vee.khee.wong@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Tan,
 Tee Min" <tee.min.tan@intel.com>, "Ling, Pei Lee" <pei.lee.ling@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Russell King <linux@armlinux.org.uk>, "Sit,
 Michael Wei Hong" <michael.wei.hong.sit@intel.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "Ong, Boon Leong" <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next V1 3/4] net: stmmac: Reconfigure
 the PHY WOL settings in stmmac_resume()
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

> No, the interrupt will not be discarded. If the PHY is in interrupt mode, the
> interrupt handler will triggers and ISR will clear the WOL status bit. 
> The condition here is when the PHY is in polling mode, the PHY driver does not
> have any other mechanism to clear the WOL interrupt status bit.
> Hence, we need to go through the PHY set_wol() again. 

I would say you have a broken setup. If you are explicitly using the
interrupt as a wakeup source, you need to be servicing the
interrupt. You cannot use polled mode.

	   Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
