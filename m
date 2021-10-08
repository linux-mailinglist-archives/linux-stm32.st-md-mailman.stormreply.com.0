Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E074267D5
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Oct 2021 12:30:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADDA7C597B4;
	Fri,  8 Oct 2021 10:30:42 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D17E3C597B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 10:30:40 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id w11so5839862plz.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 03:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Je7GFIaoe/1MpS2xrn6D1lOO7y+dAVRD95NUMf/V3zs=;
 b=W3psoaO7j99aZioi+//I535eoTtWeVxgqX9OOWNU1jRH8p2nhP9PXXVumd1RUKvROf
 WwFPu7/L7lg5ACpMA/zRM/gWThPt1EpLUf+0sCzYAdXmWBZX7jt+uuIeoNU96sNce1/0
 dpDYb3KnBYvIH8q3j0FwWUTzIGx9V6XjK2/hAOSWlOr8pio5elJcjC/b/D0twaTjjfML
 UnbRd9i4vwkMFxPmofbKOd+JbwOVfwaUy/397DGHdQXANjblt6rzqii9C8YvBZ8QEReW
 jfOUlbRzzz9W8jqftJyMfFSGJaWC6m6ofEAWxZCHYgq82YFBL1Kdb987IuoO89Bbj6er
 JULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Je7GFIaoe/1MpS2xrn6D1lOO7y+dAVRD95NUMf/V3zs=;
 b=czLS1is9A1YdJTQpTd46iT2cEmU1ou+NXzsICRVeUPPDYj7lOfdA57SmiFP+BjyIJ3
 x2eXje3//ppKWNMsL6LCeC0xr8k21AzYTqqt13spWONA0CMoX+kZNc8OqFYGC8Lknhn8
 3/djzMqx5DBbYjEOXDMF/VtRK/HDv2NGKPF7BAIJbhlOrvS/N8rIHZWh6nV96WOOLeeZ
 mWB3QFLSDYJOYw9YBiBhrOr9gRgZ/bC113iG7lXP5GeADZLm/AF6V1ni0LhHVB+vP1ee
 EmHOjwcbYG/Ay0LPG1BmFdGyL0IDCCxlJJ97FC38GIR2Ct8EUDvaykBthM++OvyqVci9
 oNVQ==
X-Gm-Message-State: AOAM532wvwHw4MNRP5DIZKRTB+v67TAQQeeORlUycoqKxpwwrlVKmFuJ
 M1UU0DasiZfFZshuBCQC8co=
X-Google-Smtp-Source: ABdhPJwoOKyB0Fx9ftLPP0D1VaXGs1oDZ7DxpKJbY5v3qnWYR5NxGJgzD1dDHTRblqUr2TRVqrwnZg==
X-Received: by 2002:a17:902:c193:b0:13e:8e77:6c82 with SMTP id
 d19-20020a170902c19300b0013e8e776c82mr8767786pld.29.1633689039547; 
 Fri, 08 Oct 2021 03:30:39 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id y15sm2620151pfa.64.2021.10.08.03.30.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Oct 2021 03:30:39 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Fri,  8 Oct 2021 18:30:08 +0800
Message-Id: <1633689012-14492-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
References: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 4/8] ARM: dts: stm32: Enable DMA2D on
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
v3: no change

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
