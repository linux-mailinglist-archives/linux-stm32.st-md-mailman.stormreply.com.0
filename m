Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0542E41EF
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Dec 2020 16:15:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4795CC5717E;
	Mon, 28 Dec 2020 15:15:54 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA051C56638
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Dec 2020 15:15:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D08C207A1;
 Mon, 28 Dec 2020 15:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1609168550;
 bh=iwZ8EackymjR876ZEz27R3Tkb8qshewzfpykT+9JELg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JIvuw/dx19QhTocOBgPlp+bGu7lGnk1BQdPFn1B9D43cL5O/ZOOcBkG9awoVQEovH
 5IU55h3Zy0ZUHjGXPdRr0ViOg0RAgqmuUzEtjZcnaHjUv5YlT2aodJxBSQ3YnbC+lb
 pwBI8hWmYhOKHoKX4f52JLkOAAvJU8+LURa8fRds=
Date: Mon, 28 Dec 2020 16:17:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Erwan Le Ray <erwan.leray@foss.st.com>
Message-ID: <X+n297h2+zlhXKGV@kroah.com>
References: <20201218190020.1572-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201218190020.1572-1-erwan.leray@foss.st.com>
Cc: devicetree@vger.kernel.org, Valentin Caron <valentin.caron@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/7] STM32 uart cleanup and improvements
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

On Fri, Dec 18, 2020 at 08:00:11PM +0100, Erwan Le Ray wrote:
> This series brings various fixes, cleanups and improvements to stm32-usart
> driver.

This patch series does not apply to 5.11-rc1.

Please fix up and resend.

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
