Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBE569FAB7
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Feb 2023 19:04:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CD6FC6A5F8;
	Wed, 22 Feb 2023 18:04:25 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0C7CC01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Feb 2023 18:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=hlNS2X2Xqf+Z97espqDnwbcl/Ki3E10UhHxUQFY1lCE=; b=AVK8vTj3eQpBWUQ3toTiAMeZNA
 2/+u5ANSCyFS8g9BTtGnw6eZnmOK5EnmIjpyoIlR31NJewT0RHIqK3dKqaEJpWOPyJYdinKFRspp4
 hkgRAyj0a+Xufnl3nR7C0jdTixqQ6kkh4iDYMoJ67VIt8vhYtghSIr93VNaASfUQ8nzo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1pUtSw-005iK5-Un; Wed, 22 Feb 2023 19:03:42 +0100
Date: Wed, 22 Feb 2023 19:03:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Henneberg - Systemdesign <lists@henneberg-systemdesign.com>
Message-ID: <Y/ZY/o5HvNCPLfFg@lunn.ch>
References: <87y1oq5es0.fsf@henneberg-systemdesign.com>
 <Y/XbXwKYpy3+pTah@corigine.com>
 <87lekp66ko.fsf@henneberg-systemdesign.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87lekp66ko.fsf@henneberg-systemdesign.com>
Cc: linux-kernel@vger.kernel.org, Simon Horman <simon.horman@corigine.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net V3] net: stmmac: Premature loop
 termination check was ignored
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

On Wed, Feb 22, 2023 at 04:49:55PM +0100, Henneberg - Systemdesign wrote:
> 
> Simon Horman <simon.horman@corigine.com> writes:
> 
> > On Wed, Feb 22, 2023 at 08:38:28AM +0100, Jochen Henneberg wrote:
> >> 
> >> The premature loop termination check makes sense only in case of the
> >> jump to read_again where the count may have been updated. But
> >> read_again did not include the check.
> >> 
> >> Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
> >
> > This commit was included in v5.13
> >
> >> Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")
> >
> > While this one was included in v5.4
> >
> > It seems to me that each of the above commits correspond to one
> > of the two hunks below. I don't know if that means this
> > patch should be split in two to assist backporting.
> >
> 
> I was thinking about this already but the change was so trivial that I
> hesitated to split it into two commits. I wanted I will surely change
> this.

The advantage of splitting is that it makes back porting easy. Both
parts are needed for 6.1 and 5.15. 5.10 only needs the fix for
ec222003bd94. It if does not easily apply to 5.10 it could get
dropped. By splitting it, the backporting probably happens fully
automated, no human involved.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
