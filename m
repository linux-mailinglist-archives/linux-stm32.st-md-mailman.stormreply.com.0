Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DCF94E710
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Aug 2024 08:46:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86633C78028;
	Mon, 12 Aug 2024 06:46:41 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEE03C712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Aug 2024 18:33:10 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7106cf5771bso2599657b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Aug 2024 11:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723314789; x=1723919589;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q4c+whqw7VCHvGEHz3FeHPPNwPTgAPKV0FJKHEoguag=;
 b=BYp2fc0uDCWaSVbYK7RZltC1NQbkuWW28p+JYbLz6Q4W9EyI6VzwziwbUC7KrlMMy1
 UnUUpP7hr/b60MLT13VMoy7b5t69cRY6gEYEMgTjCDVhqCx8orFCE/iKUajmEy1dCLSi
 K+gMaJ18V6KIJ+jpYFyxke5c/aGuyoRNmb76Yoi3AIEXPrsgEAe+Ox5rvUUSwTfsv1h4
 NrJMnAhu9bpB8MTrdl8uaPw0HS4e1hLnVZsjL15/UCVole/6F+xMnlKnAPq/prSkU+Zi
 iENRGO8Mco38ytwd/ySZYy5zilog+jiAUhVh5lMS28qRGlyAIezNO/Ea6qez5PIt087e
 seGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723314789; x=1723919589;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q4c+whqw7VCHvGEHz3FeHPPNwPTgAPKV0FJKHEoguag=;
 b=n+zcT2NTfXuHR7fso4bs1W4rmooGxLpzhzO3eH4K2yxAG7uXk2tFeSLKG88UNTd254
 omidlwmFqsMevyhn783SSi3j7F3Sydt9EDhw/xC0pzWD+jK3B+aOVsAdVvbJrmB3C2pY
 CShkozlgzQTbeKRcoRJgVgfWibuuknqgjluZnOUK5oI84BGqD9naBiMygyCYYYmdcMKO
 /GktUXNCIv8dL0ZvTBvzYrV2zI3Sm38cL8VR5kjSQCTlhCCahsToF7TDy57bpf7Ox5XP
 4vZ8t8BzGYbcDjB+Vee7uAJPYz80/hsQ7k1kFfbTkEJ+W4j4abFxggP4QT/Pbyhn1sGO
 SDrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW67HHs5vBNDeqJfmuiJoIX+PLLWspMR9p9MjDcUDEx7p+RP7A0PytC+gQddSeDLig28LGLTaf0mG+yBbXrGOyzZmPEhMcayEGcLuIh1xbY3F1KS1o7DDjU
X-Gm-Message-State: AOJu0YyOiXTndmpTR2YUdPDTYryFVgAKI3EskvtaBKYkgf3jQuVjmEDy
 dlPjFE4pbsQMr+2RGpWNxsxaQnFcvvQYegXKl9gJTIW5E+khb6P9
X-Google-Smtp-Source: AGHT+IGAmoob6M2YfzT7qs47bzAguInmQOEGahZYxNNUI6bjBDtp76GyhC9jEtaDU6a7uIsymMEwLw==
X-Received: by 2002:a05:6a00:4f89:b0:70b:30ce:dfdb with SMTP id
 d2e1a72fcca58-710dc77f957mr4797138b3a.24.1723314789127; 
 Sat, 10 Aug 2024 11:33:09 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:40c1:10b8:2b0a:a61f:9daf:ba70:6c3d])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710e5a43ccdsm1503418b3a.138.2024.08.10.11.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Aug 2024 11:33:08 -0700 (PDT)
From: Amit Vadhavana <av2082000@gmail.com>
To: linux-doc@vger.kernel.org,
	ricardo@marliere.net
Date: Sun, 11 Aug 2024 00:02:38 +0530
Message-Id: <20240810183238.34481-1-av2082000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 12 Aug 2024 06:46:41 +0000
Cc: catalin.marinas@arm.com, dave.hansen@linux.intel.com,
 conor.dooley@microchip.com, aou@eecs.berkeley.edu, hpa@zytor.com,
 skhan@linuxfoundation.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel-mentees@lists.linux.dev,
 costa.shul@redhat.com, corbet@lwn.net, mpe@ellerman.id.au, x86@kernel.org,
 christophe.leroy@csgroup.eu, mingo@redhat.com, workflows@vger.kernel.org,
 av2082000@gmail.com, naveen@kernel.org, npiggin@gmail.com, bp@alien8.de,
 paul.walmsley@sifive.com, bhelgaas@google.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, palmer@dabbelt.com,
 mcoquelin.stm32@gmail.com, dmaengine@vger.kernel.org
