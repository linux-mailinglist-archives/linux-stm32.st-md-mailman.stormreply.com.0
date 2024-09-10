Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0849735E9
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Sep 2024 13:07:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F8EEC78010;
	Tue, 10 Sep 2024 11:07:15 +0000 (UTC)
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90606C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2024 11:07:07 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8128C40E0285; 
 Tue, 10 Sep 2024 11:07:06 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id qrGWVqrTr6ZO; Tue, 10 Sep 2024 11:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1725966422; bh=q7/7i/hleCHmeIelV+J/jkKAUyMAdVAI7TwF0D/iof4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h1euPbz/eINJg26bo1VdAuCGL3YtT4WXke/s/QTbdUBNuaw4tN4CZ2Tmwg7p4jGrx
 XOrZ1Xbpw3qhbn77G5Igcv5fYT+S+6uiE5sTP8nx+qOoSK22Y9s1QGQhszVhQTlqvZ
 XeWOGIsqIMyMmgKYujxQO/9aerou17O6fY6rmGm6fQEm81kDLJ8ub8rUWE/lR8tYiu
 qsuFZQ4h4iVZKFTgoPnTnYfPQQajXawwBusQNj+z9DEprwXor4oNiT5trlmEzjVqXO
 AJfJQu5usxw27FxDDFy2XRTRQSfguyIOC3VK+g1jkrGnKkvo3mud8NlPuLkkutJ6yN
 H183fcPIn54bti3UYfOsqDvQXv21LJsuvhtySTvjhXO/vCc6T9ypjtTf79gjYbvea4
 WN41/pCIA+Sutaigak2gTF7//QjGVuP8D35AuD2TyJ83/la7RGt1MhawAV7paR2f6Z
 wlYaCF8+xUWqsXEKTcJ6+e9Dxae+rMN79LkY17PpWBCZG9TjqdXa5LeRLsLqobHXYQ
 S/DZjwPJsC/1cLTT9SQ3CGgqs45SE7Gd/c4KKJhibWXGjCd4MJL17ovU5O0pj6nzs1
 GXilzgnSdSObcBPWsf2F5ugfx+owoNuu6uxoj8iQfRgKyEU1rdJHfArG4Y1zDxFeJQ
 rllAmw1rHXWh9frbC1OqTDQo=
Received: from zn.tnic (p5de8e8eb.dip0.t-ipconnect.de [93.232.232.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C421740E0081;
 Tue, 10 Sep 2024 11:06:47 +0000 (UTC)
Date: Tue, 10 Sep 2024 13:06:42 +0200
From: Borislav Petkov <bp@alien8.de>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <20240910110642.GAZuAoQnZqcr98x5en@fat_crate.local>
References: <20240905081902.GAZtlpdlQp5XOm5XtO@fat_crate.local>
 <544a633e-de53-493d-9c29-de8ff52630da@foss.st.com>
 <20240909084506.GBZt61kqqGVUTqjKc4@fat_crate.local>
 <0e9018d0-c49f-4dac-aa0f-b05504f9c6f6@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0e9018d0-c49f-4dac-aa0f-b05504f9c6f6@foss.st.com>
Cc: dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] dw_mipi_dsi-stm.c:(.text+0x8db9a3): undefined
 reference to `clk_hw_unregister'
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

On Tue, Sep 10, 2024 at 12:48:49PM +0200, Raphael Gallais-Pou wrote:
> Unless I am mistaken, the link you provided refers to a PowerPC linker error:

Ah, the kernel test robot is doing other architectures now too, sorry about
that. In any case, I am triggering it on x86 too.

> What do you mean by 'sending it to Linus' ? If you meant to do a pull request,
> then no. This patch is already in the drm-misc tree, which means it will keep
> its usual pace of merging with the rest of the drm-misc tree.

That's ok - I'll simply disable CONFIG_DRM_STM from building in my randconfigs
for the time being.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
