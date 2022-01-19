Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF20493D1E
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jan 2022 16:29:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2AAEC5AB61;
	Wed, 19 Jan 2022 15:29:51 +0000 (UTC)
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [83.223.95.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03622CFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jan 2022 15:29:50 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 419E030057E65;
 Wed, 19 Jan 2022 16:29:50 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 27C5F3ABB52; Wed, 19 Jan 2022 16:29:50 +0100 (CET)
Date: Wed, 19 Jan 2022 16:29:50 +0100
From: Lukas Wunner <lukas@wunner.de>
To: patrice.chotard@foss.st.com
Message-ID: <20220119152950.GA4445@wunner.de>
References: <20220117121744.29729-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220117121744.29729-1-patrice.chotard@foss.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] spi: stm32-qspi: Update spi registering
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

On Mon, Jan 17, 2022 at 01:17:44PM +0100, patrice.chotard@foss.st.com wrote:
> Some device driver need to communicate to qspi device during the remove
> process, qspi controller must be functional when spi_unregister_master()
> is called.
> 
> To ensure this, replace devm_spi_register_master() by spi_register_master()
> and spi_unregister_master() is called directly in .remove callback before
> stopping the qspi controller.
> 
> This issue was put in evidence using kernel v5.11 and later
> with a spi-nor which supports the software reset feature introduced
> by commit d73ee7534cc5 ("mtd: spi-nor: core: perform a Soft Reset on
> shutdown")
> 
> Fixes: c530cd1d9d5e ("spi: spi-mem: add stm32 qspi controller")
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: <stable@vger.kernel.org> # 5.8.x

Reviewed-by: Lukas Wunner <lukas@wunner.de>

Thanks!

Lukas
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
