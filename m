Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE2A683EC
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jul 2019 09:14:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5B7EC6C835
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jul 2019 07:14:26 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A846D34558
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 02:20:34 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=alex.shi@linux.alibaba.com; NM=1;
 PH=DS; RN=21; SR=0; TI=SMTPD_---0TWfJjL-_1562898031; 
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com
 fp:SMTPD_---0TWfJjL-_1562898031) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 12 Jul 2019 10:20:31 +0800
From: Alex Shi <alex.shi@linux.alibaba.com>
To: linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Date: Fri, 12 Jul 2019 10:20:09 +0800
Message-Id: <20190712022018.27989-3-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
In-Reply-To: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
References: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jul 2019 07:14:23 +0000
Cc: Tony Luck <tony.luck@intel.com>, linux-s390@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-kernel@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, linux-mips@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, Alex Shi <alex.shi@linux.alibaba.com>,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 03/12] Documentation/ia64: repointer docs to
	Documentation/arch/ia64
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

Since we move 'ia64' docs to Documentation/arch/ia64 dir,
redirect the doc pointer to them.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-ia64@vger.kernel.org
---
 MAINTAINERS             | 2 +-
 arch/ia64/kernel/efi.c  | 2 +-
 arch/ia64/kernel/fsys.S | 2 +-
 arch/ia64/mm/ioremap.c  | 2 +-
 arch/ia64/pci/pci.c     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c21d5464c86f..583c35cba7bc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14286,7 +14286,7 @@ SGI SN-IA64 (Altix) SERIAL CONSOLE DRIVER
 M:	Pat Gefre <pfg@sgi.com>
 L:	linux-ia64@vger.kernel.org
 S:	Supported
-F:	Documentation/ia64/serial.txt
+F:	Documentation/arch/ia64/serial.txt
 F:	drivers/tty/serial/ioc?_serial.c
 F:	include/linux/ioc?.h
 
diff --git a/arch/ia64/kernel/efi.c b/arch/ia64/kernel/efi.c
index 8f106638913c..02cdc38d15e8 100644
--- a/arch/ia64/kernel/efi.c
+++ b/arch/ia64/kernel/efi.c
@@ -852,7 +852,7 @@ valid_phys_addr_range (phys_addr_t phys_addr, unsigned long size)
 	 * /dev/mem reads and writes use copy_to_user(), which implicitly
 	 * uses a granule-sized kernel identity mapping.  It's really
 	 * only safe to do this for regions in kern_memmap.  For more
-	 * details, see Documentation/ia64/aliasing.txt.
+	 * details, see Documentation/arch/ia64/aliasing.txt.
 	 */
 	attr = kern_mem_attribute(phys_addr, size);
 	if (attr & EFI_MEMORY_WB || attr & EFI_MEMORY_UC)
diff --git a/arch/ia64/kernel/fsys.S b/arch/ia64/kernel/fsys.S
index d80c99a5f55d..b493ca74890a 100644
--- a/arch/ia64/kernel/fsys.S
+++ b/arch/ia64/kernel/fsys.S
@@ -28,7 +28,7 @@
 #include <asm/native/inst.h>
 
 /*
- * See Documentation/ia64/fsys.txt for details on fsyscalls.
+ * See Documentation/arch/ia64/fsys.txt for details on fsyscalls.
  *
  * On entry to an fsyscall handler:
  *   r10	= 0 (i.e., defaults to "successful syscall return")
diff --git a/arch/ia64/mm/ioremap.c b/arch/ia64/mm/ioremap.c
index 5e3e7b1fdac5..989cc4df9087 100644
--- a/arch/ia64/mm/ioremap.c
+++ b/arch/ia64/mm/ioremap.c
@@ -42,7 +42,7 @@ ioremap (unsigned long phys_addr, unsigned long size)
 	/*
 	 * For things in kern_memmap, we must use the same attribute
 	 * as the rest of the kernel.  For more details, see
-	 * Documentation/ia64/aliasing.txt.
+	 * Documentation/arch/ia64/aliasing.txt.
 	 */
 	attr = kern_mem_attribute(phys_addr, size);
 	if (attr & EFI_MEMORY_WB)
diff --git a/arch/ia64/pci/pci.c b/arch/ia64/pci/pci.c
index e308196c2229..6ba87b70e30c 100644
--- a/arch/ia64/pci/pci.c
+++ b/arch/ia64/pci/pci.c
@@ -450,7 +450,7 @@ pci_mmap_legacy_page_range(struct pci_bus *bus, struct vm_area_struct *vma,
 		return -ENOSYS;
 
 	/*
-	 * Avoid attribute aliasing.  See Documentation/ia64/aliasing.txt
+	 * Avoid attribute aliasing.  See Documentation/arch/ia64/aliasing.txt
 	 * for more details.
 	 */
 	if (!valid_mmap_phys_addr_range(vma->vm_pgoff, size))
-- 
2.19.1.856.g8858448bb

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
