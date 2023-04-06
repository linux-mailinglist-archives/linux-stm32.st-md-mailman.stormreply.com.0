Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B836D9988
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Apr 2023 16:25:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BD1FC6B441;
	Thu,  6 Apr 2023 14:25:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4ECBBC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Apr 2023 14:25:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 32CE06478C;
 Thu,  6 Apr 2023 14:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5763C433D2;
 Thu,  6 Apr 2023 14:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680791106;
 bh=dVLrRKMixxYJuJxgFVKfxaLTvhfPWlQjL3ZdegVqCYo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XrQ4vEbqAY8KxcnwjjJnmbT/Yk4YENoIhmdid/YAyH0cqbPKOsJU5RsEvdJBhtpFr
 YbH/Y4Ry6cRD7NFkUq/mcW6RCuy4+C9qSP4ScbpNd+HtXvYzFLWPfJFcIyJhPmXT0+
 qZCj+qXajGDAhZtUKKL3BFDD7HzuenGi+I/0ROZzQuFXZezmr6MKE5E+DfL2huyXJk
 tI43BX9eOW8OFlSnz8RqNJlOsHKpr1rb6O3M5jmqTC0oUQu0grYQYm79hd/qkHgdVT
 JB0vPjHUIzCVKnU97MvxXPevOkTIPwtFVaf4O3oq3a7RLP34yAYvhgYc+JXZ2vmPIG
 fH6ktcgA64cMQ==
Date: Thu, 6 Apr 2023 07:25:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Message-ID: <20230406072504.68e032e6@kernel.org>
In-Reply-To: <20230406024541.3556305-1-michael.wei.hong.sit@intel.com>
References: <20230406024541.3556305-1-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Cc: andrew@lunn.ch, Voon Weifeng <weifeng.voon@intel.com>,
 Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Eric Dumazet <edumazet@google.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, hock.leong.kweh@intel.com,
 linux@armlinux.org.uk, Jose Abreu <joabreu@synopsys.com>,
 Paolo Abeni <pabeni@redhat.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Tan Tee Min <tee.min.tan@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Zulkifli Muhammad Husaini <muhammad.husaini.zulkifli@intel.com>, "David S
 . Miller" <davem@davemloft.net>, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [RESEND PATCH net 1/1] net: stmmac: check fwnode
 for phy device before scanning for phy
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

On Thu,  6 Apr 2023 10:45:41 +0800 Michael Sit Wei Hong wrote:
> Some DT devices already have phy device configured in the DT/ACPI.
> Current implementation scans for a phy unconditionally even though
> there is a phy listed in the DT/ACPI and already attached.
> 
> We should check the fwnode if there is any phy device listed in
> fwnode and decide whether to scan for a phy to attach to.

Why did you resend this?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
