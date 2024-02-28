Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9B486A72B
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Feb 2024 04:24:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59DD1C6C855;
	Wed, 28 Feb 2024 03:24:04 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFB5CC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Feb 2024 03:24:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6ADAA6125B;
 Wed, 28 Feb 2024 03:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803E7C433C7;
 Wed, 28 Feb 2024 03:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709090642;
 bh=qjRhA/7m70o8XxVxvrScP2vkVDFa71oSPSWfBELbXys=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E4A31KBmTGU2rRX9LATdmS8xnX2Wl4RXHZPQR09a/oGzT7tkPAevLuxPnKp8keGJI
 vTJ2f5hsHjQLaEz5uqRCs7X5kZ24yGNuhOhP08UCbkECRrucrMZ5k2vuXTzOljpyCs
 0s8tOSmMi55lxSCR0oOEB+erU7MSCmcGaX9LrKBERtzq/eexk87he7aETHSdCL6eaK
 8LyC54cF13Fl8U4qsLGtOEu7boziqji32fHh1XsP5jP/a2UgCNAkJ13qLxHfD2/F3C
 DLFtu59Atjt34//wJGigH3/FkkDUbNy5yon4pUwQ/Tfn+0khjsO/nrRQOm2iXu2L3D
 TRbkAUniEwZMg==
Date: Tue, 27 Feb 2024 19:24:00 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Piotr Wejman <piotrwejman90@gmail.com>
Message-ID: <20240227192400.19f4c9cc@kernel.org>
In-Reply-To: <20240226093144.31965-1-piotrwejman90@gmail.com>
References: <20240226093144.31965-1-piotrwejman90@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: fix rx queue priority
	assignment
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

On Mon, 26 Feb 2024 10:31:44 +0100 Piotr Wejman wrote:
> +	ctrl2 = readl(ioaddr + XGMAC_RXQ_CTRL2);
> +	ctrl3 = readl(ioaddr + XGMAC_RXQ_CTRL3);
> +	

checkpatch points out there is an unnecessary tab on this empty line

> +	/* The software must ensure that the same priority
> +	 * is not mapped to multiple Rx queues.
> +	 */
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
