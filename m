Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D57DAD62A3
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:42:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A565C36B16;
	Wed, 11 Jun 2025 22:42:30 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EDF9C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:42:28 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-40905ae04e4so126525b6e.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681747; x=1750286547;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Dxd93MXVamZ7ztUFC194OTJH1bC4/5rgbs/4bZ7YxEg=;
 b=I2tMqPIXOaVrs7irxzcOpxGxvxrXk1BSKfbKi9kZGDbdUQ/1i2UMJCyVL2JUd2d8ub
 CNQn9OfFUyfaxnFtDSxSg1D1FDs5jNnJMMjlIeFS6Dv1PqZ7oyYOb/iS+wBcRaq2By2D
 4yMWBN56gqcGj6goWw46sZBg4tBGXve54BQkTi45/tpoidgSXwgf6QtE4gGqahUEJx5H
 6S2IZ4lJsoaISqPPycnzSoGWyHEd01hxjK3WL5ttjQVPJOPPhrwXn0Lf1KoSMh53hdAh
 MOfkmWTJU57OczT7EkINHcNX4ZdivWSdn3lGfcyuOugm+h8Sd/ofK0vRaC7I1CnkZH2e
 uAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681747; x=1750286547;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dxd93MXVamZ7ztUFC194OTJH1bC4/5rgbs/4bZ7YxEg=;
 b=JrHDTMSeC5eFLOyQR/vFhmSQ0/C/ntU5uKHRxxwABzEa93s/TwSijHZxEpNOxpE9ER
 Ns/QDy5/vBnQjR8S1L+Xv7Iqf8A4Sp7kTb3eUxtH7aZPLCzIzkwN4hKEsSiEgMjZdGCj
 6KXaU99IaPFuABNeCGV0on1HWjiPOsZqihbljmupxhMIyrj+Ehxnz2peX+EpEzpKn9o0
 s2RWPWAoo1Tfct1exLfIPrn08z8THG6RQ6ujr4TCycSs6yhup7XiH6pG4g93ZI5B+T24
 4B9Nr0glPd99wHZjnd6OE7gpyUgirb9Enn4COt+xrPkj9bTGWzAr6vLYCIT+d/lsI1JC
 e3xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH8N68KvDNDWrS3QUiOm+VhFrP7aaYEb1VmcaillfDouuACz3qNkvub19hHMnpbFROzKFd3Mj50duT1A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyez8Kzg7BPK3s0hIKCm+7Y379aa8dFidjaqlWYmX8axoYMSGux
 OEChF3bAWKMYW3iwagbSF7ou2BQnHsv5zxoDh9mGA0cqFTrD5AWDRXRy5u5gWr+p6OE=
X-Gm-Gg: ASbGncs8lfwUYSCbWHoRvvhLUq/SiPRgk8FrzaCGWWtDj8VdvX0ux0xAG5D3lMK6z1j
 ijjB6aBu/i70lqO+6n9WIDM+yNHMdMacYIGi4lshiHR9djRDsJrVjCUoaQDbTbGOsITYWxhW7Lv
 sHUF6r+kowfq16I5DMpVehQhkagYXciFCcJJDuCz31PrW0w6Avbu/Jc/FsCGh/ZxENjcjynpERX
 /xLqb1R3X2V5OluL+w6dek430nX2LV9XRoPXPeQq+2D+hryuS6aWGsWZkJ/yY+qR5IyrogXJQPA
 HLCQObzS3t4JSEmSMcwSvalN1UDZOQsUW7R4UPoutjPftKr22RUfIoMmkhlCYF50uaJyRQaUhxK
 kRfg=
X-Google-Smtp-Source: AGHT+IFQBThN9gqVMuv0yZV4fKxfsQN3C7pn2YLNqV1M+RISkP7nir8q7A3hG/2ChnbAzLdY1TtRyw==
X-Received: by 2002:a05:6808:6349:b0:402:1016:e9cf with SMTP id
 5614622812f47-40a5d1640c9mr2811691b6e.34.1749681747387; 
 Wed, 11 Jun 2025 15:42:27 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:42:27 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:38:58 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-6-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=839; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=J89vMIrnHas95b9IQRpMB3abmxVy58q4+X2PR5Kxrzs=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgWrluEPstsE3vfOa2602G4vDUiURfJwcuPmj
 Ecdin91id+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFqwAKCRDCzCAB/wGP
 wPDzB/0ezOPNIM1GcdwSJUtoBdBzF+of4mq74dFA0f4iCvbOvAC9fCmCzg5hxL69oaeNJIKLKNN
 hwYn4bwrsFDn7hpTk4oxy+0yhbNBF3FS9rqxNmkw5sq+imc+Bge3o9MlimTvdYjRFeWz1olLBsK
 RujuQh/8d+BqbeBkJy6HGkvMCcyYr4HMiR32pZxq3ktZX1yG2QbvAfaGvOtFKtCjsFCh+x/0Tk1
 JzzUKytVoQDoqN/jeT+fEIYsymB+ELqIGIQ5jEtG2AOnEQdDR4Q/i73QIQnRhDjaJw/RzxhYyeY
 LG1BSqJLLtf/Qqw+97BIE+EwDDmTTolk2qkEpoqaZjPnMzDK
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 06/28] iio: adc: rtq6056: use = { } instead of
	memset()
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
 drivers/iio/adc/rtq6056.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/adc/rtq6056.c b/drivers/iio/adc/rtq6056.c
index 6ff47415a2221436b1fd548aa0bc070ba5fbb774..ad9738228b7f2db3f3b6cfc01fd97e43b579b687 100644
--- a/drivers/iio/adc/rtq6056.c
+++ b/drivers/iio/adc/rtq6056.c
@@ -645,12 +645,10 @@ static irqreturn_t rtq6056_buffer_trigger_handler(int irq, void *p)
 	struct {
 		u16 vals[RTQ6056_MAX_CHANNEL];
 		aligned_s64 timestamp;
-	} data;
+	} data = { };
 	unsigned int raw;
 	int i = 0, bit, ret;
 
-	memset(&data, 0, sizeof(data));
-
 	pm_runtime_get_sync(dev);
 
 	iio_for_each_active_channel(indio_dev, bit) {

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
