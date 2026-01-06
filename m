Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10210CF6F30
	for <lists+linux-stm32@lfdr.de>; Tue, 06 Jan 2026 08:02:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4088C5A4CA;
	Tue,  6 Jan 2026 07:02:41 +0000 (UTC)
Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch
 [79.135.106.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2ECDDC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jan 2026 07:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
 s=protonmail2; t=1767682957; x=1767942157;
 bh=Ff33WQ4GQXy7iOXr07oKwZiyvNoomCN0lMUIfbK3JYQ=;
 h=From:Date:Subject:Message-Id:To:Cc:From:To:Cc:Date:Subject:
 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=KY24gprEBSRLNs4XwnP8ztibL8SJvCsGaIRZl5Luww9RJVgq2f1n7OooViBUZ4eoD
 3F6SaU6rkt2Z8FKkDtCYGMXd54dsXinZA1/si92Lu22j0PqlHo6y936qjXCIRIiS7P
 p2vYjFs4YRnMcmlR436AYZv+GH3MqaCL0KEjWv6rBnB2fQaUZRm1+wX9tc5RIIhve7
 KsVZPYm2uGvLXnlYv/h78+W4ciQEraJ0pZaBmWJgIG5616aNBv3B0J7tLa0Yf80/qY
 wlkpmcClHRROnnmb+0JHb6WYCyrOfKTpRiGvUrKAtF5zY/qcKxv5DEWfsr5Ah2eeAh
 HIJA8EEJ5uclw==
X-Pm-Submission-Id: 4dlhv00m80z1DFFx
From: Sean Nyekjaer <sean@geanix.com>
Date: Tue, 06 Jan 2026 08:01:57 +0100
MIME-Version: 1.0
Message-Id: <20260106-stm32-pwm-v1-1-33e9e8a9fc33@geanix.com>
X-B4-Tracking: v=1; b=H4sIAGSzXGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQwNT3eKSXGMj3YLyXF1Lw+QkCxNjMwuDNBMloPqCotS0zAqwWdGxtbU
 AIJCvw1sAAAA=
X-Change-ID: 20260105-stm32-pwm-91cb843680f4
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Sean Nyekjaer <sean@geanix.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] pwm: stm32: handle polarity change when PWM
	is enabled
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

After commit 7346e7a058a2 ("pwm: stm32: Always do lazy disabling"),
polarity changes are ignored. Updates to the TIMx_CCER CCxP bits are
ignored by the hardware when the master output is enabled via the
TIMx_BDTR MOE bit.

Handle polarity changes by temporarily disabling the PWM when required,
in line with apply() implementations used by other PWM drivers.

Fixes: 7346e7a058a2 ("pwm: stm32: Always do lazy disabling")
Cc: stable@vger.kernel.org
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
This patch is only applicable for stable tree's <= 6.12
How to explicitly state that and what is the procedure?
---
 drivers/pwm/pwm-stm32.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index eb24054f9729734da21eb96f2e37af03339e3440..d5f79e87a0653e1710d46e6bf9268a59638943fe 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -452,15 +452,23 @@ static int stm32_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	enabled = pwm->state.enabled;
 
+	if (state->polarity != pwm->state.polarity) {
+		if (enabled) {
+			stm32_pwm_disable(priv, pwm->hwpwm);
+			enabled = false;
+		}
+
+		ret = stm32_pwm_set_polarity(priv, pwm->hwpwm, state->polarity);
+		if (ret)
+			return ret;
+	}
+
 	if (!state->enabled) {
 		if (enabled)
 			stm32_pwm_disable(priv, pwm->hwpwm);
 		return 0;
 	}
 
-	if (state->polarity != pwm->state.polarity)
-		stm32_pwm_set_polarity(priv, pwm->hwpwm, state->polarity);
-
 	ret = stm32_pwm_config(priv, pwm->hwpwm,
 			       state->duty_cycle, state->period);
 	if (ret)

---
base-commit: eb18504ca5cf1e6a76a752b73daf0ef51de3551b
change-id: 20260105-stm32-pwm-91cb843680f4

Best regards,
-- 
Sean Nyekjaer <sean@geanix.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
