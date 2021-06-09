Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB3D3A0914
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 03:32:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6155C58D5C;
	Wed,  9 Jun 2021 01:32:17 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57260C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 01:32:16 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso407655pjb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Jun 2021 18:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=53F3JLy2efE/MBSv+u+hdtt2UsFBNaGfSp4/xOndCJw=;
 b=m8NgwwBQVj+jiOSgp/qosMdniUSNKbEihuaHW84YK4n9ISHj3p6eAH3wIijol8CUmh
 k3wtBdLYgwJCdaFrYTPzeEsfQEkRAAIloFRJ0Sx/vYTGIY+B/zxkUMh19sS9ieeAqE2n
 sj0F+OZvJC5hhI2EM6bvsroDIrY3Auoz3JZyWzpzuc+HciWeuIcXFSe7YGclcC3ESDNk
 pnzjomO6GPuXSgUii5ZNOBSo1wDYmz06NRFK7KEI40Lv51VGF4mhD1t624cUaenHvZrw
 0GH3TSRk2/IW6oYUsVIxopQoUUKkXYvBGnNVSgFQ75Bd58+NsUu8byQp3tFnbnwYsGMz
 O20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=53F3JLy2efE/MBSv+u+hdtt2UsFBNaGfSp4/xOndCJw=;
 b=X81iI6L7+rUmGsAxJDFqTV/ZJcJp9RVkVXdN8bRDSylij0wa4GLx1itkeNz5IAdS4z
 tTeGWFTdwUucHu1gMuC0ahHtz3GynGlSq237IGu59f4CaxeHs+Zlb8xRtsr4a+FBoIeQ
 muMUGHm/lOvder6Xoi1UjDjKn78T7+UzFEA1ZdX64QuUDcDng93z7ieRDLnUcvzJQs86
 M4dSGdJeysrv9q3N8rYfCvNt6DIlrxfrsFnaJqZgGYfSygLR4tx47evUJA8+tzR5XUAU
 Dl1arZeBB1kKq+MWMrxYemz0jTXZDOdLClY1d9JvPcSsnjcj93uzQ35w02HcOSNQCEsF
 8oVg==
X-Gm-Message-State: AOAM531PIqP5AyqFkvonRkyUJ58A8CYYTirT4AtEG50Xu7nHf8WmGx/1
 FouDMJ05RJ53xh5AcCrvHPY=
X-Google-Smtp-Source: ABdhPJxlALKo8z10rInZn6MEjc+0Tt+aSv/JtpP5OOw76asrvljiGTcoZp64CRIKQeDsuyxCbelwOA==
X-Received: by 2002:a17:90b:1888:: with SMTP id
 mn8mr8046509pjb.179.1623202334944; 
 Tue, 08 Jun 2021 18:32:14 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id v14sm12659815pgl.86.2021.06.08.18.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:32:14 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Wed,  9 Jun 2021 10:31:08 +0900
Message-Id: <97ce79878a26809f0b15b2eac9a86ca39e0ecd74.1623201081.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1623201081.git.vilhelm.gray@gmail.com>
References: <cover.1623201081.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v11 05/33] counter: 104-quad-8: Annotate
	hardware config module parameter
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

When the kernel is running in secure boot mode, we lock down the kernel to
prevent userspace from modifying the running kernel image.  Whilst this
includes prohibiting access to things like /dev/mem, it must also prevent
access by means of configuring driver modules in such a way as to cause a
device to access or modify the kernel image.

To this end, annotate module_param* statements that refer to hardware
configuration and indicate for future reference what type of parameter they
specify.  The parameter parser in the core sees this information and can
skip such parameters with an error message if the kernel is locked down.
The module initialisation then runs as normal, but just sees whatever the
default values for those parameters is.

Note that we do still need to do the module initialisation because some
drivers have viable defaults set in case parameters aren't specified and
some drivers support automatic configuration (e.g. PNP or PCI) in addition
to manually coded parameters.

This patch annotates the 104-QUAD-8 driver.

Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index 233a3acc1377..0fd61cc82d30 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -21,7 +21,7 @@
 
 static unsigned int base[max_num_isa_dev(QUAD8_EXTENT)];
 static unsigned int num_quad8;
-module_param_array(base, uint, &num_quad8, 0);
+module_param_hw_array(base, uint, ioport, &num_quad8, 0);
 MODULE_PARM_DESC(base, "ACCES 104-QUAD-8 base addresses");
 
 #define QUAD8_NUM_COUNTERS 8
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
