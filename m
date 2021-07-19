Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AACC3CEB70
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jul 2021 21:50:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 203F6C57B6B;
	Mon, 19 Jul 2021 19:50:57 +0000 (UTC)
Received: from mx-lax3-1.ucr.edu (mx-lax3-1.ucr.edu [169.235.156.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8A8CC57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jul 2021 19:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1626724256; x=1658260256;
 h=from:to:cc:subject:date:message-id;
 bh=MYc29Ou9YlvgD3SQj+KfJB5TjwaCedW7HGkkcEg43K8=;
 b=asdJFxuvrXDx65ZWE3nyCElyNbPk2mlIAZOAllmkYRWIqfWHnUJjmrH0
 YR12UEhL07WovRnC7N0kf17mosidp2ur7vb34377nDzwCPo3KAjUtK9R2
 ivkhie1Cm1J81fPluyTrUBBwxpYJ/4LnpA8ogU/CD1SuhXTQzKxlk5gXu
 /9eeqTM9EHTHNQLKF0QGamhFDMwrvWZh5Q/wNd9act0Xma5BbwyFeT9xx
 wXVeZWzVcZtIbwo9Tb0f81k/zxMOrTlpwLIHSkvu2+veemhvhYtLg7cRZ
 5cdmwLBywJpjXyJ72Mc0FrJhMnp2Xlozk7MnA8wD2RA9noZcNDFs9Vg+k g==;
IronPort-SDR: 3TQbkWaihPdADZPlrrFwCC0N1P+o0bPsbDaFpsIsmIIs8rLDuR5qzgteFkLGRH3Ue6kuIANPtf
 1JVpbotcEO+BnMoBzKzPdJAYnNOzf9LIriv96f/Nw2/O0th1exUriFMUE2CjZ/2VKleMpIh1Cy
 VLsWxppYArHKgiiA+IENQbnGIt/0h7zfmfr15Qm2jwIqYwkgze1JuXRssKnxyQhMY3nZjB0zTg
 OxjcmKSKfv8fQY2jKUcXLnmOhoVPXVX9L+VMYvcy/P1h4wBpaX5lHieD67ACzk50mT6YeHq/Ga
 AHKUUzmjIvUOMgZhfaAHIh6E
X-IPAS-Result: =?us-ascii?q?A2F6BAAI1/Vgf0jYVdFagmKDeVUWjUyHEwEBBoFBin2BA?=
 =?us-ascii?q?oZ8iGaBfAIJAQEBDQEBQQQBAYRXgwACJTQJDgIEAQEBAQMCAwEBAQEBAQMBA?=
 =?us-ascii?q?QYBAQEBAQEFBAEBAhABAYEMC1kLY4FPgXkGBD2COCmDZQsWFVKBFQEFATUiO?=
 =?us-ascii?q?YIWAYJhJpotgQQ9jDEzgQGIBwEJDYFjCQEIgSiIfIUXgRmBEIJQgTN1h2+CU?=
 =?us-ascii?q?ASDFVMoE4JpgRABAQGTUAGoRQEGAoMKHIMRmw5Fg2OCfY5dQpBeAS2QJqo/A?=
 =?us-ascii?q?goHBhAjgTiCFU0lgWwKgUFNAQIBAgEMAgECAQIBAgECCAEBAo1yATUWji1BM?=
 =?us-ascii?q?jgCBgsBAQMJjBMB?=
IronPort-PHdr: A9a23:NZ5WgRP8FepcEVS7O9kl6na1DRdPi9zP1u491JMrhvp0f7i5+Ny6Z
 QqDv60r1weCBN6Lo7Ic0qyK6vGmATRBqb+681k6OKRWUBEEjchE1ycBO+WiTXPBEfjxciYhF
 95DXlI2t1uyMExSBdqsLwaK+i764jEdAAjwOhRoLerpBIHSk9631+ev8JHPfglEnjWwba1uI
 BmsowjdqsYajZZsJ6sy1xDFpmdEd/lMyW5nOF6emwzw6tus8JJm7i9dp+8v+8lcXKvgYq82V
 6ZYDDMoM2A04M3kqxzORhaR63UfT2sbjANGDxDK4x/mUJjxtDD6tvdm1ymBIcL2V7E0Vi+84
 KptVRTllT0INz898GHQl8xwkKdWqw+vqhBj34LZZpyeOeFgda3BY9wVWWtBXt5QVyNfBIO8c
 5APBPcFMepBsoXxu0cCoR64CAmpBePv0SRIhn7w3a01zu8vDxjI1xEuH9IPrnvUqMj6P7oWX
 e270KXEyDPOYPRK1Drz9ITEbwktre2RUbltdcbd1EkiGwbDg16Nq4LqIimV2/wNvWaF8uRuW
 +GhhWk8pg1tvjSi3Nsgh5PVio4JzF3P6CV3wJwyJd29UEN0Y9+kEZpQtyGHMIt9X8QvQmFpu
 SY60LIGuIK3cDQExZk82h7Qd+aHf5KW7R3+SeacODF1j29qd7yjnRi961SgyvHiWcmu1lZHt
 iVInsfOu34NyxDe7siJRuV980qi1ziCyR7f5OFFLE02iKfWKpwsz7oxm5cSr0nOAiz7lFnqg
 KKUa0kp9fak5eThb777pZGcL5d5hh/iPqkqgMCyAuQ1PhIQU2SG+Omwzr/u8VPhTLlXj/A7l
 rPVvI7UKMkbvKK1HQ1Y3pw95xqhATqr1skTk2MdI1JfYh2HipDkO1TJIP/lE/iym0+skDJ3x
 /DeOb3hH4nNImDDkLj/ebZ97FZRyA8pwtBe45JYE6kBIPDuVkPoutzVDAE1Pxa7w+bgD9V92
 YceVnyVDqCFN6PStEeE5uMpI+aSeI8YoCjxJ+Qh6vL0jnI0mUURcbe00ZYWcny1HOpqL12cY
 XX2g9cBFWkKvhA5TOzvkFCDUT9SZ3aoUKI9+j03FIyrAJzeRo+xmryNxjm0EYBLZmxeEFCDD
 W/od5mYW/cLcC+SJs5hkjoZVbmuUoMhzg2utAr0xrZ5NefU4TEYuYvm1Ndo/uHTkAs99T1wD
 8SYyW6NSXt4nngURz8xxqB/pFZ9xUmb0ah8g/1UD8Bc5/RMUlRyG4TbyrlLCsLyRwWJKsabS
 F+nGo39KSw6VJQ8z8JYMBU1IMmrkh2Wh3niOLQSjbHeQcFpmp8=
IronPort-HdrOrdr: A9a23:/aCy+67YUIXlU/bB0gPXwMnXdLJyesId70hD6qm+c20xTiX2rb
 HIoB12726WtN9uYgBHpTnoAsDpKhPhHPZOgLX5Vo3SODUO1lHYTr2KLrGO/9QjIUfDHyJmup
 uIC5IOceEYxGIX4/rH3A==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="55032890"
Received: from mail-pj1-f72.google.com ([209.85.216.72])
 by smtp-lax3-1.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jul 2021 12:50:53 -0700
Received: by mail-pj1-f72.google.com with SMTP id
 z93-20020a17090a6d66b0290175a6c43dbfso7131111pjj.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jul 2021 12:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OXOnGGPnlJMlgfJA7I8h06LGQvk/TlSh7ooUa6JcARg=;
 b=czr+UIwC2lvdfwUsvul+o3xp2k/0GnWI0K/58mDX5pWJIeV6EmSEu1QVCxMgvILW4D
 pePg3hpnvdB6CcW+9aOi0E0nfCo6ZJn721HtLDnGp3IFYN5sAfLEe5e5v0butVSfHPDW
 dIDxNq3qg+gxHLT4lQuTgdFqbbccpgLsLH5lYziyAzrKY+C7Kq0lWComp/n2Bd2fkHmx
 Zs0TWQ0JhgL/9Ex8rU2EYUCrEXrgN8t1EUwYjgSRFcwCfTkeKQERj2BV9DUQjIBUaGMn
 X5o0jzwILY4l0tvShC30MG0Y8YLGTWHTHUm0GKMNBZ+YratDH4YuViLpZBFEKHY5CQtJ
 D+xg==
X-Gm-Message-State: AOAM530T7PJMkJz0D+TpuC7XP+V/I8miV7e2GO45yieMYIA9UGR8+B6z
 PVikQhAeQ5/C0YHWpSiPIP3mmBo4EZ5c8oD+A4RIyM7ARjfYjdEGHau72rzGckHm60E+aZncdo8
 57fJ8jttiOWHUpxaX7JFW8QLb7l5NSVTNsa2swH0Twg==
X-Received: by 2002:a17:90a:5305:: with SMTP id
 x5mr31068668pjh.135.1626724253095; 
 Mon, 19 Jul 2021 12:50:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeoggVNck06c751xfNeJAk9UTizVm33D0WmnP578NV87JKcTcN5mzJ1hVRacMKD2c9/PCsqw==
X-Received: by 2002:a17:90a:5305:: with SMTP id
 x5mr31068659pjh.135.1626724252863; 
 Mon, 19 Jul 2021 12:50:52 -0700 (PDT)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
 by smtp.googlemail.com with ESMTPSA id y4sm299857pjg.9.2021.07.19.12.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 12:50:52 -0700 (PDT)
From: Yizhuo <yzhai003@ucr.edu>
To: 
Date: Mon, 19 Jul 2021 19:53:11 +0000
Message-Id: <20210719195313.40341-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Mugilraj Dhavachelvan <dmugil2000@gmail.com>, linux-iio@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Yizhuo <yzhai003@ucr.edu>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH] iio: adc: stm32-dfsdm: Fix the uninitialized
	use if regmap_read() fails
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

Inside function stm32_dfsdm_irq(), the variable "status", "int_en"
could be uninitialized if the regmap_read() fails and returns an error
code.  However, they are directly used in the later context to decide
the control flow, which is potentially unsafe.

Fixes: e2e6771c64625 ("IIO: ADC: add STM32 DFSDM sigma delta ADC support")

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/iio/adc/stm32-dfsdm-adc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
index 1cfefb3b5e56..d8b78aead942 100644
--- a/drivers/iio/adc/stm32-dfsdm-adc.c
+++ b/drivers/iio/adc/stm32-dfsdm-adc.c
@@ -1292,9 +1292,11 @@ static irqreturn_t stm32_dfsdm_irq(int irq, void *arg)
 	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
 	struct regmap *regmap = adc->dfsdm->regmap;
 	unsigned int status, int_en;
+	int ret;
 
-	regmap_read(regmap, DFSDM_ISR(adc->fl_id), &status);
-	regmap_read(regmap, DFSDM_CR2(adc->fl_id), &int_en);
+	ret = regmap_read(regmap, DFSDM_ISR(adc->fl_id), &status);
+	if (ret)
+		return IRQ_HANDLED;
 
 	if (status & DFSDM_ISR_REOCF_MASK) {
 		/* Read the data register clean the IRQ status */
@@ -1303,6 +1305,9 @@ static irqreturn_t stm32_dfsdm_irq(int irq, void *arg)
 	}
 
 	if (status & DFSDM_ISR_ROVRF_MASK) {
+		ret = regmap_read(regmap, DFSDM_CR2(adc->fl_id), &int_en);
+		if (ret)
+			return IRQ_HANDLED;
 		if (int_en & DFSDM_CR2_ROVRIE_MASK)
 			dev_warn(&indio_dev->dev, "Overrun detected\n");
 		regmap_update_bits(regmap, DFSDM_ICR(adc->fl_id),
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
