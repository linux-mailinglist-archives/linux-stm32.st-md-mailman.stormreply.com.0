Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E3D8CB127
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2024 17:24:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC012C6B47A;
	Tue, 21 May 2024 15:24:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AC5ECFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2024 15:24:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AFF1560E76;
 Tue, 21 May 2024 15:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08FF1C2BD11;
 Tue, 21 May 2024 15:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1716305079;
 bh=LT2IUGSarwkRVytFH/RJkbdqTKdlRHx7kjBBbCwkZOc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=w1lSHUlEHNdUOwtpggmkodjLPq5e6XoEd/jeTIGLtlAfkWhwgojNAbWSwSm2MoGXx
 BPRZblVE/xwREaXWcgKfJrruhZZE1XuVVN57yD/06Hwa70krn0wGvgrH9DjmwaWiwq
 U8MFpltI8aA428Idvt85wdfvGhnWEZdckYdrcX+k=
Date: Tue, 21 May 2024 17:21:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <2024052113-vanilla-expectant-5684@gregkh>
References: <20240521151109.3078775-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240521151109.3078775-1-fabrice.gasnier@foss.st.com>
Cc: heikki.krogerus@linux.intel.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] usb: ucsi: stm32: fix command completion
	handling
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

On Tue, May 21, 2024 at 05:11:09PM +0200, Fabrice Gasnier wrote:
> Sometimes errors are seen, when doing DR swap, like:
> [   24.672481] ucsi-stm32g0-i2c 0-0035: UCSI_GET_PDOS failed (-5)
> [   24.720188] ucsi-stm32g0-i2c 0-0035: ucsi_handle_connector_change:
>  GET_CONNECTOR_STATUS failed (-5)
> 
> There may be some race, which lead to read CCI, before the command complete
> flag is set, hence returning -EIO. Similar fix has been done also in
> ucsi_acpi [1].
> 
> In case of a spurious or otherwise delayed notification it is
> possible that CCI still reports the previous completion. The
> UCSI spec is aware of this and provides two completion bits in
> CCI, one for normal commands and one for acks. As acks and commands
> alternate the notification handler can determine if the completion
> bit is from the current command.
> 
> To fix this add the ACK_PENDING bit for ucsi_stm32g0 and only complete
> commands if the completion bit matches.
> 
> [1] https://lore.kernel.org/lkml/20240121204123.275441-3-lk@c--e.de/
> 
> Fixes: 72849d4fcee7 ("usb: typec: ucsi: stm32g0: add support for stm32g0 controller")
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_stm32g0.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
