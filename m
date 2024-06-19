Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F13C790F64B
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 20:46:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F1C0C7128F;
	Wed, 19 Jun 2024 18:46:09 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52338C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 18:46:05 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-35f1c490c13so97713f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 11:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718822765; x=1719427565;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i2ZaP1GIFake6LOudA2QCXAqpH6bV7MuTKm6aVLhChY=;
 b=ety2b1iEio6W5LUwjK8U/pPXOD8zaiawh+e9/SezFkwCg7cWjUcYpHXrcyA3Ka9sBw
 qHZdcKOT7GrzX4ZlU6N9KCiBKxqu+qp7pMKzm063wCMeEoReMIKbESwiBWxLEk8e6y3X
 D92v8QBF1uedRJnKywjm0of4UBxn8q3Pdllhkytlkex1KC0+qEn7YGjBvmWpqCw+D5qB
 a6xpR8YeWYhrC69s/JErhBMIrr0rf/eH+pNfZLZ6Qvb4kE4HRspkCBnWm8v6LteZ9hPZ
 4s7j3WAxuBrURtLkqbMSo6Ycgqf5AFxFRezefAZeiyaRmKeISsmmVjytLMJ19+N6VeBR
 4CVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718822765; x=1719427565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i2ZaP1GIFake6LOudA2QCXAqpH6bV7MuTKm6aVLhChY=;
 b=B2msLgg5mwB0GQc3KqOsnpQyhFsttVbbIln10SpzbEGq36+AnqbatjchG+me1JcuAD
 QUYSylDK6V6C4rDBB2kNHTGjMaR03eHwmFQtxxm0NpIzAnFuECiy2WzYSf8yvh6K3AAf
 a8R9Ip0jbcIqmKWihV/UQ8Db3ormq+UmmHTHaTwwDlMO7p6qahbXqD4ec65dWoTMCGDx
 /PBABH5+g6qAyZzZKNrAli9Rewgc9/OmbHR2Gju/C0umypFvw9kR69nZE1un84qPWFbb
 S5cWNaedixBKkZaOQt/eP72OVtBKVRIQmV3ieJBx68kpzw+G0ZDYG+kySshpA1aZ8RSS
 jYGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjun46ANEdeqZHxKDtttUg7XFON1Sp8wrBNN3NfIO354RPKowJOUhoHwRP65toyE0ElJlaReo4zmDWBMiDZG9OjdsCR4s8NLW7A+AOQUHQqfW75uZA4AtL
X-Gm-Message-State: AOJu0YyBpLKoLcJ0Ci05qq2w0cQbZTGLmS/McNgyRtv6X07NA8u33yGb
 LViPZs/Qb8KZb2LA/kOb1JQSMDttxqi/P0pvPaKlW+B2MUNqpw+ODFhpj577efE=
X-Google-Smtp-Source: AGHT+IFHpgEdcFxPeHRNEDbOoGGaHbIDTAIRX4vjn/KLZAdtQ8VVBfo3vmxuKjBv7nIHdarP5mwF1w==
X-Received: by 2002:a5d:590c:0:b0:35f:1eba:cf66 with SMTP id
 ffacd0b85a97d-363199905dbmr3314238f8f.61.1718822765554; 
 Wed, 19 Jun 2024 11:46:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:991f:deb8:4c5d:d73d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36098c8c596sm7594156f8f.14.2024.06.19.11.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 11:46:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Date: Wed, 19 Jun 2024 20:45:44 +0200
Message-ID: <20240619184550.34524-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240619184550.34524-1-brgl@bgdev.pl>
References: <20240619184550.34524-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/8] net: phy: aquantia: add missing
	include guards
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The header is missing the include guards so add them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/phy/aquantia/aquantia.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/phy/aquantia/aquantia.h b/drivers/net/phy/aquantia/aquantia.h
index c0e1fd9d7152..b8502793962e 100644
--- a/drivers/net/phy/aquantia/aquantia.h
+++ b/drivers/net/phy/aquantia/aquantia.h
@@ -6,6 +6,9 @@
  * Author: Heiner Kallweit <hkallweit1@gmail.com>
  */
 
+#ifndef AQUANTIA_H
+#define AQUANTIA_H
+
 #include <linux/device.h>
 #include <linux/phy.h>
 
@@ -198,3 +201,5 @@ int aqr_phy_led_hw_control_set(struct phy_device *phydev, u8 index,
 int aqr_phy_led_active_low_set(struct phy_device *phydev, int index, bool enable);
 int aqr_phy_led_polarity_set(struct phy_device *phydev, int index,
 			     unsigned long modes);
+
+#endif /* AQUANTIA_H */
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
