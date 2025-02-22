Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26812A40737
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Feb 2025 11:00:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8C62C78F83;
	Sat, 22 Feb 2025 10:00:29 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55039C78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Feb 2025 10:00:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 035B55C4D03;
 Sat, 22 Feb 2025 09:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25FDCC4CED1;
 Sat, 22 Feb 2025 10:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740218426;
 bh=O0GBKjyjvst1Ef+k3JkpAQlW8scAA9rB7DUZrqOeRDo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oc2fscaEwhy/TUTIxe3wf9j8WIRhkk1A87kqKUKxmzwZ2RSIbP5HuqEiQGHMS41sJ
 IuMORh5KiiBrcUB1G/rfWq9LwRjHBeKZy4pihkOC++Fsyo/TM7rJ3pxYLcLNvbf5uP
 mzZAIwcGrLLv9EZbGix723ngzBn374tQ+t5/XgIxoA4NrfHDjTun3v6qzdU/AZ2ZIb
 DgoswH6eLC3JeavzhgcuZBD+6E2O0trw9wh4ERrhuVK6aP3aN0D8S+9Zf3uUaPSgqN
 tim1TXV3XWb8KC0v4O9A6IucpXEraDL6o9zdZtGTKlsbg4BOGAY1iI3gvTlFkgwxXU
 0dj7HLInl2eOA==
Date: Sat, 22 Feb 2025 15:30:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <Z7mgNoJTIE8bbxte@vaman>
References: <E1tlRMK-004Vsx-Ss@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1tlRMK-004Vsx-Ss@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: qcom-ethqos: use
 rgmii_clock() to set the link clock
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

On 21-02-25, 11:38, Russell King (Oracle) wrote:
> The link clock operates at twice the RGMII clock rate. Therefore, we
> can use the rgmii_clock() helper to set this clock rate.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
