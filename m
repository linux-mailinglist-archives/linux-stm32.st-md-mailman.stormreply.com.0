Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2406121FE06
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jul 2020 22:04:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E06E5C36B29;
	Tue, 14 Jul 2020 20:04:55 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4E76C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2020 20:04:51 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id x72so8045108pfc.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2020 13:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UOLpDhUaI5YvggRlgo01SV+Tf6RdV3ahOTchedkHuLg=;
 b=miob1jqq3uyJWDK9ehHABuSktDa5Dsm4+0451K6rGGo5B3KyWsNDs4e5X+wFRxTVeq
 To5GMy0VfU2mFj7H8BeWp2p1pHYsb6ZtVxpCTupv7HY0xRWCgnekld6iDJwip0yq5y1y
 aCStCoIiKicPpeHwSqWvOTKd1pQD1QTFRvZPlEMia/WO3oqWxceKUyWDrt2M4az+zwqm
 wd+cXATvk3FyONmAIFkJaAIN3/1PpvpUKbK3nMvbVeBmIBtfB0NNA9ZAZRrXYWn5n+I+
 fsGo79c6oOaV0L5pjzm0EIBAITNsPyFjht7r0mcoQCaDb+sUsEpSxWpghrI9gXmHW8U3
 jrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UOLpDhUaI5YvggRlgo01SV+Tf6RdV3ahOTchedkHuLg=;
 b=KZ4B/VtToad/LWdcd7BoNrKmJ1J1163L99rrHBMOn/8Fcj4sQvCQNOu+efp0xKpgRD
 nDzqtuKwkqbBV4x6LTaj8R5t9Gk8xunqCBE8TwMQIxcqrsO3qE33mSpNuUtTIO0xb3Xy
 vLWPsGAvfVNfS1Re564s54sbd1r7+YtfbxxMXKX7a5HTVVc5Lcmawp+hksF3drDG5NI9
 Ed/fnSCe9+XWsceUZjgi0mBQSUss2mEZfYOp3bTaRqhQn1kOepYZccRBpCRt6eHA9Pbp
 g5b3HRldhO6ws/4jKAkUK2CPpsgIhVnvVSUEhz2UOiM0XiawTiluukoMYu11ak/RaJ3U
 u85Q==
X-Gm-Message-State: AOAM531jr6y0YQVNOeeJ/jfITbgcQoZrqyFFtrqayIv4RM6piwxIfh8C
 MW0Bt16d1MuGcGJ0MNeGYK6nGw==
X-Google-Smtp-Source: ABdhPJz6mKLieZUUmXU9lcTrNEVXgWxB8eIfhND2OLgaJYj0xFmOUrJ3RIeo/P99+TTmJnFR5Te/IQ==
X-Received: by 2002:a63:d806:: with SMTP id b6mr4287879pgh.403.1594757090379; 
 Tue, 14 Jul 2020 13:04:50 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id t13sm3262959pjs.17.2020.07.14.13.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 13:04:49 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
 arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Date: Tue, 14 Jul 2020 14:04:36 -0600
Message-Id: <20200714200445.1427257-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
References: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v6 02/11] remoteproc: stm32: Request IRQ with
	platform device
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

Request IRQ with platform device rather than remote proc in order to
call stm32_rproc_parse_dt() before rproc_alloc().  That way we can
know whether we need to synchronise with the MCU or not.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 2973ba201c1d..c00f60d42ab6 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -262,7 +262,8 @@ static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 
 static irqreturn_t stm32_rproc_wdg(int irq, void *data)
 {
-	struct rproc *rproc = data;
+	struct platform_device *pdev = data;
+	struct rproc *rproc = platform_get_drvdata(pdev);
 
 	rproc_report_crash(rproc, RPROC_WATCHDOG);
 
@@ -554,7 +555,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
 
 	if (irq > 0) {
 		err = devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
-				       dev_name(dev), rproc);
+				       dev_name(dev), pdev);
 		if (err) {
 			dev_err(dev, "failed to request wdg irq\n");
 			return err;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
