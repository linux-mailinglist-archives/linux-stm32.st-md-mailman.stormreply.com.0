Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF79D970DE1
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Sep 2024 08:30:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45C5DC7801F;
	Mon,  9 Sep 2024 06:30:42 +0000 (UTC)
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2328CC78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2024 08:19:38 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id EA03A40E0284; 
 Thu,  5 Sep 2024 08:19:36 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id j-7o-7WItxvG; Thu,  5 Sep 2024 08:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1725524372; bh=R5dGDsP5UUAqve48fbetJtWj/XRQVM4kjtwcRHxLMAQ=;
 h=Date:From:To:Cc:Subject:From;
 b=YI0oukfIcBgEqX45/5eMWLqZrS3JiUd4miyhCLXBj5TzeHrH66qLAP4+Qd+5mRNBP
 85oxAJO4MrFF1i5si0nCbjH/YhagZQYcGj97gJsHSNcw44iRLpyDzqhMt8QC/p/ZTM
 J7rCC4CZ7lo7Ejeu/G5nMPzSupQHQojfS4skVYNXA/BuHCOyY4TF1rQ9VamQwR4hqa
 NClV6N5oKL5UiKycbIkz9lv6rlNgIsa1RkWy15W8e8ZZeLnl5HSJdGgqP0VX3SsJZA
 XkpelkbTyMTfU5ZJagmE/T6+rQyIptw+nJy2bX4hLT1iva1ouAY28XGLwqDUO+a8Bb
 jS4fFCa4CskATy1EJenpNXZfAm7AfInhMv/wHlLzACOy++IuVv6mxAD6xsT3Bagc7g
 1mSKV/eSFpXQCrX1Vi/idqn9/7KhaiML5dE4emN0G8/fiP2F5spPINCs8SOzqU1dP4
 h5QaLfZNc/9nTbf3TEsExuPcIpsEivDY6BGufLdtttcaz1VD3tQiFzNXCUXdaS8RDH
 ImBkjTArDnHiKbynZKTQXEhx96onu6Y2/VYOmyTzPXI0T2ywf95rIfUsVMfr267UYo
 OrJcSsCvRPTWiY/I1eZOG2cJ93dMJc+azmqaK65c5rZ8vXzUcSus6yHQ9FPyqQdSdP
 iPO8kZ9XMo1/vJSkpcH0tzbs=
Received: from zn.tnic (p5de8e8eb.dip0.t-ipconnect.de [93.232.232.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A61CF40E0275;
 Thu,  5 Sep 2024 08:19:18 +0000 (UTC)
Date: Thu, 5 Sep 2024 10:19:12 +0200
From: Borislav Petkov <bp@alien8.de>
To: linux-stm32@st-md-mailman.stormreply.com
Message-ID: <20240905081902.GAZtlpdlQp5XOm5XtO@fat_crate.local>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 09 Sep 2024 06:30:41 +0000
Cc: dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] dw_mipi_dsi-stm.c:(.text+0x8db9a3): undefined
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

Hi all,

this fires in my randbuilds here:

vmlinux.o: warning: objtool: adis16400_write_raw() falls through to next function adis16400_show_serial_number()
ld: vmlinux.o: in function `dw_mipi_dsi_stm_remove':
dw_mipi_dsi-stm.c:(.text+0x8db9a3): undefined reference to `clk_hw_unregister'
ld: vmlinux.o: in function `dw_mipi_dsi_clk_register':
dw_mipi_dsi-stm.c:(.text+0x8db9f5): undefined reference to `clk_hw_register'
ld: vmlinux.o: in function `lvds_remove':
lvds.c:(.text+0x8dc605): undefined reference to `clk_hw_unregister'
make[2]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 1
make[1]: *** [/home/amd/bpetkov/kernel/linux/Makefile:1156: vmlinux] Error 2
make: *** [Makefile:224: __sub-make] Error 2

is there a fix somewhere?

People love to do

	depends on ... COMPILE_TEST

but then if no one takes care of it in time:

https://lore.kernel.org/oe-kbuild-all/202407212000.rpDH64jP-lkp@intel.com

that COMPILE_TEST thing is forcing me to simply blacklist it and is not really
helping.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
