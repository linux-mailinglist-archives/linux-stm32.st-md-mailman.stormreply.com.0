Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E53FD42D6F8
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Oct 2021 12:25:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC9D7C5C838;
	Thu, 14 Oct 2021 10:25:35 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCC79C5C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 10:25:33 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so4442156pji.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 03:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Kx7tv1rBkw8DYQ/KOQZm+xfGgLpEtL5qGF7IydRoTQ4=;
 b=odyox3Hdfso6cThPmxhQsELofUohRkumvKUVwGDONKl6XJBgBq0Nu3DnYJPpHMOn7N
 KLJhX33idpW0L6YHd2Nk3fQ9n7cKKIOMOc/HCZF3UseHjjKk66Te4ximVm9fTIbUkb/z
 Cl2Qfc0O8l2prQQJtWDi9++PgDcIdUqMy1+qk/2n5i3HHoi4uLHAky0zIZ2hUC1Z4gxj
 v6O/vCDE7IgqG9OrV85medv629eM7fJJZeXISqEJ+TldSgkjs8jzdz7pnnNj94m8wn72
 FZjJTQ0oRWqzmp+QQ3wmaaHdk2WXYv7uUtKf6LodCoPCz3rp8NDRDdJ/zAIQQIWsqPXi
 Pt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Kx7tv1rBkw8DYQ/KOQZm+xfGgLpEtL5qGF7IydRoTQ4=;
 b=mkw2gjmC7oTF+bKJsyOTNjkh1K41Y8G9JOwE67Fhd/COO/ReBxj2ywrFryWYikSoEn
 KrMtjOCqbDKMvnvuR9VWvf6aRlDHnP/Znh4Be4bhDvRqjpsynzg4iHHWu8SKZ9RWp8K3
 wGhRKkyTTQYiwf6hDUzproz/UHThuEStzbsT8XvXLIC2UfqH7TsbJvVOlcpju/QWWQWY
 1mal/Yyuv5A9Pa2aqfqjyIyTqwY5smHBoWa0Zlk4gl/YFQ6OUA9xfgRQ8VBYdQ95H/+C
 us+iP3LacjvBQ+eo4/758w7P72fspjf6RhzTeavGZl8bAf0AesP/43U2GJzAwSAa03Lh
 /Vyw==
X-Gm-Message-State: AOAM530SA/B4dTHW2MQdYGYv/xORJ5iCvEwQJf0X4hBwWBj4bfPz5pc2
 rLvHag9MemI+ceZQpl2yL7Y=
X-Google-Smtp-Source: ABdhPJyeUZOfEEYvhIzWnXhQQ5u2kAOZWHJkWR/DmVPxo5ivQ8lXBAiVo/uzr1vHRT51wloiviWd8Q==
X-Received: by 2002:a17:902:e313:b0:13f:1866:aa86 with SMTP id
 q19-20020a170902e31300b0013f1866aa86mr4112465plc.55.1634207132637; 
 Thu, 14 Oct 2021 03:25:32 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id ip10sm2105939pjb.40.2021.10.14.03.25.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Oct 2021 03:25:32 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Thu, 14 Oct 2021 18:25:02 +0800
Message-Id: <1634207106-7632-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
References: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v4 4/8] ARM: dts: stm32: Enable DMA2D on
	STM32F469-DISCO board
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Dillon Min <dillon.minfei@gmail.com>

Enable DMA2D on STM32F469-DISCO board.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v4: no change.

 arch/arm/boot/dts/stm32f469-disco.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index 30905ce672a0..ba26a3375b0d 100644
--- a/arch/arm/boot/dts/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/stm32f469-disco.dts
@@ -132,6 +132,10 @@
 	clock-frequency = <8000000>;
 };
 
+&dma2d {
+	status = "okay";
+};
+
 &dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
