Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F6B35F452
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Apr 2021 14:56:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57658C57B78;
	Wed, 14 Apr 2021 12:56:36 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEB4EC57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Apr 2021 12:56:34 +0000 (UTC)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id E331F22236;
 Wed, 14 Apr 2021 14:56:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1618404993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nIqcTyZ0aGklq+mdSHotuPklBOhZa+ud8+bN5Q5+CPw=;
 b=VZL40Qx/ZFqrvlYpNa+CpUnri3A5IcdLrj+2SxpxVHAI8fYpizPcSIOU0o4IGsNgU2L8zb
 buzdqfa91h/T+Kc3jCccsyXkXKwvO0deOpvm1xgmDARKkJkG9wKdcW8QSFZ/zWqZRgSGou
 k2tTqyTzN0TuoPWxydGMvbSU0aMYGjo=
MIME-Version: 1.0
Date: Wed, 14 Apr 2021 14:56:30 +0200
From: Michael Walle <michael@walle.cc>
To: Dan Carpenter <dan.carpenter@oracle.com>
In-Reply-To: <20210414053336.GQ6021@kadam>
References: <20210414053336.GQ6021@kadam>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <cf5c86dd6492b9c1907ea69e2d660eb2@walle.cc>
X-Sender: michael@walle.cc
Cc: kbuild-all@lists.01.org, lkp@intel.com, netdev@vger.kernel.org,
 kbuild@lists.01.org, linux-kernel@vger.kernel.org,
 ath9k-devel@qca.qualcomm.com, linux-renesas-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 UNGLinuxDriver@microchip.com, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/2] of: net: pass the dst
 buffer to of_get_mac_address()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Dan,

Am 2021-04-14 07:33, schrieb Dan Carpenter:
> url:
> https://github.com/0day-ci/linux/commits/Michael-Walle/of-net-support-non-platform-devices-in-of_get_mac_address/20210406-234030
> base:
> https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
> cc0626c2aaed8e475efdd85fa374b497a7192e35
> config: x86_64-randconfig-m001-20210406 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> smatch warnings:
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2069 axienet_probe()
> warn: passing a valid pointer to 'PTR_ERR'
> 
> vim +/PTR_ERR +2069 drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> 
> 522856cefaf09d Robert Hancock      2019-06-06  2060  	/* Check for
> Ethernet core IRQ (optional) */
> 522856cefaf09d Robert Hancock      2019-06-06  2061  	if (lp->eth_irq 
> <= 0)
> 522856cefaf09d Robert Hancock      2019-06-06  2062
> 		dev_info(&pdev->dev, "Ethernet core IRQ not defined\n");
> 522856cefaf09d Robert Hancock      2019-06-06  2063
> 8a3b7a252dca9f Daniel Borkmann     2012-01-19  2064  	/* Retrieve the
> MAC address */
> 411b125c6ace1f Michael Walle       2021-04-06  2065  	ret =
> of_get_mac_address(pdev->dev.of_node, mac_addr);
> 411b125c6ace1f Michael Walle       2021-04-06  2066  	if (!ret) {
> 411b125c6ace1f Michael Walle       2021-04-06  2067
> 		axienet_set_mac_address(ndev, mac_addr);
> 411b125c6ace1f Michael Walle       2021-04-06  2068  	} else {
> d05a9ed5c3a773 Robert Hancock      2019-06-06 @2069
> 		dev_warn(&pdev->dev, "could not find MAC address property: %ld\n",
> d05a9ed5c3a773 Robert Hancock      2019-06-06  2070  			 
> PTR_ERR(mac_addr));
> 
>   ^^^^^^^^^^^^^^^^^
> This should print "ret".

Thanks, this was fixed (in the now merged) v4. I forgot
to add you to that huge CC list. Sorry for that.

-michael
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
