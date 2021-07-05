Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B26373BB8B5
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Jul 2021 10:19:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A467C57B5B;
	Mon,  5 Jul 2021 08:19:32 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA86DC5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jul 2021 08:19:30 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id o18so16974043pgu.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Jul 2021 01:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lwJZ+FRHmPdVwm0/Cne9BWGWHB7Nx2ph+8GMBriVPGo=;
 b=qghfU1Ic26rrzYU0rkpTSWDcEhb5c0NOIgjgWfhYyp5axzpVaF2tWiTEhum0GRfWhM
 Y0G/UPaghUKDzGYLyilG8VdUkM8yhrjsPXIDct8QTi8xO50pcLumVGtnv6acUX2ME8Qb
 g5OsIjaoRxtxwjVdUsiXXXmt1Y9sVN2ubtppGC8rqkBnyvD6nQ4l3ZyJ/LsnZYdO0K+2
 C7UFf0YQDr6LeFAGJnVuR2dOvnT/lRdpz+m93stZPw3eTbvQ98EvcEenTRXWk4SlKL0U
 bj+hY54Hif9QH8SuDY71yRHkWQwHug7w4wVQ4IvCDhzVrhXqlc5QkNQoRyqooJlzwk4N
 uAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lwJZ+FRHmPdVwm0/Cne9BWGWHB7Nx2ph+8GMBriVPGo=;
 b=XUfTzIwYouqrG+PYg0dhKjzWzPDM04KpAF7KKvoQGX0sdFhKZa1lidqptCNiHe8m8O
 W5OIfjBllGYwIPXc+zDJLvklmXlkEksaMoAnv+AKRtxeNCbkgJnsuerdaeqltb4V6cEY
 1yah8nuxmEtqxJ0U3APMSGHo5AubaEu4NtqGmripnMHEL6nLIP59td7ixqLVT+i0L196
 WJgXkxVqG1qQQ0+h/ngmA1kAL7fvR4nmjtpbruEPUAIWjEbSuazdG1OyWOt/Db1aYR0v
 1W0yG9Ku0iwJPynqqqVglXL38VwRY+M4KWQqAnRgR5flKk0Ihw3B9GF4iiXIR1pfdM3L
 NWEQ==
X-Gm-Message-State: AOAM532HlxpTUz+/hqt5bqqoam97KzUXHYN3Vh6vb/wfOXsQ9K4RmbW0
 E4h8OTND2SChKQRv2IR8ibA=
X-Google-Smtp-Source: ABdhPJzDzeeL4WGvM1opfkx9OeUUJ5r5Ef7PkA03J1pzloGnM3C4c5JHEqnlXWV5KzY6fSkJyIDvIQ==
X-Received: by 2002:aa7:943b:0:b029:321:809a:f0b with SMTP id
 y27-20020aa7943b0000b0290321809a0f0bmr794524pfo.32.1625473169361; 
 Mon, 05 Jul 2021 01:19:29 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y11sm12209986pfo.160.2021.07.05.01.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 01:19:28 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Mon,  5 Jul 2021 17:18:49 +0900
Message-Id: <8a7614a06dbc60650fe60c31fa47d398890200f8.1625471640.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1625471640.git.vilhelm.gray@gmail.com>
References: <cover.1625471640.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v12 01/17] counter: 104-quad-8: Return error
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
