Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1F8319DFD
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Feb 2021 13:14:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87683C57B5B;
	Fri, 12 Feb 2021 12:14:19 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2DD1C57B59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 12:14:17 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id z32so6473776qtd.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 04:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zYNQDVBttWuol9Nr7vZ9TZ0pD01e0D8AxvqzWcKy2yQ=;
 b=aM0sxgfW7EgiObp2+TZrx7/lpr8sKMXQGE4XaF94+aL5T5kix2W8sOsAr8u0jENXVE
 7ifeOIOq16yrovXrbb8oiyDkt+ArzI+PtEZez5zjEvlJFN3ZFsbl6RvIAoza1oNUOCX1
 olEGary8VS5UP6uiSlIR5HLqcnjrgFztryrCUkJeSMUKk70QmoHERtWMIrvjqQqulxX0
 xMyTRO5H7Say1S18oBN+GhBXNe6kuL1byvWTOHo9i5zCEEshHdM0dxUrf0Ud9pvL7rOj
 OxFXDTRj2LBOa+80VR1/rN5SRZ27oq6IRHXOM8rvgNHGumKKjlrG3dNbN0m3JfnPzCSa
 zSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zYNQDVBttWuol9Nr7vZ9TZ0pD01e0D8AxvqzWcKy2yQ=;
 b=adQgwELV6CMufgY2b9fYK2TLN/3TBqpYAeew60tfjLe6FS8Ao6oEw3AbWBftar6FLx
 A4M2yHuMI/AzkpDWaWj+TO5d04Mr0L34+sgqPDUwfKpwbiBtta6qOxLOUNNKBd2mkXzN
 ImtKwO+gkL+OVjM8pU6V9mt55Z5gAV41uY8kUt4EP+DxhEnDDhNfTxDzi5LX8UFO5gJ0
 jBS8YJO8NFWV96xsFhRg3A7dxa/rxlCL/OjcvEiH1/jVcGG72SCvR5+gjcthYCGtue3J
 +cOXF2lInwgnPp2BtedAf+Rs2mGKyssv/eQvCU+hw3L5VksrAGb9Quug3TGNzDjnP8Zw
 Z6ZA==
X-Gm-Message-State: AOAM533MRsoED9OS6VebrK1qJ3wvJeqHrSSLDTDHbMtf5FZ8fkQOkZEI
 8f4C9+BudgR96vPOeXp1QLc=
X-Google-Smtp-Source: ABdhPJwnyJ+R/neIAfUAIjSjngmjsVTVRQEo+iuZDMXLDZrsRJ6K4GTnnYIMjHvxF2iySoUNHUa4Gg==
X-Received: by 2002:ac8:5894:: with SMTP id t20mr2078682qta.194.1613132056934; 
 Fri, 12 Feb 2021 04:14:16 -0800 (PST)
Received: from localhost.localdomain ([193.27.12.132])
 by smtp.gmail.com with ESMTPSA id y135sm6278534qkb.14.2021.02.12.04.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 04:14:16 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 12 Feb 2021 21:13:27 +0900
Message-Id: <2be0c071e7730ea16b8faa1efcd3d0d908e7f9db.1613131238.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1613131238.git.vilhelm.gray@gmail.com>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v8 03/22] counter: 104-quad-8: Return error
	when invalid mode during ceiling_write
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

The 104-QUAD-8 only has two count modes where a ceiling value makes
sense: Range Limit and Modulo-N. Outside of these two modes, setting a
ceiling value is an invalid operation -- so let's report it as such by
returning -EINVAL.

Fixes: fc069262261c ("counter: 104-quad-8: Add lock guards - generic interface")
Cc: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index 9691f8612be8..f0608b21196a 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -714,13 +714,14 @@ static ssize_t quad8_count_ceiling_write(struct counter_device *counter,
 	switch (priv->count_mode[count->id]) {
 	case 1:
 	case 3:
+		mutex_unlock(&priv->lock);
 		quad8_preset_register_set(priv, count->id, ceiling);
-		break;
+		return len;
 	}
 
 	mutex_unlock(&priv->lock);
 
-	return len;
+	return -EINVAL;
 }
 
 static ssize_t quad8_count_preset_enable_read(struct counter_device *counter,
-- 
2.30.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
