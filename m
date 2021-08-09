Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A43B73E46BB
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Aug 2021 15:35:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 565B5C57B51;
	Mon,  9 Aug 2021 13:35:29 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D711C57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Aug 2021 13:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=4ANahQ2cqmBDHTiQEa5YLbEqQAFRzNMJ3iDCtBOXvgI=; b=ZBYHEpi+HbXPwkc/gBLFF8X5pf
 880QW5VjvwWasYI5PzgwK41YsF9fYzv0YeC7r6EwGDR7Au3ztt/yjWgGwM2pvhpBiDrpowKHpPptG
 OUqP2HB7ie0GOy8N5LlbFHRKbBZ63pc9lDK5Q+a6nscl9Vjemgdz3XQnB/GFs6V7icdE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1mD5Qr-00Gi51-F9; Mon, 09 Aug 2021 15:35:09 +0200
Date: Mon, 9 Aug 2021 15:35:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Message-ID: <YREvDRkiuScyN8Ws@lunn.ch>
References: <20210809102229.933748-1-vee.khee.wong@linux.intel.com>
 <20210809102229.933748-2-vee.khee.wong@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210809102229.933748-2-vee.khee.wong@linux.intel.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 Voon Weifeng <weifeng.voon@intel.com>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: pcs: xpcs: enable skip
	xPCS soft reset
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

On Mon, Aug 09, 2021 at 06:22:28PM +0800, Wong Vee Khee wrote:
> From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> 
> Unlike any other platforms, Intel AlderLake-S uses Synopsys SerDes where
> all the SerDes PLL configurations are controlled by the xPCS at the BIOS
> level. If the driver perform a xPCS soft reset on initialization, these
> settings will be switched back to the power on reset values.
> 
> This changes the xpcs_create function to take in an additional argument
> to check if the platform request to skip xPCS soft reset during device
> initialization.

Why not just call into the BIOS and ask it to configure the SERDES?
Isn't that what ACPI is all about, hiding the details from the OS? Or
did the BIOS writers not add a control method to do this?

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
