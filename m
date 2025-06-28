Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C582CAEC8CF
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Jun 2025 18:39:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBBE7C36B2B;
	Sat, 28 Jun 2025 16:39:45 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4089BC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Jun 2025 16:39:44 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-40b1c099511so1820874b6e.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Jun 2025 09:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751128783; x=1751733583;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IMFk6TBSRPoytsEFWA/L8bAiB5zpBhaDKXVpwxdgx3Y=;
 b=a67QcXY2uzYW5HXvXb+hCbI8a6P0FSAhKyN3zT5zXRRBQcsRkHzdG9Q0vkEgVuPF5h
 IqF2wL2gjLjK9Gat6vRVgD8ofZM2vueiFgUMPcFqDnOD7vasWSS3ootCSiQyKwLTpqwc
 3zJoTCOKfoE8+8jFNLQ23/ELXO75HtXHK0hloryvKbjsruEPZ/zZGN+WWFrPnwOSs4zW
 xqVCcjuneoFe2lZw7/wZEjNw2YlMRuG4hb2naT9BNWbf/gLwsgZoUJBxo40OKmczCyjJ
 SlAOHTHjcFg6up24IkYjFGCAseLJFUtHH2lSm7qDqYCCt34opY8eknDPXN3iqxqIoTuW
 XRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751128783; x=1751733583;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IMFk6TBSRPoytsEFWA/L8bAiB5zpBhaDKXVpwxdgx3Y=;
 b=htpRNF4MuTYhVzyAKNkQAL4Ka82NhWDCaZ3dFTlmNBNgpJCuy1aQoMBisXMCvx4nGW
 IP9urWZmQeide57estoH7HzTK1T/6C1WRzYubs4znmQFCd6ShYnQcgnDnXBNVeCoETsa
 1yvBIdx2BV9EHTlqIm9is4M4K+a6b/L1m9l34s8EkvL/JEMf7lurWPLIfAIukVmf9j6G
 7Cwfpcur8KQkucXHSJX5nQQSIdkH9hZ1BD2D1giC/lURxMD2lBDQR0FZ6rqPeUegVsXe
 kvYJj5CgTQO3q15F5FDHaY48uG4i/1zqXd0Mg6bCfgY8OFtCwxECa+rRX+koZBlc8jNo
 fHfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF4rZo5r0NEt0gppYtzMKqPUoZ9Sl6DZiBT52MckD68MxJuMBQvTCnPe3OE7qWC5eN4VMyzZ3UxYKzJw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyRsQDU9pZjqoPy4zCLTdZvVd01KAFglwT1hl7OqIovmpPWlfT0
 IqD4WYWG2uPOLQ82SlgltVnfarjHjKB7dG+JayYCLb6XgZK4nbLm0Vm0EygtcY+pMoQ=
X-Gm-Gg: ASbGncuoY2zgNC8aXQ0iDOtEv71Y608/KjTXWqWVhZvR43+yG96qIpoLCCBObqB/0TD
 Q+WQGxFmv9oeeagRHEIEwP2g6YE0MxAJHeWL+EKgoPP86g/sxkh+eKvdc7RYzWX5HUD8/1yaRKR
 8Lvw+44/WsMIvH3VyZFWXyZky3ksktJk9K5c7GdEUqeugrHkX2udAfNJ0Y4VPUqXMSN72r2kb3i
 gW/mm+Ss1XK+s3yaJeOPl3oHoimzIrwBCBladA1TmfWXN7EsBQmKjujdcOci7XXmGTNBKDKvEH/
 dLF7R3ziwpQegHaE3tQqpsU/vPuwOMP2tX2XgbILdCAS1YA2FR3F/2uuySncu7qb3FIs
X-Google-Smtp-Source: AGHT+IG/xoZFtVbTTOBbDGQ9ZV0tQLObLKh4Adi4IyxX1NpFYvM7jSz8pvzVA7s7N1PFYx+rLy3enw==
X-Received: by 2002:a05:6808:f8f:b0:406:70bb:f25 with SMTP id
 5614622812f47-40b1c87a6c5mr9375589b6e.4.1751128782758; 
 Sat, 28 Jun 2025 09:39:42 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40b338a048fsm845415b6e.24.2025.06.28.09.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jun 2025 09:39:42 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Jun 2025 11:39:33 -0500
