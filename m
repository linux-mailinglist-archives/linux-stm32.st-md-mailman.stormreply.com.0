Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D8D34A96A
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Mar 2021 15:18:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2514C5718D;
	Fri, 26 Mar 2021 14:18:23 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 257D1C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 14:18:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6A5361A02;
 Fri, 26 Mar 2021 14:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616768300;
 bh=B2wQnGoW3sjS3jK2xpNARrCIjunm/tk41Pa8NA5DY5E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1yBm8JhuS01juL29Nf8Cm+AQNa8BlSM9LErBVnG18b9NDhG4PqA+jEt/BKX/2wYP+
 4GVy3U0Qv2VJ+gjn26jWNzva5ZiReSohVrh2kuibvEocqni/vdrXpYHs1B6C5Bdj7g
 S8UIfkLJMbEMgo6UnMd+ScTgUiSZwm4ZgyBfzs7A=
Date: Fri, 26 Mar 2021 15:18:18 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Devera <devik@eaxlabs.cz>
Message-ID: <YF3tKmzX1PtlX59x@kroah.com>
References: <1615559009.788146.2976052.nullmailer@robh.at.kernel.org>
 <20210312153702.12349-1-devik@eaxlabs.cz>
 <20210312153702.12349-2-devik@eaxlabs.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312153702.12349-2-devik@eaxlabs.cz>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Le Ray <erwan.leray@st.com>
Subject: Re: [Linux-stm32] [PATCH v7 2/2] tty/serial: Add rx-tx-swap OF
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

On Fri, Mar 12, 2021 at 04:37:02PM +0100, Martin Devera wrote:
> STM32 F7/H7 usarts supports RX & TX pin swapping.
> Add option to turn it on.
> Tested on STM32MP157.
> 
> Signed-off-by: Martin Devera <devik@eaxlabs.cz>
> Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

This does not apply to my tty-next branch at all.  Can you please rebase
this series (and keep Rob's ack of patch 1) and resend?

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
