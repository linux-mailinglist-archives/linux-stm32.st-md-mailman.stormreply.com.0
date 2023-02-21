Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F78D69E877
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Feb 2023 20:41:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 349A3C6A5F8;
	Tue, 21 Feb 2023 19:41:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95F35C6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Feb 2023 19:41:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 65D5C611B2;
 Tue, 21 Feb 2023 19:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C8AC433EF;
 Tue, 21 Feb 2023 19:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677008459;
 bh=eYLLW5S3Lj0DfJGoQXiq8cvFhX8POKnoMCP9k1pGSvs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eVb89wVeLoZIphCUnqK8cj8jMop3IR9+3QChT71az41oS9ofu5w/z/BkhbiJ4e303
 +rCySsaZGqAYdNOQ3BwDDH9e0AILMmJ8DSWJdtOAuEtTxEccsDeTEsv8sw/xUrTo5N
 TbvBt1+87H7HA4Yfzdd0gML+HB9zjyNGwY6jXB7hMkXD/AZ4E+YeEDJciKjEYG7cVV
 Y6MU89pWb9X6LAV5kZ7dTkAQlVAw53c4tP8bLlw0WRocTDX/Dp5YZnj244mWnaQwG2
 6qz7y67AuafRORCs6QX6ukbx5mCiFI6T5zrp5dYpRo7V59ftuNf7gPPiAmZoZ9BtpA
 yOC8V2od/uikQ==
Date: Tue, 21 Feb 2023 11:40:58 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jochen Henneberg <jh@henneberg-systemdesign.com>
Message-ID: <20230221114058.5775664d@kernel.org>
In-Reply-To: <877cwa7qtm.fsf@henneberg-systemdesign.com>
References: <87fsaz6smr.fsf@henneberg-systemdesign.com>
 <Y/T0NRtorZn74EH3@corigine.com>
 <877cwa7qtm.fsf@henneberg-systemdesign.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Simon Horman <simon.horman@corigine.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net V2] net: stmmac: Premature loop
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

On Tue, 21 Feb 2023 20:35:25 +0100 Jochen Henneberg wrote:
> The premature loop termination check makes sense only in case of the
> jump to read_again where the count may have been updated. But
> read_again did not include the check.
> 
> Fixes: bba2556efad6 (net: stmmac: Enable RX via AF_XDP zero-copy)
> Fixes: ec222003bd94 (net: stmmac: Prepare to add Split Header support)
> Signed-off-by: Jochen Henneberg <jh@henneberg-systemdesign.com>

Please repost separately, not as a reply. Patch tracking utilities 
will categorize emails with Re in the subject as comments rather 
than submissions.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