Subject: [Linux-stm32] [PATCH] Documentation: Fix spelling mistakes
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

Corrected spelling mistakes in the documentation to improve readability.

Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
---
 Documentation/arch/arm/stm32/stm32-dma-mdma-chaining.rst | 4 ++--
 Documentation/arch/arm64/cpu-hotplug.rst                 | 2 +-
 Documentation/arch/powerpc/ultravisor.rst                | 2 +-
 Documentation/arch/riscv/vector.rst                      | 2 +-
 Documentation/arch/sparc/oradax/oracle-dax.rst           | 2 +-
 Documentation/arch/x86/mds.rst                           | 2 +-
 Documentation/arch/x86/x86_64/fsgs.rst                   | 4 ++--
 Documentation/process/backporting.rst                    | 6 +++---
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/arch/arm/stm32/stm32-dma-mdma-chaining.rst b/Documentation/arch/arm/stm32/stm32-dma-mdma-chaining.rst
index 2945e0e33104..301aa30890ae 100644
--- a/Documentation/arch/arm/stm32/stm32-dma-mdma-chaining.rst
+++ b/Documentation/arch/arm/stm32/stm32-dma-mdma-chaining.rst
@@ -359,7 +359,7 @@ Driver updates for STM32 DMA-MDMA chaining support in foo driver
     descriptor you want a callback to be called at the end of the transfer
     (dmaengine_prep_slave_sg()) or the period (dmaengine_prep_dma_cyclic()).
     Depending on the direction, set the callback on the descriptor that finishes
-    the overal transfer:
+    the overall transfer:
 
     * DMA_DEV_TO_MEM: set the callback on the "MDMA" descriptor
     * DMA_MEM_TO_DEV: set the callback on the "DMA" descriptor
@@ -371,7 +371,7 @@ Driver updates for STM32 DMA-MDMA chaining support in foo driver
   As STM32 MDMA channel transfer is triggered by STM32 DMA, you must issue
   STM32 MDMA channel before STM32 DMA channel.
 
-  If any, your callback will be called to warn you about the end of the overal
+  If any, your callback will be called to warn you about the end of the overall
   transfer or the period completion.
 
   Don't forget to terminate both channels. STM32 DMA channel is configured in
diff --git a/Documentation/arch/arm64/cpu-hotplug.rst b/Documentation/arch/arm64/cpu-hotplug.rst
index 76ba8d932c72..8fb438bf7781 100644
--- a/Documentation/arch/arm64/cpu-hotplug.rst
+++ b/Documentation/arch/arm64/cpu-hotplug.rst
@@ -26,7 +26,7 @@ There are no systems that support the physical addition (or removal) of CPUs
 while the system is running, and ACPI is not able to sufficiently describe
 them.
 
-e.g. New CPUs come with new caches, but the platform's cache toplogy is
+e.g. New CPUs come with new caches, but the platform's cache topology is
 described in a static table, the PPTT. How caches are shared between CPUs is
 not discoverable, and must be described by firmware.
 
diff --git a/Documentation/arch/powerpc/ultravisor.rst b/Documentation/arch/powerpc/ultravisor.rst
index ba6b1bf1cc44..6d0407b2f5a1 100644
--- a/Documentation/arch/powerpc/ultravisor.rst
+++ b/Documentation/arch/powerpc/ultravisor.rst
@@ -134,7 +134,7 @@ Hardware
 
       * PTCR and partition table entries (partition table is in secure
         memory). An attempt to write to PTCR will cause a Hypervisor
-        Emulation Assitance interrupt.
+        Emulation Assistance interrupt.
 
       * LDBAR (LD Base Address Register) and IMC (In-Memory Collection)
         non-architected registers. An attempt to write to them will cause a
diff --git a/Documentation/arch/riscv/vector.rst b/Documentation/arch/riscv/vector.rst
index 75dd88a62e1d..e4a28def318a 100644
--- a/Documentation/arch/riscv/vector.rst
+++ b/Documentation/arch/riscv/vector.rst
@@ -15,7 +15,7 @@ status for the use of Vector in userspace. The intended usage guideline for
 these interfaces is to give init systems a way to modify the availability of V
 for processes running under its domain. Calling these interfaces is not
 recommended in libraries routines because libraries should not override policies
