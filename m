Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EF52DD6AA
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Dec 2020 18:59:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBAB8C3089F
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Dec 2020 17:59:47 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F08FFC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Dec 2020 17:59:46 +0000 (UTC)
Date: Thu, 17 Dec 2020 09:59:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608227985;
 bh=jNtML/03RYnflOWL8WR+rzcFTOWO7gE/3Mgtcxp5w/E=;
 h=From:To:Cc:Subject:In-Reply-To:References:From;
 b=kQgX/CnWq7XOhpDBIzoGnNVs1wX8YxfjImlPjcb/Yr6sMl6Y+9IWySlm2KIMyTaAr
 CQlsqumlZ8cJNbkiy2TbJs5PplEUuU0Svw1lRJSqNsxxWxLZ8VsG00ZS92pszhdJMM
 NQcxTTRmjgxyvCKZJ5e8Lms0/fKg+437IHm0mtzz29fLhUu5463K3CHDb3uUHNy2jR
 rj5nfcW/wij3uJFOpHP8LoOdQqo6twmfJAiOEk2v0cDiV6cco9rciJUapbquUSU5BW
 uHCLmJtRbww+V1g/Zi9G5eXv75SKNyT4uCYzzjNfltSVN3jQuJipPEDcnKVYTp6dqp
 C6PPxIkZb3New==
From: Jakub Kicinski <kuba@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20201217095943.6b17db4f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <ae5371c0-ea53-6885-a25b-b44e9fe0b615@pengutronix.de>
References: <20201216113239.2980816-1-h.assmann@pengutronix.de>
 <20201216171334.1e36fbff@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <ae5371c0-ea53-6885-a25b-b44e9fe0b615@pengutronix.de>
MIME-Version: 1.0
Cc: kernel@pengutronix.de, Jose Abreu <Jose.Abreu@synopsys.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Rayagond Kokatanur <rayagond@vayavyalabs.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Michael Olbrich <m.olbrich@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] net: stmmac: retain PTP-clock at
	hwtstamp_set
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

On Thu, 17 Dec 2020 09:25:48 +0100 Ahmad Fatoum wrote:
> On 17.12.20 02:13, Jakub Kicinski wrote:
> >> +			netdev_warn(priv->dev, "HW Timestamping init failed: %pe\n",
> >> +					ERR_PTR(ret));  
> > 
> > why convert to ERR_PTR and use %pe and not just %d?  
> 
> To get a symbolic error name if support is compiled in (note the `e' after %p).

Cool, GTK. Kind of weird we there is no equivalent int decorator, tho.
Do you happen to know why?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
