Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D902338720
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Mar 2021 09:15:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37207C5718B;
	Fri, 12 Mar 2021 08:15:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DF30C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 08:15:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E511964F24;
 Fri, 12 Mar 2021 08:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1615536946;
 bh=pGOkfq4PO14DvGqEJeNzFWg1lPYSGCHDiyFuwWF38ew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1DHu3ktO5sP3m9DLEfAyTWhET34y3e8n1W+VXx0TEQiKvp2eb6QEeYIRseQTe/e6s
 Z9DCjiOORTqwKkDubqHsgXIuOf9SkbQRZLmKWWA5VxqQGwMq8hHaeWqb+d3OhBEb+3
 yeCG0npTLkYLSAEpDWee16MOo3X6tlishaqdE900=
Date: Fri, 12 Mar 2021 09:15:44 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Devera <devik@eaxlabs.cz>
Message-ID: <YEsjMJae3cGOdyjG@kroah.com>
References: <20210308192040.GA2807217@robh.at.kernel.org>
 <20210311215153.676-1-devik@eaxlabs.cz>
 <20210311215153.676-2-devik@eaxlabs.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210311215153.676-2-devik@eaxlabs.cz>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Le Ray <erwan.leray@st.com>
Subject: Re: [Linux-stm32] [PATCH v5 2/2] tty/serial: Add rx-tx-swap OF
 option to stm32-usart
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

On Thu, Mar 11, 2021 at 10:51:53PM +0100, Martin Devera wrote:
> STM32 F7/H7 usarts supports RX & TX pin swapping.
> Add option to turn it on.
> Tested on STM32MP157.
> 
> Signed-off-by: Martin Devera <devik@eaxlabs.cz>
> Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  drivers/tty/serial/stm32-usart.c | 11 ++++++++++-
>  drivers/tty/serial/stm32-usart.h |  4 ++++
>  2 files changed, 14 insertions(+), 1 deletion(-)

What changed from v4-v1 on this patch series?  That needs to go below
the --- line as documented.

Please fix up and send v6.

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
