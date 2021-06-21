Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8C53AE9B1
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jun 2021 15:06:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86491C57B53;
	Mon, 21 Jun 2021 13:06:00 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54E3FC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jun 2021 13:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=vZwauemkwVd28l2j/FRyIlgC3dtVqFc07kW48PeHXL4=; b=P6wtPnCfNEgooXieezZE104G9J
 psG16da7CyrdETa3ia7vlhCuS1FZgcwN+e0VfNEyDlAVuSvqTVu0s0WuOvU4pV1kMNJUoAjs9GdvM
 s5s7nbrntL712rS0c3CtYxJ3P6vXCSroHmrEGQPXd225oPa1FfWsdmzudeZrBALFcFgU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1lvJcW-00AVLt-0Y; Mon, 21 Jun 2021 15:05:44 +0200
Date: Mon, 21 Jun 2021 15:05:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ling Pei Lee <pei.lee.ling@intel.com>
Message-ID: <YNCOqGCDgSOy/yTP@lunn.ch>
References: <20210621094536.387442-1-pei.lee.ling@intel.com>
 <20210621094536.387442-4-pei.lee.ling@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210621094536.387442-4-pei.lee.ling@intel.com>
Cc: Wong Vee Khee <vee.khee.wong@linux.intel.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Weifeng <weifeng.voon@intel.com>, Wong Vee Khee <vee.khee.wong@intel.com>,
 netdev@vger.kernel.org, Tan Tee Min <tee.min.tan@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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

On Mon, Jun 21, 2021 at 05:45:35PM +0800, Ling Pei Lee wrote:
> From: Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>
> 
> After PHY received a magic packet, the PHY WOL event will be
> triggered then PHY WOL event interrupt will be disarmed.
> Ethtool settings will remain with WOL enabled after a S3/S4
> suspend resume cycle as expected. Hence,the driver should
> reconfigure the PHY settings to reenable/disable WOL
> depending on the ethtool WOL settings in the resume flow.

Please could you explain this a bit more? I'm wondering if you have a
PHY driver bug. PHY WOL should remain enabled until it is explicitly
disabled.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
