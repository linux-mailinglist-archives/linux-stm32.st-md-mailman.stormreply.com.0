Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 669F3B30FF4
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 09:08:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2425AC3FACE;
	Fri, 22 Aug 2025 07:08:41 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6136FC3F959
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 03:51:31 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-3252c3b048cso44160a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Aug 2025 20:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755834690; x=1756439490;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2ic1RSwaMXXzlWjrwYqAcZq1BU5xUJqmqIIBPYXlasM=;
 b=nEEhwGCVvHclpCjYUkg9xYyp5AoBhylNwzDAC+i+8UivL+DVTLRf7u4Q5SNfEInSyw
 hWM/4HW9/xsZnQZ7fLvmqRPYozUDl2uEj0KaVB1Pp30wZ601Uv6VyoxXkBQrw8XDvR1U
 6LDXVlV6P5gB6A0Fyz1O79W/ix0T16bu+/WT2eO7lw8vGcqj/l6ZPxx/CeWxz4KC2Lfj
 Hjx3EpUd7wkNY1wJ3Yeb+IqByfKuqLwBzsRBuj0i6/reDi8W/d9vM72cywdOoZtPH/hg
 QvI572JHzrJYFlS4N9gRx03kDCuqHSyYEDy/qs4ImXiddbnVDQSpf6Lnxrs7dQlbkRgx
 36ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755834690; x=1756439490;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ic1RSwaMXXzlWjrwYqAcZq1BU5xUJqmqIIBPYXlasM=;
 b=lxHHKAV6KeGTC2p2VlwRU2z6/ClAdKug8W1PxXh4SM0lkqhg3XDQGZVb8Bh6bxtR49
 Qc110tXPsb15Io6m7v6EoEW1R0d1BVUa9/cTkp/FODUzRLlDCipp0H7dbCo+TttFjuMC
 eDBGdhkyTvraPh2YaFqj6UPU/mocejmVPDOoOo/cLDe8rqlqVD6tg4rHEoU3vvrMgznz
 sJYEhWZWt/5imGepT9yeNYNzOweDE9TTisK6Lu8Rb3ONWzirS84VQZ5GIhhijr4DVbAZ
 b4PtyYGBD4nv0BZURHE63SgpNvd8xGJdzL4pMALhdpeu9zw298+RwovLqhHKLbqLB7zb
 Nulg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFMfhPGtMxEGpXTxtH4sE1Nddjl4Neqf4w6QVf6XEyNfJDLdu+KR4YbctCiOM6+uW+oEQ0OvXV9/Cc3w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz5G32XV75Nby462uvOozXvkDY20Ypz8iin4dbcUr/gU8pMiSYD
 sP6YXsCtjL4/cSngYLGkNXjUGQeeZiUsZuiDeZ8TQAeI+Uogj7K4wpHr
X-Gm-Gg: ASbGncv10Up7KlSds3PmcslP5Q6rCQDpRUKq82fUJ8++X5LLfdjIe4EGWwC7cWGdnQY
 1W1flAq3G8Q9IwX1QUe3mnJK17o+H6qyHS3/+clICFcwVUopMkZujmo1fQ6E4dqvPHFgiVD/tfn
 N+FeRqJ2YjPfZR17P+BU5U1zm38wyuPiE5AzGaFI/A0M2oC30ZCfk5TWWnU99bn/axpN0W6WWXT
 jo0EWrNDyuGG9Di0tqnoXuMhHwLTBfiUzZCQBHr9DY5rQ4+Vo/EYf3AouWxhG10ihnmMCJZgzzN
 UKW4ELCpfRdVhQ79hkN7dxVjdHujUv+cibpKGEKncvcWgAoqQ4uy91s+3C87O2WI28O78GVidvZ
 n/3+rbPm4GPQL9VyHM8B3jYCUAPFF
X-Google-Smtp-Source: AGHT+IHazmWMn5flz3tUaLeTbaWTObNzUqMBMWJOszgRw6Z/ukldWbaL+PRp8cadzUHNkyL/sZ9JwA==
X-Received: by 2002:a17:90b:3905:b0:323:7e80:881a with SMTP id
 98e67ed59e1d1-32518b82606mr2312355a91.37.1755834689799; 
 Thu, 21 Aug 2025 20:51:29 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 20:51:29 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:55 +0530
MIME-Version: 1.0
Message-Id: <20250822-enomam_logs-v1-7-db87f2974552@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=902;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=E1V6sSqy5U5ix2vZ9xw2GcRNF44acNubcMe6cIl813U=;
 b=aWuPdlGcfJX5HdaU6dQ4HYX84kcudR6WWXh2AU7VNH88OlFqJsDl+0zRF36EXeUVuuUYIi8ni
 WpnWGOqUnKCBWTnDisswIM4TkMfukTERrC0n2E6vcvNG0UpfSGUKNEb
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=
X-Mailman-Approved-At: Fri, 22 Aug 2025 07:08:39 +0000
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dixit Parmar <dixitparmar19@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 07/10] iio: potentiostat: Drop unnecessary
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
 drivers/iio/potentiostat/lmp91000.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/potentiostat/lmp91000.c b/drivers/iio/potentiostat/lmp91000.c
index 030498d0b763..eccc2a34358f 100644
--- a/drivers/iio/potentiostat/lmp91000.c
+++ b/drivers/iio/potentiostat/lmp91000.c
@@ -321,10 +321,8 @@ static int lmp91000_probe(struct i2c_client *client)
 	data->trig = devm_iio_trigger_alloc(dev, "%s-mux%d",
 					    indio_dev->name,
 					    iio_device_id(indio_dev));
-	if (!data->trig) {
-		dev_err(dev, "cannot allocate iio trigger.\n");
+	if (!data->trig)
 		return -ENOMEM;
-	}
 
 	init_completion(&data->completion);
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
