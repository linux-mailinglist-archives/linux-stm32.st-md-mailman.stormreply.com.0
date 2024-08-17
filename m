Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2163695562A
	for <lists+linux-stm32@lfdr.de>; Sat, 17 Aug 2024 09:27:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD259C71290;
	Sat, 17 Aug 2024 07:27:53 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8E02C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Aug 2024 07:27:45 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2d3e46ba5bcso1126696a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Aug 2024 00:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723879664; x=1724484464;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fjk2EI8ZiEP4zfYt0Qe13udGW0VGF08C7NmtxZPQvvA=;
 b=laSc6D9uOcdkMFYDXiboVSAhmoDajBd+aChqvt7dUOgyFUhASektFvF4a2dWHguSDR
 vBcPTydy336FmrVwghofboUbDXuod8P+0Qhoi2ZO0t1Zgdv8rP4vNJqdKEKESMKyH1Nv
 AZ8a4PgK0lBWzZHElrFqQ0nhh4bMpCdF8KxDL8FUFHWD8LMQN4FRgdL6MATGazHQkWzl
 FAnbOG8gsxvH+2rORr+90OVtvpw4N0tsvralDInwWEbbXk6kfl8o6im1j04/JskTqShd
 agPKgZ4M1s8QadgMCCa7h8CU+fS246Ma02VVhApRoORL2hjNZmZbtGK4TeCfD4M37fr5
 M9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723879664; x=1724484464;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fjk2EI8ZiEP4zfYt0Qe13udGW0VGF08C7NmtxZPQvvA=;
 b=Gs4DwWiwMFNeobKSZIHTg+/73MGTyC7yc5iQjIjLTNFqVp/MGOJLas3HvjURHw7Skj
 vI2SdTp1KiLpeDTdkrlYgrNa69l/PkbIipdO1PDK/N5S2RNuoB9YhuqjCossSqsGCwLJ
 sj1lUJ4Ylz5CpR+AYScIVahYwfRG1suAqTj0RCa0+mw/7LFMvMpMLtg/ApSIj/3BDJr6
 rhVGumfnlcI8kOXARG0r8TpyBHdiIr8t/87o9w3b8lbN4plbcCbaUjVeSvytqgzltJRE
 QXjdNcdBMpfg7whOYAZ1TJmYFK+DDlzDvoBvjLuBSH4MqkzDpMC8Hf+5U2cxTwT7LSC+
 9c6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIqLxPz9GVSL/nPsqaGr1OXPVD98P4Rj2cacjBRETwTLptwhTSgYZDD9dqT5R8gFzFA1v/HI0UP9/O5nVeGsagW1jFjJnRPoCnEaZpvjQpx5kkcxl106ro
X-Gm-Message-State: AOJu0YzZgcXcE1l3kC/4U+5rtcZZqxX+s8NHyUCkDQQooCc1HZX8w0Eb
 zLXfHLC/l6KRvayabGeZk0g2EPsci0Krtm7Tkmf8Qz9JS0hBAfxt
X-Google-Smtp-Source: AGHT+IE6X6NdUFqH5STro3RyFQKnmXLcd7Q/tjaJtzJodMhcakvq4bBfNlQl3NZjm0J23S7MY4VzKw==
X-Received: by 2002:a17:90b:1286:b0:2d0:86a:fbd with SMTP id
 98e67ed59e1d1-2d3e00f08fcmr5267786a91.32.1723879664083; 
 Sat, 17 Aug 2024 00:27:44 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:40c1:1031:6067:f4e3:ef39:b58b:607e])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d3e2e6b228sm3179929a91.14.2024.08.17.00.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Aug 2024 00:27:43 -0700 (PDT)
From: Amit Vadhavana <av2082000@gmail.com>
To: linux-doc@vger.kernel.org,
	ricardo@marliere.net
Date: Sat, 17 Aug 2024 12:57:24 +0530
Message-Id: <20240817072724.6861-1-av2082000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Subject: [Linux-stm32] [PATCH V2] Documentation: Fix spelling mistakes
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

Correct spelling mistakes in the documentation to improve readability.

Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
---
V1: https://lore.kernel.org/all/20240810183238.34481-1-av2082000@gmail.com
V1 -> V2:
- Write the commit description in imperative mode.
- Fix grammer mistakes in the sentence.
---
 Documentation/arch/arm/stm32/stm32-dma-mdma-chaining.rst | 4 ++--
 Documentation/arch/arm64/cpu-hotplug.rst                 | 2 +-
 Documentation/arch/powerpc/ultravisor.rst                | 2 +-
 Documentation/arch/riscv/vector.rst                      | 2 +-
 Documentation/arch/x86/mds.rst                           | 2 +-
 Documentation/arch/x86/x86_64/fsgs.rst                   | 4 ++--
 Documentation/process/backporting.rst                    | 6 +++---
 7 files changed, 11 insertions(+), 11 deletions(-)

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
index 75dd88a62e1d..3987f5f76a9d 100644
--- a/Documentation/arch/riscv/vector.rst
+++ b/Documentation/arch/riscv/vector.rst
@@ -15,7 +15,7 @@ status for the use of Vector in userspace. The intended usage guideline for
 these interfaces is to give init systems a way to modify the availability of V
 for processes running under its domain. Calling these interfaces is not
 recommended in libraries routines because libraries should not override policies
-configured from the parant process. Also, users must noted that these interfaces
+configured from the parent process. Also, users must note that these interfaces
 are not portable to non-Linux, nor non-RISC-V environments, so it is discourage
 to use in a portable code. To get the availability of V in an ELF program,
 please read :c:macro:`COMPAT_HWCAP_ISA_V` bit of :c:macro:`ELF_HWCAP` in the
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
