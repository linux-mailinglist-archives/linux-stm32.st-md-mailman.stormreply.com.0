Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 764D0B30FF5
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 09:08:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3422CC3FAD0;
	Fri, 22 Aug 2025 07:08:41 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2DC7C3F959
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 03:51:42 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-77033293ed8so130665b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Aug 2025 20:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755834701; x=1756439501;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/EixXrQYznjJW/63oKtisPH5UyKT6tWjQS1Ri3VBxh8=;
 b=AkYiL41sFkOs8shASNFdrLpaS7Re0gpjBp7aDZ3iLACmmcRrLiWG8fW1Il/Il6hUav
 t3niYroxNeZTS9mwBAWqZN9lfABtevuECe+Ode5VF/vLuKZmEu0E1BF/Pl4JWvO9hkDh
 mcrNsSp8J3NrlbvFbwdlyD8rEptCKxbRRl+tpXpdxBT9y13TDmZJAXXG6rn0OUkPx6LA
 WPVXYOx9SSA/RMMvbmG/K5luejOiWFpOp8wDvfDeJ7o6SlCyNH3HoDJ0dskQqwrxQc1f
 JH+eDw2AdTzjnh5E6zyUwZ76K1dfzpPEUQjCFJjWvpxnxFShTdTfedHDnShnHsnlIWQb
 hVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755834701; x=1756439501;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/EixXrQYznjJW/63oKtisPH5UyKT6tWjQS1Ri3VBxh8=;
 b=GlEh0GtPS3I8n2xrjZuAwNxNT9cgp9fksCKjo5FOeQD0rkfZsMi4ENvRrcZklLMZTB
 JkIc0tPBUNDs2DIxE98c1nHS8fQ1MR0rGgMiN7V5v/1T3Ua/pDm1cTizNSB0eoGxSvPd
 d+KWU9PqGzQne4T72WMqj6Mxmy4ljgu4P87qHlZCpMYpMq7qjGFMzn1rnCclanoD/UgU
 2w6OT0kfWqzYXHNdPU8jFc9S954wQlAsQCC3gglBmkISi1CmBz0H3zqhL8jCIskfANqm
 wQ3gHlN+0FHfrpgRQklte+rYoYXCFTvznC89CBZ9GXd8jINW+5up3s3ugfEj0PcRBvhl
 lqOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEZMaBR5wNQJ4+9vsOrPy7cxSwitSCk9dmZFkpRj19mo0lwEkvbs4gbaXFVHJ3RJnOdo9gDERJNB9/fw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwxalKjWPnDE3QBJB28i0HhMGQXTCXpGfQSNoZ2uqztFwcjH21R
 O6POQQQIq9FIPFv7eSu94ZcVki/5PB+Hw5lQ10dXaNlixO5GAKlGbCx2
X-Gm-Gg: ASbGncsb5O7/zeOikuohhA18NQrCqgUmlj7i06v04oQ4Yiry93QQLSxs1C0FcWsl7r0
 BSKbdiw4TBv7dM3t+ps9FQ4iI5DUt10ynTmwDSE7DpC6SlqG51rjjKjFO+E+yB7jDv81XGcjllG
 VTtZw7jaS24SsHORFwuHaiMihd2hKlGkJCibrj17GNlmz4j3Pjd/QMgOyeIqiHYjFvI56P87TGQ
 k6Dtj8PylAoQFC116g11sdH83UodXLRH2CkA605pxWFEuEfsSKDgjkJL2MXazM7Hbd0iA+JyHb1
 8latvgsO1QA/MpxPMG+Q7vnKKM4rxsH3UqBnPBLpNdrvG2NHiXGjdtZ5MudZ9AtBjZSvs2KAwGO
 bA/X4RmTi0Yt+s+cUV79oGrdMijFA
X-Google-Smtp-Source: AGHT+IGmG2iHm+kPtdB8VyZNf1Keeivo0b/Ddo4YxYKdTXfFyokHg1nQnJSsPhPXXQhViC7G78ZoCQ==
X-Received: by 2002:a05:6a00:2288:b0:770:3064:78fa with SMTP id
 d2e1a72fcca58-77030647984mr1909008b3a.2.1755834701233; 
 Thu, 21 Aug 2025 20:51:41 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 20:51:40 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:56 +0530
MIME-Version: 1.0
Message-Id: <20250822-enomam_logs-v1-8-db87f2974552@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=834;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=9sYG9bHos7xB9NTLNoGx74dL9X517YjRrTR6gyjXoAQ=;
 b=NI1M2YGG1OwJpwbLAJnJ6Qnit+GivyUJswFcnSjAyT2MnVw5sTWxxCLJoS3GZsCiajAbZFUyc
 84hThunItQmAHPZ5dwKUdMNC8vDzpzBO3EbM2n4xQrC+R98ypIPo+hY
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=
X-Mailman-Approved-At: Fri, 22 Aug 2025 07:08:39 +0000
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dixit Parmar <dixitparmar19@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 08/10] iio: pressure: Drop unnecessary -ENOMEM
	messages
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
 drivers/iio/pressure/dlhl60d.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/pressure/dlhl60d.c b/drivers/iio/pressure/dlhl60d.c
index 48afe5c94000..c5f4f5efaef8 100644
--- a/drivers/iio/pressure/dlhl60d.c
+++ b/drivers/iio/pressure/dlhl60d.c
@@ -294,10 +294,8 @@ static int dlh_probe(struct i2c_client *client)
 	}
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*st));
-	if (!indio_dev) {
-		dev_err(&client->dev, "failed to allocate iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	i2c_set_clientdata(client, indio_dev);
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
