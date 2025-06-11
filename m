Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D45AD62BC
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:43:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B33E3C36B16;
	Wed, 11 Jun 2025 22:43:06 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26496C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:43:05 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-4074997ce2bso101205b6e.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681784; x=1750286584;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=F8QCKzZLzA9c1boYxiH6Zgd6l2s0DqEIDVHfSqU5zrU=;
 b=e1FCtOcZm+rOFzHksqs9QoVmCvMUTranoX+TE/Oxxr4OkzAcJv8DuAKfHKUa6QQwk1
 Ktovm1x5/C/kqA+rQIMxLuWye3ITgE9ed/W/oSZS7jdft0ruBJztfay+zCb5tEHUFeg4
 NGDe1/r2AvP+tJyuosfKqCBQ4zJba0frKBZYXz8A1wEvy0pm9Z5z91UgGlb+EXevlR4J
 zdkHFFYijx1CNTqf+fb+xkfUehklZxh7a1+5XdpdHpbtGAc4mSCEvau3KF31LJ2end1S
 qH+NYVqdwwHbr8TvY38iZb3RAxaGLCe+w8HzNthSlXTF8OiKteQMUZcZHxqMjoHFLaKM
 Wy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681784; x=1750286584;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F8QCKzZLzA9c1boYxiH6Zgd6l2s0DqEIDVHfSqU5zrU=;
 b=SupFeFjZIMy/7N1bMnluQKjmrXjR0AkG4hXOSCBoPZzoIdjSoVYS5pL+9ryVsckAeC
 3wgyrg+SmSI2GZwjVt0rmFLfXtDQvpGqAlygUK2a264od75EBQTTeB5YX7GZlfpF3c2V
 mnq3W3zvG5yu+17nFGVMdZLA7NDPCCBOQBVbYLx+abnkyoL+tbxF5ABkVfFsT19g32lN
 rQ6kk8d0/N8Jxq/i0Ev/W5kxficiaK0h8+zprZxJ+6sGXjkUmnD+CP0cNPDNeYSiiQpV
 wnFGJajHV35LNMCIZjDzxtCUPLZNWrOIV/juBWeqBJEHFtj0sarTCCcup1T5PgJnQiij
 scxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUQmybPejnc6H01sjIEhmNeiBmW46YtCOnw/e3jVhneUtFAOWRZKjO5qC6SqA+4PO5agxJMlsX7sstoA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YybRP2aEwvE5Ct6uxmyrf4YysYYFC1RkKdMGlG+UwRREDPFWwfP
 7IuzJI/nu2q1kqspaYO4XF8LOJ7hpxVxEUVdL1kdRYwf95K9AIL3zL0hVmAI1KTe8AE=
X-Gm-Gg: ASbGncs1HInZRS9WqNf3d1ZNngsD86vK/sEjrFZaLS0kxm3HpMjfnoI1soLeFZfYxw6
 yL+NHKT9bnWl307LwKllEvpTZwBQBXtwZf7enGOifItGM4/2EKUDC/tX+T0xJz+UiiDeq+SUJcJ
 ywHEmKmxL/aL8Fp1/con1+Wf+jHO5klVh0BG5a4IOlkzK5+ekl6Dxo/TwpPkGdIkKcCrb3hE7w+
 GsCdnP9TQ2w3b1bpC26W5pwt9UDANF91xsctPgjnUnV3mOXexKwqAH7/5lTwb0APj+TguBv3Vsx
 InwGmLMXuAfAk7WsOz01k1YH+vwa/gwjY0NbYrZSQFoJ5OTvPHYA41IUe7PkxaBlU89l
X-Google-Smtp-Source: AGHT+IH53kFC4pQ00iW8frMOPsS2aW2HVSZ9BOgRUzZQwvvNEv752UPhJnf5JrLuBhq1/flY7pu0bQ==
X-Received: by 2002:a05:6808:164d:b0:401:cd6d:25e2 with SMTP id
 5614622812f47-40a65f92499mr1064493b6e.4.1749681784031; 
 Wed, 11 Jun 2025 15:43:04 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:43:03 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:17 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-25-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=+Al+Scx0CuEWvmKSaR9FmNdQ/zr1q9Yo8+2pHc+n7jQ=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgYqU/X8zadeXISux/OIM8m2Cz7MRuRxATYcV
 71OkLQHQ0+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoGKgAKCRDCzCAB/wGP
 wHHRB/sFQd4QvOKtJlimYNNmwLWT8x571H1gIrBjRcfNuzvQddwOXZULzkxba8/Lj/g41g9T0Fh
 uwYOV52qXTHRasuWN6cTVSBSNo/K+9CEGdRWSIUqOF141Ti3/hm7iKloBYRHP5KlfhztlEVvBSO
 UVlWPLsr8ndFwcGj/M1lNwTZENm/nAXlochyQYMHsX7ojshZQEm2BWXiUnTUrFdv6Yr3groQUyW
 dzkx9EmFcUYCuxAkx2sdIPfNCMTKAlUp67GEvcdCf9xtNkjY6Q5G2NqrtGeYmGHS63CmPwJtxYE
 NWy1n7x6KNDIiXYX2AlAAOY+bvwSYvg9fG0jz0c2dypLa1eD
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 25/28] iio: pressure: mprls0025pa: use = { }
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

The initialize of the cmd value is trivial so it can be moved to the
array initializer as well.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/pressure/mprls0025pa_i2c.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/iio/pressure/mprls0025pa_i2c.c b/drivers/iio/pressure/mprls0025pa_i2c.c
index 1a48f8d43d716b28b8fceb8e1a06d63a73a74a86..79811fd4a02b370b3fde8bd67a5115a3934f8614 100644
--- a/drivers/iio/pressure/mprls0025pa_i2c.c
+++ b/drivers/iio/pressure/mprls0025pa_i2c.c
@@ -44,10 +44,7 @@ static int mpr_i2c_write(struct mpr_data *data, const u8 cmd, const u8 unused)
 {
 	int ret;
 	struct i2c_client *client = to_i2c_client(data->dev);
-	u8 wdata[MPR_PKT_SYNC_LEN];
-
-	memset(wdata, 0, sizeof(wdata));
-	wdata[0] = cmd;
+	u8 wdata[MPR_PKT_SYNC_LEN] = { cmd };
 
 	ret = i2c_master_send(client, wdata, MPR_PKT_SYNC_LEN);
 	if (ret < 0)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
