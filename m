Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEB53DD353
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Aug 2021 11:51:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7156AC5A4E1;
	Mon,  2 Aug 2021 09:51:15 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07F10C57B6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jul 2021 23:19:16 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id k27so6844444edk.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jul 2021 16:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=VBbhEWvbus7ziJpvb/XYH0OM683tiVzU4891qJ5jW4U=;
 b=lemSPLuV5IaA49HyZM/afkD+OgNcBUvIJauIxkInOvd4rnovqj3+gKZfSRrxj6fT2C
 1fMNmcNF52bK3nvqP1a0BTcDcKWOAb9x4uZBaHgv8gajItD/T1cQH+1Ux4JaSLNumzsC
 EuHqf0Kg5BSClTi60HMrLHy30v2msKCJ19bwDeypVU+IQ47DDaRNmuoDWvTGD9Vht5CT
 ZmKa5PeMIGz2+0RvavO6uIeSKDm71/BFljpMu9kwUGHR/Y/DxXmlYmzbpSQYJuk+7Mxi
 78a5MuBMHWqC3LSsNPPg0QBgSDQWUp2ejhH/zhIB1F+y1z6gXlMf/u4zhrQVj674LKFw
 lAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=VBbhEWvbus7ziJpvb/XYH0OM683tiVzU4891qJ5jW4U=;
 b=XDRcvnRwe/8paJqxD7qT8OdBt9fhSKjYApbNBowpAxNsisKxgwNaB37AaatdaNL7ch
 jqUpnHH0u1r9y62HviVFWsoGR5kYLs0tyvPPwJ08CcCcnitX98/khzyMBCr2jTJwLNr4
 pnwXaHuqy+M05AQ/8d59rHc6m2g0RB9H5qLqv8H03+hey7A2J2+4Qnldz2DqTqRkeNCv
 S1NH8uXCVK7AHGX+bBA1sIs1530Jn/WtM2vW7p4TJ+bbs6IK+qem3GjegZw27g4buSYk
 0xvjl1izP0DYJLU1KsGSzeRPlf+0Mmmm2jz0QgJ+Afrupbi3U9YX8og8tNasVS92XlcK
 UTng==
X-Gm-Message-State: AOAM5323+QsARVZ1rBKyYewsXSEt64l/m5DBLDJwq5AnmoSwktHso8Hd
 uiTKOV1igI2GEQhgOCK9yaI=
X-Google-Smtp-Source: ABdhPJxaNoFn9O1IGfp71lScAWRvRQMBo74KvcqChM8BUYAhSFoXmB3BCa2ZOxHlKrWpZgeMLi/W3Q==
X-Received: by 2002:aa7:cfcf:: with SMTP id r15mr1594999edy.161.1626131956606; 
 Mon, 12 Jul 2021 16:19:16 -0700 (PDT)
Received: from pc ([196.235.212.194])
 by smtp.gmail.com with ESMTPSA id e24sm6983837ejx.100.2021.07.12.16.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 16:19:16 -0700 (PDT)
Date: Tue, 13 Jul 2021 00:19:10 +0100
From: Salah Triki <salah.triki@gmail.com>
To: fabrice.gasnier@foss.st.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Message-ID: <20210712231910.GA1831270@pc>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 02 Aug 2021 09:51:10 +0000
Cc: linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] divide by 3*sizeof(u32) when computing
	array_size
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

Divide by 3*sizeof(u32) when computing array_size, since stm32_breakinput
has 3 fields of type u32.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/pwm/pwm-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index 794ca5b02968..fb21bc2b2dd6 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -544,7 +544,7 @@ static int stm32_pwm_probe_breakinputs(struct stm32_pwm *priv,
 		return -EINVAL;
 
 	priv->num_breakinputs = nb;
-	array_size = nb * sizeof(struct stm32_breakinput) / sizeof(u32);
+	array_size = nb * sizeof(struct stm32_breakinput) / (3 * sizeof(u32));
 	ret = of_property_read_u32_array(np, "st,breakinput",
 					 (u32 *)priv->breakinputs, array_size);
 	if (ret)
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
