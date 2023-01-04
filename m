Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B3B65CCCF
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Jan 2023 07:10:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDFDBC6905D;
	Wed,  4 Jan 2023 06:10:53 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E886C03FE0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Jan 2023 06:10:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 19E5AB811AF;
 Wed,  4 Jan 2023 06:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BBA0C433EF;
 Wed,  4 Jan 2023 06:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1672812650;
 bh=Kbcq+uYhLv3BKlIhOzG7lEXrgxIBAdAfwWFOGqxXWm8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b5S+O6YP0yDEIft+xKaW50DZCIo+jNahqTvXBdoYJ6g41XJ7cH7SU845rNE1EedGM
 ZbNTrWPn2aRGXwsiJFB8URB290GK3nCtoC2jA3lJWehfGYHgqu2gQ/ZmQjgD/D1QUM
 g7rCUwCj+EE08VHgq2+3FPk+b4ZSd18mgxyIJlo0=
Date: Wed, 4 Jan 2023 07:10:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Message-ID: <Y7UYaDL82NqFu7vK@kroah.com>
References: <20221222100504.68247-1-gatien.chevallier@foss.st.com>
 <Y6SIOpsxNdezKCTc@kroah.com>
 <98aa92e9-9ac0-0fe4-a140-ac478e261f94@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <98aa92e9-9ac0-0fe4-a140-ac478e261f94@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Oleksii_Moisieiev@epam.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH v2 0/7] Introduce STM32 system bus
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

On Tue, Jan 03, 2023 at 10:45:15AM +0100, Gatien CHEVALLIER wrote:
> Hello Greg,
> 
> I've put the "RFC" tag on the the patch set as it is based on bindings that
> are currently under review. It has been submitted with the idea to support
> the bindings proposed by Oleksii. Apart from this and the comments made by
> Krzysztof, there is indeed no more "work" planned on this change.
> 
> Should the "RFC" tag be omitted for the next version?

If you feel it is ready to be merged, yes, then please remove it,
otherwise it's obviously not ready and will not be merged :)

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
