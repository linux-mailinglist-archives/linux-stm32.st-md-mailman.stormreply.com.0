Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8FA3A367B
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jun 2021 23:46:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F79CC58D79;
	Thu, 10 Jun 2021 21:46:07 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8754BC58D5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 21:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623361565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EskfVdmEpVOex3IAfBnti5Wx89Q+wzN0Zpd/qsC+eCM=;
 b=U6k2oIbHtKs+UoeMbjD7y6KkZn0tPSqMb7lBw5EuAVLBQ/XjmpTObu00cDSKwbXY+hDDhv
 hSsfVd6A9wPyMkP11CPTnUNVejDzy4BuncCJzupsUEjwICMK3v09YNfYQ01WQT2r4Cy5li
 bJW2nQ6Z1LSX+CH/tUp0RbwUbJfDb+c=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-1DKvuP3-NV244GEvFky1KA-1; Thu, 10 Jun 2021 17:46:04 -0400
X-MC-Unique: 1DKvuP3-NV244GEvFky1KA-1
Received: by mail-oi1-f200.google.com with SMTP id
 f84-20020aca38570000b02901f424a672b7so1882847oia.18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 14:46:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EskfVdmEpVOex3IAfBnti5Wx89Q+wzN0Zpd/qsC+eCM=;
 b=Lgps/ovhZuueAUuYh0HPtfYJeVYS4IULUcrU/7jZK+4iZK+hglXSdDgPVCWud471AY
 +GVTPRlsufdSGiSZEQAwjXpuYHHW5ASsSnNtmXPzhjCmar1rxynrmCg5XPOHtLvBBo8q
 XkbrwFf4bUJg6qTLC+c5sgwNDyEZ8DrRHMWZWIjhOtzvrFAySLSCpZAKfkVacUlfqcMm
 INnqaJmyV68gW8KLXzEjFLqXcNPUnOQOmoSmB9IPdOP1vqSQuaA8Ht9nFb/PvGclOHLN
 pcrFK61K+izn5GRytbyUR4GPEmbeGTbwBdgCA9mRqS5oJxjQFL8E2uMBvw5tYUEd+KlV
 wR2A==
X-Gm-Message-State: AOAM5307OTI6z5M8t95JY+yK3ifQAQw5OE40VeP+cnPn882HCK3W4Qmj
 ofuaNql6bUw0T/yopU7sCPL+q7yOlOL2XHeSy/mWraGYWAS8CYxH0XS+IoBxOZSqnvni+gscUhO
 eUOsxG5KdjLv6FPCmZFMvkVxAJpQ/mRouc4coyjaH
X-Received: by 2002:a4a:b2ca:: with SMTP id l10mr508302ooo.30.1623361563881;
 Thu, 10 Jun 2021 14:46:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7SVUzlSK/f1fDrHG5iNpljzriPnaeQkhfspBLGN6ijrDdm2MtUq40WVdJ5HgW0VGYiWYtFg==
X-Received: by 2002:a4a:b2ca:: with SMTP id l10mr508277ooo.30.1623361563723;
 Thu, 10 Jun 2021 14:46:03 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id i15sm881839ots.39.2021.06.10.14.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 14:46:03 -0700 (PDT)
From: trix@redhat.com
To: robh+dt@kernel.org, tsbogend@alpha.franken.de, jic23@kernel.org,
 lars@metafoo.de, tomas.winkler@intel.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, nbd@nbd.name, lorenzo.bianconi83@gmail.com,
 ryder.lee@mediatek.com, kvalo@codeaurora.org, davem@davemloft.net,
 kuba@kernel.org, matthias.bgg@gmail.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, apw@canonical.com, joe@perches.com,
 dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, chenhuacai@kernel.org,
 jiaxun.yang@flygoat.com, zhangqing@loongson.cn, jbhayana@google.com,
 sean.wang@mediatek.com, shayne.chen@mediatek.com, Soul.Huang@mediatek.com,
 shorne@gmail.com, gsomlo@gmail.com, pczarnecki@internships.antmicro.com,
 mholenko@antmicro.com, davidgow@google.com
Date: Thu, 10 Jun 2021 14:44:37 -0700
Message-Id: <20210610214438.3161140-8-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210610214438.3161140-1-trix@redhat.com>
References: <20210610214438.3161140-1-trix@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Tom Rix <trix@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 6/7] mt76: add a space between comment char
	and SPDX tag
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

From: Tom Rix <trix@redhat.com>

checkpatch expects a space between '#' and 'SPDX...'
Add a space.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/Makefile | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/Makefile | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/Makefile | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/Makefile b/drivers/net/wireless/mediatek/mt76/mt7615/Makefile
index e8fc4a7ae9bc2..83f9861ff5226 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/Makefile
@@ -1,4 +1,4 @@
-#SPDX-License-Identifier: ISC
+# SPDX-License-Identifier: ISC
 
 obj-$(CONFIG_MT7615_COMMON) += mt7615-common.o
 obj-$(CONFIG_MT7615E) += mt7615e.o
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/Makefile b/drivers/net/wireless/mediatek/mt76/mt7915/Makefile
index 40c8061787e94..80e49244348e2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/Makefile
@@ -1,4 +1,4 @@
-#SPDX-License-Identifier: ISC
+# SPDX-License-Identifier: ISC
 
 obj-$(CONFIG_MT7915E) += mt7915e.o
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/Makefile b/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
index e531666f9fb43..0ebb59966a083 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
@@ -1,4 +1,4 @@
-#SPDX-License-Identifier: ISC
+# SPDX-License-Identifier: ISC
 
 obj-$(CONFIG_MT7921E) += mt7921e.o
 
-- 
2.26.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
