Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DE78AABCF
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Apr 2024 11:49:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74021C7128A;
	Fri, 19 Apr 2024 09:49:39 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5FF3C71288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 09:49:36 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-78edc3e80e6so124279985a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 02:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713520176; x=1714124976;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=o87/x+VFy7QdGpzFKB0wOlVC4lrWjoCcMvbEo+2HMvU=;
 b=DUhnPbxXRqY8RJqBYbpYkKqcfpaOWjUGdkWbsWcBWlzmRjmCmtDp8zAbHV+09NyrOc
 0RMG5G1WR738iyUDbvRyDkSUrKKForEolvInaKs6HxOLaWcL8/Qlm595ViMqsZyIEkoD
 kK2NHL7HQneUPwyGmsITz1HRjyhkQnkdrux/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713520176; x=1714124976;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o87/x+VFy7QdGpzFKB0wOlVC4lrWjoCcMvbEo+2HMvU=;
 b=GOeuhVKwNyJj3S6+p9UERxCFD5gJMqP2ZNQWGNXy2DZcnQ1W4QZv2dUHGxVBdyzoSl
 xhe05OysQ3ybJiYIcU7Pz4oeKi5+9daGkPGPEyPSLcU1CkrjoMxPZ8NP4qKMjtGyxbAk
 EBODGzq2Yiz8CT/rFEGuMMT6iFGlSv6KX4vFTOhj7nmzokB2OrfCGa7aWEge157s9/3U
 xkXZ28hX4tdGBtfW3IxWW5lDyZgMDHxORGQrZT5ntbHh5CXbUJVp8vKdPx5wabzhq23I
 ClMlIPs4ipvFthh1EGKFonrsRphrh9uOnfmXN4/2ks8+cRAlVVI0QfxAZFMSwcb1L9rw
 ttAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4+gGK8lyxQ0aQ6IYwIn/kQsILOx5B8uGlwOqUP+TWAGCa0PV2kkbzS+6h2Q8L4CnOys97eohbh43m2nUGA0l0LcYSwCabAasS0Xip8iYcCphCsbCGtqxQ
X-Gm-Message-State: AOJu0Yw/WIMFj5bIjL6tml3uEsdeWHGuHEfZVZe9sR4TUpPmApKrDuid
 sg/58u3amro6LdoKZbz13NvY5AZqzuQ5lp2wRBk4d5XGr4kBDoTB98SDllUm4w==
X-Google-Smtp-Source: AGHT+IF61myZQzLIJtZThv3LhAjLCPCU5PGkGLiYz8SZp337r7gQKsKEDGbkUPSHG1pPHq3o/FKykg==
X-Received: by 2002:a05:620a:47c2:b0:78d:6ef5:f10d with SMTP id
 du2-20020a05620a47c200b0078d6ef5f10dmr1532638qkb.65.1713520175867; 
 Fri, 19 Apr 2024 02:49:35 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 02:49:35 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:00 +0000
MIME-Version: 1.0
Message-Id: <20240419-fix-cocci-v2-14-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.4
Cc: linux-arm-msm@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 14/26] media: dvb-frontends: drx39xyj: Use
	min macro
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

Simplifies the code.

Found by cocci:

drivers/media/dvb-frontends/drx39xyj/drxj.c:1447:23-24: WARNING opportunity for min()
drivers/media/dvb-frontends/drx39xyj/drxj.c:1662:21-22: WARNING opportunity for min()
drivers/media/dvb-frontends/drx39xyj/drxj.c:1685:24-25: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/drx39xyj/drxj.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.c b/drivers/media/dvb-frontends/drx39xyj/drxj.c
index 1ef53754bc03..6fcaf07e1b82 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
+++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
@@ -1445,8 +1445,7 @@ static int drxdap_fasi_read_block(struct i2c_device_addr *dev_addr,
 
 	/* Read block from I2C **************************************************** */
 	do {
-		u16 todo = (datasize < DRXDAP_MAX_RCHUNKSIZE ?
-			      datasize : DRXDAP_MAX_RCHUNKSIZE);
+		u16 todo = min(datasize, DRXDAP_MAX_RCHUNKSIZE);
 
 		bufx = 0;
 
@@ -1660,7 +1659,7 @@ static int drxdap_fasi_write_block(struct i2c_device_addr *dev_addr,
 		   Address must be rewritten because HI is reset after data transport and
 		   expects an address.
 		 */
-		todo = (block_size < datasize ? block_size : datasize);
+		todo = min(block_size, datasize);
 		if (todo == 0) {
 			u16 overhead_size_i2c_addr = 0;
 			u16 data_block_size = 0;
@@ -1682,9 +1681,7 @@ static int drxdap_fasi_write_block(struct i2c_device_addr *dev_addr,
 				first_err = st;
 			}
 			bufx = 0;
-			todo =
-			    (data_block_size <
-			     datasize ? data_block_size : datasize);
+			todo = min(data_block_size, datasize);
 		}
 		memcpy(&buf[bufx], data, todo);
 		/* write (address if can do and) data */

-- 
2.44.0.769.g3c40516874-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
