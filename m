Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A94588C1A
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Aug 2022 14:30:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09FB3C640F9;
	Wed,  3 Aug 2022 12:30:22 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF42FC640F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Aug 2022 12:30:20 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id c22so8633450wmr.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Aug 2022 05:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g9heR4TjDoATr+7jD8mL256mkC9k3Sq6Q/fNFgtLRcY=;
 b=ZWCrDmJsaF5rjaaPFXOCezlG5Hrqxmd82nrthFSbU7rDxjbViSCm0+ug895yBlMx6Y
 O0jzll/IIgV/E6VOt0upI8VMeu3aRPr41B0d6MxNWKDOz95WJwkedTKRWVCu4OIPg2qH
 hlMN/3G9NQjJkpU4uT1048gpDStaZ3joVuzb9O72zv7+YB+WOheB3YY/2cOoA1BSA8Fr
 zFpQcmqnzsnaE6wttEL/FK4F9VGcaqOuSCjeyFZNiUvsW3f0mXc7iUssweq9FB16uB7w
 4SahDV4gENBpOo3hiz8NiYUnYSTbNA5MKlWNTlSwDH1InQDzKgOQL6+bCSGoJX5vSdeg
 3sxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g9heR4TjDoATr+7jD8mL256mkC9k3Sq6Q/fNFgtLRcY=;
 b=2P83t0VdO3HS22j20i4ohD/wNTPlNM2lgvY2RHYX8u/iAvJEeTJ+rMOS+ucit5eCiH
 uKsJdFTCEYxe2FgI4jBNQ7xVCGXcK7j3zFHwZAP9mdS3qw2louEFVcOoDvPqlatMDzas
 CDwq86a8EQCLPhneDJ+cnkPpmWtkMnu2tDS4vOa0nYFKF46Qvd+84lNCGXAaiZhT/tcH
 SWCJl15ZcfADFug/bzbz8kCIajItkSBZyqLVV9f/xMavM3FV/6Z0wUpS69KGmDnx7O3p
 7qBbbs4ifMD249AR3+6L49pPy06caQ+CwqCxuljHQU1gOwwoptyTKmpQKIpinE+Kn5KG
 SXhg==
X-Gm-Message-State: ACgBeo3o8tTcg3kZeAGGEIZQIC8igT2AIMUEVXmhKazYVHq6sV8y2Okg
 ikhbrpUt/haTpcg6siBnod4=
X-Google-Smtp-Source: AA6agR7wc8Pn+zYiaa70OFAL33BgIf99foNkbLKIHZ+NKhsuREFIuv3RbzZoZ7tixwIznPMyvCeHdA==
X-Received: by 2002:a05:600c:511f:b0:3a3:254c:b079 with SMTP id
 o31-20020a05600c511f00b003a3254cb079mr2898294wms.68.1659529820167; 
 Wed, 03 Aug 2022 05:30:20 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 k18-20020a5d6292000000b0021ec32d130asm18346111wru.74.2022.08.03.05.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 05:30:19 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-usb@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Wed,  3 Aug 2022 13:30:18 +0100
Message-Id: <20220803123018.913710-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH][next] usb: typec: ucsi: stm32g0: Fix spelling
	mistake "booloader" -> "bootloader"
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

There is a spelling mistake in a dev_err_probe message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi_stm32g0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
index 061551d464f1..6ced49e4d208 100644
--- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
+++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
@@ -599,7 +599,7 @@ static int ucsi_stm32g0_probe_bootloader(struct ucsi *ucsi)
 		g0->i2c_bl = i2c_new_dummy_device(g0->client->adapter, STM32G0_I2C_BL_ADDR);
 		if (IS_ERR(g0->i2c_bl)) {
 			ret = dev_err_probe(g0->dev, PTR_ERR(g0->i2c_bl),
-					    "Failed to register booloader I2C address\n");
+					    "Failed to register bootloader I2C address\n");
 			return ret;
 		}
 	}
-- 
2.35.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
