Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3958AA59531
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Mar 2025 13:54:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01F82C78F96;
	Mon, 10 Mar 2025 12:54:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52365C78F74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 12:53:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2B7225C5BE7;
 Mon, 10 Mar 2025 12:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7079CC4CEE5;
 Mon, 10 Mar 2025 12:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741611237;
 bh=J1e0tuX0R2dKRPJ+pB6GcyRcQHThRSNrXsdiWBni5Qk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sINWN16ngmfU2lykcPSvEltv8suz+4O4FzbpqqAf8sN1TkxAateKk8xaWROXzZlg/
 4lKExBHdAJhTMm/zIyb7EjXGys2rB3rHGsL9TxpkaSK9WzmatdOIuYHViAbazwRVRx
 IS2iaG3Ocpg2eRRLOJdc+t5PDggdRzoe+fOKYDFI2WjPO1G3fEl3/mZAQZe+Pdnhsd
 yzfgHJadIf7kxez3j5tOJkx/cPK3eQ2lcqMaIl4R2CIPdG5y32mnhK+XpT5rLaF+BC
 KkJV7Vt9a4FqNJME2iX0fxvjPhZFHGtPSgfKx91tzXj0w69Q4R8z7/Dw3TJXqDx9JE
 68olY1HAX1M+g==
Date: Mon, 10 Mar 2025 07:53:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <174161123533.3885448.13844393493565707617.robh@kernel.org>
References: <Z82tWYZulV12Pjir@shell.armlinux.org.uk>
 <E1trIAQ-005nto-3w@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1trIAQ-005nto-3w@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Emil Renner Berthing <kernel@esmil.dk>,
 Eric Dumazet <edumazet@google.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Alexandre Ghiti <alex@ghiti.fr>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Minda Chen <minda.chen@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 6/7] dt-bindings: deprecate "snps,
 en-tx-lpi-clockgating" property
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


On Sun, 09 Mar 2025 15:02:14 +0000, Russell King (Oracle) wrote:
> Whether the MII transmit clock can be stopped is primarily a property
> of the PHY (there is a capability bit that should be checked first.)
> Whether the MAC is capable of stopping the transmit clock is a separate
> issue, but this is already handled by the core DesignWare MAC code.
> 
> Therefore, snps,en-tx-lpi-clockgating is technically incorrect, so this
> commit deprecates the property in the binding.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
