Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0402DAD62BD
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:43:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFA6BC36B16;
	Wed, 11 Jun 2025 22:43:08 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A577C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:43:07 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id
 5614622812f47-40791b6969bso189804b6e.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681786; x=1750286586;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Bvfq/1PthJkt3QRBA4xnMMNhlIO3I3TLPySbwtnDOss=;
 b=xvlFt+DKtyQRBNV/m+nzL/N+N5jsKIseA3Mdoj1Wmg2JLq6Pf33+C2ZCiXkPsCv1AO
 +1v1UowmggOCgzDTRY8TQRt+idVMujoqcm5d+YcxnfRWV1VG4rmHuj0Ey0ewe1A+mPeV
 pkOku08mX3laui9fLRYG32e2qTflVzcumjpch8VL+DT15zzAC7lMYNA480JXeaWihIeA
 Z8J0vYxpD8HTrfXVHOFh3EPgokozXybWPjRiCJM1LIvm3m9beIEYoAImd937Xb0ir4HB
 cPpcXe6XZGaWnhVEHdJ/kN5E6NC0eVQB5UqYn2h0M6KFwfKI/JofY8p+U+01XxGAIqDi
 GSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681786; x=1750286586;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bvfq/1PthJkt3QRBA4xnMMNhlIO3I3TLPySbwtnDOss=;
 b=oFaAvTRGPdMrROlFZRNLL2USPIfMBj/WpcKCIHv9B5/zrKjstRkSk9fZRO2KDpZ666
 LzFg5dOM+Do5ui4uh/231BCHT5za1Ho8mEe3U9CnICmMPmFt0dkO+J5UBSGg7+6Ipy4C
 1auUwvFR32vyinM53OTmx7gPc6ao/c0sdSKA8KtzwJ+ER70ACl7ZLB4dQRCOxgXQvYEu
 wvPSztzWe99y8F0gYol3891MUPGHWGYpf+jBo8tx0Gu+nnvk0sSUrbd+o0WiPUu1kPLG
 Z8VnfHGtRH+W22Ph1xaaPVbAxT1SvvmFZZQ/lqg+w8j7eI7WNkT9t0dy2Z31Ty5LrXMb
 phEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOD6/U78DOfl+CVX+aadpf4cV0SbyNZbmZHYBixChj+xvubd6CfNh7AKaJnfZKzgrcF+Amg/+RjOFeeQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwyvQHa8nGtOmHU4yv4T7fofaDmCl1H8ZKej0mmISX/F8fn0aNn
 cnoIFcYI0pZmK6eM31dFLQZLM1vvPI/Y3eSw/1JTcu1yaCIpIYN1zhAPIu/BQiIozF0=
X-Gm-Gg: ASbGncvZbj9Sdh8mZZ/UG7k2mJGZvQp74bFoXslsZWgvpFnUOtabFRzXjaYirNbCmUz
 Wb70Tpv9znagp92fZlbVmz5UAOD2Esgg/BzF/g8JIabiYls9uEl64fHH/e1pifeqWzM5wGWnfyH
 y0YdOuDIsbivimI2dMHYhAen40nQWHWFOci/bL/PUoKKuiRG5pSMijhUIXAPiRzosko6Fo7rJN8
 k2dhjUoXMZja2J+VJGf3OSerlyPygox3PcFxSrunlcG0d2Nq6fvgQB2MoW0NdoDR0dQfKcOlfE+
 hmf1WLqh90sGpFuIVANOdask4f/MQVuSgEJlpRZyIUWatqbUqTcVMJfrMNCcPrObGa2S
X-Google-Smtp-Source: AGHT+IEzxA2Sz6qgNCiFhtXAvcRaONOijMvYTiFTuj8n/pknGpxJ7PSUYEWQmDmDDdoICgN5Se7ZKw==
X-Received: by 2002:a05:6808:3189:b0:403:31a4:f3fa with SMTP id
 5614622812f47-40a66b562cbmr545614b6e.35.1749681786177; 
 Wed, 11 Jun 2025 15:43:06 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:43:04 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:18 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-26-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=929; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=UW7Bx8ZURpZRdKW8GhG9VQDYCD+6f2n+DIethjWGd1w=; 
 b=owGbwMvMwMV46IwC43/G/gOMp9WSGDK82AxWczZcn9t22vxZreO96Ev3Hf1fuZXnZ25ICSzpP
 XO+89HZTkZjFgZGLgZZMUWWNxI35yXxNV+bcyNjBswgViaQKQxcnAIwkao77P/DT3lqzXe/zn1s
 h3e/z7q+bpFp7GeZuULWKl1hX6qm8k+l9c7Uus/9bWfDFaKXxB3Sf9bVp7PzdswS9ZB57fbd2bs
 9DN64lqm9C9hhL8usdXSC/UK1SIvH+gkLWi1jV5+9WXnOxz7DZAbPKa1ug4TndQ9vSd5b8HaCvL
 H71aO/c5o12+TDV7dUx03cXXby7LJjMXZGwZkZlrXvL894O2uN3Z2kraLbH5m+jZN5Zror4rxGk
 idH5xtfc5VfqxTF58pnWEt4TC9qus7BwvP5lZUuj4ugdWhJWFpJSs2GpkXrpm5k1W3Tt8+R3Bi2
 rjKXxaVg2sXJoUKyX2+y7S0LaN2e9Pslj3Dx05DQFe3SAA==
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 26/28] iio: pressure: zpa2326: use = { }
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
 drivers/iio/pressure/zpa2326.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/pressure/zpa2326.c b/drivers/iio/pressure/zpa2326.c
index 1640aa3717eddc135dfac9d5e45d899ae2579f64..6eef37c0952d7c209478911413de2cf3d2552920 100644
--- a/drivers/iio/pressure/zpa2326.c
+++ b/drivers/iio/pressure/zpa2326.c
@@ -583,11 +583,9 @@ static int zpa2326_fill_sample_buffer(struct iio_dev               *indio_dev,
 		u32 pressure;
 		u16 temperature;
 		aligned_s64 timestamp;
-	}   sample;
+	} sample = { };
 	int err;
 
-	memset(&sample, 0, sizeof(sample));
-
 	if (test_bit(0, indio_dev->active_scan_mask)) {
 		/* Get current pressure from hardware FIFO. */
 		err = zpa2326_dequeue_pressure(indio_dev, &sample.pressure);

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
