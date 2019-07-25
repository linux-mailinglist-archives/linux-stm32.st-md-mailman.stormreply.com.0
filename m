Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A0475745
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jul 2019 20:53:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 015BCC16347;
	Thu, 25 Jul 2019 18:53:01 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38362C16340
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jul 2019 18:52:59 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id D7C4E1439869E;
 Thu, 25 Jul 2019 11:52:56 -0700 (PDT)
Date: Thu, 25 Jul 2019 11:52:56 -0700 (PDT)
Message-Id: <20190725.115256.1232519801887604352.davem@davemloft.net>
To: navid.emamdoost@gmail.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190723222809.9752-1-navid.emamdoost@gmail.com>
References: <20190723222809.9752-1-navid.emamdoost@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 25 Jul 2019 11:52:57 -0700 (PDT)
Cc: joabreu@synopsys.com, secalert@redhat.com, netdev@vger.kernel.org,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, emamd001@umn.edu,
 mcoquelin.stm32@gmail.com, smccaman@umn.edu, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stmmac_dt_phy: null check the allocation
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

From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Tue, 23 Jul 2019 17:28:09 -0500

> @@ -342,10 +342,13 @@ static int stmmac_dt_phy(struct plat_stmmacenet_data *plat,
>  		mdio = true;
>  	}
>  
> -	if (mdio)
> +	if (mdio) {
>  		plat->mdio_bus_data =
>  			devm_kzalloc(dev, sizeof(struct stmmac_mdio_bus_data),
>  				     GFP_KERNEL);
> +		if (!plat->mdio_bus_data)
> +			return -ENOMEM;

This leaks a reference to plat->mdio_node() which is acquired in the
for_each_child_of_node() loop right before the context here.

This is what I really fear about these automated patches, it is quite
often the case that acquired resources are subtly acquired in nearby
code and not released by the proposed "fix".

Therefore, either we end up with a regression, or as is the case here
a reviewer invests more time into double checking your patch than you
put into writing the patch in the first place.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
