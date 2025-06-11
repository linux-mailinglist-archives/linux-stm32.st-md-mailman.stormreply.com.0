Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 852B9AD62B7
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:42:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50916C36B16;
	Wed, 11 Jun 2025 22:42:59 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E2D7C32E8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:42:57 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-408e0986303so224405b6e.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681776; x=1750286576;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=O49HniDCuoXMC9eMwPqBiAeGw4w5v2Vl7zSDG8FL1hA=;
 b=TzJB92vjKaDDwCpMjZPVr+eJLjeDXhIDhn2VAfKu/MiAtj/tVXqM2vUcVKZ0JZS9ZZ
 zE8fWoaiO3+c+GxxQoPltfDCu19q+98s1Bwqw1yivvrE/Lcd2NfpVcRhfZhGC+L/zPSS
 brVHOm7P+1rf0dBul44K4q+QK/E1rOoSrm5WOuR5JpN7pO4b0N8mT4tTbGKdf6N4cXJ2
 V5yYkg3Xib27a15Fk1vg8iilKN7tBhW2e39MIfj7/L15tmNt861kHOlNdGI9qzHf8chg
 f6v2fulXLWlzOLQHg4D/1tjPqijsdXepmAVBOG4vYWnO0ainIRfPb8utLPJKh1Ro7pw1
 9rHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681776; x=1750286576;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O49HniDCuoXMC9eMwPqBiAeGw4w5v2Vl7zSDG8FL1hA=;
 b=YusNnkyyZlG3Dyh7lqk1BAT1mmGaRA/acVRHyk8qc5qqMdcpmIcIH/edp4i63hwKFt
 zq+AsasI8sRARYhqF6ljy2aDRvjVXlnnmQgfU+A2eVb9mMRGqdTS41PaGEgYm8GP3M1K
 PNdaOoQuFlYuED+nup8iJohpV+NjFle04ExpYf6Y3w4dVtldErHf/hj1dpdA69Sfe/q2
 L0WkfyidlXijc+JzxPV2agxV01v08rntiE3YWSKOqv61LoMtHZIcDqHTA55on8uKu+Xp
 95uFOBegTEObEj1SFG/nfvdSos/YKIynuo+YYFOcsD+O/IHdL6ps+/15zm4kZCQcqA+Y
 CxLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXh2PjzWrDW+6b+EOXfapCjE/IgP2lRnq2WiHTfJrbS18izpXIwcFZ81cakuO8stCS57Ecu7rHR+u5HwQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzs1Q8Yi8ol3KJ5CEbaFm3EJuuRNzn/vn2DnJ4DRmKXs7WAOaA9
 yoaAKozOqze9bdDn+t4y0lRNhr7n1SH/sNx+RPT7WyfUO0LAcOINTa3G1LHstaE4ekM=
X-Gm-Gg: ASbGncuRx/Ubh6+WRaZCpb/V5ZrEZZqNjfy5WGI8RKi1c40Pid+nMW4+zpF0lr7uG6t
 b8vv+rVoaXj0Y3k05UqzA4tU/ZvbzglZYpynNYTPd6o6jKY1XOD9P31mqUWRmaEHzp7Vb5yJOhw
 yj3bwFkpV9jxtfKds+EU2qrqkRPg1KMS+rzatZUmUIRp0WXJhFEJdFp+3P9ZhkOV89bJ9G+4eB/
 5Yb44adTTHeX4BPGCRMcod6n1+e0ycWbsjoaEIn53VKzk9nBSHSHFPHMvTvWsn56G2a8zaVo15T
 74E9QrfvoOfcHGJksHP9kgI9Vhl96HDt8QQO9mfmVpGWNaNPPLVkDmWXeff2Mu6iTp3u
X-Google-Smtp-Source: AGHT+IEdXlTs5BQlKqDRA2XR9le0U//SvE0Qifl3mfGztXMmWUlblRQ96qzrlkvIsB1m096LadrsCQ==
X-Received: by 2002:a05:6808:180c:b0:409:f8e:7282 with SMTP id
 5614622812f47-40a65f87782mr956229b6e.5.1749681776215; 
 Wed, 11 Jun 2025 15:42:56 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:42:55 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:12 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-20-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1055; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=u68bZZMO/JKUz2mz6KZxBlhHkEylsEbUz83VhCyRYl4=; 
 b=owGbwMvMwMV46IwC43/G/gOMp9WSGDK82DgYtDNtb2gx3z7l0jyT+eHvDe25Ny/eC02uWrn1Y
 Ct3oj9PJ6MxCwMjF4OsmCLLG4mb85L4mq/NuZExA2YQKxPYFC5OAZjIHWH2f3bdcxonrJAMav7A
 XffFu02lOFatYYFB7CF7t92HHtwV1csJuGihoZXQqzjn9qFVwQ9lw6WjTz/KejJDP9U9zPVrSVd
 FI6OcwCrLffXZi7bwHns3aafaxnuO18SbZz42r7q3SNX/4t5VaVwdlmdCG1e/YlOZNq/SJHTm1b
 6D+oXG06fdm+A7z+KTCU+oXc0f3u8ab+avuiHZGW8WcF/yQc2Kvd6bNgqbneTXPqugcUbhajePp
 EmfdwGzmsgpxSwm/ZdqT8JD1yvJaf4XW2u/8qFBW/Mx9Tn3HWZaHeLU2JRZ4bDydVbTlvcc7xlc
 pgl9PKq54uvTWCH/WaeKFt2rffq43yDVPalMb2os24pjAA==
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 20/28] iio: light: opt4060: use = { } instead
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
 drivers/iio/light/opt4060.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/light/opt4060.c b/drivers/iio/light/opt4060.c
index f4085020e03ebadb2b91db3212449db82d738ebd..3c927149bd256b392ed8d1bfa9847788981ef2f0 100644
--- a/drivers/iio/light/opt4060.c
+++ b/drivers/iio/light/opt4060.c
@@ -1083,7 +1083,7 @@ static irqreturn_t opt4060_trigger_handler(int irq, void *p)
 	struct  {
 		u32 chan[OPT4060_NUM_CHANS];
 		aligned_s64 ts;
-	} raw;
+	} raw = { };
 	int i = 0;
 	int chan, ret;
 
@@ -1091,8 +1091,6 @@ static irqreturn_t opt4060_trigger_handler(int irq, void *p)
 	if (iio_trigger_validate_own_device(idev->trig, idev))
 		opt4060_trigger_new_samples(idev);
 
-	memset(&raw, 0, sizeof(raw));
-
 	iio_for_each_active_channel(idev, chan) {
 		if (chan == OPT4060_ILLUM)
 			ret = opt4060_calc_illuminance(chip, &raw.chan[i++]);

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
