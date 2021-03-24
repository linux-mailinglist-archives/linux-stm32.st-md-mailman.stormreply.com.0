Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F88347AB3
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Mar 2021 15:31:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A454C57B5E;
	Wed, 24 Mar 2021 14:31:30 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF20EC56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Mar 2021 14:04:29 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id z10so18059023qkz.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Mar 2021 07:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CpPLSn6SC+tjm/MP07tit/iX5OAxIHrELjJluCN4+Z4=;
 b=gK5Mfehw83CQNoo5eO1MGPKzFRwSFCx1vqAA28oFXLRTV77chR4gF8N12l9TMcl97r
 cWvV5XnWYoGjF6ouRwSJenqexpLsuARyB0/VwUZmMxruLd8c8kxXLjQzV1x1mubb8UGX
 1aU3vVsN/vvRK0/ygLinYq36Q7Oxr09rXYsAkWHsgc4phugCighwF47+TdD4h8VNYFzv
 7BsGHqcprnPLKvo/sc4vKNFTA+m3a4VySXoulxk5pmA3cDOZWwdzg6rgVBFQFZEXmdVs
 2sx0muI+K5n2Eqvp8Ds9THCqMm2lfsC2MCg+NKWQCb6ThIcqOPdEITvJFZnaADU/Opbw
 z6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CpPLSn6SC+tjm/MP07tit/iX5OAxIHrELjJluCN4+Z4=;
 b=l6ddnbGCnC3eMKG/WOqavzNnMM+l2oZGZYAuPUgcAXNY35sjFJGAGRLeMWeqA7It5R
 b7cZFvCRn7cMs/Qa+n12P9XnILXwD7imKb2Cev2w7e7Vp1uZqp/T+ZKWt5IMRcTPrOHk
 VWw9mp2TDUoBTHF5g933uYwJh+egkmNMRL8x5Mz20A15yYm40sae8Ul4fd/jI9fYPzZz
 FlD9j/V5KE/0cG7fBDaW1zPSOyumqyntDpe1bWdVFaoz64IBzma3GzudLX2MGdUgYaff
 GLQ2N0aH4iqwi2n+cN4ijvB1021CcimhrQi36pN7CDJeD1hS5UTUUV7tdSHWPLOGHZi8
 xLkA==
X-Gm-Message-State: AOAM5307yJskJHweVXIF4A8GrELIcEJn4n6b5gUa6zASfQgHYMnX66uD
 tHzP3CX9Z0mSkFQAn4pZJMk=
X-Google-Smtp-Source: ABdhPJxvFiADFOynFmLKf93cGd6AwCKXxls8SlNl74wx2zHm5MoUxa6OiY+hjvXImOw9EEkuYUg7Uw==
X-Received: by 2002:a05:620a:2013:: with SMTP id
 c19mr3175599qka.403.1616594668546; 
 Wed, 24 Mar 2021 07:04:28 -0700 (PDT)
Received: from Slackware.localdomain ([156.146.36.138])
 by smtp.gmail.com with ESMTPSA id s6sm1524096qtn.15.2021.03.24.07.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:04:27 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, p.zabel@pengutronix.de, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 24 Mar 2021 19:36:10 +0530
Message-Id: <20210324140610.32385-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 24 Mar 2021 14:31:28 +0000
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [Linux-stm32] [PATCH] i2c-stm32f4: Mundane typo fix
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


s/postion/position/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/i2c/busses/i2c-stm32f4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index 937c2c8fd349..4933fc8ce3fd 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -534,7 +534,7 @@ static void stm32f4_i2c_handle_rx_addr(struct stm32f4_i2c_dev *i2c_dev)
 	default:
 		/*
 		 * N-byte reception:
-		 * Enable ACK, reset POS (ACK postion) and clear ADDR flag.
+		 * Enable ACK, reset POS (ACK position) and clear ADDR flag.
 		 * In that way, ACK will be sent as soon as the current byte
 		 * will be received in the shift register
 		 */
--
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
