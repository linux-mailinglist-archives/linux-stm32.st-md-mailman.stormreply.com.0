Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C13E43DED60
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Aug 2021 14:06:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86264C5A4CC;
	Tue,  3 Aug 2021 12:06:48 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B182C5A4CC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Aug 2021 12:06:46 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d17so1467116plr.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Aug 2021 05:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lwJZ+FRHmPdVwm0/Cne9BWGWHB7Nx2ph+8GMBriVPGo=;
 b=NTem+pkvyz3M/u5VjRQwsmmDGNloiGzV+oR7glIH/HFdYnQ98DNxbSymxCdY3BgM2s
 QlRWpKLt6GwQS5p2H0N3+EC2EmgbDJlRmSFh88V1cwtyTO9GwsjM1vOXa/EzambMhA5A
 3A185UhljFQ5NZqBtccFkRd7hFEbz4aUqYX11e3AWjVdJcE7wQdfkx9te9CfVddqUYHk
 A3UDKpIoTCv10Vor/i8a3hjcHvSIaoRZxchRh090Ky/qt1gg86EjQl8uAr5ILYb/5ioR
 sNLP9OQIiFI0WVyVUk3FucUJdke5raumtLdEuvJC4vgg/Voq15hk6lYLOInoemwzAGqa
 df5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lwJZ+FRHmPdVwm0/Cne9BWGWHB7Nx2ph+8GMBriVPGo=;
 b=XtTOyibccPRu6pXkOp0tCNmwdEIPnJ+dA3YmjLEzTpP4bFyzH42IfR+dwqGwEFMCW1
 RH8IdzdbVozDpQhtVPUNQ5dmXbwP7QkILajUz3iVt83V8/q4MNk0q7YvHbiLtC57eDTv
 udCTwFpdc28Atsykooi671Y0DW1kt/SYYRMekdZJDiNlwREikATuW7FeDR3agDAihJ8p
 q/6UTxgMGtsAxJivh/5QmMpEDetMUwfuEG9SdQNmRRsEC0TcQG/ErF6D+oDkagMxRTwS
 uFQtRkUD3/Qwu/FhYNd777oRqZ22pg9KDW/pSOrEL+fj5EkWnvJrnRMT13fXhwttEDKr
 YjnQ==
X-Gm-Message-State: AOAM532WM2uI1QAV9K8vgrRKOLJsCAMXWCdEEWR9NoxASm2VAJMcyTza
 w9nYquEkb3PSRFTZKOXkrUY=
X-Google-Smtp-Source: ABdhPJx7iYzeWpTrP94hIsTJ4WXIr0TQZsRbh0RmiS5LYEvELWQrYXJERtSsV13WL96l31egt9ZJ1g==
X-Received: by 2002:aa7:8d56:0:b029:327:6dc:d254 with SMTP id
 s22-20020aa78d560000b029032706dcd254mr22101625pfe.69.1627992405250; 
 Tue, 03 Aug 2021 05:06:45 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id n35sm7197502pfv.152.2021.08.03.05.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 05:06:43 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  3 Aug 2021 21:06:11 +0900
Message-Id: <a2147f022829b66839a1db5530a7fada47856847.1627990337.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1627990337.git.vilhelm.gray@gmail.com>
References: <cover.1627990337.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v14 01/17] counter: 104-quad-8: Return error
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
