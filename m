Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D0395B1FA
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Aug 2024 11:42:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 332B6C6DD9D;
	Thu, 22 Aug 2024 09:42:54 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D844C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 09:42:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 098C420005;
 Thu, 22 Aug 2024 09:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724319766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oLYel8MERsORw87KG40ZczmgE+PRQ3IJYM7INT7rTyo=;
 b=glrNT2RDuY8jBpkmsN+su8jt0vQ/IVHPXE8hnhq9Z5C7PM5Ni2gIFHr/M5ohGOyyeIDxk8
 JQXb0f3r6eCJfD2Oz8o0+0D6Sw2dwlCVOzlVqbuyZ/W09foeRt9EEl0RtRts2t0ZXhe4Ib
 wmowORp3s4ESDpsW74uwpQDDLsxRmHxcJED4hXNLdFyuuCr7mnk5ny9x2Wi3pjHO9Yd7B+
 jwjkVM2k9i8QYoVOdS5iaEpERhXeExgi5fj4lonxkJoBiV9q0Bz5DdI0JhVXmCtv+UMaOn
 +vXB0tts/wDyJjx/kys7vmDUtt60jtX3GzWThAJucbPdirjiGOtot9U/SyW1CQ==
Date: Thu, 22 Aug 2024 11:42:42 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20240822114242.112dda9b@fedora-3.home>
In-Reply-To: <20240822084733.1599295-8-frank.li@vivo.com>
References: <20240822084733.1599295-1-frank.li@vivo.com>
 <20240822084733.1599295-8-frank.li@vivo.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: andrew@lunn.ch, marcin.s.wojtas@gmail.com, kees@kernel.org,
 linus.walleij@linaro.org, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, f.fainelli@gmail.com,
 linux@armlinux.org.uk, hkallweit1@gmail.com, joabreu@synopsys.com,
 u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com, kuba@kernel.org,
 pabeni@redhat.com, clement.leger@bootlin.com, mcoquelin.stm32@gmail.com,
 ulli.kroll@googlemail.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, horms@kernel.org, justinstitt@google.com,
 olteanv@gmail.com, davem@davemloft.net, shannon.nelson@amd.com
Subject: Re: [Linux-stm32] [net-next 7/9] net: ethernet: marvell: mvneta:
 Convert to devm_clk_get_enabled()
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

Hi,

This looks good to me,

On Thu, 22 Aug 2024 02:47:31 -0600
Yangtao Li <frank.li@vivo.com> wrote:

> Convert devm_clk_get(), clk_prepare_enable() to a single
> call to devm_clk_get_enabled(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
