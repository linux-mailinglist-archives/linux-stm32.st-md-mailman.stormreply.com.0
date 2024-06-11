Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B009033D1
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 09:35:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 134F5C6C838;
	Tue, 11 Jun 2024 07:35:45 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F063C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 07:35:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01FE7FF809;
 Tue, 11 Jun 2024 07:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1718091344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tfBmIBfBFzgmDf9ez+C3sLKXREaPjawEgC3PAYhHrqA=;
 b=G1dHZpSPZiMZx6xplQlDZzeRp6StTvRQv1HEpmvQyVDcd2aJFAAK/JH4+M0lqgfzatidja
 JAjuIfNfY2MxV6kUzZ/QxPYq3AwjB6TmVlyrVrCJe7X2OzvE810KJmwBnicYekTlDHHwJs
 MEqATZ2+1icOGjraYCMRambWf3TQddcO0nsLtOjEBV3TKmmh/sHpn/fZJolbyQKWcsD4Oz
 zgp5MsoQSh969n8Ush2XO63WXl9uaPxH22Fu/PyjXm+ws+gfiZ9a8S4Sj0pBJMgc/yOmeh
 CnrWfNKfjw517ZrhYLv2FbBo4Y5OH7np1o51qJLleEHZnFRMt3RQPEiEPEyv8g==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Serge Semin <fancer.lancer@gmail.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Date: Tue, 11 Jun 2024 09:36:26 +0200
Message-ID: <5509689.FacUkMOHz6@fw-rgant>
In-Reply-To: <E1sGgCH-00Facn-T6@rmk-PC.armlinux.org.uk>
References: <ZmcQTuR5IKRp0pgy@shell.armlinux.org.uk>
 <E1sGgCH-00Facn-T6@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] Re: [PATCH net-next 1/5] net: stmmac: add
	select_pcs() platform method
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

On lundi 10 juin 2024 16:40:33 UTC+2 Russell King (Oracle) wrote:
> Allow platform drivers to provide their logic to select an appropriate
> PCS.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Tested-by: Romain Gantois <romain.gantois@bootlin.com>
Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
