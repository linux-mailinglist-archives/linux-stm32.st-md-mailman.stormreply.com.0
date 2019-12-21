Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB9C128784
	for <lists+linux-stm32@lfdr.de>; Sat, 21 Dec 2019 06:29:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6126C36B0C;
	Sat, 21 Dec 2019 05:29:23 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FD84C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Dec 2019 05:29:22 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 80A41153D31DC;
 Fri, 20 Dec 2019 21:29:19 -0800 (PST)
Date: Fri, 20 Dec 2019 21:29:18 -0800 (PST)
Message-Id: <20191220.212918.1661751615125167321.davem@davemloft.net>
To: p.rajanbabu@samsung.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <1576750621-78066-1-git-send-email-p.rajanbabu@samsung.com>
References: <CGME20191219102407epcas5p103b26e6fb191f7135d870a3449115c89@epcas5p1.samsung.com>
 <1576750621-78066-1-git-send-email-p.rajanbabu@samsung.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 20 Dec 2019 21:29:20 -0800 (PST)
Cc: Jose.Abreu@synopsys.com, jayati.sahu@samsung.com, rcsekar@samsung.com,
 netdev@vger.kernel.org, sriram.dash@samsung.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, pankaj.dubey@samsung.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: platform: Fix MDIO init for
 platforms without PHY
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

From: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
Date: Thu, 19 Dec 2019 15:47:01 +0530

> The current implementation of "stmmac_dt_phy" function initializes
> the MDIO platform bus data, even in the absence of PHY. This fix
> will skip MDIO initialization if there is no PHY present.
> 
> Fixes: 7437127 ("net: stmmac: Convert to phylink and remove phylib logic")
> Acked-by: Jayati Sahu <jayati.sahu@samsung.com>
> Signed-off-by: Sriram Dash <sriram.dash@samsung.com>
> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>

Applied and queued up for -stable, thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
