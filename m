Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 505A0AD62A5
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:42:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A036C36B16;
	Wed, 11 Jun 2025 22:42:33 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE733C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:42:31 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-408d7e2b040so190008b6e.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681751; x=1750286551;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wPyCAeDwGaZFGchY0PBly99ut+lLVqj8mqClvHcxWU8=;
 b=JYp3JGpaa08MLdbNn27neDK1vPf/XVkox214pf9kkueVHDhVaucfFVe44bzw/49Ahz
 fl2/Do5hQu3GgiKqtz4pNTV+vCUPP00MegaLwYjm5NsVUCmdclE1BqJJvad0jSc0liuw
 FDXwepA+JMynSjqWEDFyMz0sHFCw4jWmRVAaaJdv+Hn7QR1e+emCYJkB4JFywToSVk0u
 e9JSiL9e2lpxFLdaUcpFOIP/cM4ZJdTuV+PM8dRBLCdScfEgJMB9CQUZCMgGOvmR6Biz
 VuMRoHfZ1MR6Jvq08YL7Oy1MfUMNFP/esnaJvCq6PFlfuoqPBTIMXZrcNCV7ACIXYoKQ
 Rhbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681751; x=1750286551;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wPyCAeDwGaZFGchY0PBly99ut+lLVqj8mqClvHcxWU8=;
 b=FyAWsUEv/MwWkqFrfwF3me9WD8QvQrOnnhSJw6hIgioX9tsXDNO1paN5+TxFXEbw+G
 YlHgfoAEfzWOSCohssRnrJdbcCMzVaUfR+ZTm7EQmjegIekoPmst5ceVxmXGtKHgNOpr
 J2pE98N/v7AAZMGqWYhRaCVe+7nCf7Z2WcCHNjPsllbDFHeRjrVnS/lGPtec1iHNl4Xo
 dAz6ZJh+4noxAeLkD2L4vDxuWYWKmn4slyaIGuHvQ2gzkCn3Efno2p87KE5t4CImTKjX
 MHz8NYDniDcSNdqrJQKg5OyeVCgOW2YTrAcAEzVgKqlfBc+nSSqHRaG1RWJ0kbHnK0lY
 83xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOYTBADrGVxhQgun/l7ZzeKp3s78zK7c52nzE8eb6qWju/qzw0jl261Vt7LxT6cmIJit/ReI/k3jsBLg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy+ra2EvRN7FlfrDqcHnRJDeGmtpCukz9l4eeqN9D86VZaTitcl
 1qB+jYQqUCr5d6jf1kdstDEiG7BDthbv5gks7YXBNPSE2kLdDQsAMWG8oErzExNJboI=
X-Gm-Gg: ASbGnctt3rDLfRPYsIMbz92nwy5Ad4VHw94O4nIDHX1x9G4FiMsJOpS0UwsTBxJo++p
 wWD/ptUzpW1DJdsIf5X8k2+aYCHkOSjXubtuz5A7XZ3jeU22Nt1WcmY4uJcDWucHLOCjCQDnQdt
 LfA0NTHlmU/ziYJH/ASELwGHUTLeFuCd8loVSc3huqsT6K9En6fg7T+biL+uFnlGLmjJriq5cIr
 2t988SXCiF3cFt/clarss38Vm9rqhPrXME9HXNIXJPB4FXkNZG9N+FLIa8/dMuiFiyIO4/pqRmN
 IhotAZrD4Cc3iqDYB+k/6N2T+RDIphxFMgGDnoe4r2XZLRDon/UPoQdEMM/d5LlpAF7u
X-Google-Smtp-Source: AGHT+IGnJ7SCSrcoLGGDHLkeFWZl+xwmv56WaGassXNMfNwjd3I20gGItGHx1iX1x1Me2SDAPUpVcQ==
X-Received: by 2002:a05:6808:178d:b0:403:3370:4768 with SMTP id
 5614622812f47-40a5d05539amr3930457b6e.5.1749681750679; 
 Wed, 11 Jun 2025 15:42:30 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:42:29 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:38:59 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-7-ebb2d0a24302@baylibre.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>, 
 Roan van Dijk <roan@protonic.nl>, 
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Mudit Sharma <muditsharma.info@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=+7ef0opXHNBN2h0b3NWv84zYFhgTKH377f2j3if5pfQ=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgWyAR0/NtALS5gQgsb6D+CiSxnqwsX+WEtuq
 AOohtpPO9eJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFsgAKCRDCzCAB/wGP
 wDuGB/sHqLC2qkSS1PGNPlHGddzhPG/h6E+AJRBdBcDq5LES75oaDoNUp8YYjpUZ8xdWx6xXph9
 6s27b8H4wFgEqsmBhgTYtnLCeP9M5musN7+TAkf6nypK2UmTcK9fbVKTFJjTfgqDI2SlJXIgEQF
 9wZZHbHDOUxdLYBXmkPZKrjV+dIg1MvgLe+f0trGAuiVHPzEXT+jESYp6Bg8UvB9t0QQkNYXnP3
 hOfcMmO/eFMS/iKbzKKpfSQde3C42a5c/GPyzIqCLxiEhPIjQobMVq3UgCav5l44eRb1PJ9V2KC
 m6/9HkniYjZKtQ4qPcJc73pexbQoq3dz03m+kTljc/9Bt9Mw
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 07/28] iio: adc: stm32-adc: use = { } instead
	of memset()
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

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/stm32-adc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index e84babf433853977b77aa283025f446353510a21..588c69e175f5129030eef9ebfe0eabb6412b1893 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -2470,7 +2470,7 @@ static int stm32_adc_chan_fw_init(struct iio_dev *indio_dev, bool timestamping)
 static int stm32_adc_dma_request(struct device *dev, struct iio_dev *indio_dev)
 {
 	struct stm32_adc *adc = iio_priv(indio_dev);
-	struct dma_slave_config config;
+	struct dma_slave_config config = { };
 	int ret;
 
 	adc->dma_chan = dma_request_chan(dev, "rx");
@@ -2494,7 +2494,6 @@ static int stm32_adc_dma_request(struct device *dev, struct iio_dev *indio_dev)
 	}
 
 	/* Configure DMA channel to read data register */
-	memset(&config, 0, sizeof(config));
 	config.src_addr = (dma_addr_t)adc->common->phys_base;
 	config.src_addr += adc->offset + adc->cfg->regs->dr;
 	config.src_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
