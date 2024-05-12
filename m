Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8819E8C35BB
	for <lists+linux-stm32@lfdr.de>; Sun, 12 May 2024 10:35:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18E9FC62EFE;
	Sun, 12 May 2024 08:35:35 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03A6DC5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 May 2024 08:35:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E9FECCE0A29;
 Sun, 12 May 2024 08:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A72C116B1;
 Sun, 12 May 2024 08:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715502924;
 bh=kXs5Vk2uM7TF2KGpm3iKNAHLpYpFzJyyIakxcjC+ewE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dCxVXXfliol5EzkqZ307uFnJDXrNPhRi9Ta4wEvxHKbAbzOorKrUoMmuTSZyYW5Ca
 C0hS53eqzqve6hpg8aqbJ+jKAZ+5y1G6Vy6XzA243VIDssTBanTYI/ZLr0TcrQLoB3
 7iDjbQQbZhmR9KHDYVBCJeuiz/Ubp/lI+FEjXyyONc88CfYv1mwq3FotWwZlXQxc8t
 l+SZzLppHWo9iM5FHxcRJVpaUAfg+VfmsuUghi3DovDLyLS5sIAy0UKDegBoNLhvxp
 vuX92yWw2YsOno/k5qpE+XW1A4iq7dgGOt+FT5IaDnPbVzHLTxdNR/j9hRrGHkJ6pD
 mL0u2Vz12TPLQ==
Date: Sun, 12 May 2024 09:35:18 +0100
From: Simon Horman <horms@kernel.org>
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Message-ID: <20240512083518.GX2347895@kernel.org>
References: <20240510000331.154486-3-jitendra.vegiraju@broadcom.com>
 <20240511015924.41457-1-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240511015924.41457-1-jitendra.vegiraju@broadcom.com>
Cc: netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2, net-next,
 2/2] net: stmmac: PCI driver for BCM8958X SoC
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

On Fri, May 10, 2024 at 06:59:24PM -0700, Jitendra Vegiraju wrote:
> Broadcom BCM8958X SoCs use Synopsys XGMAC design, which is similar to
> dwxgmac2 core implementation in stmmac driver. The existing dwxgmac2 dma
> operation functions have some conflicting differences with BCM8958X.
> This glue driver attempts to reuse dwxgmac2 implementation wherever
> possible, adding alternative implementations where necessary.
> 
> v2: code cleanup to address patchwork reports.
> 
> Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c

...

> +static struct mac_device_info *dwxgmac_brcm_setup(void *ppriv)
> +{
> +	struct mac_device_info *mac;
> +	struct stmmac_priv *priv = ppriv;

Hi, Jitendra,

A minor nit from my side.

Please consider using reverse xmas tree order - longest line to shortest -
for new Networking code.

This tool can be of assistance: https://github.com/ecree-solarflare/xmastree

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
