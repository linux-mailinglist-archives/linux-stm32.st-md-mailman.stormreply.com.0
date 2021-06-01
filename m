Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3990D397C4B
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Jun 2021 00:12:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2959C57B74;
	Tue,  1 Jun 2021 22:12:08 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94148C57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Jun 2021 22:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=y8LwDyWYmv5YNXiWo6XrFDujLoYra5BDGywMvk5NFl4=; b=jlhGbIHApiEzg8PFSvdCwdNYui
 KPnwoVWetNNnsKN60MmkBoMmIIb87Wbd+txqaGZbkddmlO6FSTdIkZUY7ha14fhKxWuBm056Lphz3
 EEq5Wg42Q4Glb60n0KCgtfJBUyFVsJ0w42esrPhiOxu7RuUo0bVQ+9ybBIPvwXWIkB+g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1loCc9-007M0b-84; Wed, 02 Jun 2021 00:11:57 +0200
Date: Wed, 2 Jun 2021 00:11:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Message-ID: <YLawrTO4pkgc6tnb@lunn.ch>
References: <20210601135235.1058841-1-vee.khee.wong@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210601135235.1058841-1-vee.khee.wong@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: enable platform
 specific safety features
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

On Tue, Jun 01, 2021 at 09:52:35PM +0800, Wong Vee Khee wrote:
> On Intel platforms, not all safety features are enabled on the hardware.

Is it possible to read a register is determine what safety features
have been synthesised?

     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
