Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B21C26E2
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Sep 2019 22:44:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33497C36B0B;
	Mon, 30 Sep 2019 20:44:18 +0000 (UTC)
Received: from mx1.ucr.edu (mx1.ucr.edu [138.23.248.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E26CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2019 20:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1569876256; x=1601412256;
 h=from:to:cc:subject:date:message-id;
 bh=HYGA3/ETQRN0dliOSfTAE61tbuv040Q6WyOvR7/0sbI=;
 b=hOvzm5IEas2jFy7Q8bg/69wnDq8nM6am52v8bWuIB+duPNhv2PywV3wc
 T90JVyNsFjlNi0w+pGC4NxCNo2L5U2losRxcqB4MF17M6f1y3G0ADAt0k
 NXRDyrUEmmuVWtTuhqrYOHPCys+fcP8vV2S48NP9OZvW2e0l/JfBwLO6A
 sLL8v1j5yn51khnGydKaeZBquT/bgLGBZudhX+eSBLy52JxyXDykUXpoF
 oWOhhnbEkgKKU/TjW4PImtU4kbucOnGjvrJFT3zZI/eP30L254oZqc64i
 D2RXJKvZS4nnml5zsLny6PmvfuhwwRzAoEkyaNLlOl2IInci4VQoxcJnb A==;
IronPort-SDR: cNyvr8GtTNZ4YOwPXAQ4CpJqnrlkeWp0sAU+06iqEt+kcTxVfp13RkwuVA52tfbQE24LYse6HB
 YjzSl/7WCBTz2KvAkZtIUr5CFNHjl19zaBKr0tMtlD8V4VuGEr8Frdh9u69GonQHMrk0X/vVxb
 y9CEsdHwmKKIdiuVgEN8ndeLZhwmx8/L1nO/kCFTYEifwufNNhTpXs0A+eKy53E6uQEOYLFq+T
 SEoLcRdKt8SA41Ekh9LGCJrZbEhsTPc67zsnN5taAyHarUTAEzMUgI+DpdnEZdOo5jbD1t+EDb
 Xjc=
IronPort-PHdr: =?us-ascii?q?9a23=3AXEy0qREEGPMfKimFp1w9Kp1GYnF86YWxBRYc79?=
 =?us-ascii?q?8ds5kLTJ7zpsSwAkXT6L1XgUPTWs2DsrQY0rGQ7/qrADBfqb+681k6OKRWUB?=
 =?us-ascii?q?EEjchE1ycBO+WiTXPBEfjxciYhF95DXlI2t1uyMExSBdqsLwaK+i764jEdAA?=
 =?us-ascii?q?jwOhRoLerpBIHSk9631+ev8JHPfglEnjWwba58IRmsogjdqMYajZZtJ6sz1x?=
 =?us-ascii?q?DEvmZGd+NKyG1yOFmdhQz85sC+/J5i9yRfpfcs/NNeXKv5Yqo1U6VWACwpPG?=
 =?us-ascii?q?4p6sLrswLDTRaU6XsHTmoWiBtIDBPb4xz8Q5z8rzH1tut52CmdIM32UbU5Ui?=
 =?us-ascii?q?ms4qt3VBPljjoMOiUn+2/LlMN/kKNboAqgpxNhxY7UfJqVP+d6cq/EYN8WWX?=
 =?us-ascii?q?ZNUsNXWixEA4O8dJAPD+sHPeZXsoLzuUIApgawBQmtGuzvziJHjWLy0aA0z+?=
 =?us-ascii?q?gtFAfL1xEiEd0TqnTZtNX7OrkPX+67z6fGyi7OY+9K1Trn9ITFaAwtre2KUL?=
 =?us-ascii?q?ltccTR004vFwbdg1qSqIzkPjOV1vkKs2OG6OdhVeOui249pAFwvjSj2skhh5?=
 =?us-ascii?q?LUho0J0FDI7zt2z5soJdChTkNwfN2qEINIui2EK4d7RtkuTmJotSog1LEKpJ?=
 =?us-ascii?q?G2cDIXxJkjwxPTc+GLfomM7x75SuqcLzd1iGh7dL++nRq/80etx+vhXceuyl?=
 =?us-ascii?q?lKtDBKktzUu3AI0Bzc99aIR+Nm/kekxTaPzwfT6vxYIUwslarUNZohwrkom5?=
 =?us-ascii?q?oWq0vDHyv2lFzujK+Sa0ko4+ao5/njb7jivJOcOIh0igbxMqQqhMOzG/g3Mg?=
 =?us-ascii?q?8LX2SD+OS80qPs/VHhTblUkvE7lrPVvZPaKMgBuKK1HgBY3pw+5xu7CzqqyN?=
 =?us-ascii?q?EYkmMGLFJBdhKHlY/pO1TWLfH4DPa/g06jkDZ3y/zaMLDsGYjNIWTZkLv7Y7?=
 =?us-ascii?q?ly9lNcxBIpzd9D/5JUFq0BIPXrV0/1tdzYCAI5MgOtz+b8FNV9040TVXyUD6?=
 =?us-ascii?q?+CLKPeqFqI6f82L+mJfoAVuTL9K/0/6P7ol3M5gkMdfa6z3ZsScnC3AOxmI0?=
 =?us-ascii?q?GZYHb2ntgBFmIK7UIQVuvv3WyDQz5OYD7mTrA87zBjUNmOEIzZAI2hnerSj2?=
 =?us-ascii?q?+AApRKazUeWRi3GnDyetDBBK8B?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2G+BgAYaJJdf8fWVdFmhXxMEI0ehkQ?=
 =?us-ascii?q?BAQEGiyaBCYV6iiwBCAEBAQwBAS0CAQGEQINGIzgTAgMJAQEFAQEBAQEFBAE?=
 =?us-ascii?q?BAhABAQkLCwgnhUKCOimDNQsWFVKBFQEFATUiOYJHAYF2FKJGgQM8jCUziGA?=
 =?us-ascii?q?BCQ2BSAkBCIEihzWEWYEQgQeEYYdlgkQEgTcBAQGLPgGCMYcrlkkBBgKCEBS?=
 =?us-ascii?q?BeJMHJ4I3ggKJPTmLBgGKVZxrAgoHBg8jgUaBe00lgWwKgURQEBSBWxeOQyE?=
 =?us-ascii?q?zgQiQGgE?=
X-IPAS-Result: =?us-ascii?q?A2G+BgAYaJJdf8fWVdFmhXxMEI0ehkQBAQEGiyaBCYV6i?=
 =?us-ascii?q?iwBCAEBAQwBAS0CAQGEQINGIzgTAgMJAQEFAQEBAQEFBAEBAhABAQkLCwgnh?=
 =?us-ascii?q?UKCOimDNQsWFVKBFQEFATUiOYJHAYF2FKJGgQM8jCUziGABCQ2BSAkBCIEih?=
 =?us-ascii?q?zWEWYEQgQeEYYdlgkQEgTcBAQGLPgGCMYcrlkkBBgKCEBSBeJMHJ4I3ggKJP?=
 =?us-ascii?q?TmLBgGKVZxrAgoHBg8jgUaBe00lgWwKgURQEBSBWxeOQyEzgQiQGgE?=
X-IronPort-AV: E=Sophos;i="5.64,568,1559545200"; d="scan'208";a="11100431"
Received: from mail-pl1-f199.google.com ([209.85.214.199])
 by smtp1.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Sep 2019 13:44:12 -0700
Received: by mail-pl1-f199.google.com with SMTP id g11so5884986plm.22
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2019 13:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dapQGiPs5+yxjLDl9zMNq1LcsFOAJWQdGyLQ0/gwWhQ=;
 b=YGRcSH7a2ZHUUt4G8p8LJJrp5ph0TwpDruQcMuD3ILWHoyPXovxXy3VxSkdZzSruAc
 XF7f/zlCsrqjVOlTfoNC5gj7Rp+zfST+mkkOsY5eYuixGwKfLN17a/koZTdu61ZFPoKn
 JezZbclTzSP9IP2ROky7lH2aqL//iiBqtsOsnJgcOQthBJMmVv/IT/FRni99By6dZuPh
 y9ntKjHYknlNGwz5LvDiu4pjz7Psk3zLOZlsag2XmocG0c2M0Vg5V4/EvyMZd65czMaZ
 cOhWj2uuO+Zj03d8n7SOqRoyC/635E9DI3RJJcIC9CWT/XuEoYXO66dwZOMUCPSCMTZe
 zMzw==
X-Gm-Message-State: APjAAAUEW3AicqiNITLMwCgqC3r/SDwIEDhFR312ArKoMmRdlmHulaMT
 elRynVdTYOgVM0b4P54qlTqIc55C/PKZfa2QihPD2joAUeXM1orWc6uUEKglKAbeKlR3Zrqr90W
 tg6eg613K57nnVslHCK2sHNFvybOpxivF8OUxziTbBA==
X-Received: by 2002:a63:e001:: with SMTP id e1mr11470030pgh.358.1569876251833; 
 Mon, 30 Sep 2019 13:44:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx9zg1sf8FzV4vsDfqgG05ZRQlpuE7Jqlj1s/A+Zus03/W2Go073rlg0ow44d+y6lPcxf9YEw==
X-Received: by 2002:a63:e001:: with SMTP id e1mr11469999pgh.358.1569876251280; 
 Mon, 30 Sep 2019 13:44:11 -0700 (PDT)
Received: from Yizhuo.cs.ucr.edu (yizhuo.cs.ucr.edu. [169.235.26.74])
 by smtp.googlemail.com with ESMTPSA id s97sm409068pjc.4.2019.09.30.13.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 13:44:10 -0700 (PDT)
From: Yizhuo <yzhai003@ucr.edu>
To: 
Date: Mon, 30 Sep 2019 13:44:49 -0700
Message-Id: <20190930204451.28614-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
Cc: csong@cs.ucr.edu, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 zhiyunq@cs.ucr.edu, linux-kernel@vger.kernel.org, Yizhuo <yzhai003@ucr.edu>,
 linux-arm-kernel@lists.infradead.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH] iio: trigger: stm32-timer: fix the usage of
	uninitialized variables
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

Several functions in this file are trying to use regmap_read() to
initialize the specific variable, however, if regmap_read() fails,
the variable could be uninitialized but used directly, which is
potentially unsafe. The return value of regmap_read() should be
checked and handled. This patch fixes most of the uninitialized
variables, but those in function stm32_tt_read_frequency() are
hard to handle and need extra effot.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/iio/trigger/stm32-timer-trigger.c | 98 ++++++++++++++++++++---
 1 file changed, 85 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
index a5dfe65cd9b9..f8ea7bcbb739 100644
--- a/drivers/iio/trigger/stm32-timer-trigger.c
+++ b/drivers/iio/trigger/stm32-timer-trigger.c
@@ -107,6 +107,7 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
 	unsigned long long prd, div;
 	int prescaler = 0;
 	u32 ccer, cr1;
+	int ret;
 
 	/* Period and prescaler values depends of clock rate */
 	div = (unsigned long long)clk_get_rate(priv->clk);
@@ -132,11 +133,21 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
 	}
 
 	/* Check if nobody else use the timer */
