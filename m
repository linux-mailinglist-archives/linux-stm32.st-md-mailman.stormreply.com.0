Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1FC3CEB6E
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jul 2021 21:48:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E69B5C57B6B;
	Mon, 19 Jul 2021 19:48:53 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92B0FC57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jul 2021 19:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=MpEyn1pQ8l2HvWMWGEa3AhtkYJDX6GLV9nl0yEUWM14=; b=2s0wrwA8pwvnAuX2PxG+beLmQY
 KpDRKdogrjz2PDRFl6GlhRaEdmMfOI5+R0uQNzQ4pBQsrJdepX6Xg8zlwIG2W68d012YY6c5e2gRB
 cfA3mFDobMR1ySd8gajLhAqvMkJeEIDtSMc0GoHDOmUSmKvwSIiGJDO49od3im9QD/yE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1m5ZFc-00DxMj-KL; Mon, 19 Jul 2021 21:48:28 +0200
Date: Mon, 19 Jul 2021 21:48:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Hao Chen <chenhaoa@uniontech.com>
Message-ID: <YPXXDDcH1Gs2Oek8@lunn.ch>
References: <20210719093207.17343-1-chenhaoa@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210719093207.17343-1-chenhaoa@uniontech.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 alexandre.torgue@foss.st.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4] net: stmmac: fix 'ethtool -P' return
	-EBUSY
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

On Mon, Jul 19, 2021 at 05:32:07PM +0800, Hao Chen wrote:
> The permanent mac address should be available for query when the device
> is not up.
> NetworkManager, the system network daemon, uses 'ethtool -P' to obtain
> the permanent address after the kernel start. When the network device
> is not up, it will return the device busy error with 'ethtool -P'. At
> that time, it is unable to access the Internet through the permanent
> address by NetworkManager.
> I think that the '.begin' is not used to check if the device is up.

You forgot to update the commit message.

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
