Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC85AD62A1
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:42:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42A69C36B16;
	Wed, 11 Jun 2025 22:42:26 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43430C36B16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:42:25 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-7304efb4b3bso237571a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681744; x=1750286544;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=s2fS10WGm/NgAzKDhSHbfRTkjHM/qI8657OmZeiqRck=;
 b=XDgSwbml22MZZpCCxa6X/YsBRmeLKvbzw4j9fymIt318o95flv6KdJyEevc3GpNdJj
 PF97Tijv8uAshErDlJA6SlWW/h8SBC+cwb6MflM8Pupk0PtPlLdkj0TrwZ66Sx10Jar9
 O3IVe02E/ImRR/fxCF+UsBI3vjdfe5UB+kHV+4SwMTMFpZ968lB5zt831lK+lk7Fpa6C
 AIdrV05MWEHx9o69mp7SchZlMOjpOWu3FK7qIzPTPGvaAdN6um+74XTfyGz2aCDWoiRE
 cN1c0Ku7fKi8XQjeW+3oxD+hSZZAjcOVW+hxKTJ+w4JIOIo7nrE6kxNAvR61Ab3JgCmR
 HLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681744; x=1750286544;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s2fS10WGm/NgAzKDhSHbfRTkjHM/qI8657OmZeiqRck=;
 b=N6lWlOhaIuiIF4CgSKcT9kK+f0pj4bBZysy0kmcqog/9ULRJwwMzgaCIFhOT8Isgog
 a/5o75AUW/ZJ7j/tUGmV5MugQx6wB+9Us+wefmi+1gpI8kjHX0S71OrgEvyYPJV3v3Q+
 Ci2upB+QFeqGw+ldLrYeyjR5FVJ1U458Tm3bHZVNr9KoMubi3FPq+A4jB/MrgptXjy5n
 oOWpH2y9EalXvxOSyHwVnsDWXjoYt94mlEvJwSG3UHmDKb6+DRRmN3s7IVOQi42KBn9M
 K8q64aBeHlaEo6OhTDbe/xAQUo4wfWiWsLOVPiJVm7RtK90uhpxsGaa1wZokITeIL/kX
 6oNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0kAUgGnPDH5Kpc3vMoiSvv7alRaUYEmxaKaozdLC5ZbUZlRkdzScLM0mKeh+KZLgOIeetKNNkuKcAyA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzeB0bdckCNdEARM7oU+vPIc8YWLGZjZhynWBvNkLW3revvsKr0
 QagmCLPG1rUPX4gwjOS5kj87dKYOP4bcek22DXIGLgYRyrFeyV9t4vj7pqrEUX0wlfY=
X-Gm-Gg: ASbGncvY9jczsAkLvdsZ5DPM9Ieb4lX4VVf4JEy0gqFylDMgWX+lKwM+5rw5RhrPyxW
 CfN7b+JF2XTPaLoqCqTGAaaImKGTkYe1Ur9Zqb67cZW4TK/9V6gH6ZOtET5EdQ5ARvQ9nMzXXgX
 /ZdPJsOYPgB/HDyQmZQ7IGpmTydMEwt9LGczxSa8JbW9itj617x8KEUXUWxQl5b4WJeJP2DzeQb
 opnVi5U8bDoYHsQxAtF+T3WFKNfY43DkmSAo0zHzQcv0MX/m9/AW8pvR43Cf57DvlGrKNdzOaH1
 Lzb3i64DjZ8Y2LcipEy3JO8fuscDbJvpBAWeiXGc8kU8QNcqi5lw0ouyRBZLhMVKZjaj
X-Google-Smtp-Source: AGHT+IFjlERueVRup/Jao17hhnugkq7j+GiRg2h8bJth2v9G/6rcI2wGbyBF567ki5XFEPby/lqVcQ==
X-Received: by 2002:a05:6808:1782:b0:40a:54f8:2cac with SMTP id
 5614622812f47-40a5d171b8fmr3897834b6e.37.1749681743953; 
 Wed, 11 Jun 2025 15:42:23 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:42:22 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:38:56 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-4-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=865; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=16CSBjTW3ADRr7MOYui8jO+Mhn4wtu5HebYIEym4zkw=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgWdyp6TsgG9grzVt7c+wkMZGk5rY+tH83VPR
 hAY0b/nO7aJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFnQAKCRDCzCAB/wGP
 wAQzB/9cinMYWAun9atmE8CTlRWjiF0B5MbkKSL06PlW5jHOfBbJnzoPpdU6t7b9ozExAUWagaM
 8JTlmB5ashMocc15UKPD4atXkaW+KR5WfIj1opieHDVgHgx5tmd+cF37qZ/nJC5bxm35Lt9TO9w
 SohEdmnhmSCLTGxX7ALcqjT+7vJ4mo1HUfReJvrXjzj1tz2LJzp5fNpa87BbHN8CzI4Xr7C2l86
 5jlpdI0UeHhGJxVurKzbrYb5jJijAbCw9gASQDR1HQ1jLcq7YXokcMk1qBSn3TLhRCg/3PlePTR
 TZtSE5eAx5o9+zFV8pz3++L/hWjP87mrPrk4KNrXiw1r2Lln
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 04/28] iio: adc: mt6360-adc: use = { } instead
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
 drivers/iio/adc/mt6360-adc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/mt6360-adc.c b/drivers/iio/adc/mt6360-adc.c
index f8e98b6fa7e923c6b73bedf9ca1c466e7a9c3c47..69b3569c90e5b665e1d2c59621df00d6142fbe9c 100644
--- a/drivers/iio/adc/mt6360-adc.c
+++ b/drivers/iio/adc/mt6360-adc.c
@@ -264,10 +264,9 @@ static irqreturn_t mt6360_adc_trigger_handler(int irq, void *p)
 	struct {
 		u16 values[MT6360_CHAN_MAX];
 		aligned_s64 timestamp;
-	} data;
+	} data = { };
 	int i = 0, bit, val, ret;
 
-	memset(&data, 0, sizeof(data));
 	iio_for_each_active_channel(indio_dev, bit) {
 		ret = mt6360_adc_read_channel(mad, bit, &val);
 		if (ret < 0) {

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
