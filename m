Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 680A290341F
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 09:45:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E00FC6C838;
	Tue, 11 Jun 2024 07:45:21 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDD72C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 07:45:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 75534C0006;
 Tue, 11 Jun 2024 07:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1718091919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VzysMo60EaW8PFa2ydA6Nv+HipQDazekB7E714o/3BA=;
 b=Vi4xEe5Nc1zu7cfZHWTgvg/9NEDOq6Z8U7uapmRA7xnZ+Z9h/noeiWOd0BNtHOPeZw7Vcl
 E9qFLmHyzHiOc1U0x7L7YiAf6T4i8rsXAe5D9zGaZAE7Dq01n0jOW6HWB35T4Ym46y4N1u
 LoC3+qspIJQctZ7o8mPDtCTMtWrC6XxgWpC94tqteki/KUmQTvFjwoXGHdwwZ1SRRbbD0v
 NGSeGZ/bEmgUpYdP7cwKxitNs042vZqt7tLLc7JQzqnpNkMJqf9cE7cki/DE1MUw+JIluz
 3mEmkfYvB/TgiQGKidezEoF8dJIWfLnonKrd3oMkB1W4iFdIjiPWjruXEOGxhA==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Serge Semin <fancer.lancer@gmail.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Date: Tue, 11 Jun 2024 09:46:01 +0200
Message-ID: <8905016.TWkq766n7R@fw-rgant>
In-Reply-To: <E1sGgCc-00FadB-Ch@rmk-PC.armlinux.org.uk>
References: <ZmcQTuR5IKRp0pgy@shell.armlinux.org.uk>
 <E1sGgCc-00FadB-Ch@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] Re: [PATCH net-next 5/5] net: stmmac: clean up
	stmmac_mac_select_pcs()
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

On lundi 10 juin 2024 16:40:54 UTC+2 Russell King (Oracle) wrote:
> Since all platform providers of PCS now populate the select_pcs()
> method, there is no need for the common code to look at
> priv->hw->phylink_pcs, so remove it.
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
