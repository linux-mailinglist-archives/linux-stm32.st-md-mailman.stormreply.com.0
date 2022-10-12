Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8AC5FCE18
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Oct 2022 00:05:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D524C640F3;
	Wed, 12 Oct 2022 22:05:50 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22EBBC03FD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 22:05:49 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5D9BF240006;
 Wed, 12 Oct 2022 22:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1665612348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=egg7PTPd+Td6H4icK4xfYZXNoHe/oN9/MQiilWB/82Y=;
 b=PcAWNdTbQfr+jTBdWlnVxZQF29L8PCjb6BR7rIRK6Ogz0ZdKaxwv30E2Z1sGLtRO2FwC4m
 kWvY4mBy5ZIaN9MwYVd0K47jI3KIuZ4MOafAoijimtkLQiz8kx9MSQ9EVhw8kaA+N3ujCo
 cgXZhH2iC1TRqKOzr/51+s/6su9qqVa99L5ORz10EH3gcU/Nj00FlPfvCWVSVoGGs6ffi/
 mbnmg6gnZ3xSHToV0Z3ICUraiIXy5pvCADHWpNgA0oH7zUKagPRM/eCLX1DtaiWHE4Kzrq
 qSRYJ/X+4YWBDZCJ5PKMpFLn+TbplpzrJaDMSDrcqFWFjLVghLC4gvKKUVVtMg==
Date: Thu, 13 Oct 2022 00:05:45 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wsa@kernel.org, akpm@linux-foundation.org, a.zummo@towertech.it,
 Lin Yujun <linyujun809@huawei.com>, wim@iguana.be,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com
Message-ID: <166561232122.1050426.7852925848421780044.b4-ty@bootlin.com>
References: <20220915065253.43668-1-linyujun809@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220915065253.43668-1-linyujun809@huawei.com>
Cc: linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH -next v3] rtc: stmp3xxx: Add failure
 handling for stmp3xxx_wdt_register()
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

On Thu, 15 Sep 2022 14:52:53 +0800, Lin Yujun wrote:
> Use platform_device_put() to free platform device before print
> error message when platform_device_add() fails to run.
> 
> 

Applied, thanks!

[1/1] rtc: stmp3xxx: Add failure handling for stmp3xxx_wdt_register()
      commit: 0759011157b0d666b02b03b986d3de005d84027e

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
