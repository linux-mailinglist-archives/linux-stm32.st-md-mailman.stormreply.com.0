Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6031F691DA7
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Feb 2023 12:10:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14BC0C6A5EA;
	Fri, 10 Feb 2023 11:10:04 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A5A7C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Feb 2023 11:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AXxKWPiVWJU1ugGjgpin75Nz5rvbBLIVFJ34R7UAKY4=; b=WRGrmvm4i7DY8WBKznriUmhH27
 HfSP+oNS0Q8XKdW3xMV7kb6qm5JR8qHzlHdfAr/9lB41CWLwO8HnMqM40mtotygauRM1XQ2/F0TVA
 3vV5Txv0zXOEk0Ds4/M6RZoyHDyjPCrMKR7MJx6sQdueTeqW6qmBZS/jLPuwNQaflyMC8vBQjK+gZ
 vcBHwoqcgEc5/pDOTlXMtPD7ZJeupFKiI7NPGbGv3XhCJbddfUeBReMofYDKeNG8HbckSFCm94Qph
 C2Cu8ywsYkf58Y3iQP2I9rmBqqecVNQZS3ciesqhtbDZ1YaeWxOFvaCGrIPfEET16Zf3fyjqRH7sn
 5xaoyalQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36516)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1pQRHk-0001No-OQ; Fri, 10 Feb 2023 11:09:44 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1pQRHg-0005XJ-T1; Fri, 10 Feb 2023 11:09:40 +0000
Date: Fri, 10 Feb 2023 11:09:40 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>
Message-ID: <Y+Yl9AvJN5ClU3ZD@shell.armlinux.org.uk>
References: <20230209151632.275883-1-clement.leger@bootlin.com>
 <20230209151632.275883-6-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230209151632.275883-6-clement.leger@bootlin.com>
Cc: Herve Codina <herve.codina@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kurt Kanzenbach <kurt@linutronix.de>, Eric Dumazet <edumazet@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 Tan Tee Min <tee.min.tan@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>,
 Wong Vee Khee <veekhee@apple.com>, Jose Abreu <joabreu@synopsys.com>,
 Milan Stevanovic <milan.stevanovic@se.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jimmy Lalande <jimmy.lalande@se.com>, linux-arm-kernel@lists.infradead.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Pascal Eberhard <pascal.eberhard@se.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v3 5/6] net: stmmac: add support
	for RZ/N1 GMAC
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, Feb 09, 2023 at 04:16:31PM +0100, Cl=E9ment L=E9ger wrote:
> +struct rzn1_dwmac {
> +	struct phylink_pcs *pcs;
> +};

Please see my comments on your previous patch series as to why I don't
think you need this structure nor its associated memory allocations.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
