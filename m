Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 475F21A3BB8
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Apr 2020 23:11:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D047BC36B0B;
	Thu,  9 Apr 2020 21:11:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34959C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Apr 2020 21:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586466664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YSl0zSCZeOdeYuCL6gv46V+k0KPuN+t2A0LflI9Lv3Y=;
 b=VVQ6kCiW4iqs++POtbcQNS4egtgO4Xw2QzuIJRLlFbTUW0VkzHQLLAgLIIjk4tT1DtsuWI
 BCDnc9fgaqrd3D9aePnvkwHYW2Ag8g+tOW0VLBaYPB0rWyfaHdvUJGsXcMjmnDPhuyL/Wb
 l4jPUrs7oKlwPIzE2Qn+nNzbA4tyFWw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-NYt6JHVBO0S3nI9VKvYbJw-1; Thu, 09 Apr 2020 17:11:00 -0400
X-MC-Unique: NYt6JHVBO0S3nI9VKvYbJw-1
Received: by mail-wr1-f72.google.com with SMTP id v14so7336555wrq.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Apr 2020 14:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=RtBDKwbJtd92jp7E6LtBd9yu+eRXqfVPRMTN3swQKxo=;
 b=VmbGOxo0vusSMWeWLdXKSQmHgXPh67N5kRmd7fz42qaxa9BJySuBVqpBL5nAtPF6+z
 GdDj65du9YDJv/5lVbcA5Mj9apNjrK72YZonItISCpm19tpODta2JhKsj2Htr3y8vZ7U
 G808JJtjCALK9bK1RGMQR6lVTyKgxfl/ibGHhLwkhD+89HRfqk18feN4Td/ZEE8c3baz
 TAruOgMItMIbh9hQfQJ/3+2pyaSCSJSfIoISFKzduto4/l+ymBdfJu+rIFioLO/Yc/GO
 DqUbgxWf8cSpVfymj31JVGZaAJjCOEBJCuZN/aWLYcBVcZpKaOVjvwuUnCFAhD9xV6+P
 hsdQ==
X-Gm-Message-State: AGi0PuZpBelCeLl49LZ7GD9NAOnpzfQUIbkA8oCbR0qkeKorJ0v4vda0
 cmOxWqrpjH4k84k//hskY75OplOzErGzB/iQdlALcjNOeP3hIVVqyj2M2tRwhfitUPYAp/8L5jF
 +j/4wqukIn2HKPQNwdnM5mV+rZGZYJCegSJxjSQ+N
X-Received: by 2002:a5d:4011:: with SMTP id n17mr1132445wrp.104.1586466658690; 
 Thu, 09 Apr 2020 14:10:58 -0700 (PDT)
X-Google-Smtp-Source: APiQypJabTxDz0WDx3biZbaja84PLZF34ZKZYgpYhxA8C4IQqw2wzmtgimWKqtv+yfhnsaBo2HvboA==
X-Received: by 2002:a5d:4011:: with SMTP id n17mr1132435wrp.104.1586466658564; 
 Thu, 09 Apr 2020 14:10:58 -0700 (PDT)
Received: from redhat.com (bzq-109-67-97-76.red.bezeqint.net. [109.67.97.76])
 by smtp.gmail.com with ESMTPSA id
 o67sm5411345wmo.5.2020.04.09.14.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 14:10:58 -0700 (PDT)
Date: Thu, 9 Apr 2020 17:10:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Message-ID: <20200409211054.12091-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] remoteproc: pull in slab.h
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

In preparation to virtio header changes, include slab.h directly as
this module is using it.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/remoteproc/stm32_rproc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index a18f88044111..7ef931e9605c 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -19,6 +19,7 @@
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
+#include <linux/slab.h>
 #include <linux/workqueue.h>
 
 #include "remoteproc_internal.h"
-- 
MST

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
