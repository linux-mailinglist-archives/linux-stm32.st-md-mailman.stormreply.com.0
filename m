Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EECFB338C1
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 10:30:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FCF6C36B2B;
	Mon, 25 Aug 2025 08:30:17 +0000 (UTC)
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90533C36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 08:30:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756110548; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fcoF6iTWhunYRzmFhgB2V3l5FZ9P/Bv+oOvF+IuclMEqjuYKNO3vJ/sLEWEvCGVAAnsfbR4tGjIqBruztA25yFUmJDCcSab4zBGNsB0Sl+mb1GMnjFFQPkIYI4ekgXtLI4bhQffnlBV6S34KGJLeZ2TT57Xr6Dexx3M0N3SGUxE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756110548;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=+ds7UJ/GcM+1QFx5GWEDvr7qiCy8pTo68rCv3gqg+cA=; 
 b=jcVgmokYWSc3/2pFP2AN4L5NRtJj546MoILinFFpiugnyVfJ0uvPNHkFMi3gtM4KRVbDCjEfL+CZz83bciBuK0ik7VjyTjWoh5vtsRX0f3NYVHspwiMLAAO4Q5N/gglpU/SPDX1nnO+5iC8bxmZz2KuwVRAMr2tPsYxe14QvEpw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756110548; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=+ds7UJ/GcM+1QFx5GWEDvr7qiCy8pTo68rCv3gqg+cA=;
 b=cPLPo+ugJ9OTuZR0YLUSsUMHTndMsIh1nn7r0cp8U3GoZh17B+lYsHNmg1lfhLoV
 i6RUuPyzRMf8lSBk0TUkt8NGh7loOLdjy4D6F+hmqC4knvMQhv6QyJIPnLNoT4qka/0
 /pzdWdzF4llaxjRtAiqg0a2zRs/NiFpg3Ai9dZ8k=
Received: by mx.zohomail.com with SMTPS id 1756110545721254.6775577730043;
 Mon, 25 Aug 2025 01:29:05 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 25 Aug 2025 10:28:21 +0200
MIME-Version: 1.0
Message-Id: <20250825-byeword-update-v3-1-947b841cdb29@collabora.com>
References: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
In-Reply-To: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
To: Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Jaehoon Chung <jh80.chung@samsung.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shreeya Patel <shreeya.patel@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
X-Mailer: b4 0.14.2
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 01/20] bitmap: introduce hardware-specific
 bitfield operations
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

Hardware of various vendors, but very notably Rockchip, often uses
32-bit registers where the upper 16-bit half of the register is a
write-enable mask for the lower half.

This type of hardware setup allows for more granular concurrent register
write access.

Over the years, many drivers have hand-rolled their own version of this
macro, usually without any checks, often called something like
HIWORD_UPDATE or FIELD_PREP_HIWORD, commonly with slightly different
semantics between them.

Clearly there is a demand for such a macro, and thus the demand should
be satisfied in a common header file. As this is a convention that spans
across multiple vendors, and similar conventions may also have
cross-vendor adoption, it's best if it lives in a vendor-agnostic header
file that can be expanded over time.

Add hw_bitfield.h with two macros: FIELD_PREP_WM16, and
FIELD_PREP_WM16_CONST. The latter is a version that can be used in
initializers, like FIELD_PREP_CONST.

Suggested-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 MAINTAINERS                 |  1 +
 include/linux/hw_bitfield.h | 62 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d4bddc462c079f85ee35e685527c93dd1620f890..75a266a78a13721372a92b9ae45b9ae56e301347 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4281,6 +4281,7 @@ F:	include/linux/bits.h
 F:	include/linux/cpumask.h
 F:	include/linux/cpumask_types.h
 F:	include/linux/find.h
+F:	include/linux/hw_bitfield.h
 F:	include/linux/nodemask.h
 F:	include/linux/nodemask_types.h
 F:	include/uapi/linux/bits.h
diff --git a/include/linux/hw_bitfield.h b/include/linux/hw_bitfield.h
new file mode 100644
index 0000000000000000000000000000000000000000..df202e167ce487122e4440962eacb2e44817ad9f
--- /dev/null
+++ b/include/linux/hw_bitfield.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2025, Collabora Ltd.
+ */
+
+#ifndef _LINUX_HW_BITFIELD_H
+#define _LINUX_HW_BITFIELD_H
+
+#include <linux/bitfield.h>
+#include <linux/build_bug.h>
+#include <linux/limits.h>
+
+/**
+ * FIELD_PREP_WM16() - prepare a bitfield element with a mask in the upper half
+ * @_mask: shifted mask defining the field's length and position
+ * @_val:  value to put in the field
+ *
+ * FIELD_PREP_WM16() masks and shifts up the value, as well as bitwise ORs the
+ * result with the mask shifted up by 16.
+ *
+ * This is useful for a common design of hardware registers where the upper
+ * 16-bit half of a 32-bit register is used as a write-enable mask. In such a
+ * register, a bit in the lower half is only updated if the corresponding bit
+ * in the upper half is high.
+ */
+#define FIELD_PREP_WM16(_mask, _val)					     \
+	({								     \
+		typeof(_val) __val = _val;				     \
+		typeof(_mask) __mask = _mask;				     \
+		__BF_FIELD_CHECK(__mask, ((u16)0U), __val,		     \
+				 "HWORD_UPDATE: ");			     \
+		(((typeof(__mask))(__val) << __bf_shf(__mask)) & (__mask)) | \
+		((__mask) << 16);					     \
+	})
+
+/**
+ * FIELD_PREP_WM16_CONST() - prepare a constant bitfield element with a mask in
+ *                           the upper half
+ * @_mask: shifted mask defining the field's length and position
+ * @_val:  value to put in the field
+ *
+ * FIELD_PREP_WM16_CONST() masks and shifts up the value, as well as bitwise ORs
+ * the result with the mask shifted up by 16.
+ *
+ * This is useful for a common design of hardware registers where the upper
+ * 16-bit half of a 32-bit register is used as a write-enable mask. In such a
+ * register, a bit in the lower half is only updated if the corresponding bit
+ * in the upper half is high.
+ *
+ * Unlike FIELD_PREP_WM16(), this is a constant expression and can therefore
+ * be used in initializers. Error checking is less comfortable for this
+ * version.
+ */
+#define FIELD_PREP_WM16_CONST(_mask, _val)				 \
+	(								 \
+		FIELD_PREP_CONST(_mask, _val) |				 \
+		(BUILD_BUG_ON_ZERO(const_true((u64)(_mask) > U16_MAX)) + \
+		 ((_mask) << 16))					 \
+	)
+
+
+#endif /* _LINUX_HW_BITFIELD_H */

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