MIME-Version: 1.0
Message-Id: <20250628-iio-const-data-10-v1-1-0ba93ac792c8@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAMQaYGgC/x3MMQqAMAxA0atIZgNtaEW8ijiUJmqWVloRQby7x
 fEN/z9QpahUmLoHilxaNacG23cQ95A2QeVmIEPeDDSiasaYUz2RwxnQGiQZDTtm8Y6gdUeRVe/
 /OS/v+wFFPZsnYwAAAA==
X-Change-ID: 20250628-iio-const-data-10-2e80d4dde542
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1712; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=U/8CNOHGauLsIgkJyowuqKhLhmaCBd6GX/xYox/0+34=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYBrHfYdBpf/RErszbzr+6hfxu+RD/bVyFoJwj
 IclktGBs5iJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGAaxwAKCRDCzCAB/wGP
 wO0PB/4p5kujQILGatenvEj8+iwGQi6pgb6/Fzf7IdgpkaT8YugDUWjhLwUIfRctbSudWZDNBL1
 NNaMnRe4Wi9Huv+IDIRG5KZwlQ5+j0GRmlMhc2mPf5X/tq4IU321PAna8TnfhqDSLzeY3qAhagu
 8Cx80zHyoUAdBk/7KAY7EowzTt5EV7Hsnd5Za2Z9gxBKwzGEt9VTX9+Id8vzNfJdpT7GBYkqXAz
 VWUcALNxdA84Et3wg44mu5ZD1WMZRaL0DpRCBSwFUo9hrvaNqYOtOUosSJV8hxh9rJhLHH5AExX
 57IN0QLnNW1V45C8dBMUQYeZOiBG9/Q+epD7uEQLv8s8C1el
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] iio: adc: stm32-adc: make stm32_adc_trig_info
	const
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

Add const qualifier to struct stm32_adc_trig_info. This is read-only
data so it can be made const.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/stm32-adc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 588c69e175f5129030eef9ebfe0eabb6412b1893..b9f93116e114b1c840cbe568f17462b2d25bf2db 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -216,7 +216,7 @@ struct stm32_adc;
 struct stm32_adc_cfg {
 	const struct stm32_adc_regspec	*regs;
 	const struct stm32_adc_info	*adc_info;
-	struct stm32_adc_trig_info	*trigs;
+	const struct stm32_adc_trig_info *trigs;
 	bool clk_required;
 	bool has_vregready;
 	bool has_boostmode;
@@ -383,7 +383,7 @@ static const struct stm32_adc_regs stm32f4_sq[STM32_ADC_MAX_SQ + 1] = {
 };
 
 /* STM32F4 external trigger sources for all instances */
-static struct stm32_adc_trig_info stm32f4_adc_trigs[] = {
+static const struct stm32_adc_trig_info stm32f4_adc_trigs[] = {
 	{ TIM1_CH1, STM32_EXT0 },
 	{ TIM1_CH2, STM32_EXT1 },
 	{ TIM1_CH3, STM32_EXT2 },
@@ -473,7 +473,7 @@ static const struct stm32_adc_regs stm32h7_sq[STM32_ADC_MAX_SQ + 1] = {
 };
 
 /* STM32H7 external trigger sources for all instances */
-static struct stm32_adc_trig_info stm32h7_adc_trigs[] = {
+static const struct stm32_adc_trig_info stm32h7_adc_trigs[] = {
 	{ TIM1_CH1, STM32_EXT0 },
 	{ TIM1_CH2, STM32_EXT1 },
 	{ TIM1_CH3, STM32_EXT2 },

---
base-commit: 14071b9cf2d751ff9bc8b5e43fa94fbf08aceea1
change-id: 20250628-iio-const-data-10-2e80d4dde542

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
