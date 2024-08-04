Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A01E394718F
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2024 01:11:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CEE4C71290;
	Sun,  4 Aug 2024 23:11:27 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60BA9C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Aug 2024 23:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=xPcQPhnjefrAYPKlbLal+dPjivGLLzQxviFzFKK6nPM=; b=o1EaUPvhdYVisztqS0ZbOVFM/6
 pssJF8sIgd1ISQUE9aqJ2rAWcyyEi0u2LIfIKBkBWOZ7t/JoKVGQvhaSDPFd/xpjTzp7n0tPhW2Bc
 Hg6RaeP/x3HXbc1Z7zpWNAGjur30Z/Lh7FBLNzxg/NLIlGRika+eKz9ydYgCKOorRgRc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sakNg-003zgl-0j; Mon, 05 Aug 2024 01:11:16 +0200
Date: Mon, 5 Aug 2024 01:11:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Message-ID: <8aa45bc5-b819-4979-80b5-6d90a772b117@lunn.ch>
References: <AM9PR04MB850628457377A486554D718AE2BD2@AM9PR04MB8506.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AM9PR04MB850628457377A486554D718AE2BD2@AM9PR04MB8506.eurprd04.prod.outlook.com>
Cc: dl-S32 <S32@nxp.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/6] net: driver: stmmac: extend CSR calc
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

>  #define	STMMAC_CSR_20_35M	0x2	/* MDC = clk_scr_i/16 */
>  #define	STMMAC_CSR_35_60M	0x3	/* MDC = clk_scr_i/26 */
>  #define	STMMAC_CSR_150_250M	0x4	/* MDC = clk_scr_i/102 */
> -#define	STMMAC_CSR_250_300M	0x5	/* MDC = clk_scr_i/122 */
> +#define	STMMAC_CSR_250_300M	0x5	/* MDC = clk_scr_i/124 */

That should probably be called out in the commit message. It is not a
fix as such, since it is just a comment, but as a reviewer i had a
double take when i noticed this.,


    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