-configured from the parant process. Also, users must noted that these interfaces
+configured from the parent process. Also, users must noted that these interfaces
 are not portable to non-Linux, nor non-RISC-V environments, so it is discourage
 to use in a portable code. To get the availability of V in an ELF program,
 please read :c:macro:`COMPAT_HWCAP_ISA_V` bit of :c:macro:`ELF_HWCAP` in the
diff --git a/Documentation/arch/sparc/oradax/oracle-dax.rst b/Documentation/arch/sparc/oradax/oracle-dax.rst
index d1e14d572918..54ccb35ed51d 100644
--- a/Documentation/arch/sparc/oradax/oracle-dax.rst
+++ b/Documentation/arch/sparc/oradax/oracle-dax.rst
@@ -197,7 +197,7 @@ Memory Constraints
 ==================
 
 The DAX hardware operates only on physical addresses. Therefore, it is
-not aware of virtual memory mappings and the discontiguities that may
+not aware of virtual memory mappings and the discontinuities that may
 exist in the physical memory that a virtual buffer maps to. There is
 no I/O TLB or any scatter/gather mechanism. All buffers, whether input
 or output, must reside in a physically contiguous region of memory.
diff --git a/Documentation/arch/x86/mds.rst b/Documentation/arch/x86/mds.rst
index c58c72362911..5a2e6c0ef04a 100644
--- a/Documentation/arch/x86/mds.rst
+++ b/Documentation/arch/x86/mds.rst
@@ -162,7 +162,7 @@ Mitigation points
    3. It would take a large number of these precisely-timed NMIs to mount
       an actual attack.  There's presumably not enough bandwidth.
    4. The NMI in question occurs after a VERW, i.e. when user state is
-      restored and most interesting data is already scrubbed. Whats left
+      restored and most interesting data is already scrubbed. What's left
       is only the data that NMI touches, and that may or may not be of
       any interest.
 
diff --git a/Documentation/arch/x86/x86_64/fsgs.rst b/Documentation/arch/x86/x86_64/fsgs.rst
index 50960e09e1f6..d07e445dac5c 100644
--- a/Documentation/arch/x86/x86_64/fsgs.rst
+++ b/Documentation/arch/x86/x86_64/fsgs.rst
@@ -125,7 +125,7 @@ FSGSBASE instructions enablement
 FSGSBASE instructions compiler support
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-GCC version 4.6.4 and newer provide instrinsics for the FSGSBASE
+GCC version 4.6.4 and newer provide intrinsics for the FSGSBASE
 instructions. Clang 5 supports them as well.
 
   =================== ===========================
@@ -135,7 +135,7 @@ instructions. Clang 5 supports them as well.
   _writegsbase_u64()  Write the GS base register
   =================== ===========================
 
-To utilize these instrinsics <immintrin.h> must be included in the source
+To utilize these intrinsics <immintrin.h> must be included in the source
 code and the compiler option -mfsgsbase has to be added.
 
 Compiler support for FS/GS based addressing
diff --git a/Documentation/process/backporting.rst b/Documentation/process/backporting.rst
index e1a6ea0a1e8a..a71480fcf3b4 100644
--- a/Documentation/process/backporting.rst
+++ b/Documentation/process/backporting.rst
@@ -73,7 +73,7 @@ Once you have the patch in git, you can go ahead and cherry-pick it into
 your source tree. Don't forget to cherry-pick with ``-x`` if you want a
 written record of where the patch came from!
 
-Note that if you are submiting a patch for stable, the format is
+Note that if you are submitting a patch for stable, the format is
 slightly different; the first line after the subject line needs tobe
 either::
 
@@ -147,7 +147,7 @@ divergence.
 It's important to always identify the commit or commits that caused the
 conflict, as otherwise you cannot be confident in the correctness of
 your resolution. As an added bonus, especially if the patch is in an
-area you're not that famliar with, the changelogs of these commits will
+area you're not that familiar with, the changelogs of these commits will
 often give you the context to understand the code and potential problems
 or pitfalls with your conflict resolution.
 
@@ -197,7 +197,7 @@ git blame
 Another way to find prerequisite commits (albeit only the most recent
 one for a given conflict) is to run ``git blame``. In this case, you
 need to run it against the parent commit of the patch you are
-cherry-picking and the file where the conflict appared, i.e.::
+cherry-picking and the file where the conflict appeared, i.e.::
 
     git blame <commit>^ -- <path>
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
