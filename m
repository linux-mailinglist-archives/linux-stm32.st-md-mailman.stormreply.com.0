Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FF450A1F9
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Apr 2022 16:18:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66BE6C60496;
	Thu, 21 Apr 2022 14:18:24 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F82BC60467
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Apr 2022 14:18:23 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3078383DC8;
 Thu, 21 Apr 2022 16:18:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650550702;
 bh=IvZk+E5qcIJ81RWEfDeREOKT03sif/v0IElp3pJxnv0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MvUKPM5vsjAvNsnvONvy2oQVG78SOasFvOQLeSPNhcJXX9b85N3lHW/S+iHTDNxdW
 4/u7eCbmmJDL0u0UB/XZcy51uLHMARYWelOpiwkLAHZ/jiK0qh31uaJoMJe8wunN8M
 QQXIxB//plUsk75whqHHb3osh6QWq492cSeeHoJev3yZSHyCqBJcsyijOI/Pdmu53C
 iDkxgV/wLxOgN9BLc4inigqupr1ymWp9vji9iWhtB8G0GORWtNuM4nAuCUJ7H2Rk2U
 Uc3M/IkE8L0MEq6UsPNZ2Y7lfz2cX5VKES33CS5oxF/HLg43rmUCrFeXU1WIf2Fu6D
 03uzmgptVNZ2g==
Message-ID: <a0973f7c-63f9-6d08-546a-b204a6607070@denx.de>
Date: Thu, 21 Apr 2022 16:18:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>
References: <20220415215550.498381-1-marex@denx.de>
 <87pmlhidmn.wl-maz@kernel.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <87pmlhidmn.wl-maz@kernel.org>
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC][PATCH] irqchip/stm32: Retrigger hierarchy
 for LEVEL triggered IRQs in tasklet
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 4/16/22 11:25, Marc Zyngier wrote:

[...]

This patch is superseded by:

[PATCH] irqchip/stm32: Keep pinctrl block clock enabled when LEVEL IRQ 
requested
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
