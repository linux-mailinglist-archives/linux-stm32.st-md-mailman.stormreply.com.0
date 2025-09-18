Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FC1B86D8B
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Sep 2025 22:11:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD2CFC3F959;
	Thu, 18 Sep 2025 20:11:28 +0000 (UTC)
Received: from mail.mleia.com (mleia.com [178.79.152.223])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3404DC3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Sep 2025 20:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
 t=1758226287; bh=Iz1O6jfjq1q9VqakNVUVO7uZ4sHU1u3uu4IY4c2AODg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=idkAdHuL3LERu69pldFSTewZEkM2ke2QlZR8x3wLMExFHvq3v28C00mmuWZtn+QUn
 eiTw4pD2Od7CeYDMMY7vXIPAw4MFLnzMkpIhAjgCNiCsxwH3SPv4NSgYOvS6Q/Hr6v
 N08Xf1Nc8bcps8ZPB1eq+PKJC8WOnA+j+ztxd4GZFj94zHDwE9VAY4Ra4B4GJ7eemL
 fYs8OfYQ53jk3W64OD8//weQjsy47BKG4k4YxDN1Wz4lr7iKZqIL57hF3XU89wyI/8
 yhcPYwZ3ibt0CiwmEzBEcTmatzqkJvTXZ7c6y+2Jd+WIsSOInaj66atOwHNfi9bJ3y
 vU1qIJ0k/wCWw==
Received: from mail.mleia.com (localhost [127.0.0.1])
 by mail.mleia.com (Postfix) with ESMTP id 762393D55C1;
 Thu, 18 Sep 2025 20:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
 t=1758226287; bh=Iz1O6jfjq1q9VqakNVUVO7uZ4sHU1u3uu4IY4c2AODg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=idkAdHuL3LERu69pldFSTewZEkM2ke2QlZR8x3wLMExFHvq3v28C00mmuWZtn+QUn
 eiTw4pD2Od7CeYDMMY7vXIPAw4MFLnzMkpIhAjgCNiCsxwH3SPv4NSgYOvS6Q/Hr6v
 N08Xf1Nc8bcps8ZPB1eq+PKJC8WOnA+j+ztxd4GZFj94zHDwE9VAY4Ra4B4GJ7eemL
 fYs8OfYQ53jk3W64OD8//weQjsy47BKG4k4YxDN1Wz4lr7iKZqIL57hF3XU89wyI/8
 yhcPYwZ3ibt0CiwmEzBEcTmatzqkJvTXZ7c6y+2Jd+WIsSOInaj66atOwHNfi9bJ3y
 vU1qIJ0k/wCWw==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi
 [91.159.24.186])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.mleia.com (Postfix) with ESMTPSA id F04BE3D4D3E;
 Thu, 18 Sep 2025 20:11:25 +0000 (UTC)
Message-ID: <64ea0259-30a2-4264-8c05-8fd7df113bb5@mleia.com>
Date: Thu, 18 Sep 2025 23:11:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
 <E1uytpv-00000006H2x-196h@rmk-PC.armlinux.org.uk>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <E1uytpv-00000006H2x-196h@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250918_201127_506365_0BB65E3C 
X-CRM114-Status: GOOD (  11.00  )
Cc: Drew Fustini <fustini@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 imx@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
 Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Minda Chen <minda.chen@starfivetech.com>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next 10/10] net: stmmac: remove
	mac_interface
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 9/17/25 18:12, Russell King (Oracle) wrote:
> mac_interface has served little purpose, and has only caused confusion.
> Now that we have cleaned up all platform glue drivers which should not
> have been using mac_interface, there are no users remaining. Remove
> mac_interface.
> 
> This results in the special dwmac specific "mac-mode" DT property
> becoming redundant, and an in case, no DTS files in the kernel make use
> of this property. Add a warning if the property is set, and it is
> different from the "phy-mode".
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
