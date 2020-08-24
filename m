Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9781824FF6D
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Aug 2020 16:01:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4ADF1C3089E;
	Mon, 24 Aug 2020 14:01:14 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E618DC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Aug 2020 14:01:10 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id k18so6169458qtm.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Aug 2020 07:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=XdATegxPLjRZ1S4FVShTFf9GHc/aayt9pgohmSeXGf4=;
 b=GhFho+Whb925lK0QvwZZEgD0KL8uGJe1twqMwtHZtWQaDfE8W0VNo+ipvLaU7nryjW
 UZM7kB4GEZQ2Bsq/EtYNhpYtIhVGwiwNnQLVpIBzsE0WUBn+1E+KwkeVGJhya/AtjDnp
 bHaEGkoLh5rJCO0r2U7UtOIELog4bKxkYvJWo8pBec2B50/3Gx2V/WIEYOljIhbcQwVu
 VRf/zGfsRgoC0v9MadZLvNdExBejZ6zT8a1JpJnl1an7fnEno2ftEMSWuUOSLe6ZHC0Y
 b8pjkNzxJZJIFWk2XtHzP9tDKe31O4MRj1RQyR3RPXDkn0Obd/psbCMq0TOz1NjCGk2H
 KLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=XdATegxPLjRZ1S4FVShTFf9GHc/aayt9pgohmSeXGf4=;
 b=lLjuue+MrBykNDqjxhVI0ts00MBhrY96morltX+O+/DFQMyqty3/rhiDVEgDjQi89E
 qRDLadcVOdZ0fvhFYs/pVqNbYRMUhBtXyZv1bIJ7Zdf/PrN3ftrco/+/NKrP0cDyTwqM
 uBCYn/A9PjCrJVk78IcY2Kocknma3cmqWded59UL2Bpsd7t1YwiNmI8208hz7dqnbXhP
 zDeuz5BHGln0CYJv/AvLKk1BDcHQ9iEXqVntAYWQkVCHY2IO7ZU3f8ZOAeXz4IgZAWP7
 lLt/GUKRRu8Uu8hFo+cqOWQQLHo+DsVXg+tZm3cmJC+ARPLqN9SRL7TeMkWe2sETWB47
 qTTw==
X-Gm-Message-State: AOAM532fYnAARwT+jWMLkodINbW1dL9CBkm5unWkWsVXkg0RpH5UfFIr
 Q5kOEqKuFU7zFUGPmbfEjB0=
X-Google-Smtp-Source: ABdhPJy3v6o9XZ+hI2AtpPbRiWrP20uHMzFlskDAgpOiz2CxRlsxZqrx8wKYr4u2FNcM2Pfv/5rkog==
X-Received: by 2002:ac8:22e2:: with SMTP id g31mr4681700qta.214.1598277669675; 
 Mon, 24 Aug 2020 07:01:09 -0700 (PDT)
Received: from localhost.localdomain ([177.194.72.74])
 by smtp.gmail.com with ESMTPSA id r20sm3244459qtc.87.2020.08.24.07.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 07:01:08 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: herbert@gondor.apana.org.au
Date: Mon, 24 Aug 2020 10:58:39 -0300
Message-Id: <20200824135840.3716-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Fabio Estevam <festevam@gmail.com>, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/2] crypto: stm32/crc32 - include <linux/io.h>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Building ARM allmodconfig leads to the following warnings:

drivers/crypto/stm32/stm32-crc32.c:128:2: error: implicit declaration of function 'writel_relaxed' [-Werror=implicit-function-declaration]
drivers/crypto/stm32/stm32-crc32.c:134:17: error: implicit declaration of function 'readl_relaxed' [-Werror=implicit-function-declaration]
drivers/crypto/stm32/stm32-crc32.c:176:4: error: implicit declaration of function 'writeb_relaxed' [-Werror=implicit-function-declaration]

Include <linux/io.h> to fix such warnings.

Reported-by: Olof's autobuilder <build@lixom.net>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/crypto/stm32/stm32-crc32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/stm32/stm32-crc32.c b/drivers/crypto/stm32/stm32-crc32.c
index 3ba41148c2a4..2994549beba3 100644
--- a/drivers/crypto/stm32/stm32-crc32.c
+++ b/drivers/crypto/stm32/stm32-crc32.c
@@ -7,6 +7,7 @@
 #include <linux/bitrev.h>
 #include <linux/clk.h>
 #include <linux/crc32poly.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
