Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68227A0A992
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Jan 2025 14:33:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F77DC78028;
	Sun, 12 Jan 2025 13:33:05 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4293BCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2025 13:33:00 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5d44550adb7so597007a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2025 05:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736688780; x=1737293580;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mRUu7xwt0GOb8hs+BKrBffaLbY4C8ptCLopKQNeTlgY=;
 b=v9Jskv8UiS0LB8af6BlCW9j30KVe5IQIFGMVpH+r8hDas5T65KbbvOU2AQswIvG71Z
 Cmjl2ppwcKGRn6Z3lGTa+eQBmrJhORubztaULDZXFXIbrgkLeRZhtNdLa+eB8m0bU4bn
 1uKcXjvaQP5V71em5L4ymaeM7o1gy7exyZ7eC1GAGUeGam8wNZjokdMQAd3uB3A+UrKR
 RS4AVOXGNhuWRx7eW7istaONmBInTv9Wr+CJtfKeTHsDY5X2dDkvStAZokif3Tk4wzbC
 qf/8OtTwflKgumDAyuF+P/qY0XI3zslBKH/dtM2FzsVIHzQngdhwUqMOgh0RDreWrFiZ
 ZxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736688780; x=1737293580;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mRUu7xwt0GOb8hs+BKrBffaLbY4C8ptCLopKQNeTlgY=;
 b=iE8zGabfXUjAoMiaQs6hplEm/jT0XTNkfs4T9Ha0mpojCINsSNk4oVUobqFIMLeyG/
 W8BD6Sx2dz7gUAvrkc7sRNEIRyuMYagmzwPd5/z/F+0PQ9pjfnUfTIlqVmqbDTNAVPtS
 J+AY15ZhFTiQt6vrPiEmanhN9KqZ5dARDlqN9wL3QBonvmp/LrHDzrm3NF1W8F9lJYJ+
 35k+vwmr37NArKK6cr+gD3BIK98taEbRmy3khYdyUgVXx6+FMoMzl75sS5GZGtImSjo7
 FiHpe3O3/cCTRvGawvlMv/BCdAcodyky7J5Gduz/3NexQEk6/1/stTXDEf7oyEL3VVmn
 ea6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyKrNPiILshlh3cV40dj6Ilz3KigVIAOmB+96MOsfIggFn7ts/lc/DVGTw+MJxUJSIZ0vjCL2B2AAfRw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxkCo8xTWEsiV4VWiH5y0OizEFSFXo182GnX8cup4SF7O8BcStH
 PAbZpUQ1V9wDxMMY8HsNAx6lqH4IMH7b5yDhCglfVD+XS38yoQn4XmwO93ZLR9I=
X-Gm-Gg: ASbGncuAM3cXM0dGGONy5RuSQ9Mo+HqhLQHJRZGWDNn4F13vYzk6SSSRHAZk6fExRlT
 wiHS1U+hZEaRcxD1dp7lnNgkP139qCwu7Mn+l8hU5Hkwdo8mo+KgwXjbxtlmOcBxBXGT2JZqYRy
 AWrqwGMyfzeeWBXrVKTjzk2wl5/sDcuUoCn9CnJMKagneHnPh3sdDbuF5DocqM1733BHM08G9TO
 WaJ/6ihx/t0Xx+xo8JcxMkxCWsvskdcAw1FWnZabiZe4eoRrTnffYvlH9GCvOCunoohsOaL
X-Google-Smtp-Source: AGHT+IHe7/2lTE7/Nj6QfvaBW+C/pcgDJDaV2DeHYFVEZqu1pr4HggBi1zI3dnd6icGke5g9aysmUg==
X-Received: by 2002:a05:6402:42ca:b0:5d0:eb6b:1a31 with SMTP id
 4fb4d7f45d1cf-5d972e1eb67mr5915789a12.5.1736688780172; 
 Sun, 12 Jan 2025 05:33:00 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9903c4477sm3584609a12.51.2025.01.12.05.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2025 05:32:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 12 Jan 2025 14:32:43 +0100
MIME-Version: 1.0
Message-Id: <20250112-syscon-phandle-args-net-v1-1-3423889935f7@linaro.org>
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
In-Reply-To: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
To: MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1232;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/XBAGwsAFpwFBBQSU961+beyZLkCUNZ5sGTLi9rt57I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8SBqm1C6n54I2y3MlkXEqlfvD/rdrdWXja7l
 F8+5Is0j1KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PEgQAKCRDBN2bmhouD
 17VVD/4qthD2/zGGxdy7/UvqcrbSUvelem2TFjP4otSbOQQWt2FoBYJM9pNa/ia4nDRzVPRxvWp
 AB684QLqy1jsKUV6CGPT3D+zER5yVvYN4twzngQrr02IRwqmYMGieUhT4C5lGveMXOBMmGa2mfU
 udJ4cuPGtlhH3fISl4u+3noNIZKMzIg3tNCkfvRsZDOAxAPyLpaePpjLMBYlgfahKqDSJJ3Ymly
 +xpGJ/hwDta2luGxIuxazAdQWU4lIeXdwHWgMBrdSensqJLq59XmNTDvSvGOYe6RhYYZEOGkBh+
 dowV/JQhEousq+sLQk8Vg6rJ20bAffXxCqMtmMMKK0iPtwmP7eeWQipA3SOUCyoWyqstPFDnJef
 WwaKd5jhJ6isWq6wImBLMXOke7etQoi8jD70/MBSBHYv5utAytgbAPEPSfrKdDyrDKanOHAS3Uw
 3qfAbOu3ld+3DGyNuxGR9gKUfogV69mX1twFMUXFg01h/7HOcmqFUu4qyW79JH9Fm5zJO/kIneA
 HbwYf3HvIrn7L1rWNCiZIli0eXsOgM6StdpoUZ9ty2Vp8tBg21cFVNlkY77/RG/d4ZAsx89Kw1p
 bp3xe0sin6kUFa1weHxNQaVneoV7PfrWRYHktdBkv66MzEVc9Yneu5Hxr8HS3MmFxNSjVv5cFp0
 Mqd3su6GpsWZLIQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/5] net: ti: icssg-prueth: Do not
 print physical memory addresses
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

Debugging messages should not reveal anything about memory addresses.
This also solves arm compile test warnings:

  drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c:1034:49: error:
    format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Werror,-Wformat]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
index 3dc86397c367d2b195badcf1fcb5f1ef39ffabd6..64a19ff39562fa4a6ba6f7e9de903f689a3d5715 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
@@ -1031,8 +1031,6 @@ static int prueth_probe(struct platform_device *pdev)
 						   (unsigned long)prueth->msmcram.va);
 	prueth->msmcram.size = msmc_ram_size;
 	memset_io(prueth->msmcram.va, 0, msmc_ram_size);
-	dev_dbg(dev, "sram: pa %llx va %p size %zx\n", prueth->msmcram.pa,
-		prueth->msmcram.va, prueth->msmcram.size);
 
 	prueth->iep0 = icss_iep_get_idx(np, 0);
 	if (IS_ERR(prueth->iep0)) {

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
