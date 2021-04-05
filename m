Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7155354824
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Apr 2021 23:25:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 590FFC57B69;
	Mon,  5 Apr 2021 21:25:48 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34AFFCFAC55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Apr 2021 21:25:44 +0000 (UTC)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lTWij-00Ezaw-R6; Mon, 05 Apr 2021 23:25:17 +0200
Date: Mon, 5 Apr 2021 23:25:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: kernel test robot <lkp@intel.com>
Message-ID: <YGuAPb1+AcFTOYdq@lunn.ch>
References: <20210405164643.21130-2-michael@walle.cc>
 <202104060306.lmTxeOmW-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202104060306.lmTxeOmW-lkp@intel.com>
Cc: kbuild-all@lists.01.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath9k-devel@qca.qualcomm.com,
 linux-renesas-soc@vger.kernel.org, Michael Walle <michael@walle.cc>,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 UNGLinuxDriver@microchip.com, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] of: net: pass the dst buffer to
	of_get_mac_address()
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

On Tue, Apr 06, 2021 at 03:19:11AM +0800, kernel test robot wrote:
> Hi Michael,
> 
> I love your patch! Yet something to improve:

Looks correct. You missed the #else case for #ifdef CONFIG_OF in
stmmac_platform.c

Lets see what else 0-day finds before i start reviewing.

      Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
