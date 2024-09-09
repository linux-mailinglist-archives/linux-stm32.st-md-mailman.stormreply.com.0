Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 511A2971268
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Sep 2024 10:45:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 064BBC6DD72;
	Mon,  9 Sep 2024 08:45:39 +0000 (UTC)
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77C5BC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Sep 2024 08:45:32 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6193D40E0284; 
 Mon,  9 Sep 2024 08:45:31 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Smcyy78yUVRc; Mon,  9 Sep 2024 08:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1725871527; bh=cXRkoUjvWWukIVmvh78yiiN7jPJRZwpkNqUTm59HqO0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cmT4ASQKWcfjfWlXEKk+u8iG2po9B2WRedjfHPbSDnxtY20l8Cjn9kHpALbjL67yQ
 3Ev1yk4OPdnSkTO3SIfPbx++/z91dDlsD4eYvI4uprDoCIJFKJJMW3XWFsLrOzCsGV
 e7gBX9T1o4u2BpanAWGiSa8m9SsieeIiTTzj1sLiwxr8j3fxRv1q9FmxiFOLn9HNoW
 GWK2HkGXACnGX2leKTMXwagoP08GOOdgkOhqJb9StnOYG6xZQwY/r1cpoyMROQWByA
 tDImLNBJuvi5VQfow6Z/1e69Yzq+uB1vHyDsIEhemFZFkIkLEBPYXwuWmkNnAnkcOf
 PbfC/j5MkCEqD8dtwyPzDmpjYmA05nmfZsndbrsc3Jt8nCUk6MaO7xp7u54KCqeEjM
 7ZTRYT24XiODsSRR1bL8me80E5kl3l7o1E0cEGTglDnwAD71PSTrLyqWJvk0qp+9J6
 XqL+8RTdC6ZnFDRhS83wMDiAXELuAGFSCM5M8r5j8dqoOVkGdNPYxvzkN2yvlQIZq5
 k3QdRRONsbXXroNIvEW8GpS8DicMPxHcVT3+UzA6nkJ1vUmHH13vdQbtren4J9z83s
 GrJ82j8vDsX1KN5dTFuexmW95sdxTRxVLJiPanfWTo3I1plq+2neqaGPSfif2TOGj5
 nTfnCtaxVeZLChwhjDyIhZAw=
Received: from zn.tnic (p5de8e8eb.dip0.t-ipconnect.de [93.232.232.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 19C4F40E0263;
 Mon,  9 Sep 2024 08:45:13 +0000 (UTC)
Date: Mon, 9 Sep 2024 10:45:06 +0200
From: Borislav Petkov <bp@alien8.de>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <20240909084506.GBZt61kqqGVUTqjKc4@fat_crate.local>
References: <20240905081902.GAZtlpdlQp5XOm5XtO@fat_crate.local>
 <544a633e-de53-493d-9c29-de8ff52630da@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <544a633e-de53-493d-9c29-de8ff52630da@foss.st.com>
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

On Mon, Sep 09, 2024 at 08:57:57AM +0200, Raphael Gallais-Pou wrote:
> Arnd Bergmann sent a patch regarding this issue on x86 that I merged several
> weeks ago.
> 
> https://lore.kernel.org/lkml/20240719075454.3595358-1-arnd@kernel.org/
> https://lore.kernel.org/all/c3d0757a-07c0-4f83-9f06-c3ad205aa1e9@foss.st.com/

Thanks.

> Now, I'm not familiar with PowerPC architecture and toolchains, but I think
> this patch should fix your problem.  Do you have the above fixup in your
> tree ? If not please try it.

Not PowerPC - it is an x86 build. I do random config builds as part of build
testing and when a driver depends on COMPILE_TEST, it does gets built in some
.configs. So some may fail, as in this case.

So I think you should send that patch to Linus now so that such randconfig
builds do not fail anymore.

Unfortunately, I cannot test it right now because I've removed the triggering
randconfigs but when I hit it again, I'll make sure to apply yours.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
