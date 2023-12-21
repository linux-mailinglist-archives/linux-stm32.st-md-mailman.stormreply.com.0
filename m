Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB1F81B213
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 10:22:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31688C6C820;
	Thu, 21 Dec 2023 09:22:50 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01A1DC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 09:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=bhUM1XijalfIIIJGc6XtFDdiTTA83ZKMMJW0N2PSJ5E=; b=peRf5dwvFRD8WvXs6Z1Jv+lm33
 2s6gLOzX6ieSPJym3uodnNNcv5tgAS1xPHktD36vAWi8AzYsHtBx/GWobLW2AUJtOGoScRGqdRsKW
 5n5opFOfsR1jZtcpvqnrBnBctByjfZi2wcV35PUV3pyOukIZYFlRb/KhLAPpGKryXsp8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rGFGJ-003Udl-8V; Thu, 21 Dec 2023 10:22:39 +0100
Date: Thu, 21 Dec 2023 10:22:39 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Gan, Yi Fang" <yi.fang.gan@intel.com>
Message-ID: <0f85171e-cb9c-47dd-bb7d-f58537e24a54@lunn.ch>
References: <20231221085109.2830794-1-yi.fang.gan@intel.com>
 <20231221085109.2830794-3-yi.fang.gan@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231221085109.2830794-3-yi.fang.gan@intel.com>
Cc: Voon Weifeng <weifeng.voon@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>,
 John Stultz <jstultz@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>, Looi Hong Aun <hong.aun.looi@intel.com>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Choong Yong Liang <yong.liang.choong@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Song Yoong Siang <yoong.siang.song@intel.com>, netdev@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net v2 2/2] net: phylink: Add
	module_exit_stub()
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

On Thu, Dec 21, 2023 at 04:51:09PM +0800, Gan, Yi Fang wrote:
> In delete_module(), if mod->init callback is defined but mod->exit
> callback is not defined, it will assume the module cannot be removed
> and return EBUSY. The module_exit() is missing from current phylink
> module drive causing failure while unloading it.

You are missing justification it is actually safe to remove
phylink. Maybe Russell King deliberately did not implement
module_exit() because it can explode in interesting ways if it was?

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
