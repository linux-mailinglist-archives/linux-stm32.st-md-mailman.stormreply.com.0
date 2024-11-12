Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D35139C54BF
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Nov 2024 11:50:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EF96C78F7F;
	Tue, 12 Nov 2024 10:50:15 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 091BAC78F77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 10:50:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37DEC1BF205;
 Tue, 12 Nov 2024 10:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731408613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xkaaHxYMcgWp/Jayi5yY0YVWgrdbJQW2Bo/aXyuAcTM=;
 b=isDiJkf0oDX77LXbJdSdCzRBNxcVXYU8Eai4pp6HN/z63vhnavWl1UtE70ItXhyv7QDcXF
 Hgo8EJb7GPFkqIdTH9q/pUSAacJc7nfeAzL2kdSlKlv/Iy0k0uih6Dw0d+aJVBQ4QBW+16
 UTjWOTeDMrFkVK1WXoIcFnZlfsDpSZDRaqIF0Ip1YFVNWBhmiS6udn0QDmXrDY/mqt9kAU
 rReUKiWoFRLHv461lr7igdYCGG8/l1RDYhXE/IrLkZYhweOB2kEZvjgOVLsy8nhlPWOnGH
 W4YleSe/ON9aFboToWLe5yXSTIPpSoglbRTZRjlXLyQSa5EBspMWShEGQeYvVA==
Date: Tue, 12 Nov 2024 11:50:09 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Paolo Abeni <pabeni@redhat.com>
Message-ID: <20241112115009.028b8724@fedora.home>
In-Reply-To: <1b335330-900e-4620-8aaf-a27424f44321@redhat.com>
References: <20241106090331.56519-1-maxime.chevallier@bootlin.com>
 <20241106090331.56519-5-maxime.chevallier@bootlin.com>
 <20241111161205.25c53c62@kernel.org>
 <1b335330-900e-4620-8aaf-a27424f44321@redhat.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 4/9] net: stmmac: Introduce
 dwmac1000 ptp_clock_info and operations
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

Hello Jakub, Paolo,

On Tue, 12 Nov 2024 10:28:21 +0100
Paolo Abeni <pabeni@redhat.com> wrote:

> On 11/12/24 01:12, Jakub Kicinski wrote:
> > On Wed,  6 Nov 2024 10:03:25 +0100 Maxime Chevallier wrote:  
> >> +		mutex_unlock(&priv->aux_ts_lock);
> >> +
> >> +		/* wait for auxts fifo clear to finish */
> >> +		ret = readl_poll_timeout(ptpaddr + PTP_TCR, tcr_val,
> >> +					 !(tcr_val & GMAC_PTP_TCR_ATSFC),
> >> +					 10, 10000);  
> > 
> > Is there a good reason to wait for the flush to complete outside of 
> > the mutex?   
> 
> Indeed looking at other `ptpaddr` access use-case, it looks like the
> mutex protects both read and write accesses.
> 
> @Maxime: is the above intentional? looks race-prone

You're right, this is racy... It wasn't intentionnal, it's actually the
same logic as dwmac4 uses so looks like dwmac4 is also incorrect in
that regard.

I'll send a v4 with that change, and a fix for dwmac4 along the way
then.

Thanks for spotting this,

Maxime

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
