Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B562903417
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 09:44:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B9FAC78004;
	Tue, 11 Jun 2024 07:44:43 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BE3BC78003
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 07:44:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CD961C0005;
 Tue, 11 Jun 2024 07:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1718091875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ihufCtlwErxwfHYl3EzgqZNtueA4taxOagrZb+gbUz4=;
 b=VEU/7Sh4FRVxuUs2eVCAOggJ9zOOYwYL6GD9MfybnrFYuOVmJzPiYoi70vHL1XW5yWZvAY
 bNpufuxhrmdmH//cR+nc9gAx7c6Qs3VdpjAc5hpeAzsvm37Sm7KnxeIIzpcnoFavPASiP1
 VSyQ79HaUD83pn5Ale6cG5EJ9txgjZH4Pt3BoUqPmruLmFCBBZKHdTuleRE8PXWtdSBGwO
 HQpa/8LS8kcXpFxABSWkbEp3nfEQCGHRr9VzSr+N14mUcNegL//9szYIu//GhZl6jOzKMB
 pJzVDNVk7Gcnw+EoMKfJYdcAAA/JX42Vnf7DX4xTN08XDRdbkyLfSU7+c5EbyQ==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Serge Semin <fancer.lancer@gmail.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Date: Tue, 11 Jun 2024 09:45:15 +0200
Message-ID: <171812177.LLWfzqLr5J@fw-rgant>
In-Reply-To: <E1sGgCX-00Fad5-92@rmk-PC.armlinux.org.uk>
References: <ZmcQTuR5IKRp0pgy@shell.armlinux.org.uk>
 <E1sGgCX-00Fad5-92@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] Re: [PATCH net-next 4/5] net: stmmac: dwmac-socfpga:
 provide select_pcs() implementation
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

On lundi 10 juin 2024 16:40:49 UTC+2 Russell King (Oracle) wrote:
> Provide a .select_pcs() implementation which returns the phylink PCS
> that was created in the .pcs_init() method.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
