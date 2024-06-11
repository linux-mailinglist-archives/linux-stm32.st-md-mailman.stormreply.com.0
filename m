Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF2C9033E6
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 09:40:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CABFC6C838;
	Tue, 11 Jun 2024 07:40:18 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7356C6C838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 07:40:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B15E24000E;
 Tue, 11 Jun 2024 07:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1718091611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=12jWhPIUnOw/RKwQiE4XQ7cBa4eoelBDbdF0jGh8WZg=;
 b=W2pG7pe9lyBpyZie7mu2wpgUjZVchYnYUM5Vxcl52qCiH1Yu7BNv5tE3F7fEsjssxijh0s
 v85gyRgwxsFD1oeh5fvChc89+50kx+di54loOYwi73ojCJ7CfPCEUqpMB2g4zdqqRH0OqV
 ZgD/uLbi0aI7g+2x6A+rJ+6bt53EWtDFWdunFOaVY8i3nwHAN/f4geiru2/ygoc1h/wwrh
 f4wo/X5wLfvXqV+b94InQ92kMx3+eKiPil7CYfMEtTbtF2MRcPrijjI+/Ij0maK2/q6Uoi
 jQZrE4ei2H20qLh150jB8qwcl6A1A78rmvrLLJ+CZucxCzyevMaGpeOGo6cOAA==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Serge Semin <fancer.lancer@gmail.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Date: Tue, 11 Jun 2024 09:40:51 +0200
Message-ID: <572700203.5assNPOG8s@fw-rgant>
In-Reply-To: <E1sGgCN-00Fact-0x@rmk-PC.armlinux.org.uk>
References: <ZmcQTuR5IKRp0pgy@shell.armlinux.org.uk>
 <E1sGgCN-00Fact-0x@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] Re: [PATCH net-next 2/5] net: stmmac: dwmac-intel:
 provide a select_pcs() implementation
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

On lundi 10 juin 2024 16:40:39 UTC+2 Russell King (Oracle) wrote:
> Move the code returning the XPCS into dwmac-intel, which is the only
> user of XPCS. Fill in the select_pcs() implementation only when we are
> going to setup the XPCS, thus when it should be present.
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
