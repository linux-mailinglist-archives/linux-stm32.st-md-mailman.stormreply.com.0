Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEB45AEDA
	for <lists+linux-stm32@lfdr.de>; Sun, 30 Jun 2019 08:19:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF71AC0DB2C
	for <lists+linux-stm32@lfdr.de>; Sun, 30 Jun 2019 06:19:32 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 739FBC0DB2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 Jun 2019 06:19:32 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id x144so6585151lfa.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 29 Jun 2019 23:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WBff9Q31WytToFILW5VoVwYEkxeSh4M7iWNthN+AK6I=;
 b=Gu+je+QvkPfwZwmVMBiAW+7QjNESKrsPTusBSrnlL6x3cKKjMpcKVv6OOktztRyFkm
 LNDS/CQnqpeioeg2vD+CZRyTWXv7GVVUIYCi2LaxfNuCJrBh+SJt4ID4aN49YR8rW5sq
 f0VKml1Mo1WCKiM614KKxegV0o566gY0yHAvQ1xhDPqtm9Z6+5664z/TfdPjNg0Kt3Py
 RG8dQpnvd4zoSMtsFhbY4AKE68BUQ3LJVqix+9c6IYUVGSXXNiMBsDiDEw1SnbZpNeDY
 59Q0MlyqpbqjIk2cOKZEggFOph1f4OOES8KGKe9pjBPK7OWN2Il9qM+IlmBfa9oyxHXq
 8EyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WBff9Q31WytToFILW5VoVwYEkxeSh4M7iWNthN+AK6I=;
 b=PDespCXcPU5wn9r8PMIxhSyKeUD9QhZUjUT4Qbyg7Vgp3CKZCIAUvbItzzbntSBJe8
 XtjOOYwmeEbeqBdFGtuV10wAWXnLNT5FA4uyAAZBGhjPG+rtQuKpugNwmW9B9xF+JR7G
 8gvqEBcCFpyXhWOl9lLw0r3O4aIZHPEZHmQQ0wLjEVAoG6GF5E3s6uQurzhDhWms1oAA
 zCuRdg9hiYnv+MaOdD7Oy0OhZu9VMSps5HQvQwHLGCuoWycLkdliV9AAbmIXUF654pLx
 M4heJJnVzCkPFlmouPM6FSFM+u+ISn1lULbsZCS27cbvyHkBXf3Sk/VXH/q/QAse0+M/
 jpDg==
X-Gm-Message-State: APjAAAXtkLUmtFmsE89sBLPKhHYcG2LqOZ7z8eYKwoLY7HfoCw9duJYF
 A3yqX46tqTeUo88Mckt7p6U=
X-Google-Smtp-Source: APXvYqwrcoTpWP5VhHTwC52oXSKcJgARlMY1UIo4OQXUv7/qwWhLp2ZyI7Xek4qR9uaa3DSxLagPRA==
X-Received: by 2002:ac2:46ce:: with SMTP id p14mr9097784lfo.148.1561875571620; 
 Sat, 29 Jun 2019 23:19:31 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 o74sm1794024lff.46.2019.06.29.23.19.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 23:19:31 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Date: Sun, 30 Jun 2019 08:18:52 +0200
Message-Id: <20190630061922.7254-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630061922.7254-1-sam@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Yannick Fertre <yannick.fertre@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1 03/33] drm/stm: drop use of drmP.h
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

Drop use of the deprecated header file drmP.h
from the sole user in the stm driver.
Replace with necessary include files.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Yannick Fertre <yannick.fertre@st.com>
Cc: Philippe Cornu <philippe.cornu@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Vincent Abriou <vincent.abriou@st.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
The list of cc: was too large to add all recipients to the cover letter.
Please find cover letter here:
https://lists.freedesktop.org/archives/dri-devel/2019-June/thread.html
Search for "drm: drop use of drmp.h in drm-misc"

        Sam

 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index 0ab32fee6c1b..a03a642c147c 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -8,13 +8,17 @@
 
 #include <linux/clk.h>
 #include <linux/iopoll.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
-#include <drm/drmP.h>
-#include <drm/drm_mipi_dsi.h>
-#include <drm/bridge/dw_mipi_dsi.h>
+
 #include <video/mipi_display.h>
 
+#include <drm/bridge/dw_mipi_dsi.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_print.h>
+
 #define HWVER_130			0x31333000	/* IP version 1.30 */
 #define HWVER_131			0x31333100	/* IP version 1.31 */
 
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
