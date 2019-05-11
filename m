Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB471A621
	for <lists+linux-stm32@lfdr.de>; Sat, 11 May 2019 03:23:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 266E4C0D697
	for <lists+linux-stm32@lfdr.de>; Sat, 11 May 2019 01:23:47 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6595AC0D696
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 May 2019 01:23:45 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id w37so7589880edw.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 18:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Sy6IJVq4VJSGNsCncCOevfEMVkxJ4DdVxf3Fz7dO1o=;
 b=rnMpbkIZV4iQ4uC1XfVbzikGIDK3Y+X7xhPA0psUZYD05UE/Dqd5RuIMhOxiYAFKqn
 uKs3xy3l40Rp4PJym3z08kOPIuHzjGzk2tezFv6qMlcYGEncR0+Y7n0whFx+kDsCB6Tb
 Z49SYnDW8VehUpLEXctnUsWYHTGT++65Lp23fGWAICCifApmLlteKtlNTK2oFp3mQ6lH
 ikukBB6HUN+zaBVSvGe1nLUw/HbhQ8ruWgpsy/T66ozOwjE5ykYJtuGBAtvUAPDllIxf
 /gCI9y5LGU9tCSG/+V5w754Nbb8UPqwBMl1/pqEk1U0JYG6UXtn9r/cJGpKeIlOC2zyt
 q7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Sy6IJVq4VJSGNsCncCOevfEMVkxJ4DdVxf3Fz7dO1o=;
 b=gweLaejMCaDYkhC8uSYg6isIT/x6VpVNlgy6PGPDm4XbM0f4WNfLuj36xEs0D/xteH
 47vq0tFdRv7CYkZkilSEnqKCrRCJpRjg5VqIgXQCpdjDdmbA86qXfa4MsfHhpDIdZvJK
 PTcp+n9aqMj442W0Qf6Eeg5iq0BFnkHFO6vbb9NC0Emo6vC/OcsJcsVGQ1X5rPp6hHnp
 /yFoktaihXW/pwKW/997pO/7M8kFJ+Ou2F+PZSs7aoki+f7/T8Ka6sgLiF+kK8qqXMdm
 l0i91QNLVl1W7C5dUQBvNfAfJYdWZ/GhMCr3ie6DD2og4krtOEziwVnT+YULqoAaztWG
 CTVg==
X-Gm-Message-State: APjAAAXRKD+ululF1S4OF1GZxSL1OTeAZGDq6zA8ZRvSXLSkce98DcIt
 kBMjaazdwzLP04qNWc6d86U=
X-Google-Smtp-Source: APXvYqx0DjxzxMiJASMnY3yXqVa1UNYgM9oYsPoKMw+8rRXJ93TwPZ8R959C69MGa/Os41aCsPmcww==
X-Received: by 2002:a50:b3a4:: with SMTP id s33mr14924192edd.112.1557537824828; 
 Fri, 10 May 2019 18:23:44 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b84::2])
 by smtp.gmail.com with ESMTPSA id r3sm941779ejb.88.2019.05.10.18.23.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 18:23:44 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Amelie Delaunay <amelie.delaunay@st.com>, Lee Jones <lee.jones@linaro.org>
Date: Fri, 10 May 2019 18:23:01 -0700
Message-Id: <20190511012301.2661-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] mfd: stmfx: Fix macro definition spelling
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

Clang warns:

In file included from drivers/mfd/stmfx.c:13:
include/linux/mfd/stmfx.h:7:9: warning: 'MFD_STMFX_H' is used as a
header guard here, followed by #define of a different macro
[-Wheader-guard]

Fixes: 06252ade9156 ("mfd: Add ST Multi-Function eXpander (STMFX) core driver")
Link: https://github.com/ClangBuiltLinux/linux/issues/475
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 include/linux/mfd/stmfx.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mfd/stmfx.h b/include/linux/mfd/stmfx.h
index d890595b89b6..3c67983678ec 100644
--- a/include/linux/mfd/stmfx.h
+++ b/include/linux/mfd/stmfx.h
@@ -5,7 +5,7 @@
  */
 
 #ifndef MFD_STMFX_H
-#define MFX_STMFX_H
+#define MFD_STMFX_H
 
 #include <linux/regmap.h>
 
-- 
2.21.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
