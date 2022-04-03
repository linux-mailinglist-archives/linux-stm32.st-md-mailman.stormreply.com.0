Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB85D4F0A15
	for <lists+linux-stm32@lfdr.de>; Sun,  3 Apr 2022 16:02:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70A8EC5F1F1;
	Sun,  3 Apr 2022 14:02:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A75FAC5EC76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Apr 2022 14:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648994543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IgMX2nj2cNExGiU4IHmGwPOWMy+mYsJ+4MxIjrhMhLQ=;
 b=IUK67A5JGdDj6SFvTU2o1CJoZA6bocPffQciGy8gHb1xuUAjN45R7MIEbq7QkGUUspijjf
 BUXSsSpOq+r6IemLm53N2FVhy5BxkUxQ9+6fGKrHO5jrG1GioFgWJnBz0GobMUeWE44z9J
 JBHcBEZ48mX8dvxqLAdxK3/NopoajNI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-DMoAKjAvOOCK37HIwJ_i4g-1; Sun, 03 Apr 2022 10:02:15 -0400
X-MC-Unique: DMoAKjAvOOCK37HIwJ_i4g-1
Received: by mail-wm1-f71.google.com with SMTP id
 t2-20020a7bc3c2000000b003528fe59cb9so3671738wmj.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Apr 2022 07:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IgMX2nj2cNExGiU4IHmGwPOWMy+mYsJ+4MxIjrhMhLQ=;
 b=1+UkMaPAnNOtm9/SOkikM01daJz3hx7r5zxNEzNdF/lHeFvqFQKP99mYQb9RvKcS8m
 xnu/+eDT6k3Y7DvGMQHSNLMBUhR2hQVuaBxPnpO29KyOBvRm498fz7+cZZ1VJWwY90QH
 +UQ6n74Jc2VsB6H7T7tvhdD34Gy+vuYaehmqTbgJA7lkXo8b+nIEWI9bpU1NHLOTvnVb
 XI8DD+xNxxSURq2rnXVTiGZOXjEgYQgFnj2pOxy6EN1gSHsnAXDVcSKDXiHl+atVFwiF
 vThdg3H41/U4/ZiN9w68JL4GGWUt5LeHUc2SNTcQeRY3/tMmugbHySseDxhneV3wq2GM
 +kWw==
X-Gm-Message-State: AOAM531+64GBdlnrO+k40cvepOImT2/oEA6dlSQtBc/7HJT2NT38i2Ki
 gfTuT5aho/yIyj4YwB96U/N+jucPmTSVw2wgLPZ3ah0A9VsaQxtch3eSBS0ixy5lAeFFXAur6Ev
 baXREQ6muYJnCut1kg8L412CXvKFOL3wA8Prtmnsw
X-Received: by 2002:a5d:40c8:0:b0:205:2a3b:c2c with SMTP id
 b8-20020a5d40c8000000b002052a3b0c2cmr14072344wrq.13.1648994534315; 
 Sun, 03 Apr 2022 07:02:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwz8TWqYImcP6rcwIhAkGMXujAFPtHd1mtW4Epczq6oGwMPXw022V6Oc/3xXzJvj9XSl1FGwA==
X-Received: by 2002:a5d:40c8:0:b0:205:2a3b:c2c with SMTP id
 b8-20020a5d40c8000000b002052a3b0c2cmr14072332wrq.13.1648994534137; 
 Sun, 03 Apr 2022 07:02:14 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 k9-20020adfb349000000b00206101fc58fsm914374wrd.110.2022.04.03.07.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 07:02:13 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com
Date: Sun,  3 Apr 2022 10:02:02 -0400
Message-Id: <20220403140202.2191516-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: netdev@vger.kernel.org, Tom Rix <trix@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] stmmac: dwmac-loongson: change
	loongson_dwmac_driver from global to static
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

Smatch reports this issue
dwmac-loongson.c:208:19: warning: symbol
  'loongson_dwmac_driver' was not declared.
  Should it be static?

loongson_dwmac_driver is only used in dwmac-loongson.c.
File scope variables used only in one file should
be static. Change loongson_dwmac_driver's
storage-class-specifier from global to static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index ecf759ee1c9f..017dbbda0c1c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -205,7 +205,7 @@ static const struct pci_device_id loongson_dwmac_id_table[] = {
 };
 MODULE_DEVICE_TABLE(pci, loongson_dwmac_id_table);
 
-struct pci_driver loongson_dwmac_driver = {
+static struct pci_driver loongson_dwmac_driver = {
 	.name = "dwmac-loongson-pci",
 	.id_table = loongson_dwmac_id_table,
 	.probe = loongson_dwmac_probe,
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
