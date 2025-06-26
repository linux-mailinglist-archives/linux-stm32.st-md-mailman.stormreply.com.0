Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA50AEAFE2
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Jun 2025 09:13:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B3CDC3089F;
	Fri, 27 Jun 2025 07:13:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE5ABC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jun 2025 20:55:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7DFC05C555A;
 Thu, 26 Jun 2025 20:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2BDC4CEEB;
 Thu, 26 Jun 2025 20:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750971323;
 bh=hLlzonJAvNms9VG34BSVk9UF0cfYYAcLzKIDWMr15GY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HBjC28nNB+FQqzQqdq3y1XK41BqrcL25ES1u4oYjPVI7GTgB9BhF3Lq7KWZLOwt4g
 TqCtGs3icQjmKKYk5VxgNmY1X+W34f4Jx4x96dB2ZDdP2dlMkRyLH6jfy0ZSdzTQh2
 pjZGkdA5yul1P5FHh2b21af1hqz5fZRb21TaMnq8+g3cmsR9ehUpoJZS4V8k2rl5gO
 IJ2JQEvx2gOni2azjZVh+zrdSpxC3yNGiI79jCtlpD4aEhL7QX1ItVkcXOSH1GIpFD
 HxjYYOXV67WTcpQtf5+h9s/JPGDUOQwc/56IAhn0KKcr5YY3eca40aIOS01WLkhlsS
 rX8eBRwoyqqzw==
Date: Thu, 26 Jun 2025 22:55:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: long.yunjian@zte.com.cn
Message-ID: <tfj32n5ex5ss4lj52oglc6rnj5bvwxhgabcc5xe4w2nreehgsv@j2dh3bcsov5q>
References: <20250623203144007kQF7E1Bhy5PJl-Ph3u3Ou@zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250623203144007kQF7E1Bhy5PJl-Ph3u3Ou@zte.com.cn>
X-Mailman-Approved-At: Fri, 27 Jun 2025 07:13:12 +0000
Cc: linux-kernel@vger.kernel.org, fang.yumeng@zte.com.cn, xu.lifeng1@zte.com.cn,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 ouyang.maochun@zte.com.cn, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, mou.yi@zte.com.cn
Subject: Re: [Linux-stm32] PATCH] i2c: stm32f7: Use str_on_off() helper
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

Hi Yumeng,

On Mon, Jun 23, 2025 at 08:31:44PM +0800, long.yunjian@zte.com.cn wrote:
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
> 
> Remove hard-coded strings by using the str_on_off() helper.
> 
> Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>

merged to i2c/i2c-host.

Thanks,
Andi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
