Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F19583F27A9
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Aug 2021 09:33:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68990C58D7A;
	Fri, 20 Aug 2021 07:33:53 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C00DC424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Aug 2021 03:20:02 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id 22so9548814qkg.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Aug 2021 20:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ILia9TnznEgu+zH0nAD0DU3ELIP+hXxx/xtqhrAXbUc=;
 b=sjjsZXWb4ZAPdSvkpjDDeS63EK6LqAuKdpTC5PXtJlmaww/87Om/upXqpvAX2p0oOE
 +LdwtSl8oH66cE9XdrtTVCLQT4iaBimtscoyGxjKhF1pdFI8qWmZ956TqWei0pjD6Dr1
 o6VecAO0cN+QaIVxrL5h/7Mfu5pkjyj6nVIJWTHsisCA7Gc0HHX+JhbwpFjpLQBqKpLp
 9seCoCjCY7GaI/udON/vlYZ0TVOIHVDafFyGKreSfAy7qGkJ6NhYCZ1ZFLdp8RxZvfcR
 a3XqHo66xcPA3XJeEOUUOK8nA9Ws2L1Ic/T0LNfM07fYd9oOvoone+7CC4vFRQGsLj2c
 oGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ILia9TnznEgu+zH0nAD0DU3ELIP+hXxx/xtqhrAXbUc=;
 b=Siiv+1PcZ4uyQIlp3hE04+Tbh9+GFB2+cn8lYFNxlzEn8qH3M7x3dG86R3L62NFACs
 z8g6Zs2aZGsvsDbhTgQQ5xduh3lDBPcA8PaXbelujrHKav+jconbsF8fXKJigwoiSQEW
 D4ksplsD7V8aW1eP4BvIOad6CqnfzT+yYgNua+JrfApu+UjPY5e9gsl75dTcFA0U4DGH
 6E9FIJK6iHH8kECYQPJeYzGr6PgzXyToW9I0oy8jGlp0fORNdfuPvGzwaIGSTlkqwVZi
 q+aa5pUroK++Y6mEwzxwelyPRRt10u5viyHRN7Acdlpu6O8CjOddtlUBGZNl1zTjV98/
 Gl0w==
X-Gm-Message-State: AOAM530W8ClXC/XMbjAF5aMo/b1gV2iBws9smOFuPgYAKszsd37SXnHz
 DBrG1eW8PMm310KOeMO96/o=
X-Google-Smtp-Source: ABdhPJxTY3pdJ7lF569LxTmk2KWEo0QxxkuPPcsGvnR/aBGc5UP4MwjsqxL3hZHfb6Skry/C5CQFew==
X-Received: by 2002:ae9:ef4c:: with SMTP id d73mr6935367qkg.494.1629429601851; 
 Thu, 19 Aug 2021 20:20:01 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id h68sm2668162qkf.126.2021.08.19.20.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 20:20:01 -0700 (PDT)
From: CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <jing.yangyang@zte.com.cn>
To: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 19 Aug 2021 20:19:52 -0700
Message-Id: <20210820031952.12746-1-jing.yangyang@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 20 Aug 2021 07:33:52 +0000
Cc: jing yangyang <jing.yangyang@zte.com.cn>, linux-kernel@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH linux-next] spi-stm32: fix Coccinelle warnings
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

From: jing yangyang <jing.yangyang@zte.com.cn>

WARNING !A || A && B is equivalent to !A || B

This issue was detected with the help of Coccinelle.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: jing yangyang <jing.yangyang@zte.com.cn>
---
 drivers/spi/spi-stm32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 14ca7ea..cc4a731 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -912,8 +912,8 @@ static irqreturn_t stm32h7_spi_irq_thread(int irq, void *dev_id)
 		if (!spi->cur_usedma && (spi->rx_buf && (spi->rx_len > 0)))
 			stm32h7_spi_read_rxfifo(spi);
 		if (!spi->cur_usedma ||
-		    (spi->cur_usedma && (spi->cur_comm == SPI_SIMPLEX_TX ||
-		     spi->cur_comm == SPI_3WIRE_TX)))
+			(spi->cur_comm == SPI_SIMPLEX_TX ||
+			spi->cur_comm == SPI_3WIRE_TX))
 			end = true;
 	}
 
-- 
1.8.3.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