-	regmap_read(priv->regmap, TIM_CCER, &ccer);
+	ret = regmap_read(priv->regmap, TIM_CCER, &ccer);
+	if (ret) {
+		dev_err(priv->dev, "fail to read TIM_CCER.\n");
+		return ret;
+	}
+
 	if (ccer & TIM_CCER_CCXE)
 		return -EBUSY;
 
-	regmap_read(priv->regmap, TIM_CR1, &cr1);
+	ret = regmap_read(priv->regmap, TIM_CR1, &cr1);
+	if (ret) {
+		dev_err(priv->dev, "fail to read TIM_CR1.\n");
+		return ret;
+	}
+
 	if (!(cr1 & TIM_CR1_CEN))
 		clk_enable(priv->clk);
 
@@ -164,12 +175,23 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
 static void stm32_timer_stop(struct stm32_timer_trigger *priv)
 {
 	u32 ccer, cr1;
+	int ret;
+
+	ret = regmap_read(priv->regmap, TIM_CCER, &ccer);
+	if (ret) {
+		dev_err(priv->dev, "Fail to read TIM_CCER.\n");
+		return;
+	}
 
-	regmap_read(priv->regmap, TIM_CCER, &ccer);
 	if (ccer & TIM_CCER_CCXE)
 		return;
 
-	regmap_read(priv->regmap, TIM_CR1, &cr1);
+	ret = regmap_read(priv->regmap, TIM_CR1, &cr1);
+	if (ret) {
+		dev_err(priv->dev, "Fail to read TIM_CR1.\n");
+		return;
+	}
+
 	if (cr1 & TIM_CR1_CEN)
 		clk_disable(priv->clk);
 
@@ -403,20 +425,36 @@ static int stm32_counter_read_raw(struct iio_dev *indio_dev,
 {
 	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
 	u32 dat;
+	int ret;
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
-		regmap_read(priv->regmap, TIM_CNT, &dat);
+		ret = regmap_read(priv->regmap, TIM_CNT, &dat);
+		if (ret) {
+			dev_err(priv->dev, "fail to read TIM_CNT.\n");
+			return ret;
+		}
+
 		*val = dat;
 		return IIO_VAL_INT;
 
 	case IIO_CHAN_INFO_ENABLE:
-		regmap_read(priv->regmap, TIM_CR1, &dat);
+		ret = regmap_read(priv->regmap, TIM_CR1, &dat);
+		if (ret) {
+			dev_err(priv->dev, "fail to read TIM_CR1.\n");
+			return ret;
+		}
+
 		*val = (dat & TIM_CR1_CEN) ? 1 : 0;
 		return IIO_VAL_INT;
 
 	case IIO_CHAN_INFO_SCALE:
-		regmap_read(priv->regmap, TIM_SMCR, &dat);
+		ret = regmap_read(priv->regmap, TIM_SMCR, &dat);
+		if (ret) {
+			dev_err(priv->dev, "fail to read TIM_SMCR.\n");
+			return ret;
+		}
+
 		dat &= TIM_SMCR_SMS;
 
 		*val = 1;
@@ -438,6 +476,7 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
 {
 	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
 	u32 dat;
+	int ret;
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
@@ -449,13 +488,23 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
 
 	case IIO_CHAN_INFO_ENABLE:
 		if (val) {
-			regmap_read(priv->regmap, TIM_CR1, &dat);
+			ret = regmap_read(priv->regmap, TIM_CR1, &dat);
+			if (ret) {
+				dev_err(priv->dev, "fail to read TIM_CR1.\n");
+				return ret;
+			}
+
 			if (!(dat & TIM_CR1_CEN))
 				clk_enable(priv->clk);
 			regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN,
 					   TIM_CR1_CEN);
 		} else {
-			regmap_read(priv->regmap, TIM_CR1, &dat);
+			ret = regmap_read(priv->regmap, TIM_CR1, &dat);
+			if (ret) {
+				dev_err(priv->dev, "fail to read TIM_CR1.\n");
+				return ret;
+			}
+
 			regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN,
 					   0);
 			if (dat & TIM_CR1_CEN)
@@ -517,8 +566,13 @@ static int stm32_get_trigger_mode(struct iio_dev *indio_dev,
 {
 	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
 	u32 smcr;
+	int ret;
 
-	regmap_read(priv->regmap, TIM_SMCR, &smcr);
+	ret = regmap_read(priv->regmap, TIM_SMCR, &smcr);
+	if (ret) {
+		dev_err(priv->dev, "fail to read TIM_SMCR.\n");
+		return ret;
+	}
 
 	return (smcr & TIM_SMCR_SMS) == TIM_SMCR_SMS ? 0 : -EINVAL;
 }
@@ -557,6 +611,7 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
 	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
 	int sms = stm32_enable_mode2sms(mode);
 	u32 val;
+	int ret;
 
 	if (sms < 0)
 		return sms;
@@ -565,7 +620,12 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
 	 * enable counter clock, so it can use it. Keeps it in sync with CEN.
 	 */
 	if (sms == 6) {
-		regmap_read(priv->regmap, TIM_CR1, &val);
+		ret = regmap_read(priv->regmap, TIM_CR1, &val);
+		if (ret) {
+			dev_err(priv->dev, "fail to read TIM_CR1.\n");
+			return ret;
+		}
+
 		if (!(val & TIM_CR1_CEN))
 			clk_enable(priv->clk);
 	}
@@ -594,8 +654,14 @@ static int stm32_get_enable_mode(struct iio_dev *indio_dev,
 {
 	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
 	u32 smcr;
+	int ret;
+
+	ret = regmap_read(priv->regmap, TIM_SMCR, &smcr);
+	if (ret) {
+		dev_err(priv->dev, "fail to read TIM_SMCR.\n");
+		return ret;
+	}
 
-	regmap_read(priv->regmap, TIM_SMCR, &smcr);
 	smcr &= TIM_SMCR_SMS;
 
 	return stm32_sms2enable_mode(smcr);
@@ -706,13 +772,19 @@ EXPORT_SYMBOL(is_stm32_timer_trigger);
 static void stm32_timer_detect_trgo2(struct stm32_timer_trigger *priv)
 {
 	u32 val;
+	int ret;
 
 	/*
 	 * Master mode selection 2 bits can only be written and read back when
 	 * timer supports it.
 	 */
 	regmap_update_bits(priv->regmap, TIM_CR2, TIM_CR2_MMS2, TIM_CR2_MMS2);
-	regmap_read(priv->regmap, TIM_CR2, &val);
+	ret = regmap_read(priv->regmap, TIM_CR2, &val);
+	if (ret) {
+		dev_err(priv->dev, "fail to read TIM_CR2.\n");
+		return;
+	}
+
 	regmap_update_bits(priv->regmap, TIM_CR2, TIM_CR2_MMS2, 0);
 	priv->has_trgo2 = !!val;
 }
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
