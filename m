Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6199867FF
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Sep 2024 23:07:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64DB1C78006;
	Wed, 25 Sep 2024 21:07:13 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FCB8C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 21:07:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8C5C7A4489A;
 Wed, 25 Sep 2024 21:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A44A1C4CECF;
 Wed, 25 Sep 2024 21:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727298431;
 bh=9WWq9eu7cuIVH7faIexy4b1QmBlJqq/TWxw3ZIHVjt4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RFMABg80UAzlZRGWyrqfIVrpC9pf+KZ7ccnvBYINSdZOE0vEoxMWceBAliZEcMTDW
 RCpJv2VfcSBLoHeF7E0VDAWsrUKkSgwBOV+P/dVgyITQ122pl5kO5UEOgqjNQZdVfO
 h4SNxxhIeb2DH76DzE4IlhLrg0T8UQo/j9VkVlXW+oUFymIn6rtT8GPYYlUEcZu7uZ
 wqHhouBebch/JiLDf7+51e9ufJfgMu3DNhow/hM/VsMPDaC6oAMSQo6eXKF+wHEHKy
 BbipYo1sQUC+mbsQHvc97qE69iXeCHgMwZE4eDvGEVZFYu6lq2naZhA8bXu43iX0nU
 OKOKG0CyQpcrg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mm@kvack.org
Date: Wed, 25 Sep 2024 21:06:14 +0000
Message-Id: <20240925210615.2572360-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240925210615.2572360-1-arnd@kernel.org>
References: <20240925210615.2572360-1-arnd@kernel.org>
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
Subject: [Linux-stm32] [PATCH 4/5] asm-generic: use
	asm-generic/mman-common.h on parisc and alpha
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

These two architectures each have their own set of MAP_* flags, like
powerpc, mips and others do. In addition, the msync() flags are also
different, here both define the same flags but in a different order.
Finally, alpha also has a custom MADV_DONTNEED flag for madvise.

Make the generic MADV_DONTNEED and MS_* definitions conditional on
them already being defined and then include the common header
header from both architectures, to remove the bulk of the contents.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/alpha/include/uapi/asm/mman.h     | 68 +++-----------------------
 arch/parisc/include/uapi/asm/mman.h    | 66 +------------------------
 include/uapi/asm-generic/mman-common.h |  5 ++
 3 files changed, 13 insertions(+), 126 deletions(-)

diff --git a/arch/alpha/include/uapi/asm/mman.h b/arch/alpha/include/uapi/asm/mman.h
index 1f1c03c047ce..fc8b74aa3f89 100644
--- a/arch/alpha/include/uapi/asm/mman.h
+++ b/arch/alpha/include/uapi/asm/mman.h
@@ -2,18 +2,6 @@
 #ifndef __ALPHA_MMAN_H__
 #define __ALPHA_MMAN_H__
 
-#define PROT_READ	0x1		/* page can be read */
-#define PROT_WRITE	0x2		/* page can be written */
-#define PROT_EXEC	0x4		/* page can be executed */
-#ifndef PROT_SEM /* different on mips and xtensa */
-#define PROT_SEM	0x8		/* page may be used for atomic ops */
-#endif
-/*			0x10		   reserved for arch-specific use */
-/*			0x20		   reserved for arch-specific use */
-#define PROT_NONE	0x0		/* page can not be accessed */
-#define PROT_GROWSDOWN	0x01000000	/* mprotect flag: extend change to start of growsdown vma */
-#define PROT_GROWSUP	0x02000000	/* mprotect flag: extend change to end of growsup vma */
-
 /* 0x01 - 0x03 are defined in linux/mman.h */
 #define MAP_TYPE	0x0f		/* Mask for type of mapping (OSF/1 is _wrong_) */
 #define MAP_FIXED	0x100		/* Interpret addr exactly */
@@ -43,62 +31,18 @@
 #define MCL_ONFAULT	32768		/* lock all pages that are faulted in */
 
 /*
- * Flags for mlock
- */
-#define MLOCK_ONFAULT	0x01		/* Lock pages in range after they are faulted in, do not prefault */
-
-/*
- * Flags for msync
+ * Flags for msync, order is different from all others
  */
 #define MS_ASYNC	1		/* sync memory asynchronously */
 #define MS_SYNC		2		/* synchronous memory sync */
 #define MS_INVALIDATE	4		/* invalidate the caches */
 
