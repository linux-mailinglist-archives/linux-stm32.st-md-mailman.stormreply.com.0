Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEA43A9BFC
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Jun 2021 15:29:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52C13C59780;
	Wed, 16 Jun 2021 13:29:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EA63C57B78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Jun 2021 13:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eV9wlaJRtH6xgA6NpxWOpKQTk5aIanp5IHRWCYIODGA=; b=ItNfW2usIA0QybWdB9nm+9frE
 CYTWyLkj+0HBDYNR/94lmFjpWew8IuY77Iat62zdub4KMpevVKeD2wbFK/nMxZ3b6PBnK6J8eIjKx
 ZKOnZnCVG1PEQLlsZOVog+NkC8L6jiT1tZntlfZqrsrn2zFnKaYM3haM1WThTps/oXXUkX4qD68tG
 e84yXwQsEMzwepnbZnC088WRZc5h1zr6+nQFWdXhtdrGcX+znHP1U/ySzfbRZTdSrJY489ElfblKB
 gfrXzBnxrHNKD1RTs+6+8Y+mrnbEirBdJj3jSSZjbPc6vCey7O69lYRuFxeiyDlva1lY24Qga22/q
 Hmvj1Xb/Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45068)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1ltVbK-0007Gk-P7; Wed, 16 Jun 2021 14:29:02 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1ltVbH-000645-PM; Wed, 16 Jun 2021 14:28:59 +0100
Date: Wed, 16 Jun 2021 14:28:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Joakim Zhang <qiangqing.zhang@nxp.com>
Message-ID: <20210616132859.GE22278@shell.armlinux.org.uk>
References: <20210616091426.13694-1-qiangqing.zhang@nxp.com>
 <20210616091426.13694-2-qiangqing.zhang@nxp.com>
 <20210616102038.GB22278@shell.armlinux.org.uk>
 <VI1PR04MB68004D29895652864B4C1D20E60F9@VI1PR04MB6800.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1PR04MB68004D29895652864B4C1D20E60F9@VI1PR04MB6800.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net 1/2] net: fec_ptp: add clock rate zero
	check
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

Hi Joakim,

On Wed, Jun 16, 2021 at 11:40:29AM +0000, Joakim Zhang wrote:
> Do you mean that print an error message then return directly? It seems better.

Nearly - one has to ensure that the cleanup functions don't provoke a
crash though. I notice fec_ptp_stop() makes use of fep->time_keep
and also fep->ptp_clock.

fep->time_keep is initialised after where you need to test for zero
cycle_speed, so the initialisation would need moving earlier.

I would have thought that ftp->ptp_clock should be NULL, so that's
probably okay, but should be checked that this assumption is in fact
true.

> if (!fep->cycle_speed) {
> 	dev_err(&fep->pdev->dev, "PTP clock rate should not be zero!\n");

I'd still say something like "PTP clock rate should not be zero,
disabling PTP" - say what's wrong and what we are doing. Also,
please avoid exclaimation marks in error messages.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
