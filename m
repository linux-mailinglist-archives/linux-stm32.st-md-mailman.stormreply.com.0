Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BB53A3661
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jun 2021 23:45:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CA33C58D79;
	Thu, 10 Jun 2021 21:45:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B36A2C58D5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 21:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623361533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TSv9PvVn6D8P1hr2HASl5EPE56aRrWalXa3WhtLcjzQ=;
 b=iAE7W9Gkn/rYWR6Jryyt0Re3VUdp5iV73R4W9E7XT1T7k3hTWawX7NlrfQLaR55GCtPURQ
 AMEjAfuzz5BOTKTGalm/YLoCVjhNsB3VAu0QAon3+q2wmf0NJqBKPc+m32wGUpR2hJcdbJ
 hAbF86auFHbavI4AzsRC9KbzozSl/TU=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-QeY2mGbeMQqPcxjQX_tCBw-1; Thu, 10 Jun 2021 17:45:32 -0400
X-MC-Unique: QeY2mGbeMQqPcxjQX_tCBw-1
Received: by mail-ot1-f71.google.com with SMTP id
 m20-20020a0568301e74b02903e419b82f75so630427otr.23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 14:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TSv9PvVn6D8P1hr2HASl5EPE56aRrWalXa3WhtLcjzQ=;
 b=mxxoVvtxNeh6Bxx8lJzMU2fHhbg7G01j5LCjQH77oDDr9/fMlHw5mCGfeOmpE2n8BS
 DuUjaeQ87NNJhaTTW7CpvO9aS55ko4TRQfR19iW/GbhKJ7jvoO2/WifgReA8STGbSFZl
 UNqPhIO5qcPD4ozfkv/rS81PHL/l0Gi4WFUT+ApxOshGQKCnS39wUH6l90YyK90AWVaM
 dIctV2Tku7yDGpHGaAwRy9d4nXwvohcqQw2LF7R1UcKuO1Kcws7vl3L3nS0IvrbJg9pn
 KY9ULc1COSSIqyTCdMtO1U5IjH0ze8hbgVVVb8cjO7ZjNJQgfUyIUbiyjizYFvFrX3Ni
 MV4g==
X-Gm-Message-State: AOAM532TE5tVE1NwyFDalvUqvA9rwQZG6pONv/cLdsQGmvisBlh8E+r2
 pbyLdHy4XeTQTLX50CaXarJ6N5VnGjAuwhmjOQEA4kzFtdEtLvmom0Hpg9kF9zAkGrk7cRaEpnr
 r4sQ9NRcvOdC5gHn+rTdsuQURdPXGRuEb+HgM3lT0
X-Received: by 2002:aca:b506:: with SMTP id e6mr361782oif.178.1623361531509;
 Thu, 10 Jun 2021 14:45:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLkOYqEPHROAavZ+GqUoBa88evwWu8hew7OzFYwlCFApTMasrs2l9HZneVNx3WKlokSV6LKQ==
X-Received: by 2002:aca:b506:: with SMTP id e6mr361752oif.178.1623361531370;
 Thu, 10 Jun 2021 14:45:31 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id i15sm881839ots.39.2021.06.10.14.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 14:45:31 -0700 (PDT)
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
Date: Thu, 10 Jun 2021 14:44:33 -0700
Message-Id: <20210610214438.3161140-4-trix@redhat.com>
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
Subject: [Linux-stm32] [PATCH 2/7] mei: hdcp: SPDX tag should be the first
	line
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

checkpatch looks for the tag on the first line.
So delete empty first line

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/misc/mei/hdcp/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/mei/hdcp/Kconfig b/drivers/misc/mei/hdcp/Kconfig
index 95b2d6d37f102..54e1c95269096 100644
--- a/drivers/misc/mei/hdcp/Kconfig
+++ b/drivers/misc/mei/hdcp/Kconfig
@@ -1,4 +1,3 @@
-
 # SPDX-License-Identifier: GPL-2.0
 # Copyright (c) 2019, Intel Corporation. All rights reserved.
 #
-- 
2.26.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
