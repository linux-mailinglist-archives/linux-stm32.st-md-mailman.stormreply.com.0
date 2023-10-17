Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D287CD10C
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Oct 2023 01:50:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB1DBC6C837;
	Tue, 17 Oct 2023 23:50:48 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50E4BC6C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Oct 2023 23:50:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D2659CE2255;
 Tue, 17 Oct 2023 23:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104ADC433C7;
 Tue, 17 Oct 2023 23:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697586643;
 bh=DX4eQLbDH4WkaayNMxaAdYWcxQIc3Jkh/CQPfojaQEU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OCbx8CfjXQDmgOK+IJZIpXLto/5Ledwx9z5n0guSGwzj4YeTet2MByosXF+VEl/wp
 qmzX/92ZHeZ7aX3X3PuDjXgoLqgaj36J1sVU5ESBfbRxfhb99DTacmhIG/E4YYmRQG
 IZ64NtUjRYNYda1jZo1oz1iRGrgia7TtQ8yBw4Rzo8o+UYZfeHdrymVvZuSuXbOOkU
 EKcYUfpWl4HbuRg/Y4DWEx+5IUqF98ANbnRmz0G8zEcIs82xvoQ8IZZhcgd14ILbXd
 Mg/lEa2uAginD05ObCUe9yLe7v8eHWpzhr63VADWExW27TmJ5PGz1j8CtaiRV++fJQ
 KNnsfUF2hZNxQ==
Date: Tue, 17 Oct 2023 16:50:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <20231017165042.30fa9061@kernel.org>
In-Reply-To: <20231017-transfer-refurbish-5cfaf12a524c-mkl@pengutronix.de>
References: <20231010-stmmac_fix_auxiliary_event_capture-v1-0-3eeca9e844fa@pengutronix.de>
 <20231010-stmmac_fix_auxiliary_event_capture-v1-2-3eeca9e844fa@pengutronix.de>
 <20231014144428.GA1386676@kernel.org>
 <004d6ce9-7d15-4944-b31c-c9e628e7483a@pengutronix.de>
 <20231017082618.4558ad06@kernel.org>
 <20231017-transfer-refurbish-5cfaf12a524c-mkl@pengutronix.de>
MIME-Version: 1.0
Cc: Johannes Zink <j.zink@pengutronix.de>, kernel@pengutronix.de, "David S.
 Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Kurt Kanzenbach <kurt@linutronix.de>, linux-kernel@vger.kernel.org,
 Simon Horman <horms@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH net-next 2/5] net: stmmac: fix PPS capture
	input index
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

On Tue, 17 Oct 2023 22:27:41 +0200 Marc Kleine-Budde wrote:
> > Would be good to clarify what impact on device operation the problem
> > has. How would end user notice the problem?
> > Does it mean snapshots were always or never enabled, previously?  
> 
> On all dwmac devices not covered by dwmac-intel.c (INTEL 10/100/1000
> Ethernet PCI driver), PPS capture can be requested from user-space, but
> is not enabled in HW. There is no error message or other feedback to the
> user space. The user space will not get any PPS events.
> 
> As this change also affects the Intel driver, and we don't have any
> hardware to test, I think it's better that this goes via net-next to
> give it a bit more time of testing.

SGTM, we can chalk it up to "never worked, doesn't hurt anyone"
and put it in net-next. But then the Fixes tag must go.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
