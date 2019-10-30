Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F906EA5BE
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Oct 2019 22:52:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DFFEC36B0B;
	Wed, 30 Oct 2019 21:52:40 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E398C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2019 21:52:37 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 5DB1114CFAAEA;
 Wed, 30 Oct 2019 14:52:35 -0700 (PDT)
Date: Wed, 30 Oct 2019 14:52:34 -0700 (PDT)
Message-Id: <20191030.145234.1629187794527849559.davem@davemloft.net>
To: Jose.Abreu@synopsys.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <36d9af9080068c4e38cf50e80b6f2a5eafc9ed99.1572355609.git.Jose.Abreu@synopsys.com>
References: <cover.1572355609.git.Jose.Abreu@synopsys.com>
 <cover.1572355609.git.Jose.Abreu@synopsys.com>
 <36d9af9080068c4e38cf50e80b6f2a5eafc9ed99.1572355609.git.Jose.Abreu@synopsys.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 30 Oct 2019 14:52:35 -0700 (PDT)
Cc: Joao.Pinto@synopsys.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 4/9] net: stmmac: selftests: Must
 remove UC/MC addresses to prevent false positives
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

From: Jose Abreu <Jose.Abreu@synopsys.com>
Date: Tue, 29 Oct 2019 15:14:48 +0100

> @@ -499,9 +501,18 @@ static int stmmac_test_hfilt(struct stmmac_priv *priv)
>  	if (netdev_mc_count(priv->dev) >= priv->hw->multicast_filter_bins)
>  		return -EOPNOTSUPP;

This test above...

> +	dummy_dev = alloc_etherdev(0);
> +	if (!dummy_dev)
> +		return -ENOMEM;
> +
> +	/* Remove all MC addresses */
> +	netdev_for_each_mc_addr(ha, priv->dev)
> +		dev_mc_add(dummy_dev, ha->addr);
> +	dev_mc_flush(priv->dev);

No longer makes any sense now that you're removing all of the MC
addresses.

Also I know it seems that it should be guaranteed that re-adding all of
the previously configured MC addresses should succeed.  But I am always
wary when I see error codes ignored like this.

This test makes destructure changes to the device's configuration,
perhaps in a non-restorable fashion if errors occur re-adding the MC
list entries.

Running a test should never even remotely introduce a change in the
device state like that.

I really don't like this, to be honest.  I'd hate to be the user who
had this somehow trigger on them and then have to diagnose it. :-/

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
