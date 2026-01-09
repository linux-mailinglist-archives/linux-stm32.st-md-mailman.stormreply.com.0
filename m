Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1183AD0889D
	for <lists+linux-stm32@lfdr.de>; Fri, 09 Jan 2026 11:24:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7411C8F286;
	Fri,  9 Jan 2026 10:24:45 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65D6BC1A97C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jan 2026 10:24:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4390F40693;
 Fri,  9 Jan 2026 10:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9303AC16AAE;
 Fri,  9 Jan 2026 10:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1767954283;
 bh=QLg70m52S+BZ/YlLw0GoYosME7rDVF1RLDHJ1MV2EEk=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=fX+mz7wtbjB3i84dupJqpxXg2rV7lDi4uFgnS17LKsgvqc4EbZlue27OJoVFz4obP
 SvnuBeBtYa7cH5H0pNpeq/cIIRvcwt5bqfS6CFEiFgJR6ui+nO/PrZ/Gtp9/nvnCLA
 h2OcFpqds/O0zGiRVk0Oo2UJr+dPKdUbHGx4DmRg=
To: alexandre.torgue@foss.st.com, fabrice.gasnier@foss.st.com,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, sean@geanix.com, u.kleine-koenig@baylibre.com,
 ukleinek@kernel.org
From: <gregkh@linuxfoundation.org>
Date: Fri, 09 Jan 2026 11:24:40 +0100
In-Reply-To: <20260108-stm32-pwm-v2-1-ced582974f8b@geanix.com>
Message-ID: <2026010940-skewed-curable-c81f@gregkh>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
Cc: stable-commits@vger.kernel.org
Subject: [Linux-stm32] Patch "pwm: stm32: Always program polarity" has been
	added to the 6.12-stable tree
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


This is a note to let you know that I've just added the patch titled

    pwm: stm32: Always program polarity

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=3Dlinux/kernel/git/stable/stable-queue.git=
;a=3Dsummary

The filename of the patch is:
     pwm-stm32-always-program-polarity.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From sean@geanix.com  Fri Jan  9 11:22:32 2026
From: Sean Nyekjaer <sean@geanix.com>
Date: Thu, 08 Jan 2026 13:45:23 +0100
Subject: pwm: stm32: Always program polarity
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>, "Uwe Kleine-K=F6nig" <=
ukleinek@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexa=
ndre Torgue" <alexandre.torgue@foss.st.com>
Cc: "Uwe Kleine-K=F6nig" <u.kleine-koenig@baylibre.com>, linux-pwm@vger.ker=
nel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.i=
nfradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, "Sean N=
yekjaer" <sean@geanix.com>
Message-ID: <20260108-stm32-pwm-v2-1-ced582974f8b@geanix.com>

From: Sean Nyekjaer <sean@geanix.com>

Commit 7346e7a058a2 ("pwm: stm32: Always do lazy disabling") triggered a
regression where PWM polarity changes could be ignored.

stm32_pwm_set_polarity() was skipped due to a mismatch between the
cached pwm->state.polarity and the actual hardware state, leaving the
hardware polarity unchanged.

Fixes: 7edf7369205b ("pwm: Add driver for STM32 plaftorm")
Cc: stable@vger.kernel.org # <=3D 6.12
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
Co-developed-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>
Signed-off-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>
---
 drivers/pwm/pwm-stm32.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -458,8 +458,7 @@ static int stm32_pwm_apply(struct pwm_ch
 		return 0;
 	}
 =

-	if (state->polarity !=3D pwm->state.polarity)
-		stm32_pwm_set_polarity(priv, pwm->hwpwm, state->polarity);
+	stm32_pwm_set_polarity(priv, pwm->hwpwm, state->polarity);
 =

 	ret =3D stm32_pwm_config(priv, pwm->hwpwm,
 			       state->duty_cycle, state->period);


Patches currently in stable-queue which might be from sean@geanix.com are

queue-6.12/pwm-stm32-always-program-polarity.patch
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
