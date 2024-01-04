Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 867A2824256
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jan 2024 14:05:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33CA4C6B452;
	Thu,  4 Jan 2024 13:05:36 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E617FC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jan 2024 13:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=y1A8fgZsiIjsazqh2xXbSQAE7toMo839MhQ2MSFa1Ik=; b=Y8rRXlepBxDcgCzTA7uGpVud/D
 k6UiLHKLWjtAi60KxLwieZ5dGpeTkkKhx8hLP2gQ1a/2yP/23fNx52Ni9hMfIArOoaCiqHF649NrL
 /UrUYIc+HmCWT7z4WLOR8hICBXldkNSVsH/VEYFjoL7dni5lc4IeWVVdAcWGLZ3GPxfk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rLNPd-004LdL-03; Thu, 04 Jan 2024 14:05:29 +0100
Date: Thu, 4 Jan 2024 14:05:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Gan, Yi Fang" <yi.fang.gan@intel.com>
Message-ID: <fb1cc3a4-8615-4cee-8fe7-29966c4cb7c7@lunn.ch>
References: <20240104101255.3056090-1-yi.fang.gan@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240104101255.3056090-1-yi.fang.gan@intel.com>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 linux-kernel@vger.kernel.org, Choong Yong Liang <yong.liang.choong@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Looi Hong Aun <hong.aun.looi@intel.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net v3 1/1] net: phylink: Add module_exit()
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

On Thu, Jan 04, 2024 at 06:12:55PM +0800, Gan, Yi Fang wrote:
65;7401;1c> In delete_module(), if mod->init callback is defined but mod->exit callback
> is not defined, it will assume the module cannot be removed and return
> EBUSY. The module_exit() is missing from current phylink module drive
> causing failure while unloading it.

This is still missing the explanation why this is safe.


    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
