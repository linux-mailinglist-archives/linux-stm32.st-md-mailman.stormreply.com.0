Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AC16D217A
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 15:29:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 217A9C6905A;
	Fri, 31 Mar 2023 13:29:32 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35967C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 13:29:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1C07C62927;
 Fri, 31 Mar 2023 13:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB38BC433D2;
 Fri, 31 Mar 2023 13:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680269368;
 bh=Y5YtUrKC2+Ye8jz8W+QdmzBteBT9mONICvBXXC3yYHk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AGeBz/Int3Z/Zz/BhdkATkoaS/vmn66coKC0qxFAEUuShOdShOQKdxnRbgRwgWXuP
 enrXY9u311Y4S/am4tiZepiyNmr9fI0XIvyMK1tKI7nHP+4AgPiZfSjl43U2wS1e5a
 FTT6TLLUp86Ak/o1diplnsOAey/rEmvlJSgBZnsPRgb04+pAoT4I7KA4oGJiXQTsDz
 DPdIAz6qxbWiGe854xmxL2gjF56IMPhEWC2BXszYt2MgZFUewbH51qjo+FLoTUBLZw
 O+OuNXLNclsYsM4/oWRUceJyBrgVxV5uXhtmyjHLydRxv7eNxdJ09u4u1C9ToLKhAE
 xw+O3wbu2ejHA==
Date: Fri, 31 Mar 2023 18:59:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Message-ID: <ZCbgNNhFQZUo3VKH@matsya>
References: <1869feff-06b1-17f1-4628-b433c858ad79@foss.st.com>
 <20230227151318.1894938-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230227151318.1894938-1-m.grzeschik@pengutronix.de>
Cc: kishon@kernel.org, error27@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 linux-phy@lists.infradead.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] phy: stm32-usphyc: add 200 to 300 us
 delay to fix timeout on some machines
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

On 27-02-23, 16:13, Michael Grzeschik wrote:
> An minimum udelay of 200 us seems to be necessary on some machines. After
> the setup of the pll, which needs about 100 us to be locked there seem
> to be additional 100 us to get the phy really functional. Without this
> delay the usb runs not functional. With this additional short udelay
> this issue was not reported again.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
