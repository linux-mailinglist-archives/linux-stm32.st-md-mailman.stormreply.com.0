Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 148243C6FA2
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jul 2021 13:23:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3DAAC57B6F;
	Tue, 13 Jul 2021 11:23:01 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D85A2C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jul 2021 11:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yGhDFnZM0A65W5PQXub87bUt7hi0BbiF5BkXDcA/Zr4=; b=ffLTrSEP1oIazt9MQBn1/8er4
 3sgMpXXzNFjn9Tdwdueb36QlruzqqCcSURPnHeqedRvfFPWhkTHYdYjjG4fvWr24TDV3ZFZnD7Vqb
 6zUhqHqoYcrwDJGYnSZGJEfEIPtXjGRiYqf6qn+ULprCyZCttHZ0+87T4GbudVKnv/URIkSiVuXsP
 qCm2q6xIAIof9Wc45z860/XHYcV2wK1xBl3lBTz8N6rV2i90D+fjEcaAOJkmffMvNQ2AZIyLtgsfp
 EvE/2PWJx5eau5kMIjcVs9L5SlE0lWfY4I6n9gTkwU5GVX+8uXaNBX3kL3L5xuitIuy8Q5zXnHOYz
 fWMql0T3Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46046)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1m3GV5-00060D-8l; Tue, 13 Jul 2021 12:22:55 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1m3GV3-0000Ew-8A; Tue, 13 Jul 2021 12:22:53 +0100
Date: Tue, 13 Jul 2021 12:22:53 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <20210713112253.GH22278@shell.armlinux.org.uk>
References: <20210712231910.GA1831270@pc>
 <20210713063053.qqttzxlopvpnadj3@pengutronix.de>
 <20210713091954.GG22278@shell.armlinux.org.uk>
 <012ccfea2a564274bd9d2e1cfc130873@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <012ccfea2a564274bd9d2e1cfc130873@AcuMS.aculab.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Salah Triki <salah.triki@gmail.com>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] divide by 3*sizeof(u32) when computing
	array_size
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

On Tue, Jul 13, 2021 at 11:07:00AM +0000, David Laight wrote:
> From: Russell King
> > Sent: 13 July 2021 10:20
> ....
> > I would also note that the code relies on there being no padding in
> > struct stm32_breakinput - it should be noted that a strict
> > interpretation of the C standard allows padding to be added anywhere
> > to a structure - at the start, end or between members.
> 
> I'm pretty certain I remember that padding before the first member
> isn't allowed.

You may be right there.

> In any case the kernel generally assumes there is no extra padding.
> (eg for structures that map hardware registers.)

That's incorrect. Places where we care either generally end up with
__packed or are carefully layed out to ensure members are naturally
aligned to reduce the likelyhood of it. 32-bit OABI ARM has been
particularly "fun" in this respect.

> For big structures it is worth adding a compile-time check of
> the structure size - but not really for three u32.

Sorry, structure size has absolutely nothing to do with whether it's
a good idea to have a compile-time check. The deciding factor is
whether the code relies on some property such as it being a certain
size. Such as in this exact case. If you grep for "BUILD_BUG_ON.*sizeof"
in fs/ for example, this illustrates the point rather well.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
