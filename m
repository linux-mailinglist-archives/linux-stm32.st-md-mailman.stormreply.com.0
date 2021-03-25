Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CFA3488E7
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Mar 2021 07:19:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 286F3C57B5F;
	Thu, 25 Mar 2021 06:19:58 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EC81C57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 06:19:55 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id l123so961794pfl.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Mar 2021 23:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=31z6xcgVpgNt2rqQ4i917PEU8w/kVuNEF1a++fiq5dw=;
 b=nQ6TerCFDVxmOIgBYkQXfbaZtZgE4MkWwQ3DeGjNyiTbHdjhYHhK7j8av0reETN1yK
 01VZiWl8qS5kxwekLzQAK2Dp2gQpoU+OYFYtwKv+mtQwKW7srdnVdLgKpUwxQBse4Dta
 RKA2WPFUCvMGhriQjsKI3LK6w1GYY4alUwEP8OgcBMc8blPbb+kUNiByY8KQ3rNFan18
 Btyw0aMcpHJ+8bZSk61ZPhS4kVLz5aj272T47rUrKKGA6XxUOBCSgUA9bIDm/aqFTsHd
 ec3e/IpuZZ1XfWZLxVIOzjzq6lddK3j1nOzC2IiIX/BjSvZsJwUfp9DpUwaCcliUCDFU
 P+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=31z6xcgVpgNt2rqQ4i917PEU8w/kVuNEF1a++fiq5dw=;
 b=qAV0SJaXnJkyYdCcH26x5+oOOEnQsTRFOFD84LplMA1Nugi+fsgKMQx9XuyA9tYz2q
 k0nflxTS1nFGZ9a8/JZaYEOr21JTbFgy875kEa0DH3p3jUD+kQv8BoVTILWoFng/j85G
 scBxsdiRJzmtPUcaqGDC9+hi9AUjRG5nwkMp1i6scU4o9UFfn2C/DFzuV2ZCryAh/gs+
 MKlVBJP3+gf57BpUdDp8846RGjbvL/cu6aB35VIweAicDMzOzBh6jxuTyCQ02wnQc+dS
 6xD62Wge54KNZFnB2YlhIRdAlX7uhwnMJbXDN/Z5ddLrAeDBIT29uqCHc/4iiflu2eJZ
 DiXQ==
X-Gm-Message-State: AOAM531O7GAhz/3sFNrou3BFtQ6g/w/J89/XKTTkjsVTaR90q+1blnzX
 tTpThHQvps9kbTITEv20bOk=
X-Google-Smtp-Source: ABdhPJxtsQ03IwysDluyYZpJWgXX97sGPpF47gdNS8CmZlpk8MrPym7e4+FukgzZIFGl0r0dsLH8FQ==
X-Received: by 2002:aa7:91d1:0:b029:1fe:2a02:73b9 with SMTP id
 z17-20020aa791d10000b02901fe2a0273b9mr6683276pfa.2.1616653194038; 
 Wed, 24 Mar 2021 23:19:54 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id b19sm4393086pfo.7.2021.03.24.23.19.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Mar 2021 23:19:53 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com,
 gregkh@linuxfoundation.org, erwan.leray@foss.st.com, erwan.leray@st.com,
 linux-serial@vger.kernel.org, lkp@intel.com
Date: Thu, 25 Mar 2021 14:19:21 +0800
Message-Id: <1616653162-19954-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616653162-19954-1-git-send-email-dillon.minfei@gmail.com>
References: <1616653162-19954-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v5 8/9] pinctrl: stm32: Add STM32H750 MCU
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

v5: no changes

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
@@ -1966,6 +1966,9 @@ static const struct of_device_id stm32h743_pctrl_match[] = {
 		.compatible = "st,stm32h743-pinctrl",
 		.data = &stm32h743_match_data,
 	},
+	{	.compatible = "st,stm32h750-pinctrl",
+		.data = &stm32h743_match_data,
+	},
 	{ }
 };
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
