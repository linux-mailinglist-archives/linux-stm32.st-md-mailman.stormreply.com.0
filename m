Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB191E0578
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2020 05:46:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8639C36B24;
	Mon, 25 May 2020 03:46:21 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5568FC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 03:46:20 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id p21so8107138pgm.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 May 2020 20:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Eu+Ho/X9r7MZN52F/RomcQQtgjiQ+X/m9AkGhdRXtC0=;
 b=hlbOLQ3Eyjn+XvXsI6V94Sxye1id84iasnp0uBZIRnBKOkbSU9yUbIlq41keOh/DjV
 M1Ji6ztXni7ait2BVtg15UvWVCX+vU/nFT3K1YarMdgZiYIY/cRoUv0KGgjbkRIZqvSB
 63nHgdS7zUi+wtwJ8SqLo93B3tzLNNoTRj10+QAlVcCSbgjVGTKNRaeGDJTUQETf2BP+
 Lb7gvSbVZhR3G2KTWG73ysbzCiM2NYHYNaz7/L9i2dmlI2vdR+kVt1h9n0FOY+BSUkvc
 d1dqmHCCPP2l9PLtyGm+TcQLTBVFtA8k/HtwXqlArTw8rogH5EMBjOPtBKe3H89ggCO1
 zIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Eu+Ho/X9r7MZN52F/RomcQQtgjiQ+X/m9AkGhdRXtC0=;
 b=FifyWrh/vIAvUoEr3pNkkD31Kd3RxQSfUWkgJtTM4fRuRcNIuIlH9JPsdlSB2G48RS
 inaBHx8Gm2ySN0fHv8JQNUnOvPQXx8kJIn/cylasetbf7JJ93XgyU2vt37ySg1tCsjph
 mZjkn1PBPYo+xyxr1MsB0+cuRfezz5czFdimXtWJtPC7BzeO+kj4ssPuF77KTcnCUPW7
 obahYT6hr2tW0K3l1VbTvKtwXo84u8tP3ey1I9P20e/zFDptSy2ljLYI5BORlrpyF69B
 ySnliRiiz3Uq+t+7t5Ph6nEKdyAh4HWYewQYawZ+zO0dBBw6DPa+0XhK/jTq5CpuPrmU
 1ELg==
X-Gm-Message-State: AOAM532AVKB4+yLivz/hzXPI4hkHAbHtWa4c6myljKeLviQI6jxxwjaZ
 JCaa/M51nyV+Yv5XVpQP9ns=
X-Google-Smtp-Source: ABdhPJyCVTbNtcFfst1GMI7OlJFQdpx2wRpgu5bLKCThc6j672Jh+qV5W3K7wBvjbpx99E6OdCvgoA==
X-Received: by 2002:a62:8888:: with SMTP id
 l130mr14964445pfd.140.1590378378954; 
 Sun, 24 May 2020 20:46:18 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id i98sm12152831pje.37.2020.05.24.20.46.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 May 2020 20:46:18 -0700 (PDT)
From: dillon.minfei@gmail.com
To: linus.walleij@linaro.org,
	broonie@kernel.org
Date: Mon, 25 May 2020 11:45:48 +0800
Message-Id: <1590378348-8115-9-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
References: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 8/8] spi: flags 'SPI_CONTROLLER_MUST_RX'
	and 'SPI_CONTROLLER_MUST_TX' can't be coexit with 'SPI_3WIRE' mode
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

since chip spi driver need get the transfer direction by 'tx_buf' and
'rx_buf' of 'struct spi_transfer' in 'SPI_3WIRE' mode.

so, we need bypass 'SPI_CONTROLLER_MUST_RX' and 'SPI_CONTROLLER_MUST_TX'
feature in 'SPI_3WIRE' mode

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 drivers/spi/spi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index c92c894..f884411 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1023,7 +1023,8 @@ static int spi_map_msg(struct spi_controller *ctlr, struct spi_message *msg)
 	void *tmp;
 	unsigned int max_tx, max_rx;
 
-	if (ctlr->flags & (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX)) {
+	if ((ctlr->flags & (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX))
+		&& !(msg->spi->mode & SPI_3WIRE)) {
 		max_tx = 0;
 		max_rx = 0;
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
