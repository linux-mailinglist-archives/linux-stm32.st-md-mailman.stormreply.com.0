Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E58341A92
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 12:01:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17F36C58D5B;
	Fri, 19 Mar 2021 11:01:27 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62F64C58D59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 11:01:25 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id x126so5628604pfc.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1TpNtbXoxyIjRd7QIp1WNUGV3OlR+l0VzEx11bA72Sw=;
 b=bGsyS/ntHB5J/zGOzWa3dDyJ+RSrk0AxzcTTabPa/qWzSF3DAQkcBBYPCERu5rU5/L
 /Tpp7DtV9HaJHtMyRTwa9QF+cO1KFylnYYX0zCk3n0pCx8jDthkoiATd01qRCQl32SoJ
 rBFrtroMaqCCnK8fAh1FJhtZhtwxb5AdtpztX4O3YecnWYidtuMs+j3td9/dI1tAXP6l
 YEfWvLnIbxnmsj2t9dvTXyh//iJksnwS3T0AcYJcLvo+ZZziwXXeqaEOjXRlP28GXWMB
 qztwaapx0RSzcWGJBFDxMY5J3IDt3c1QgW459KejscA78lWdxtZxgJGXLYOXKCnTxLCI
 nYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1TpNtbXoxyIjRd7QIp1WNUGV3OlR+l0VzEx11bA72Sw=;
 b=Yp7X4ASG4jSAPuEJi115bGfu9c/BgTyyG2L0HSj8UE+PYWtk2aCSa/Q0rrWcuHuUZM
 gLrp5BM4JtdkHopmssX2+s8XCnduO5k/h8yF+Z6kb9UE7Gk2qdHtOmzqFgNtogjNTQZ+
 MO6WqccFOZel5mO0xKfvsG+fG2RkR7WemAY/C7Kwre+kxck+kIKvY3BAJ3nMhQ8hBXNe
 E1GiBq14HnCyLt1EpjeP9zktGLbnD6YAint/W/KqqhoCMVVxE615QWqgtOKf3QqR1s/P
 d/CQM7VwCBnta2RtdiDiHLjxzXhvCgkQQ9UF/e+KRb1vH1NwUk1y7xg4MsDxdjFzMhwb
 /XAg==
X-Gm-Message-State: AOAM532UxkQsumD/lgA5YAVJc7cqft4kT+0vAa1ZxVzUMWUNlNKUL3uF
 ssQ35BtioiZ0GRK5rfbkEVQ=
X-Google-Smtp-Source: ABdhPJzxh9zmvHiKp9AVLB5uChGOrHdkMdux+y77XRdYYBPJAs8ueovVpELDjCWf+ul14cb+iAaEDA==
X-Received: by 2002:a65:520d:: with SMTP id o13mr10965823pgp.57.1616151683853; 
 Fri, 19 Mar 2021 04:01:23 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id i22sm4879042pjz.56.2021.03.19.04.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 04:01:23 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 19 Mar 2021 20:00:23 +0900
Message-Id: <98676f9a2e9cf991d7a002b3b264cca774e5b3c8.1616150619.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v10 04/33] counter: 104-quad-8: Return error
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
index 4bb9abffae48..233a3acc1377 100644
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
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
