Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEC265453E
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Dec 2022 17:39:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECAF2C6904C;
	Thu, 22 Dec 2022 16:39:28 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1BABC64109
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Dec 2022 16:39:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6F2BDB802C7;
 Thu, 22 Dec 2022 16:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B7FC433D2;
 Thu, 22 Dec 2022 16:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1671727165;
 bh=egoBgDJa6cP4OcBqEvU1JwAhvMnDYhljcvNAPvTmGOA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wVsAaR3/PYuF4uefDRfG6KYtQ6kn5M9SvaAgseL3FsMxKUZLoQUbhfJ9s25goBFrr
 CYsQaziLynj0Nxw5LK8YdkwStTnCcNQXHZUwonRwC6x5Sq+J2ztAG35d+CNH3bHUM3
 sMJB1Kva+8U0JiUKuzBXOacf9PSlTvyZ7XvMF5/Q=
Date: Thu, 22 Dec 2022 17:39:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <Y6SIOpsxNdezKCTc@kroah.com>
References: <20221222100504.68247-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221222100504.68247-1-gatien.chevallier@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Oleksii_Moisieiev@epam.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH v2 0/7] Introduce STM32 system bus
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

On Thu, Dec 22, 2022 at 11:04:57AM +0100, Gatien Chevallier wrote:
> Document STM32 System Bus. This bus is intended to control firewall
> access for the peripherals connected to it.

Why is this an "RFC"?  That usually means "I have more work to do on it,
but I'll send it out now anyway".  What work is left?

And for most code, I know I don't review "RFC" changes as there are too
many "real" patches being submitted where people think their code is
ready to be merged.  Other reviewers might think otherwise, but be aware
of this...

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
