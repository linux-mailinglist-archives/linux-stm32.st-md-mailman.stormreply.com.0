Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0E2777517
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 11:58:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F0C3C6B469;
	Thu, 10 Aug 2023 09:58:54 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08994C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 09:58:52 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3110ab7110aso684672f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 02:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691661532; x=1692266332;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FkvqrMOXwmTcAnreaYq76I2AZtMUkMuF0vVGwhitEBY=;
 b=g/N1DWT58qicPn7aM797a838CAd0plUzi2BJWNf6ENVZomSjPXW96FFjXdcqIPtGZA
 BD2ihtG76tzRLS2QdSMjMUBQKnIHTxGmuBP78cqDNu07vqDTWPH1maafZMCdE5PeY5BF
 673UABS0RzviQvrOKhpsOJZ085Yzz9tuwo7QyPMBaywSxJMZ/0sSEjBFNDkq08f/CfHm
 yBeU1fg8oWVHc0jKQPonwe7w4LrFo4shzFaxzZGKLobN5K2BysRlSs2iT8/gqBGuOhVX
 g4Osxd3++ssQbMdARZhvPXtmiP7+eh3xqNEyXCHS/ilTIusiG9AFAovZlOCppQ2xnLng
 dM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691661532; x=1692266332;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FkvqrMOXwmTcAnreaYq76I2AZtMUkMuF0vVGwhitEBY=;
 b=ebUuAP4zVqo8uQ5dqySazR7oGKmb/F0arsgzT1AkuLX2+wqLm+L+IGiJGT/bzIg+bd
 UJJHt436uQMqbuVw3wQEIgp6cwZ92rSIR/0pDCuEe8nALW/sI/ynW6GAGWfknuOopj4O
 HR5zKSSPkWmoD7B36ew60p9yuEjs6Ox7Ozrq+KwV5oIEauJgAg4Vg6ZeOtmno32Qisza
 ZGjcaXbz9sbxripbOpE9vaLDrU6O1dvr/2YxUw3W+0ehUTOa8uBP7QfL/aIO4eDdbw61
 aMK851o8wMHttHYc+6hxpWY/psy6JlSA81Cy38Q6KVTRZROTKjJ1VikX0Ra4ngdY8UnF
 thtA==
X-Gm-Message-State: AOJu0YwAFCmP7UjXWDkFjgDRW7cGmxlRYju+jPboRHVo9kJdKHsBCUDK
 ZUntjDvDL3BNXHucA76bA/6zvg==
X-Google-Smtp-Source: AGHT+IG3X88ZKNaaHQptsEX+0z/EjxkhWAIwDrqS7AJwZwHbDUAJ6BHLalxATlDkew0dnEFTGjO0cA==
X-Received: by 2002:adf:f74c:0:b0:313:f5e9:13ec with SMTP id
 z12-20020adff74c000000b00313f5e913ecmr1581022wrp.68.1691661532380; 
 Thu, 10 Aug 2023 02:58:52 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113]) by smtp.gmail.com with ESMTPSA id
 p1-20020adfcc81000000b003179b3fd837sm1621372wrj.33.2023.08.10.02.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 02:58:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
Date: Thu, 10 Aug 2023 11:58:41 +0200
Message-Id: <20230810095849.123321-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [Linux-stm32] [PATCH 1/9] mfd: stmpe: Fix
	Wvoid-pointer-to-enum-cast warning
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

'partnum' is an enum, thus cast of pointer on 64-bit compile test with W=1
causes:

stmpe-i2c.c:90:13: error: cast to smaller integer type 'enum stmpe_partnum' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/stmpe-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/stmpe-i2c.c b/drivers/mfd/stmpe-i2c.c
index 1d7b401776d1..fe018bedab98 100644
--- a/drivers/mfd/stmpe-i2c.c
+++ b/drivers/mfd/stmpe-i2c.c
@@ -87,7 +87,7 @@ stmpe_i2c_probe(struct i2c_client *i2c)
 		dev_info(&i2c->dev, "matching on node name, compatible is preferred\n");
 		partnum = id->driver_data;
 	} else
-		partnum = (enum stmpe_partnum)of_id->data;
+		partnum = (uintptr_t)of_id->data;
 
 	return stmpe_probe(&i2c_ci, partnum);
 }
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
