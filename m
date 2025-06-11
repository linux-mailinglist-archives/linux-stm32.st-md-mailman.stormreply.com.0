Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8571BAD62AA
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:42:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADD48C36B16;
	Wed, 11 Jun 2025 22:42:39 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CE54C36B16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:42:38 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-40a55314d06so86903b6e.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681757; x=1750286557;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WO1R3xWDaYXIM2zvzfZtCHLOSbM0nDuxCxYsdjOhuqU=;
 b=Zx46wr7WWnh2ZW0SV1Qx1D9iLPGS+7rzalNq3bNCe98HFZCvNm0lbY/Ub+jEpUQAEV
 xzHx6S5vpL8yiES4DBHrIe8zZGQuEQsdc3YzmuxOsZHbjRzQLVkYYQ8HmInxpg4g6abz
 3z3aOHNQ8lvOQO/BsdwtA2CzCxhYDxgycz1LlgI6r+knD7q0No6Yp2x1w7yHh5ULjEVR
 dl3JppUcOLuolUHkJdZBNc/5TpN7v4AU2ve60rT4EAxWkcwc3HiK7qexoOmH/tJD1YME
 9aI+K3O79Tneh5trTTT2Wb4mwGjPComAV1d8iDBL83g1cowlLEatLUWqBBeEowKTT/jF
 4vUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681757; x=1750286557;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WO1R3xWDaYXIM2zvzfZtCHLOSbM0nDuxCxYsdjOhuqU=;
 b=iOWgd79RgDLJlNlFDDIwTVhXHfNDdShz/MxLJnB2wDnWQ9k9wZvY0L4aTYi0kKATEE
 J4lV7slqUJOslHORInb41XwGDM+zZ7n7Xh1hqIgr0UETRAgRJ201Gfg192mb9GxyBQd9
 jTmB2uUscrFHJZRjHbwsFC00qDVwdYTVX9zw/qI4mAANofO+Px87FHJAq/jTRJvPSD69
 DNgh4bsV4L1Modzz8aYN6HZtcP3sf2ATKwz5iAMMMnwkkZFOYSYZR3uM4fHeKL+2cXEP
 vUfKO7cLcBlewNsNb2cadZ3F9wxb/+lOAw3K5Ui9VAFTNeL9t+mufJLH14BrAJ80nNSQ
 hibQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCNCRunkxQVz0HaXZNG+sqCKcUsgZpXtfPCpxnUQHdiFiDHqRYaL2BbzunlhC6unYIcidc7G5+XP+SLA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwYIBVWtpJRImnA3kPSdj/uMAPlsm5UvpOvC6BzqZzlanw0zLyx
 OYKIqqqX5fxtw4HmtZA+7UMFYZvbwCWOj6cnYVmGvjbWtgji4C4VrxqU998YitYMIlg=
X-Gm-Gg: ASbGncusg/EBdBIp2o/34VV5IKG/EvnKStN2n2rKqcy7ep6n3tUE7NBb9svFtK0lJ5P
 3+uVgtF/0ZzgkGUMpjKsddNC7Hoc/Un5Gq+U1Be/mdG5iNw4zQLAO6DxXgkAEYhBne/No4faBsI
 DJNq0Mk2bI28kl1mBSMt3qKUQrbQ1l6S624otbrV9c9rKIvSsqwQGJGIMUxLi4XPItFn7zAXaAZ
 PNid+QHgTUMT6xKS7+hZyNvgzGNcbmNjNCdRKbzgMUCxaXirZausL3qE57nq1MbiUoT/C+xI9Es
 Mce2l5nEtYNl76w8gwhr+tLKZxwAAJD9PM43YtYwiZDJGfufXjpvHZasfVo+f8NwK8uQ
X-Google-Smtp-Source: AGHT+IFExQxTK2nqz9eZvqFA01OLk3tdW0HRirCOET6sNhsVUFcwPfvM5Peex5ov7to5WvXVcBavAw==
X-Received: by 2002:a05:6808:218f:b0:409:f8e:7273 with SMTP id
 5614622812f47-40a660deb1fmr937185b6e.4.1749681757305; 
 Wed, 11 Jun 2025 15:42:37 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:42:36 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:02 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-10-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=796; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=H2qSnwk5w335N1zWnLuUuRDW3evPi/7hcB/vx7gI2r0=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgXGMQtBWy5ZBcGQvb7srptCW55i3K59YMUWH
 K/p9lukFTSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFxgAKCRDCzCAB/wGP
 wMdrB/4wnul03c3MOAO6mWCe18RIhEvueAt8702Bg9iNqcJOIXzAq60UtlsL8lL9KfJBeyTWIE8
 Kn1YcuPT6kG/NM23xq9DfwqkwmJRaqql/t9NtrWj3fcDZ9hisOphYqKQTG/igEAW5g6Nfcz+8bW
 0MGHwVhT0gE2vhbfXW9+hFrHBHtmM7Ha9P5rGLa3H6cx2R2thSNCpjzS3ShjNnVhoTjLv0YbNk7
 cVrheUS1e/VAQdCaGjeafb/wfh7v0zxFJ8ugIGJ3AvK2hD9WEUPNck1toBMCR/UjT3Eb3fKsEzp
 LKfypHeHbcCyjL/xNms+MxWA4JU4Wp6gW8jxoF72I9jj7qfq
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 10/28] iio: adc: ti-lmp92064: use = { }
	instead of memset()
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
 drivers/iio/adc/ti-lmp92064.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/adc/ti-lmp92064.c b/drivers/iio/adc/ti-lmp92064.c
index 3f375c1f586c4153caf9b47c34a0dcf6d5c48266..7e57006a8a1268cdda3a31d7c0366f72e1b11ea7 100644
--- a/drivers/iio/adc/ti-lmp92064.c
+++ b/drivers/iio/adc/ti-lmp92064.c
@@ -200,11 +200,9 @@ static irqreturn_t lmp92064_trigger_handler(int irq, void *p)
 	struct {
 		u16 values[2];
 		aligned_s64 timestamp;
-	} data;
+	} data = { };
 	int ret;
 
-	memset(&data, 0, sizeof(data));
-
 	ret = lmp92064_read_meas(priv, data.values);
 	if (ret)
 		goto err;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
