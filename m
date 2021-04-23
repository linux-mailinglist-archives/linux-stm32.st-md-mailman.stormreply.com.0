Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4972369031
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Apr 2021 12:18:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D340C58D5B;
	Fri, 23 Apr 2021 10:18:22 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A331C57195
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Apr 2021 10:18:20 +0000 (UTC)
Received: from mail-wm1-f70.google.com ([209.85.128.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lZst9-0001bM-Kx
 for linux-stm32@st-md-mailman.stormreply.com; Fri, 23 Apr 2021 10:18:19 +0000
Received: by mail-wm1-f70.google.com with SMTP id
 o18-20020a05600c3792b0290128219cbc7bso6870949wmr.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Apr 2021 03:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EC3zoWq2BZfFb/EWRvBNqc9bpLHCgYUaPIXnRPSJVLg=;
 b=RHRX8m0YhZD35LGr0lVyn4Zzq9fL7+akXvAR/YS2nTz37w6BVXULL7S41pIMcuEKaO
 WHEiYHtMnlxt5SyVXCuPSJI5wC6o0+PY7TtEi7G5wYPDdYqInuH/Ca0zLsvH5TV5oUFo
 W+PbetwZUB1yh5xZs4xIb/WfUPXHNeQJO/+kYu0TDfdLP7zQirVetz6R/DMyAisva8WX
 pRWPyfdXXuLKpYTKPXgXO/G42ug5n7HBmVIEI8nhW/U8UlEY3F7N7dcxTwGGCnGKq6ju
 Rfre+YjhT7eE/vWBd9EG9VaPKA7Jzg11RRt86+k0RygALDqqu8KhgNUAhtxMGrQF2kFB
 d69Q==
X-Gm-Message-State: AOAM532FWK9n1MdGJjudzHkV3h7lkOY5byAtiucIwD+jCnTCjtBGobhH
 qi5Og3rRrItctZDtbv4Mi2qH7YCSectDlgGYDCihiegjFGobyiv9beat6nG9egC59h3hY+hnKpW
 ScIHu1eS3M4cvRdCVSb/uWKjEkroPU2TeMF6yEaegnkSYB5+UyTl11lDJgg==
X-Received: by 2002:a5d:6ac6:: with SMTP id u6mr3767667wrw.290.1619173099133; 
 Fri, 23 Apr 2021 03:18:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwF9sI9bCBwQSREZbDeBLDvxvweCTOZ8qI9QcsoUrGVo9CdTEpRonVxU+F0lh3KuSjDfn1b0A==
X-Received: by 2002:a5d:6ac6:: with SMTP id u6mr3767654wrw.290.1619173099028; 
 Fri, 23 Apr 2021 03:18:19 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch.
 [188.155.180.75])
 by smtp.gmail.com with ESMTPSA id k22sm9011546wrh.5.2021.04.23.03.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 03:18:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Fri, 23 Apr 2021 12:18:15 +0200
Message-Id: <20210423101815.119341-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210423101815.119341-1-krzysztof.kozlowski@canonical.com>
References: <20210423101815.119341-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Subject: [Linux-stm32] [PATCH 2/2] memory: atmel-ebi: add missing
	of_node_put for loop iteration
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

Early exits from for_each_available_child_of_node() should decrement the
node reference counter.  Reported by Coccinelle:

  drivers/memory/atmel-ebi.c:593:1-33: WARNING:
    Function "for_each_available_child_of_node" should have of_node_put() before return around line 604.

Fixes: 6a4ec4cd0888 ("memory: add Atmel EBI (External Bus Interface) driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/memory/atmel-ebi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
index 14386d0b5f57..c267283b01fd 100644
--- a/drivers/memory/atmel-ebi.c
+++ b/drivers/memory/atmel-ebi.c
@@ -600,8 +600,10 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 				child);
 
 			ret = atmel_ebi_dev_disable(ebi, child);
-			if (ret)
+			if (ret) {
+				of_node_put(child);
 				return ret;
+			}
 		}
 	}
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
