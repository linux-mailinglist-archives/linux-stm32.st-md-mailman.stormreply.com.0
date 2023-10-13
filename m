Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 614487C7EE2
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Oct 2023 09:48:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B3F4C6A613;
	Fri, 13 Oct 2023 07:48:19 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 766CCC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 07:48:18 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1c9de3f66e5so12934755ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 00:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183297; x=1697788097;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/0kb1FiHCSEkQxzh7PJsrM1RNssRIDlYu3IfcoLIqjk=;
 b=tRY7x6Ey69RS1QBhiG/1HIz2xZG42Nuy/lhEav8GrXNcSZFE/KdbIammxsVyd6CNEF
 cJlKlVh/E7ClqvVfJUEpR1zllfnlBIhQurJ39nxHaFDygRr0WqkycX1b6NQlAazd2Rmv
 Rol1tNEIhb11+BIaHkU6wIQdBL5cQ6sGtGTEUCAHSKGIREK+16t4KFgC+PLcdXi2+MBa
 W2eDM3MI8c3sEQmmziQ+MpP7e3owTg+Zm5VdpLQ9q4KR0xBe21DnSX3vw7f+1U4dZjeC
 Nn9zzrDBO7ITCYfpblJc25lMVvfYNF6HVM/oMT/SLnceFba4gGnc4OJGg8G8fasYAgHb
 Xc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183297; x=1697788097;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/0kb1FiHCSEkQxzh7PJsrM1RNssRIDlYu3IfcoLIqjk=;
 b=k93f4+moKESlg8tnyDl0M+CWFFasmA6q19FoXWAL5q7uZ9bsCb81IeXI+d/n0gumLx
 6dDg4RZjU+1bkYMlzQlluR5nCVdx4qMn0s+7q1WKf8XlhBdF6HVCM3nOKlf+r9tGyO1x
 xVmv+1MAeOERDyq8dctKGQsMU8/ltCvVl7shmvn3/cLKhL65r/s3Tp8FBWvhdgkgL3iz
 nNmSRoYCkZsUPh+28wvQk5nLgMWsz/Xs/j8v1AkHHQewvUkrqg8xM/jCmqc3AaY6x86n
 /mnzErSeMemib6QhNcMQ5/iZtHXVl8/uVqXNCZlg2XZCWWj7IuVqT5vg9VIVHc8++pbw
 1jjA==
X-Gm-Message-State: AOJu0YwglWX8GQRxTH80wleUzzn7mR+pk7CInMYVvR3JDilXOCnp9DeL
 LbhMIHbkgLjUg9SIZjHSIuEsug==
X-Google-Smtp-Source: AGHT+IEr3/GGqqC8nXhIEzypzuLKDe4Rc0uWXujjo4TuULJCozbCr3188pVwv0FnPXvQh74Eic8zPg==
X-Received: by 2002:a17:903:54d:b0:1c4:335:b06d with SMTP id
 jo13-20020a170903054d00b001c40335b06dmr22738543plb.32.1697183297103; 
 Fri, 13 Oct 2023 00:48:17 -0700 (PDT)
Received: from localhost.localdomain (fp9875a45d.knge128.ap.nuro.jp.
 [152.117.164.93]) by smtp.gmail.com with ESMTPSA id
 z8-20020a170903018800b001c9ccbb8fdasm3200548plg.260.2023.10.13.00.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:48:16 -0700 (PDT)
From: Masahisa Kojima <masahisa.kojima@linaro.org>
To: Ard Biesheuvel <ardb@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Jan Kiszka <jan.kiszka@siemens.com>, Sumit Garg <sumit.garg@linaro.org>,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Date: Fri, 13 Oct 2023 16:45:39 +0900
Message-Id: <20231013074540.8980-7-masahisa.kojima@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231013074540.8980-1-masahisa.kojima@linaro.org>
References: <20231013074540.8980-1-masahisa.kojima@linaro.org>
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Johan Hovold <johan+linaro@kernel.org>
Subject: [Linux-stm32] [PATCH v9 6/6] tee: optee: restore efivars ops when
	tee-supplicant stops
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

When tee-supplicant stops, tee-based EFI variable service
is no longer available. Restore the efivars generic ops at the
moment when tee-supplicant stops.

Linking error occurs if we set CONFIG_OPTEE=y and
CONFIG_TEE_STMM_EFI=m. Use IS_REACHABLE() guard to call
tee_stmm_restore_efivars_generic_ops() function.

Signed-off-by: Masahisa Kojima <masahisa.kojima@linaro.org>
---
 drivers/firmware/efi/stmm/tee_stmm_efi.c | 8 +++++++-
 drivers/tee/optee/supp.c                 | 4 ++++
 include/linux/efi.h                      | 1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/stmm/tee_stmm_efi.c b/drivers/firmware/efi/stmm/tee_stmm_efi.c
index edc165bc1bb0..e804b260edaa 100644
--- a/drivers/firmware/efi/stmm/tee_stmm_efi.c
+++ b/drivers/firmware/efi/stmm/tee_stmm_efi.c
@@ -572,10 +572,16 @@ static int tee_stmm_efi_probe(struct device *dev)
 	return 0;
 }
 
-static int tee_stmm_efi_remove(struct device *dev)
+void tee_stmm_restore_efivars_generic_ops(void)
 {
 	efivars_unregister(&tee_efivars);
 	efivars_generic_ops_register();
+}
+EXPORT_SYMBOL_GPL(tee_stmm_restore_efivars_generic_ops);
+
+static int tee_stmm_efi_remove(struct device *dev)
+{
+	tee_stmm_restore_efivars_generic_ops();
 
 	return 0;
 }
diff --git a/drivers/tee/optee/supp.c b/drivers/tee/optee/supp.c
index 322a543b8c27..d07d4fc4e72e 100644
--- a/drivers/tee/optee/supp.c
+++ b/drivers/tee/optee/supp.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2015, Linaro Limited
  */
 #include <linux/device.h>
+#include <linux/efi.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include "optee_private.h"
@@ -58,6 +59,9 @@ void optee_supp_release(struct optee_supp *supp)
 		complete(&req->c);
 	}
 
+	if (IS_REACHABLE(CONFIG_TEE_STMM_EFI))
+		tee_stmm_restore_efivars_generic_ops();
+
 	supp->ctx = NULL;
 	supp->req_id = -1;
 
diff --git a/include/linux/efi.h b/include/linux/efi.h
index 489707b9b0b0..9b60893d6299 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -1365,5 +1365,6 @@ extern struct blocking_notifier_head efivar_ops_nh;
 
 void efivars_generic_ops_register(void);
 void efivars_generic_ops_unregister(void);
+void tee_stmm_restore_efivars_generic_ops(void);
 
 #endif /* _LINUX_EFI_H */
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
