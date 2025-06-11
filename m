Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1EBAD62BE
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:43:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB2F1C36B24;
	Wed, 11 Jun 2025 22:43:10 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91752C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:43:09 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id
 5614622812f47-4067ac8f6cdso245682b6e.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681788; x=1750286588;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wFtBqHig8Fed23T8+cfJndFoBL4sOX9Nb3YXu3tizw8=;
 b=djy1Isdr8WSByCKWXRihK3SU2pUnec6GpoijhJX2HaOss93XYGNsa9EOIXzTY9McLo
 nhBR5sCwdRVfHNGe4D3dNRxFBG6tU4sNuncOC6rbuU26BPJUmD393dw8HDNvBgwe45mH
 B8v8kGSgtbXptr1geY3XGB/uA/9ZnLFTyukCYeUNU5D2UeAxGD+OnCOpPVvrunvBm7Ek
 QKDCuwEb0E31N34twClgP9UbPqFneA1+1vyR2Mm19L47CUCPc57D/zH06r/M1Gzkbn7W
 PQrfp7wUPIutFYPbhRnOEsdvx4zdks7qUh4vzC6w2co+TfVGK5w6cvxCuMi+NdexyWfy
 O5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681788; x=1750286588;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wFtBqHig8Fed23T8+cfJndFoBL4sOX9Nb3YXu3tizw8=;
 b=rnSZ/SeVnYBx3YlN+m0bN30V+XyRcAbcXk3aRWGKKUUiRZBJR4iuU2aGqZcTpLcQKQ
 wCzHVIK7CMLtQGgk2JIdf3L+Smd3v1Fm0SZriXY4Q2toocv8q8eG8HpjP/bdkOLsrHxn
 1/83aT6C56U9bR8lQl/DMF5M48zRQDZVkai4bNTbBmXm5YroYV56VrmHcJOxTW0G7WMM
 P9Ok8ASmiI6YFocxdriod9WRaGXKyPy5KXyuG1idmVFRE/OqL6TT9lHdWnXBc99vjev4
 KBzF9bYyGB5/cZRoFiZd0OTOW6Sc41LpliViEV7V6wPayOuHsvy0h5keEY3OwQcl8IyT
 QrkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiKXB4JcYZr+puBT96C5L3bJpZdr06SwAkL5hIgSTgEWRLS4/KQkiGVsALkovtw87oMA4ynLJQWD0fuA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx75mVkSVG0MKZ6lbn0UQljsTOJRlHnm+rnI5EvRfVf8MWSs7+F
 2L0cxXwLC0GSfhZzdmKHMsGSMmUSwhxJTq4hF2u8503OQUz8Iobim9Q5ldlTboLU8gM=
X-Gm-Gg: ASbGncv6GEyQdLAeVGto6MWj57AJDh2Z2k9ZfcjMsh5pw5fcDKliHcN8atRAKuYAvP8
 TvbXfdiC3eo4eOjgeplPrXO6+qTP/s4isWFQuNncho9qm+FbPVxXZSKRLLewoilJsd9iIpIEOfK
 3mZGjcRg5yCUVx+m2n4IUDZA/Tk6UwhEWHdIQ/V4d4lcuyHTXPQqaoZM1Sk81XKp2NvioIZRlg0
 XuXvDZ52O9g7Oe+RGsDpw7AXrTevc+PUBSElvGs9JpER8DmvS+H6tge1XvAq3I1AaiegQw7NdaA
 PD9lr+EQJ8pso+jX1vTFFH/lU4zehCjROnFsKJd82bmftPheutARBSoY82nvLvbJrYHd
X-Google-Smtp-Source: AGHT+IG5W7kH4+hxgdGC5cYojtw65mnpGPuM8rfmDxflahn9sv2QuWNjrWb24/1rv7CIa/pXKjlkYg==
X-Received: by 2002:a05:6808:238c:b0:406:72ad:bb6b with SMTP id
 5614622812f47-40a66adbc50mr575420b6e.37.1749681788466; 
 Wed, 11 Jun 2025 15:43:08 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:43:08 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:19 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-27-ebb2d0a24302@baylibre.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>, 
 Roan van Dijk <roan@protonic.nl>, 
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Mudit Sharma <muditsharma.info@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=797; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=H2LBBJsUJiIc60MPGSJU2UBb5KBWsOEZhj5u9YgC6RQ=; 
 b=kA0DAAoBwswgAf8Bj8AByyZiAGhKBjfIgQfT+NI7ZBHF6EqEZASLyMpQI6Xmjd023Z/HVL55R
 YkBMwQAAQoAHRYhBOwY2Z5iDoPWnNhomMLMIAH/AY/ABQJoSgY3AAoJEMLMIAH/AY/A1PwH/1/i
 g0gWTD7ZaRxp/hx7awW+jIFoQGzh6qTEbYue/UlgwqG8WG/qXLGJtE2TMNEr4xak/0DjEmHUQi0
 6TuTAR57tOQGCcFyvgFcpEHWGzydpL1M2UuzsT6SrTEkw8xRBk1Sjru/5SPcKg3fG0YQNSV0u/u
 y6b5ToQ6S7Fyrp/CQ9iLat82yU2B4m6UeVvKbVnUqQKf5W6irfzYAIiHsGm0U6Vt2JB0bw/xENa
 0AvOII7wKZ+yCTn68OJNIUuuO2GriVCbnOFFVj9k1xyiFlL1+f/o9rELPgpsoL23p4rJAR11ciY
 NhG+Uu1ETT3wLhRDyyFvmrfMPWxajwsHHsexQU0=
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 27/28] iio: proximity: irsd200: use = { }
 instead of memset()
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

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/proximity/irsd200.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/proximity/irsd200.c b/drivers/iio/proximity/irsd200.c
index 5e751fb0b12fb2167f4d11e814915cb2761ab9bf..253e4aef22fbdca84a0f8393d6f423385c8dcda8 100644
--- a/drivers/iio/proximity/irsd200.c
+++ b/drivers/iio/proximity/irsd200.c
@@ -763,10 +763,9 @@ static irqreturn_t irsd200_trigger_handler(int irq, void *pollf)
 	struct {
 		s16 channel;
 		aligned_s64 ts;
-	} scan;
+	} scan = { };
 	int ret;
 
-	memset(&scan, 0, sizeof(scan));
 	ret = irsd200_read_data(data, &scan.channel);
 	if (ret)
 		goto end;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
