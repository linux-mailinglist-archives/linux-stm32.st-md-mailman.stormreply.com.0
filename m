Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 917957DE0E0
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Nov 2023 13:36:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3385FC6B44C;
	Wed,  1 Nov 2023 12:36:22 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED0F5C6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Nov 2023 12:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=imo3wNryrEjYThOqsNLqw4AyRV1m29tXBY8uvJUJe6w=; b=DxrT5asDfblt1OyyS/zzam+PD3
 D5aoWqH1tLGYiTe47iJnJBaDXJw83wsO1x6Y8YHwGMrBrWr+3x2LDY36vZdNAmC7SjaSbfNtJfSIm
 kXbeG3zmSqDLJlmcYIrydnonpkY7JYLNfnYWUS1alkhrCuVzYUgfg/SOsP5RFnbw1B7k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qyAS3-000gT4-Ul; Wed, 01 Nov 2023 13:36:03 +0100
Date: Wed, 1 Nov 2023 13:36:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Gan Yi Fang <yi.fang.gan@intel.com>
Message-ID: <58132260-81d0-4f0c-90b6-0c97c7a6a2f5@lunn.ch>
References: <20231101061920.401582-1-yi.fang.gan@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231101061920.401582-1-yi.fang.gan@intel.com>
Cc: linux-kernel@vger.kernel.org, Song Yoong Siang <yoong.siang.song@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Looi Hong Aun <hong.aun.looi@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/1] net: stmmac: check CBS
 input values before configuration
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

On Wed, Nov 01, 2023 at 02:19:20PM +0800, Gan Yi Fang wrote:
> From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> 
> Add check for below conditions before proceeding to configuration.
> A message will be prompted if the input value is invalid.
> 
> Idleslope minus sendslope should equal speed_div.
> Idleslope is always a positive value including zero.
> Sendslope is always a negative value including zero.
> Hicredit is always a positive value including zero.
> Locredit is always a negative value including zero.

Which of these conditional are specific to stmmac, and which are
generic to CBS? Anything which is generic to CBS i would expect to be
checked at a higher level, rather than in every driver implementing
CBS.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