-#define MADV_NORMAL	0		/* no further special treatment */
-#define MADV_RANDOM	1		/* expect random page references */
-#define MADV_SEQUENTIAL	2		/* expect sequential page references */
-#define MADV_WILLNEED	3		/* will need these pages */
-#define MADV_DONTNEED	6		/* don't need these pages */
+/*
+ * Flags for madvise, 1 through 3 are normal
+ */
 /* originally MADV_SPACEAVAIL 5 */
+#define MADV_DONTNEED	6		/* don't need these pages */
 
-/* common parameters: try to keep these consistent across architectures */
-#define MADV_FREE	8		/* free pages only if memory pressure */
-#define MADV_REMOVE	9		/* remove these pages & resources */
-#define MADV_DONTFORK	10		/* don't inherit across fork */
-#define MADV_DOFORK	11		/* do inherit across fork */
-
-#define MADV_MERGEABLE   12		/* KSM may merge identical pages */
-#define MADV_UNMERGEABLE 13		/* KSM may not merge identical pages */
-
-#define MADV_HUGEPAGE	14		/* Worth backing with hugepages */
-#define MADV_NOHUGEPAGE	15		/* Not worth backing with hugepages */
-
-#define MADV_DONTDUMP   16		/* Explicity exclude from the core dump,
-					   overrides the coredump filter bits */
-#define MADV_DODUMP	17		/* Clear the MADV_DONTDUMP flag */
-
-#define MADV_WIPEONFORK 18		/* Zero memory on fork, child only */
-#define MADV_KEEPONFORK 19		/* Undo MADV_WIPEONFORK */
-
-#define MADV_COLD	20		/* deactivate these pages */
-#define MADV_PAGEOUT	21		/* reclaim these pages */
-
-#define MADV_POPULATE_READ	22	/* populate (prefault) page tables readable */
-#define MADV_POPULATE_WRITE	23	/* populate (prefault) page tables writable */
-
-#define MADV_DONTNEED_LOCKED	24	/* like DONTNEED, but drop locked pages too */
-
-#define MADV_COLLAPSE	25		/* Synchronous hugepage collapse */
-
-#define MADV_HWPOISON	100		/* poison a page for testing */
-#define MADV_SOFT_OFFLINE 101		/* soft offline page for testing */
-
-/* compatibility flags */
-#define MAP_FILE	0
-
-#define PKEY_DISABLE_ACCESS	0x1
-#define PKEY_DISABLE_WRITE	0x2
-#define PKEY_ACCESS_MASK	(PKEY_DISABLE_ACCESS |\
-				 PKEY_DISABLE_WRITE)
+#include <asm-generic/mman-common.h>
 
 #endif /* __ALPHA_MMAN_H__ */
diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/uapi/asm/mman.h
index 1cd5d816d4cf..3732950a5cd8 100644
--- a/arch/parisc/include/uapi/asm/mman.h
+++ b/arch/parisc/include/uapi/asm/mman.h
@@ -2,19 +2,6 @@
 #ifndef __PARISC_MMAN_H__
 #define __PARISC_MMAN_H__
 
-
-#define PROT_READ	0x1		/* page can be read */
-#define PROT_WRITE	0x2		/* page can be written */
-#define PROT_EXEC	0x4		/* page can be executed */
-#ifndef PROT_SEM /* different on mips and xtensa */
-#define PROT_SEM	0x8		/* page may be used for atomic ops */
-#endif
-/*			0x10		   reserved for arch-specific use */
-/*			0x20		   reserved for arch-specific use */
-#define PROT_NONE	0x0		/* page can not be accessed */
-#define PROT_GROWSDOWN	0x01000000	/* mprotect flag: extend change to start of growsdown vma */
-#define PROT_GROWSUP	0x02000000	/* mprotect flag: extend change to end of growsup vma */
-
 /* 0x01 - 0x03 are defined in linux/mman.h */
 #define MAP_TYPE	0x2b		/* Mask for type of mapping, includes bits 0x08 and 0x20 */
 #define MAP_FIXED	0x04		/* Interpret addr exactly */
