Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61014B39836
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Aug 2025 11:27:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D54CAC3F95E;
	Thu, 28 Aug 2025 09:27:49 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0144C3F95D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Aug 2025 09:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PgOiY/8TM3TVUl6GJF7nL449nJQfKgvLd+3cCT8JD6o=; b=rECEJydgc7m8D9fDVfaSoNnCtY
 Cvzwrz1a+X+uHqcgSXiGPBIr/ddNcuBSy8iW0m3ERG6Nwim6qN2to5wuTZcM7KH9W2fvjxl5dZK5q
 pfNr70KoQQmHgAGweJd3ElGoczV94jzic3rfWFZkcUQHrZO8o3mlGqblzzBxx+6De/AbzRG+k/LM4
 fxgM38u5ynrl2HQTDNifVxJECo1H1CBgMhfj6FoxcvQ24klFM63xabIQagT17IUb4938lM3ZIhEEX
 EXmixQ/gPXiCsWXjlOwSi9bNPN5HrCdlU0vYdejEJln892uQKeEJCtbzlOq2HCh8K3saB0Pon/Y4/
 kmSAU+HQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42286)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1urYub-000000001Pu-1HpH;
 Thu, 28 Aug 2025 10:27:17 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1urYuW-0000000031q-1yMo; Thu, 28 Aug 2025 10:27:12 +0100
Date: Thu, 28 Aug 2025 10:27:12 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Joy Zou <joy.zou@nxp.com>
Message-ID: <aLAg8Lds-O_36aaN@shell.armlinux.org.uk>
References: <20250825091223.1378137-1-joy.zou@nxp.com>
 <20250825091223.1378137-7-joy.zou@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250825091223.1378137-7-joy.zou@nxp.com>
Cc: imx@lists.linux.dev, alexander.stein@ew.tq-group.com, Frank.Li@nxp.com,
 edumazet@google.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 Markus.Niebel@ew.tq-group.com, frieder.schrempf@kontron.de,
 primoz.fiser@norik.com, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 kernel@pengutronix.de, linux-pm@vger.kernel.org, othacehe@gnu.org,
 s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, shawnguo@kernel.org,
 davem@davemloft.net, linux@ew.tq-group.com
Subject: Re: [Linux-stm32] [PATCH v9 6/6] net: stmmac: imx: add i.MX91
	support
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

On Mon, Aug 25, 2025 at 05:12:23PM +0800, Joy Zou wrote:
> @@ -310,6 +311,7 @@ imx_dwmac_parse_dt(struct imx_priv_data *dwmac, struct device *dev)
>  	}
>  
>  	if (of_machine_is_compatible("fsl,imx8mp") ||
> +	    of_machine_is_compatible("fsl,imx91") ||
>  	    of_machine_is_compatible("fsl,imx93")) {
>  		/* Binding doc describes the propety:
>  		 * is required by i.MX8MP, i.MX93.

Doesn't this comment need updating?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
