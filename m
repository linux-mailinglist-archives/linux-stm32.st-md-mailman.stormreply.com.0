Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C08C14EE07
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jan 2020 14:58:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA7D6C36B0C;
	Fri, 31 Jan 2020 13:58:11 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47FBDC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 13:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M1F71jvBqrpDNfAxNP559L2v7vOR6DOGsr1UJQiyE0E=; b=AQOn2fybqbDTF0u5okJfCrxC6z
 5g8Wyei/0tS7qnYFWdLg5ZpWmKOUaVwF//RM6mbKQfZzYeDv7d6np87N5VvOavsAQWgijt+vD6IKP
 Dx5EI3JKfG7LoNltgG/F4XYL0TFjRN76iXfrUfTrFM0kX5BgRJw0uHXl5UrCcYWOqC3A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
 (envelope-from <andrew@lunn.ch>)
 id 1ixWnq-0007SO-NR; Fri, 31 Jan 2020 14:57:46 +0100
Date: Fri, 31 Jan 2020 14:57:46 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200131135746.GF9639@lunn.ch>
References: <20200131045953.wbj66jkvijnmf5s2@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200131045953.wbj66jkvijnmf5s2@kili.mountain>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ajay Gupta <ajayg@nvidia.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 kernel-janitors@vger.kernel.org,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Steve Glendinning <steve.glendinning@shawell.net>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net] device property: change
 device_get_phy_mode() to prevent signedess bugs
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

> diff --git a/drivers/net/ethernet/apm/xgene-v2/main.c b/drivers/net/ethernet/apm/xgene-v2/main.c
> index c48f60996761..706602918dd1 100644
> --- a/drivers/net/ethernet/apm/xgene-v2/main.c
> +++ b/drivers/net/ethernet/apm/xgene-v2/main.c
> @@ -15,7 +15,7 @@ static int xge_get_resources(struct xge_pdata *pdata)
>  {
>  	struct platform_device *pdev;
>  	struct net_device *ndev;
> -	int phy_mode, ret = 0;
> +	int ret = 0;
>  	struct resource *res;
>  	struct device *dev;

Hi Dan

DaveM likes reverse christmas tree. So you need to move ret later to
keep the tree.

Apart from that:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
