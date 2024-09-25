Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EF49867F3
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Sep 2024 23:06:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A516C6C841;
	Wed, 25 Sep 2024 21:06:53 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0ED7C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 21:06:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0C0F7A4488D;
 Wed, 25 Sep 2024 21:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07B6C4CEC3;
 Wed, 25 Sep 2024 21:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727298402;
 bh=ov11DCW5fbfEkeXbc3N4tknYqvWLCe6U3JzkfrFWpkU=;
 h=From:To:Cc:Subject:Date:From;
 b=Ty4V85soYpqEM8sUDM/PovDueJXmKYgUPZM3jqIVSWscNGO92pmJEBZ1JtV6lKwJu
 /VNXVBsrBStlI+XfgvZYiro5DKkIxm1ox9IPT+JTFsrByJ7QQm6NjYBoXUBQxPCXLS
 dj5bSZq++t5pObMmZdgm5I9UMfcwcKwUA1wBFgahGj4alaWxqRSwAUTR4/2d034XBs
 WfH5LoTr3+nivVv/e+fjWSSrGa4mL16ZuTIMzAQvCXJOw//669VS4xztlBK2UwzGsJ
 AJOAs+o3b2GwT7zi/iHnQ4PcfCPCbxIqmRkrUIFZPDrXPvg7ncTbC16FbQwGAeeU/r
 TTlUE0B/JK86A==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mm@kvack.org
Date: Wed, 25 Sep 2024 21:06:10 +0000
Message-Id: <20240925210615.2572360-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>,
 Andreas Larsson <andreas@gaisler.com>, Kees Cook <kees@kernel.org>,
 linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 David Hildenbrand <david@redhat.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Christoph Hellwig <hch@lst.de>,
 Matt Turner <mattst88@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Vlastimil Babka <vbabka@suse.cz>,
 Christian Brauner <brauner@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Subject: [Linux-stm32] [PATCH 0/5] asm-generic: clean up asm/mman.h
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

From: Arnd Bergmann <arnd@arndb.de>

While thinking about the changes to linux/mman.h in
https://lore.kernel.org/all/20240923141943.133551-1-vincenzo.frascino@arm.com/
I ended up trying to clean up the duplicate definitions in order to
better see what's in there, and then I found a clash between two MAP_* flags.

Here is my current state, lightly tested. Please have a look at
the last patch in particular.

     Arnd

Arnd Bergmann (5):
  asm-generic: cosmetic updates to uapi/asm/mman.h
  asm-generic: move MAP_* flags from mman-common.h to mman.h
  asm-generic: use asm-generic/mman-common.h on mips and xtensa
  asm-generic: use asm-generic/mman-common.h on parisc and alpha
  [RFC] mm: Remove MAP_UNINITIALIZED support

 Documentation/admin-guide/mm/nommu-mmap.rst | 10 +--
 arch/alpha/include/uapi/asm/mman.h          | 93 ++++++-------------
 arch/mips/include/uapi/asm/mman.h           | 95 +++-----------------
 arch/parisc/include/uapi/asm/mman.h         | 79 ++++-------------
 arch/powerpc/include/uapi/asm/mman.h        | 11 +++
 arch/sh/configs/rsk7264_defconfig           |  1 -
 arch/sparc/include/uapi/asm/mman.h          | 12 +++
 arch/xtensa/include/uapi/asm/mman.h         | 98 +++------------------
 fs/binfmt_elf_fdpic.c                       |  3 +-
 include/linux/mman.h                        |  4 -
 include/uapi/asm-generic/mman-common.h      | 31 +++----
 include/uapi/asm-generic/mman.h             | 17 ++++
 include/uapi/linux/mman.h                   |  5 ++
 mm/Kconfig                                  | 22 -----
 mm/nommu.c                                  |  4 +-
 15 files changed, 125 insertions(+), 360 deletions(-)

-- 
2.39.2

Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Damien Le Moal <dlemoal@kernel.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Kees Cook <kees@kernel.org>
Cc: Liam R. Howlett <Liam.Howlett@oracle.com> 
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org
Cc: linux-arch@vger.kernel.org

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