@@ -43,61 +30,12 @@
 #define MCL_ONFAULT	4		/* lock all pages that are faulted in */
 
 /*
- * Flags for mlock
- */
-#define MLOCK_ONFAULT	0x01		/* Lock pages in range after they are faulted in, do not prefault */
-
-/*
- * Flags for msync
+ * Flags for msync, order is different from all others
  */
 #define MS_SYNC		1		/* synchronous memory sync */
 #define MS_ASYNC	2		/* sync memory asynchronously */
 #define MS_INVALIDATE	4		/* invalidate the caches */
 
-#define MADV_NORMAL	0		/* no further special treatment */
-#define MADV_RANDOM	1		/* expect random page references */
-#define MADV_SEQUENTIAL	2		/* expect sequential page references */
-#define MADV_WILLNEED	3		/* will need these pages */
-#define MADV_DONTNEED	4		/* don't need these pages */
-
-/* common parameters: try to keep these consistent across architectures */
-#define MADV_FREE	8		/* free pages only if memory pressure */
-#define MADV_REMOVE	9		/* remove these pages & resources */
-#define MADV_DONTFORK	10		/* don't inherit across fork */
-#define MADV_DOFORK	11		/* do inherit across fork */
-
-#define MADV_MERGEABLE   12		/* KSM may merge identical pages */
-#define MADV_UNMERGEABLE 13		/* KSM may not merge identical pages */
-
-#define MADV_HUGEPAGE	14		/* Worth backing with hugepages */
-#define MADV_NOHUGEPAGE	15		/* Not worth backing with hugepages */
-
-#define MADV_DONTDUMP   16		/* Explicity exclude from the core dump,
-					   overrides the coredump filter bits */
-#define MADV_DODUMP	17		/* Clear the MADV_DONTDUMP flag */
-
-#define MADV_WIPEONFORK 18		/* Zero memory on fork, child only */
-#define MADV_KEEPONFORK 19		/* Undo MADV_WIPEONFORK */
-
-#define MADV_COLD	20		/* deactivate these pages */
-#define MADV_PAGEOUT	21		/* reclaim these pages */
-
-#define MADV_POPULATE_READ	22	/* populate (prefault) page tables readable */
-#define MADV_POPULATE_WRITE	23	/* populate (prefault) page tables writable */
-
-#define MADV_DONTNEED_LOCKED	24	/* like DONTNEED, but drop locked pages too */
-
-#define MADV_COLLAPSE	25		/* Synchronous hugepage collapse */
-
-#define MADV_HWPOISON	100		/* poison a page for testing */
-#define MADV_SOFT_OFFLINE 101		/* soft offline page for testing */
-
-/* compatibility flags */
-#define MAP_FILE	0
-
-#define PKEY_DISABLE_ACCESS	0x1
-#define PKEY_DISABLE_WRITE	0x2
-#define PKEY_ACCESS_MASK	(PKEY_DISABLE_ACCESS |\
-				 PKEY_DISABLE_WRITE)
+#include <asm-generic/mman-common.h>
 
 #endif /* __PARISC_MMAN_H__ */
diff --git a/include/uapi/asm-generic/mman-common.h b/include/uapi/asm-generic/mman-common.h
index 2911dd14ef2a..81a14ed99197 100644
--- a/include/uapi/asm-generic/mman-common.h
+++ b/include/uapi/asm-generic/mman-common.h
@@ -27,15 +27,20 @@
 /*
  * Flags for msync
  */
+#ifndef MS_ASYNC /* different order on alpha and parisc */
 #define MS_ASYNC	1		/* sync memory asynchronously */
 #define MS_INVALIDATE	2		/* invalidate the caches */
 #define MS_SYNC		4		/* synchronous memory sync */
+#endif
 
 #define MADV_NORMAL	0		/* no further special treatment */
 #define MADV_RANDOM	1		/* expect random page references */
 #define MADV_SEQUENTIAL	2		/* expect sequential page references */
 #define MADV_WILLNEED	3		/* will need these pages */
+/* 4 through 6 are different on alpha */
+#ifndef MADV_DONTNEED
 #define MADV_DONTNEED	4		/* don't need these pages */
+#endif
 
 /* common parameters: try to keep these consistent across architectures */
 #define MADV_FREE	8		/* free pages only if memory pressure */
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
