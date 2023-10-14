Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 400D87C94E4
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Oct 2023 16:44:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC683C6B442;
	Sat, 14 Oct 2023 14:44:35 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1058C65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Oct 2023 14:44:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E1D5BB8076B;
 Sat, 14 Oct 2023 14:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638DCC433C7;
 Sat, 14 Oct 2023 14:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697294673;
 bh=11scpju71D+KerC5FhLxK9Ma2HRBqYwq2VHa/P5HXo8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tb40Oyx8m0AwzPXsLNlWOiSigEbsAvCNBdUpb2hrFWsFqQCrASeDhLRd7HQzzg0ev
 LySdTO04dtwnNoNrNM0z2C02dwhFNeXDWP0Npm+pw3FKK07TdejIZJQOnPeqelqVsR
 8b05MV4RpV1yiNOw6N2VlGGRzEzJfC+imxNtvnA4AYo8xPvQvvsybNz5CqurNrjd96
 xD4vdsOEmP25fCCGy8pMoFd8k7Nj1ebREcJgHyXIR7Y1W6HHW1bW+Oa/Fs3n8FUNky
 neYAProozhcaz3AqZxalAfVITm/Y/AZKf2cRlXMPUNYjoapEk+JnLjKWEGhnbVS6TG
 791CflIJO8iTw==
Date: Sat, 14 Oct 2023 16:44:28 +0200
From: Simon Horman <horms@kernel.org>
To: Johannes Zink <j.zink@pengutronix.de>
Message-ID: <20231014144428.GA1386676@kernel.org>
References: <20231010-stmmac_fix_auxiliary_event_capture-v1-0-3eeca9e844fa@pengutronix.de>
 <20231010-stmmac_fix_auxiliary_event_capture-v1-2-3eeca9e844fa@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231010-stmmac_fix_auxiliary_event_capture-v1-2-3eeca9e844fa@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Kurt Kanzenbach <kurt@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
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

On Thu, Oct 12, 2023 at 11:02:13AM +0200, Johannes Zink wrote:
> The stmmac supports up to 4 auxiliary snapshots that can be enabled by
> setting the appropriate bits in the PTP_ACR bitfield.
> 
> Previously instead of setting the bits, a fixed value was written to
> this bitfield instead of passing the appropriate bitmask.
> 
> Now the correct bit is set according to the ptp_clock_request.extts_index
> passed as a parameter to stmmac_enable().
> 
> Fixes: f4da56529da6 ("net: stmmac: Add support for external trigger timestamping")
> Signed-off-by: Johannes Zink <j.zink@pengutronix.de>

Hi Johannes,

The fix language of the subject and presence of a fixes tag implies that
this is a bug fix. But it's not clear to me that this is resolving
bug that manifests as a problem.

If it is a bug fix then it should probably be targeted at 'net',
creating a dependency for the remainder of this series.

On the other hand, if it is not a bug fix then perhaps it is best to
update the subject and drop the Fixes tag.

I'm no expert on stmmac, but the rest of the series looks good to me.

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
