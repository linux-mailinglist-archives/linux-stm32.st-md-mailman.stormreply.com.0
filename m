Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2161B3429BF
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Mar 2021 02:57:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFA5CC58D5C;
	Sat, 20 Mar 2021 01:57:06 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A8F1C58D5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Mar 2021 01:57:05 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id r17so4874869pgi.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 18:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TFzCPCHOGunTV7Nk7bbsASKOtAjRbwZHCSCbFBUgM/I=;
 b=Ur087o1MJp/2ELe1YpoBK26lNd76VNQRWNZwdv5AH7urkXmORI2K37lkMU2DIQl5Ap
 r90x7ycdFSaTUkRJ5ydBV4zPuqxnZqKfCakClzNs27hKsNiimvu/XDTXcTQApB+t+Ob6
 xo5T2nWh2JR6z9YNTb5wIqwRG31BEOLIY9K3+6zSni9DNe+gtF3o9r2XV5VxacS5z4e1
 s+1Fir4HAsqaih3o5my6kT5wcew90LRj9jTUEviphwiM7y/dWLeYiLDygAvcA7iV8jW/
 u3lvMLT1rAMN6m+mv14bCBPlxL39CraHN5S8aSArqxAToZQ2Av409PKd9wFe4VT5aKH6
 Fbrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TFzCPCHOGunTV7Nk7bbsASKOtAjRbwZHCSCbFBUgM/I=;
 b=q/KFRrgzPiO1+KsUoAHEHShxq9i+o3DsxkCV2013EjZ3LOxPCJSLlR1hYFnqLPVnW0
 DTATbz11Kf+aaCbmEULzLkb6cjP181q5LadqQWuaDGqPk+J7C3PiBf30igzdf0REyPS8
 mKE11uQfYV5Z1RjFM/NOjuh1nW94gXLGYHvM8yuDwQ52Vf4vWuEH1PckDHgBBPMfV+ZP
 H3f0ja8fhFqjmBU9r8rnpweM76a6ELZ/1bVDyvCic3nTFVgb26qJyzZeQc8tyswW0JZE
 PJmcr2H/xlhlOztS1Lbs6dKGuZOJzGyKjTJlJwdxTdLZktvzGYNm52uumM4INdl8qaXS
 TT1Q==
X-Gm-Message-State: AOAM531qoL7aSWQDLlhDggKjRxNeujQailh20YdOV5oyGPXt7Qk3xMJy
 dlXhgj+ZyXWhXqjs4/PQ9/c=
X-Google-Smtp-Source: ABdhPJwG+sMeeICjk5ZbpbCSzEgrYGgzg3QXDZuGx3G8W1dBBwQSH06+U5txD7x4tafuGDlixptCDg==
X-Received: by 2002:a63:e47:: with SMTP id 7mr13668938pgo.17.1616205424087;
 Fri, 19 Mar 2021 18:57:04 -0700 (PDT)
Received: from localhost.localdomain ([204.44.111.4])
 by smtp.gmail.com with ESMTPSA id y7sm5755904pgp.23.2021.03.19.18.56.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Mar 2021 18:57:03 -0700 (PDT)
From: dillon.minfei@gmail.com
To: alexandre.torgue@foss.st.com, rong.a.chen@intel.com, robh+dt@kernel.org,
 a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com,
 gregkh@linuxfoundation.org, erwan.leray@foss.st.com,
 linux-serial@vger.kernel.org, lkp@intel.com
Date: Sat, 20 Mar 2021 09:56:22 +0800
Message-Id: <1616205383-24114-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1616205383-24114-1-git-send-email-dillon.minfei@gmail.com>
References: <1616205383-24114-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v4 8/9] pinctrl: stm32: Add STM32H750 MCU
	pinctrl support
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

From: dillon min <dillon.minfei@gmail.com>

This patch adds STM32H750 pinctrl and GPIO support
since stm32h750 has the same pin alternate functions
with stm32h743, so just reuse the stm32h743's pinctrl
driver

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---

v4: no changes

 drivers/pinctrl/stm32/Kconfig             | 2 +-
 drivers/pinctrl/stm32/pinctrl-stm32h743.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/Kconfig b/drivers/pinctrl/stm32/Kconfig
index f36f29113370..fb1ffc94c57f 100644
--- a/drivers/pinctrl/stm32/Kconfig
+++ b/drivers/pinctrl/stm32/Kconfig
@@ -35,7 +35,7 @@ config PINCTRL_STM32F769
 	select PINCTRL_STM32
 
 config PINCTRL_STM32H743
-	bool "STMicroelectronics STM32H743 pin control" if COMPILE_TEST && !MACH_STM32H743
+	bool "STMicroelectronics STM32H743/STM32H750 pin control" if COMPILE_TEST && !MACH_STM32H743
 	depends on OF && HAS_IOMEM
 	default MACH_STM32H743
 	select PINCTRL_STM32
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32h743.c b/drivers/pinctrl/stm32/pinctrl-stm32h743.c
index ffe7b5271506..700206c7bc11 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32h743.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32h743.c
@@ -1966,6 +1966,9 @@
 		.compatible = "st,stm32h743-pinctrl",
 		.data = &stm32h743_match_data,
 	},
+	{	.compatible = "st,stm32h750-pinctrl",
+		.data = &stm32h743_match_data,
+	},
 	{ }
 };
 
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
