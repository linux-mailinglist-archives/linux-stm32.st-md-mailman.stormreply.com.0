Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA1FA7D057
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Apr 2025 22:35:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B03E3C78F85;
	Sun,  6 Apr 2025 20:35:36 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42915CFAC4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Apr 2025 20:35:35 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3912622c9c0so393757f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 06 Apr 2025 13:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743971734; x=1744576534;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vqE+fJoQoP5EIZsKKCKpe2hB/iRkIebJfJA+OiuqQwA=;
 b=HUcewXE5Lq7CBEjMZGmT91VrOxf0ik0BZPRmqcRZ0+/LDg0Tlg/3StI8FYymcT4TZG
 mHMQk3iorjPiZHKzTHx0srxtmMLZ/qhGi4zLGkAr9WsRwSOFMW+0NbayR+AnMJ+CfJY/
 6bhgRzgTfuwBLr7RKqeTImsHzmSILxonBiaGcePVU7DCma05bPbtaG85ZPSdzuGTQNgP
 f/7sR7wbkjX2vjW0+n9cuU1JHQXQgNrBWoos2YecKbRSJtLsBvccuPok4Uhe/+GUjTEZ
 FwMQhe7AK1UnztsKfSFdMKrBD9BTo1giv7SdidB5MTOEDxbQT2++pj7gZ2Yl+PK9HAii
 V71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743971734; x=1744576534;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vqE+fJoQoP5EIZsKKCKpe2hB/iRkIebJfJA+OiuqQwA=;
 b=jk/v8JvarIEKWYKVplYspP/SlVtIY8CEwHPGzInX8NMd9RzROOuAL3yTDuxjYMXdMh
 IxJRL6Sm3dyaq4myt4RaCwncOq+S0cYk9fJMV8Vp5lyqPqReWjg0oPjevA2NemU9Fwvp
 AcTicZ1l/oF27Wr6x/2Fhy17SeNi/y8PGi0xo7zth+vYId4z52o1NBq3m4LHGsmJWSD8
 ZV4b3vObg7nXjK3GZDZPnIdbbU8RZvPzjIsOKWZwTO5ZheygGIPLH153EOjbgYOkEjXh
 3nlUEsDMsX8HMW122+J4U+Whb/sbblnS9RSJ6EO4VqDi1vze0uy7ndFNegw5YclzdZ9G
 BlxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqSCzNCfeq5/q+/bAeMroK9x/jZOmzsujz3RH+mVJ28FKnCNCJYHD6gsijPi1STX6K92eLnfDJKnwuUQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxnrlgOdsm5eepMedz179ARjSLUP/QTOBVHWb8FjhOBiItYw30p
 5pYGQXqRx10uS46n8gSGGADoZjzTk7GtfcKLsY0F9NK7qIfDZbTYRMT13ZZOR1g=
X-Gm-Gg: ASbGnctWSjNFSCSGhQaR/27eHC6TU6irpdBBc/USDIlj/0OGwvnUKYrQl5dTJYTHDO8
 5mNo0W8C+HTtByE/X9bDr4ec1IbcW2VsMtIgLr/3lyzbgoM5CNyvbnwVF9jwlmmLfRyCVLA8m64
 BOhlr5RmPm/lAeqZoeTZkcU7uic/Of8gdyI3owDB+v1gB/C/E3XcD9dxXxS5cRKz7cD8EOI0xll
 vyrO1tJc0epiq/AGpjT2sYCCjUwtlnwrPTV5je14b9hSkx0NF2bykWboI4qTKqZub2rvQGSAPKx
 7zIQkFCxrKJv/kmNbBWqPd6vRQoYgopSRM/sG9RMRs+tdYF/eG5fDg==
X-Google-Smtp-Source: AGHT+IGnWAB5N19dqxV+uf9H1b+D2cecFF/JdZzD4NafcpKENqOS32Y9IbVOYHktlCW19MYWLq1llQ==
X-Received: by 2002:a5d:5983:0:b0:391:277e:c400 with SMTP id
 ffacd0b85a97d-39cba93faf2mr3373054f8f.13.1743971734540; 
 Sun, 06 Apr 2025 13:35:34 -0700 (PDT)
Received: from shite.. ([178.197.198.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d7c6d838bsm38022f8f.69.2025.04.06.13.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Apr 2025 13:35:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Sun,  6 Apr 2025 22:35:30 +0200
Message-ID: <20250406203531.61322-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 1/2] watchdog: stm32: Fix wakeup source leaks
	on device unbind
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

Device can be unbound or probe can fail, so driver must also release
memory for the wakeup source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/watchdog/stm32_iwdg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index 8ad06b54c5ad..b356a272ff9a 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -291,7 +291,7 @@ static int stm32_iwdg_irq_init(struct platform_device *pdev,
 		return 0;
 
 	if (of_property_read_bool(np, "wakeup-source")) {
-		ret = device_init_wakeup(dev, true);
+		ret = devm_device_init_wakeup(dev);
 		if (ret)
 			return ret;
 
-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
