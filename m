Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A403A367C
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jun 2021 23:46:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 916C8C58D79;
	Thu, 10 Jun 2021 21:46:15 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C7A8C58D5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 21:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623361573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=70NgQXU1//Wzo0iLFWpl3KegQtCCZiFqqErbm/ywz0w=;
 b=ImhHWmll1EnO2DMV0TpXM6YioeLtQqycjlbYTats4DUmKYYd8zmkbf85aR9qV+Bn08O5fr
 bRXoz/tO7NQkgVOxJIacTtZC+2JVYYV4ys9ioYJEWBuZGYkJj1xv+x2Pfm2MjtFY3q+6t2
 HDIO0ZhlWandlsrD3j+uE4NUqE/TqT4=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-6T5RoimjM0K5xGVYRlFtAw-1; Thu, 10 Jun 2021 17:46:12 -0400
X-MC-Unique: 6T5RoimjM0K5xGVYRlFtAw-1
Received: by mail-oi1-f198.google.com with SMTP id
 l136-20020acaed8e0000b02901f3ebfedbf2so1892824oih.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 14:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=70NgQXU1//Wzo0iLFWpl3KegQtCCZiFqqErbm/ywz0w=;
 b=DQc4T9Pl1JU1cvAyTjwz51SpEQfJta5lZ6Rxm9INgbgFYO4f1q7QjtE8vkJ8tsx18V
 ZVVNPSSCM/+DE0sBHZUgJwJRoKr2hqhYdKIsR8cxT2jgWT01EnrXzfq/gFwwS4X2JDJp
 L1PdG1KloFL1G7ni/Zui47c456oCda29zZX1JuBdklUH5CRekmx5pjELhEzN9eeQZGsF
 VTzkyfVEiq+h9UAD6n6ibiYbgblYFC1rPJfvvDZV/RF9LLxMahj/xuiUqf/nTJTNC3QT
 +1q+455d48PFlKbSmoi8ZUrNmKYyOUcvkXs5vbVp70oDPV+m4q1c3SeF1DfrmW7dT8Tm
 r6TQ==
X-Gm-Message-State: AOAM530bgT5s4+YEVcgZ/SYP3y9EowBcByIL2Ha2nI0JLSmin83amGw2
 rqJw5zFZ6xVuSVnZZhE0VNe77HfbDKqKcaI69eSRxcBlUsdAr/IyBFkCSjT/JCpZsWtyf+ItK5J
 VDdUiJtmypfenSHxSE+SWBj28XHkFjOktMS6GMHmV
X-Received: by 2002:a9d:554f:: with SMTP id h15mr358495oti.237.1623361570543; 
 Thu, 10 Jun 2021 14:46:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5xdp4Jwej97Ul1cmx7ubsXWjXdzvP8bKBwCPJ0ttg8L6uH+IckI6kmbkyG1b9obIsJHKQNQ==
X-Received: by 2002:a9d:554f:: with SMTP id h15mr358446oti.237.1623361570280; 
 Thu, 10 Jun 2021 14:46:10 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id i15sm881839ots.39.2021.06.10.14.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 14:46:09 -0700 (PDT)
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
Date: Thu, 10 Jun 2021 14:44:38 -0700
Message-Id: <20210610214438.3161140-9-trix@redhat.com>
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
Subject: [Linux-stm32] [PATCH 7/7] mt76: use SPDX header file comment style
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

header files should use '/* SPDX ... */
Change from c file comment syle to header style

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/sdio.h     | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/testmode.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.h b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.h
index 05180971de841..03877d89e1520 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: ISC
+/* SPDX-License-Identifier: ISC */
 /* Copyright (C) 2020 MediaTek Inc.
  *
  * Author: Sean Wang <sean.wang@mediatek.com>
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
index 8f8533ef9859f..397a6b5532bcc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: ISC
+/* SPDX-License-Identifier: ISC */
 /* Copyright (C) 2020 MediaTek Inc. */
 
 #ifndef __MT7915_TESTMODE_H
-- 
2.26.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
