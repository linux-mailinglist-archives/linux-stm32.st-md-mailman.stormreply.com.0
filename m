Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C239B30FF6
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 09:08:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44CBFC3FAD2;
	Fri, 22 Aug 2025 07:08:41 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34724C3F959
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 03:51:54 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-76e2ea933b7so1658276b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Aug 2025 20:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755834713; x=1756439513;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HtaId0UEXdWNlODSrBbRe1UfW9oq1uGtqK7BQmJdRjE=;
 b=CP0whXPpCYie0se4LtZLJwRgp+le56iKFq1UL9If23/fuJKkM7GCOfW6DPbsxjAxtS
 Z4wO1VuKlnWQ65TZCaizudDpg+qn300TcE6DgCQbqzSVzqUy6U6kw8Lm/nABv/KXbv6a
 al5pa5j2Uzr8eveXUSU89GBZMv1pylGebW/LHHQcFSsR2M7fPheKxuJmAuvWqiJssyA/
 csX+l8bN2xjRmGfiSumXcZma0YoRB+77Bx6pgbBbQhkyCufhzF1ATFt7+eQEvUQkUvWU
 83KcU7bbpwnpYPsHkN/Zl0iiF91qAr+vE2jzYu0env2gVcJD2ENIOoHympGlC+qjGK/h
 iEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755834713; x=1756439513;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HtaId0UEXdWNlODSrBbRe1UfW9oq1uGtqK7BQmJdRjE=;
 b=marfCAA9vKlBHj/mMKQEnMJkTViPcan2lWVwAUmZzl4k+oQKlndPcPMFaIp5n66B5G
 5kRgqRL3KREkrDI1TUC+mI1amsSyILa/m8Ig0PixtPWhAsJyrWXWp43/gqOt7TCKPJnW
 Pu5NtJg2xAiyrImRyS5dQpXU/YNgyxZel8UzCf/trVCPy4wNcaW3VXRHT6Et9sXDZ+a8
 zHwi2lO/KxqyTSPd2mZ3Z0o/geZrHyyFnn1mdyQP15IZeBeycFhwrBwKIpMu+k1VVQZ+
 ylJT6A+NVovETCtTHv+ZKAKIx9qldnQtH/2+cyQS/+EYkqjXhuIyL3RpAZCFAv1hy/d1
 AodA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMTnmp8nArkD7XccJN25WQo3Vytg2BXURFAKAmNX8TwtfyVeEgvT5qygl2OMgiGPDRbdO0k6LNM7KFgw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx6+v52zVG3FR55qdiRTI/sghbrVXGepis8UiqkbEZSiuFo1Iqn
 tAjoEA6pvnPPY1GoAwORRErjQDY56/8u2uJ9uC+v5gNLFvvQic9vTJPx
X-Gm-Gg: ASbGnctGdUfQPbON7K8BsRO0eOtrmJtcp50QUUyCxpCI//M3b3Ef5h53AoXsF+xDwh0
 kzhEm6qObIP6ZHn5lUfDHfXJUt3pqccOyCQLjTrnDWMTUrYunybg0EKHM7McBH9au86OvQLhEKK
 bnuMBLhnFHmqWWKKm3pg8ixcztIG0gRk7wh/sMJlx8nTuoJtg1aWeBcmlXAOzGGzF4f88BLVsHA
 4EQKVGpTyvrHrRELbUvNzj2/LQUDLrrHW1o30rhzbw91mjd3HYQQ2M++RJRB5bYlLinpNYICiiZ
 GTLS+i4NjuPtOwGFqZ4rM599mH3ioTXgTNkJYlcb/rH29gn4l21AktBeWvcP0s9NcsCsiMRMcDq
 urTpiZkQ2EACMhy39xevwhILIAYwK
X-Google-Smtp-Source: AGHT+IHEL8ONsqgS7iIxwqRUVPY9B8jnNtZgB3rknZG4iSaMdkOlahK3+51EyJoqDE0SH8cv7geg1Q==
X-Received: by 2002:aa7:8889:0:b0:748:e289:6bc with SMTP id
 d2e1a72fcca58-7703051195bmr1992722b3a.1.1755834712769; 
 Thu, 21 Aug 2025 20:51:52 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 20:51:52 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:57 +0530
MIME-Version: 1.0
Message-Id: <20250822-enomam_logs-v1-9-db87f2974552@gmail.com>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
In-Reply-To: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Haibo Chen <haibo.chen@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andreas Klinger <ak@it-klinger.de>, Crt Mori <cmo@melexis.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=1421;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=o0kHbqFpyBP/mgTiX4N/QGk9oAOztYPO8grzmPdvqrY=;
 b=Q8J70rA64x5Wx/SDVM/m1/65rdR7MZeOH79krewJg9gKcpihiqbOP8UjztiODzFgeo32vIohz
 JBzgUFPJRTDAPYbuF7xQHLIOA4XuPnb93j9EvkSJSHk3SkSO6mnz926
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=
X-Mailman-Approved-At: Fri, 22 Aug 2025 07:08:39 +0000
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dixit Parmar <dixitparmar19@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 09/10] iio: proximity: Drop unnecessary
	-ENOMEM messages
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

The drivers do not require their own error messages for error
-ENOMEM, memory allocation failures. So remove the dev_err
messages from the probe().

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 drivers/iio/proximity/ping.c  | 4 +---
 drivers/iio/proximity/srf04.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/proximity/ping.c b/drivers/iio/proximity/ping.c
index c5b4e1378b7d..e3487094d7be 100644
--- a/drivers/iio/proximity/ping.c
+++ b/drivers/iio/proximity/ping.c
@@ -280,10 +280,8 @@ static int ping_probe(struct platform_device *pdev)
 	struct iio_dev *indio_dev;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(struct ping_data));
-	if (!indio_dev) {
-		dev_err(dev, "failed to allocate IIO device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->dev = dev;
diff --git a/drivers/iio/proximity/srf04.c b/drivers/iio/proximity/srf04.c
index b059bac1078b..f9d32f9aba1f 100644
--- a/drivers/iio/proximity/srf04.c
+++ b/drivers/iio/proximity/srf04.c
@@ -253,10 +253,8 @@ static int srf04_probe(struct platform_device *pdev)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(struct srf04_data));
-	if (!indio_dev) {
-		dev_err(dev, "failed to allocate IIO device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->dev = dev;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
