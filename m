Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E403AD62AB
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:42:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8B1DC36B16;
	Wed, 11 Jun 2025 22:42:44 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF970C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:42:42 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-407a3c0654aso185458b6e.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681762; x=1750286562;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1+AXM43LJmcTiZ4+XLqifo1WeAnz6FejMu0e+/VkXQ4=;
 b=bob60hdaaKNDfPa3bbga7aWf+aPGW0yKM5WejlDEa69TkRBMMAsaHrJuvbVaCoAKZ9
 45EYvUaukB4T+RbfVSHSVFdN1qhACxgaltEjqfIVPdS+2eSFsuyWC5vN7Cv7jpOIBCvn
 KDpWKR0gb/zpBVgCurEWf7ufnM8gERPCl8mhwvwNQqpZr6z4dEqT4ohZussuQVOBEZqq
 okHP0TN+pxR7VA8tI2h7PG//cbTYTeyG9xXPzUFAvf2ghZjiXf3umCUzv6Ko7+47koUu
 rbHpl0qEC8wWCLX/X/035O1X08nGgdv4ZO+3wZbXfCACxEe5vq7pRgWFuQKQ6QGLmj9y
 VymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681762; x=1750286562;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1+AXM43LJmcTiZ4+XLqifo1WeAnz6FejMu0e+/VkXQ4=;
 b=WbFEezBlI2OuUxOH8/TFoqzU6Q4eBIv7xtrSrCjgPXfWk8DtKN6mLYl072G2KtMkzg
 v/OX34OQ6O97TeCVothkohGYG7zVXKAzHIaQyX2wowTojyyJKja6dIaMU2ANqpn4+odj
 mC/HzaaF0OnrIanV9kH6J+sMAnpgYN0fqCzxxs25MACqoDT8gG1nj9CqXVouzMs5Hmwl
 7VZZYSQGV1b/pCJQ/4XOgS20NBQbrfzyj6tiEQ6dbxUCNZ4rXffgBI8uqmSpNn8opf6E
 34EbtdLIBa5eA0YmYqM9kQDt6EoOUTiX2GN/hHDj2c44TbiUq4QVuWntIVrnCGfaBjyE
 5sjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt8g0MYf7VBu7DXhXk0bsUgNOOFX/Y7xca/7ICZnnMGJp6lcAA2rS2LYJLwBEhY6GD97x8u1IUN+q7wQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxMEsiSWEWxc4skrv+IDKHKTMikE5OqI1rnIKumdFncQ4efO28Z
 bO2AKgbFwdhvlbETCv8QAgB3VneaMC22V6p6LtdZqdsdrLidnNpbttM695HuR5nF/pc=
X-Gm-Gg: ASbGncted2tZD1dhfg+cATcC3p5KNIKZ6OHr87Jzg8MXHioLwLN+eD7JrShaFboQjol
 OZd5PQMgNWyGqPbsN7AYGDtZeaTQKvCVLIqbQmkstb+2PIr48p1AUK8bmBbWUFs2gCIOafyclkN
 pqlk3WpBbL7KOvoiRn8pSTsXm37DiCl02xjqpyMaP/DyL4HPhgXl+7cTagrX9yyFMe4/XI0K6Me
 lTZnUWDLH3EsH6llmBAR9jsXDCne8ZOdTxys6nfgWzhtEInmdJgWLqNON9UOBAT2+IBCjrHKESs
 NrolAALv0jL4X2LqALXdiFHGE0LmipJg7ccA6hV0yhVHEIts+DnHjJTqdGWAvC5ix6wZ
X-Google-Smtp-Source: AGHT+IFMMzvtGjq/XF9sKG5BGljgdifNq6jOybNnZI2VIWkdnxiv1hDecZPrcYLXm/jeBNerhjgiZw==
X-Received: by 2002:a05:6808:144f:b0:406:39b4:2232 with SMTP id
 5614622812f47-40a5d053e13mr3229763b6e.3.1749681761758; 
 Wed, 11 Jun 2025 15:42:41 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:42:40 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:04 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-12-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=810; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=w6sewnHJwVlZtUZ1XCEB4lsBcr4uySr0t3enC0nXMgo=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgXTO0fwqvdhMYlsTHXtIYGob2RsszuHsUyLs
 SfL1LagKj+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoF0wAKCRDCzCAB/wGP
 wPZeCACIJ32MRJGFXAWVkUo7XJ8IPrL0OrDOVi8YV9Bz71zO9E1Xbt2tdxaHIRCxRXTjHv0+zxe
 w/o0PiRItwBJgVkYx0LCNcV0wRJiX/3SOXvkNIYHEjW/6bG5mIuft2mWy9pOWtFB1hHlRO5OHW0
 HRZV2jH97fcqcIdH9wSd/O5uzb2vY2Mv537m9vzG3NCE1EZ6ni5m4frRR2Ju3EquwZ5eFRMUZDk
 6TffT8htFYg5wCw+GGZ+kUM+ESDQvMFNiOZTKVDPOJtDl6Lepqk3gBrXVA5n8ijfXQPulfkc44L
 Ad5/aXu1TD4BBvsWqxbL+8KuoPFw5kwu1Q/N4uflwEd9cOV+
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 12/28] iio: chemical: scd4x: use = { } instead
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
 drivers/iio/chemical/scd4x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/chemical/scd4x.c b/drivers/iio/chemical/scd4x.c
index 2463149519b6d82caede9c9b253942fa421fdd3c..8859f89fb2a942d940b1ba7adf202977df7b4ad6 100644
--- a/drivers/iio/chemical/scd4x.c
+++ b/drivers/iio/chemical/scd4x.c
@@ -665,10 +665,9 @@ static irqreturn_t scd4x_trigger_handler(int irq, void *p)
 	struct {
 		uint16_t data[3];
 		aligned_s64 ts;
-	} scan;
+	} scan = { };
 	int ret;
 
-	memset(&scan, 0, sizeof(scan));
 	mutex_lock(&state->lock);
 	ret = scd4x_read_poll(state, scan.data);
 	mutex_unlock(&state->lock);

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
