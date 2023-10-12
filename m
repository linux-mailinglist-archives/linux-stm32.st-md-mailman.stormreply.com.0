Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 688A47C70EF
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Oct 2023 17:06:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17B69C6A613;
	Thu, 12 Oct 2023 15:06:23 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86A62C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Oct 2023 15:06:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D760DB82425;
 Thu, 12 Oct 2023 15:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4A4C433C7;
 Thu, 12 Oct 2023 15:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697123180;
 bh=wY9MRkbEMq3vjjbxC2RGfewmVTqD295er3X/G+uewSw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tcWh7mvVxsBYPlGQ76SDWlwQMMhmJvDdc2TceFhV4Lf34p9bJTEseEpPmyCTLUNyA
 F/+dX6WV6q0G/Yj6yh0cRbRVMtQxPhN2EopKYJ6ybEJaI3hHQTk3BXRdX1kwznT45v
 Bb8D/MCgslpVXvZHM0g0Fzjee9LcX1cXDLznCPHB6SUkCb5VKgkBvRHAAvfrSiBXy1
 HK6ef4eb0e7vVfWSANSNLmXVmSiRxyS3lmSzjSa1fQcihUX4KFb3R1WC8thXWuqZQB
 Ib7pHN69jP8BdVpa2AzuOPxqSXUjIv/Rx49iKq9UfO64XgPt5QHgq5Vzil8vzWlXJ0
 HtPgLQ6z9J0zQ==
Date: Thu, 12 Oct 2023 17:06:16 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20231012150616.n6gpovgb6qsg5d7e@zenone.zhora.eu>
References: <20231010084455.1718830-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231010084455.1718830-1-alain.volmat@foss.st.com>
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] i2c: stm32f7: Fix PEC handling in case
 of SMBUS transfers
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

Hi Alain,

On Tue, Oct 10, 2023 at 10:44:54AM +0200, Alain Volmat wrote:
> In case of SMBUS byte read with PEC enabled, the whole transfer
> is split into two commands.  A first write command, followed by
> a read command.  The write command does not have any PEC byte
> and a PEC byte is appended at the end of the read command.
> (cf Read byte protocol with PEC in SMBUS specification)
> 
> Within the STM32 I2C controller, handling (either sending
> or receiving) of the PEC byte is done via the PECBYTE bit in
> register CR2.
> 
> Currently, the PECBYTE is set at the beginning of a transfer,
> which lead to sending a PEC byte at the end of the write command
> (hence losing the real last byte), and also does not check the
> PEC byte received during the read command.
> 
> This patch corrects the function stm32f7_i2c_smbus_xfer_msg
> in order to only set the PECBYTE during the read command.

Thanks for improving the log.

> Fixes: 9e48155f6bfe ("i2c: i2c-stm32f7: Add initial SMBus protocols support")
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

As this is a fix you should have also included and Cc'ed:

Cc: <stable@vger.kernel.org> # v4.18+

No need to resend.

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
