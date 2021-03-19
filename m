Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6229341A91
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 12:01:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72DEEC58D5B;
	Fri, 19 Mar 2021 11:01:21 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5960EC58D59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 11:01:20 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id ay2so2781862plb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YP6Y0iUlFGoxnb33nwnYEvQ4ZjRZgtWw9rrllhcAce8=;
 b=EfPTCnysQ2SO1zX7Yo4KRrKJd4T+NRxlDLzkn+xhVOtwG47MHAVbglbAXMQq/g7KTj
 e0ZUMRJrpemIZQRhRm4QevibXClI5xo33QBIsockGMprJ3UbtUz+b4lc2KcT2+bZserS
 IcUG/2q9s3Li/oSPW8Hha6ySTnMhg+/QIf0/mUIlYvT9NC15hMP9ZjenhUVJqenSXovu
 ZLj42xDF/jYkNMRWhGg+DD/QohSNPL4RKiEpMDMOh4wTaoBe6l05fEZ5ERgEMWnxjwrP
 FkEguiXLcwijo8aOSae1VgrxLrNyEKZkSumeOOEAK6CCH6+UHtFUul4dHZ17IUg+6gjB
 Vwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YP6Y0iUlFGoxnb33nwnYEvQ4ZjRZgtWw9rrllhcAce8=;
 b=UIE/8O+D0DDP+v2mrnAjE4dfkcZtPCtji9g6xIhWOC+W6OODU7MZOIhtn+tp/vCnU8
 RQ34GZYxBB7OU10qH4rzBUFR9+FqdGEGadND89JV4bsfUZMD3ACLPjuYgrxfjgpQOK2a
 I2l9+m44TkCyCWQV5gYp5jf4RhKSdBdr12lsCW0BULKOn+ydhkuPJFbO4Z5r0rJyitbe
 XKODlJPmuQPndHA75FkB1Z1BhxJiluJPfg8q8AT9bZxoWaVnfvajLFCRjEPrbAmnK9ED
 TFrbngOfekaRQp8SiyzlCl+bgDKOXnOluY7Y2bvorQVN9J2Be2AVjECfcw3jBivY9DQm
 mMPg==
X-Gm-Message-State: AOAM533Y+WgUGymZEHfefUMGYZiL8S/yDbn3zZ+5W5r3pbrPZ1z3whe7
 g2rxRkkYmCqORDqB928LNG7muPAXOMWkIQ==
X-Google-Smtp-Source: ABdhPJwEkXVpf7bCTq0t4YWhofrnRE9O3kVRUx9pwa8eP8pu6QtVdUaaJgXFqGgmXc7XvdKM4+CfGQ==
X-Received: by 2002:a17:90b:344c:: with SMTP id
 lj12mr9432230pjb.208.1616151678943; 
 Fri, 19 Mar 2021 04:01:18 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id i22sm4879042pjz.56.2021.03.19.04.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 04:01:18 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 19 Mar 2021 20:00:22 +0900
Message-Id: <e53df4416573f16069090f4c660afbd8d501f2a0.1616150619.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616150619.git.vilhelm.gray@gmail.com>
References: <cover.1616150619.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v10 03/33] counter: 104-quad-8: Remove
	pointless comment
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

It is obvious that devm_counter_register() is used to register a Counter
device, so a comment stating such is pointless here.

Cc: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index 9691f8612be8..4bb9abffae48 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -1082,7 +1082,6 @@ static int quad8_probe(struct device *dev, unsigned int id)
 	/* Enable all counters */
 	outb(QUAD8_CHAN_OP_ENABLE_COUNTERS, base[id] + QUAD8_REG_CHAN_OP);
 
-	/* Register Counter device */
 	return devm_counter_register(dev, &priv->counter);
 }
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
