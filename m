Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 772F357EA3
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 10:49:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 405C4CA027D
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 08:49:51 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6ED99C9F151
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jun 2019 14:45:22 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id n5so77835ioc.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jun 2019 07:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xOuGlUvj6Y52Av2r1WPq8pFEjxnJHawsCR+WxrVa7n0=;
 b=ZxdA8ksj5CHSQC8tTggj3pvXUMXHL7b4mPq5jHYghcxEl0EQv6+X3vJXtC3gDlYC23
 54fmlqZ0OOzxVcbRrMwFU73xPDnFrlIkHLwCTPGZ9hooakhgTEaOyPvQbf4CNARlYrY3
 exXeTcRvC54vBDmmHprd4v6K+uZ0m/cHmBCUbGIvOB4n0hdjm/3MHVgCP0kbnIH8K+IU
 BKwwhxnwxDfEdSGsvbVTQNUBHQg+Gir5BwEMuuYBLJ729W28RQCmAA2TVk8+p6roLyWk
 knWIyqDY15o1mS1QeIEFggfHO637MpeM35JKvi2j8FHpOeof/Ju+IikZNU5CDVzqTOvv
 ETEw==
X-Gm-Message-State: APjAAAWUJeQP1CzxegWabs5eXkZKYrW+cm19KSPtNelh4ac/jtLnb/77
 P6vLp1ySIeVrjWNnPN25r0Y=
X-Google-Smtp-Source: APXvYqwGxRtDkkC/HYSf0Xa19EOVzPy4PDH0ijGyOCA3nY1iJcjvQeSpvF80Hn9dksyXl8H0ioDvUQ==
X-Received: by 2002:a02:c50a:: with SMTP id s10mr94304162jam.106.1561301121327; 
 Sun, 23 Jun 2019 07:45:21 -0700 (PDT)
Received: from localhost.localdomain (broadband-188-32-48-208.ip.moscow.rt.ru.
 [188.32.48.208])
 by smtp.googlemail.com with ESMTPSA id k8sm8057458iob.78.2019.06.23.07.45.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 23 Jun 2019 07:45:20 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: Amelie Delaunay <amelie.delaunay@st.com>
Date: Sun, 23 Jun 2019 17:44:59 +0300
Message-Id: <20190623144459.21608-1-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Jun 2019 08:49:46 +0000
Cc: linux-kernel@vger.kernel.org, Denis Efremov <efremov@linux.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] mfd: stmfx.h: typo in the header guard
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

The guard macro MFX_STMFX_H in the header stmfx.h
doesn't match the #ifndef macro MFD_STMFX_H. The patch
fixes the typo.

Signed-off-by: Denis Efremov <efremov@linux.com>
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
