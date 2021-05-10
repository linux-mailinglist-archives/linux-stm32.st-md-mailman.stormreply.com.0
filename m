Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E98377F45
	for <lists+linux-stm32@lfdr.de>; Mon, 10 May 2021 11:22:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6871FC57B60;
	Mon, 10 May 2021 09:22:57 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BE5CC57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 May 2021 09:22:54 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 189581F42076;
 Mon, 10 May 2021 10:22:54 +0100 (BST)
Date: Mon, 10 May 2021 11:22:49 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <20210510112249.5613978e@collabora.com>
In-Reply-To: <542000b4-1a65-5090-72f9-441c75ee1098@foss.st.com>
References: <20210507131756.17028-1-patrice.chotard@foss.st.com>
 <20210507131756.17028-2-patrice.chotard@foss.st.com>
 <20210508095506.4d0d628a@collabora.com>
 <542000b4-1a65-5090-72f9-441c75ee1098@foss.st.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] spi: spi-mem: add automatic poll
 status functions
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

On Mon, 10 May 2021 10:46:48 +0200
Patrice CHOTARD <patrice.chotard@foss.st.com> wrote:

> >   
> >> +
> >> +	if (ctlr->mem_ops && ctlr->mem_ops->poll_status) {
> >> +		ret = spi_mem_access_start(mem);
> >> +		if (ret)
> >> +			return ret;
> >> +
> >> +		reinit_completion(&ctlr->xfer_completion);
> >> +
> >> +		ret = ctlr->mem_ops->poll_status(mem, op, mask, match,
> >> +						 timeout_ms);
> >> +
> >> +		ms = wait_for_completion_timeout(&ctlr->xfer_completion,
> >> +						 msecs_to_jiffies(timeout_ms));  
> > 
> > Why do you need to wait here? I'd expect the poll_status to take care
> > of this wait.  
> 
> It was a request from Mark Brown [1]. The idea is to implement
> similar mechanism already used in SPI framework.

Well, you have to choose, either you pass a timeout to ->poll_status()
and let the driver wait for the status change (and return -ETIMEDOUT if
it didn't happen in time), or you do it here and the driver only has to
signal the core completion object. I think it's preferable to let the
driver handle the timeout though, because you don't know how the
status check will be implemented, and it's not like the
reinit_completion()+wait_for_completion_timeout() done here would
greatly simplify the drivers wait logic anyway.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
