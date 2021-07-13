Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C962F3C6DCC
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jul 2021 11:53:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 682FFC57B6F;
	Tue, 13 Jul 2021 09:53:48 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 117E8C57B5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jul 2021 09:53:47 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id n11so11820980pjo.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jul 2021 02:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lwJZ+FRHmPdVwm0/Cne9BWGWHB7Nx2ph+8GMBriVPGo=;
 b=FgqZxAVKxvO+GCExH/zFMu9YuTw8GDamGJ/5dup4vhtKhwmmzjeYgMHLJsacEIqAC7
 yHJ7wXfseuCn0kxxJZRhz0kcpxVXpX21zWkUCKCKoIJCYxiW8d3P1aYJ2ULsd6HwOTGy
 /y+l0oce8pwfMDr8QT46b8Fb6E28WbNOauPQAeB0dkLqXpCrpcFqxQnHqiqUFYKh+f/G
 gVMwkS27jhQBD8ROukvn8RUEYmlh1TEJWgelVGy3ELBgQN883/H72pMhAyrs968bKNMj
 K/EOKAoBaagMqRMMOSVFkEfG2XbEXdfi3RXVLqv781vdlN8p3rLvdKHsAHU24IkplFCn
 HFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lwJZ+FRHmPdVwm0/Cne9BWGWHB7Nx2ph+8GMBriVPGo=;
 b=IY8qe5cvV+0KwiEmsZppt/WYaVWK03DWzCa0NyF4HEm8j6IV/1JVRoTsUW0furwfAr
 jl1ZfDWjQNbvKco2aYeWh2ofTbcn8k8i47w/7Q0uWDliIRUNGJUUMzeDhBpyRTiPEgE9
 C7UO0BEUOxDzUUvWxpJngU7feoMlwAruE2c5XqNjgjBnV0Y9cJ4BorF6erHxTQnMmE/9
 JUyQ4rChcXgScp7SvN3V+Jjs1FXroIA44OcuwdzEnnOVT6PSUx4d/X0/pfz24z9E/sO/
 cGXtsrYsgiLUeQxWA3EKO9SBtMyXz9ruoD3ZF0mI2EmfxbgItvp8cRMiXDBnVfiVVAao
 CPhA==
X-Gm-Message-State: AOAM531vwOtVNqvXt+hJC4xRzCSAKRcEVRO7kpyb4jDx1gwMYtOYxbj/
 G2vcajU/a8rVPckDv2RygHs=
X-Google-Smtp-Source: ABdhPJyZJg0h7/PGYh3gQwJmWPbdH2EnidAws8IJ5RP3cPzf0/4r23v8F6aWYAnS6YeHPh6wmMpmFA==
X-Received: by 2002:a17:902:b193:b029:11a:a179:453a with SMTP id
 s19-20020a170902b193b029011aa179453amr2841400plr.69.1626170025528; 
 Tue, 13 Jul 2021 02:53:45 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id f6sm18153854pfj.28.2021.07.13.02.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 02:53:45 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue, 13 Jul 2021 18:53:05 +0900
Message-Id: <5a9678944e953d23e0ee2a53d3c61e700cb1cd89.1626165765.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1626165764.git.vilhelm.gray@gmail.com>
References: <cover.1626165764.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v13 01/17] counter: 104-quad-8: Return error
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
Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index 09a9a77cce06..81f9642777fb 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -715,12 +715,13 @@ static ssize_t quad8_count_ceiling_write(struct counter_device *counter,
 	case 1:
 	case 3:
 		quad8_preset_register_set(priv, count->id, ceiling);
-		break;
+		mutex_unlock(&priv->lock);
+		return len;
 	}
 
 	mutex_unlock(&priv->lock);
 
-	return len;
+	return -EINVAL;
 }
 
 static ssize_t quad8_count_preset_enable_read(struct counter_device *counter,
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
