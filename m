Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9808A1C836A
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 09:27:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43993C3087A;
	Thu,  7 May 2020 07:27:13 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE5A6C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2020 17:49:03 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y4so3211233wrm.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 May 2020 10:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=srtH8bskiQrF0mpCWsWnCxht+uD1HNatLGnWm/k2SmY=;
 b=I2C97RMATzMD8KLXLxy2rBCkuviQnKAhn6fSB5//HbcMzxaD2e96LoiXeaJMbjd4Ze
 z3WcT3MOAG0FWtphVfkRUz4MDwS4w8jZk/K8eiGZYojVuasbWBc8vXv9OxMaCppZWP9l
 aWrB+a240sIDDHYIVj1I9q3PMCKXYFrWKm60r4bL3HLGVOacpQr+qyWnvtA3Xe7rAs2j
 XPq3PAkTrdfxBw10Lnjd7DusLULQgghR+ZFTzzdSg/6CiQNXdBf8a/SbCMLaI5k7AIA5
 GgQjByqUdwYyt4u4huOJAkSsZLu+mCcXzbPgALmqAMqK/TZiOeub5XrUCImv67rN0CaB
 Cnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=srtH8bskiQrF0mpCWsWnCxht+uD1HNatLGnWm/k2SmY=;
 b=QinXfIXdMeT+h8cMyaW8D26BeQOrGa8l9OL/eNrLLWQGGiFOEVb7FjeqEM9KzTnY9C
 CabsSZD8Qh/QCJFWJ+fZ+H+AFd3mLw7JRVkFVzQwQUSkFSxfqAseDNTY65qMo0fhWn+2
 rePQ2/HUDOrudFM6N5mg2alsfT8E8Uznpx9IBdTtgCd40S/mfXKNugT2eZogSdW5H6A5
 sT7sTitl66e/vUVUxbsfi3YfwN9sn8MhNXI1vzC5lddxNgiW6JyBnzr9dvjnqwY3n8RM
 pR12nJg03Xd9LUGp9TtzvY7drGj+e70IQP/eAWA5H3h08fpOkoTVo7mz0YDYhjtrMN+O
 5aJg==
X-Gm-Message-State: AGi0PuZjZEtrB9WjaqhuBs5hFEy/64XmyrgX8Wn/Y1S4LM89C38u0zoT
 mO0gtyy+XP8B3Jg7OVdPygRdog==
X-Google-Smtp-Source: APiQypJzrOxOnaeMZj2hShOBa2tNuW6vZBCQSqhwPsIO3GIRxw5ow3FX2cybrUz8TcJ9VkWpKvsviQ==
X-Received: by 2002:a5d:498b:: with SMTP id r11mr10685245wrq.368.1588787343455; 
 Wed, 06 May 2020 10:49:03 -0700 (PDT)
Received: from lmecxl0524.home
 (2a01cb058702ff00bc4b798f4f30d41e.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8702:ff00:bc4b:798f:4f30:d41e])
 by smtp.gmail.com with ESMTPSA id n6sm1997992wrt.58.2020.05.06.10.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 10:49:02 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: linux-kernel@vger.kernel.org
Date: Wed,  6 May 2020 19:48:40 +0200
Message-Id: <20200506174840.19856-1-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 07 May 2020 07:27:11 +0000
Cc: Etienne Carriere <etienne.carriere@st.com>, devicetree@vger.kernel.org,
 robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: bump PSCI to version 1.0 on
	stm32mp15x
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

From: Etienne Carriere <etienne.carriere@st.com>

Declare PSCI v1.0 support instead of v0.1 as the former is supported
by the PSCI firmware stacks stm32mp15x relies on.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 3ea05ba48215..ebceead1b120 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -24,10 +24,8 @@
 	};
 
 	psci {
-		compatible = "arm,psci";
+		compatible = "arm,psci-1.0";
 		method = "smc";
-		cpu_off = <0x84000002>;
-		cpu_on = <0x84000003>;
 	};
 
 	intc: interrupt-controller@a0021000 {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
