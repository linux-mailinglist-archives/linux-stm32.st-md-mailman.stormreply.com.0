Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F59B3578
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Sep 2019 09:22:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7546BC35E01;
	Mon, 16 Sep 2019 07:22:57 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87028C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Sep 2019 07:22:56 +0000 (UTC)
Received: from localhost (unknown [85.119.46.8])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id ED851152483C6;
 Mon, 16 Sep 2019 00:22:51 -0700 (PDT)
Date: Mon, 16 Sep 2019 09:22:44 +0200 (CEST)
Message-Id: <20190916.092244.764910996352099184.davem@davemloft.net>
To: alexandru.ardelean@analog.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190916070400.18721-1-alexandru.ardelean@analog.com>
References: <20190916070400.18721-1-alexandru.ardelean@analog.com>
X-Mailer: Mew version 6.8 on Emacs 26.2
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 16 Sep 2019 00:22:54 -0700 (PDT)
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] net: stmmac: socfpga: re-use the
 `interface` parameter from platform data
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

From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Date: Mon, 16 Sep 2019 10:04:00 +0300

> The socfpga sub-driver defines an `interface` field in the `socfpga_dwmac`
> struct and parses it on init.
> 
> The shared `stmmac_probe_config_dt()` function also parses this from the
> device-tree and makes it available on the returned `plat_data` (which is
> the same data available via `netdev_priv()`).
> 
> All that's needed now is to dig that information out, via some
> `dev_get_drvdata()` && `netdev_priv()` calls and re-use it.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Applied.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
