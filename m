Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A071EEDF8
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jun 2020 00:52:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB423C36B22;
	Thu,  4 Jun 2020 22:52:40 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75751C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2020 22:52:39 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id CCED511F5F8D1;
 Thu,  4 Jun 2020 15:52:36 -0700 (PDT)
Date: Thu, 04 Jun 2020 15:52:35 -0700 (PDT)
Message-Id: <20200604.155235.1008812507143457607.davem@davemloft.net>
To: dan.carpenter@oracle.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200603175025.GA19353@mwanda>
References: <20200603175025.GA19353@mwanda>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 04 Jun 2020 15:52:37 -0700 (PDT)
Cc: fugang.duan@nxp.com, festevam@gmail.com, s.hauer@pengutronix.de,
 kernel-janitors@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, linux-imx@nxp.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, netdev@vger.kernel.org,
 shawnguo@kernel.org, kernel@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH net-next] net: ethernet: dwmac: Fix an
 error code in imx_dwmac_probe()
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

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 3 Jun 2020 20:50:25 +0300

> The code is return PTR_ERR(NULL) which is zero or success.  We should
> return -ENOMEM instead.
> 
> Fixes: 94abdad6974a5 ("net: ethernet: dwmac: add ethernet glue logic for NXP imx8 chip")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
