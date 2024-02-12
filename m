Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A296C850F77
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 10:14:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B181C6C83C;
	Mon, 12 Feb 2024 09:14:48 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF625C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 09:14:47 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:47b8:b872:d87c:512])
 by laurent.telenet-ops.be with bizsmtp
 id m9En2B0011wMtyi019EnmE; Mon, 12 Feb 2024 10:14:47 +0100
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1rZSOk-000VTv-Ud;
 Mon, 12 Feb 2024 10:14:46 +0100
Date: Mon, 12 Feb 2024 10:14:46 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
In-Reply-To: <20240212090741.3249554-1-geert@linux-m68k.org>
Message-ID: <8bc564c7-a9e8-e491-6cf2-808875c2d334@linux-m68k.org>
References: <CAHk-=wg1c4Q1Ve6BG71DikHu-AEoKUUQoj1QbVdjwGQyTExqCw@mail.gmail.com>
 <20240212090741.3249554-1-geert@linux-m68k.org>
MIME-Version: 1.0
Cc: sparclinux@vger.kernel.org, netdev@vger.kernel.org,
 linux-sh@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] Build regressions/improvements in v6.8-rc4
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

On Mon, 12 Feb 2024, Geert Uytterhoeven wrote:
> JFYI, when comparing v6.8-rc4[1] to v6.8-rc3[3], the summaries are:
>  - build errors: +5/-18

   + /kisskb/src/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c: error: initializer element is not constant:  => 850:21, 845:20, 867:21, 838:20, 858:20, 849:21, 836:20, 856:20, 861:20, 863:21, 840:20, 864:21, 848:21, 855:20, 859:20, 839:20, 862:21, 846:21, 852:20, 865:21, 847:21, 854:20, 853:20, 851:21, 866:21, 844:20, 842:20, 837:20, 857:20, 860:20, 841:20, 843:20

arm64-gcc5/arm64-allmodconfig
mipsel-gcc5/mips-defconfig
powerpc-gcc5/powerpc-all{mod,yes}config
powerpc-gcc5/{ppc32,ppc64_book3e,ppc64le}_allmodconfig
sparc64-gcc5/sparc-allmodconfig

I.e. gcc5.

   + /kisskb/src/drivers/sbus/char/bbc_envctrl.c: error: no previous prototype for 'bbc_envctrl_cleanup' [-Werror=missing-prototypes]:  => 594:6
   + /kisskb/src/drivers/sbus/char/bbc_envctrl.c: error: no previous prototype for 'bbc_envctrl_init' [-Werror=missing-prototypes]:  => 566:5

sparc64-gcc12/sparc64-allmodconfig

   + {standard input}: Error: invalid operands for opcode: 935 => 940, 606
   + {standard input}: Error: missing operand: 935 => 940, 606

SH ICE crickets

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/841c35169323cd833294798e58b9bf63fa4fa1de/ (238 out of 239 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/54be6c6c5ae8e0d93a6c4641cb7528eb0b6ba478/ (238 out of 239 configs)

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
