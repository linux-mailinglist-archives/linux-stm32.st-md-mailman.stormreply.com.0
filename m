Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 149DAAEE790
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 21:35:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2006CC32E8F;
	Mon, 30 Jun 2025 19:35:30 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F40FC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 19:35:28 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-2efa219b5bbso743287fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 12:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751312127; x=1751916927;
 darn=st-md-mailman.stormreply.com; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uSnBBrW7DyQ9uDD3D8W9h8fjOrHlTZaIJ8+vrX+84dc=;
 b=T75TP4E5+0UXIyIVDQuF82vzMMsA3utQvpI0j5d+po//f5lnqa0t51NXNJP5YAYT72
 vS2Au5ZO0f/9D0sByIJcSUt1/vlJVS7JRhPiERHjGJLTfvPt9vGyUWLTjw9vjmBL4MF4
 PilObW22e6mxwqJRyj3ntB0mejNbciwLDxacxO8ftj2QqFd23/IK/6lNkKXUEorHBJId
 7K4ephAxYse4O5Fum5usPP6B18bTPp4TSsysuFi+RoptlJs4fY17Fm5M2fms0fiMCUul
 ugwc68clbPi9VFxf9+2tjDzRt8CyK9y+v1u+klvg1kSp4ZtH+XnGXGDRJDnqkcjmaVm9
 43SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751312127; x=1751916927;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uSnBBrW7DyQ9uDD3D8W9h8fjOrHlTZaIJ8+vrX+84dc=;
 b=j2+DkODRs6pbx+xhLJHhwr7T9Vo5dA/zf5vzcMXbrERZjTb50e4x7iaLpiPktPxiBC
 jCFn4uG4gh6rkjx/UI7g4jGRyykPEOWsMjeO8dlHvpjuumbPq9d8wBQbMITRRnX7c95x
 swlnGWxCksIfHVHEwqenV2jeis9UHRyuo31ZipsaWrUsYbhfoA+bmUC+sCrwVX9KGdcn
 oR/dzVz/xYpvkFx5LE6wIqW9gzPnw3r04zU0XPxMBfzbSdOovCF4xr9350XyIX6d1s+Y
 czDrmbj9VyCnj2tisxM24TH/DlzgklbEzf6VNHtdeUgJ8LR/3faX3Wx390+SxImX5ysW
 WJcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr/fVr1IiPf+uBCdJmbYQIw7EK0KpIbzX5nTsd7L2/sUvuq/nmPwdwJy6dC3y3E3aZbhLhCoD3IGR7Lg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwKud9l2tS95BfAVm2+fzZ3GK+yWXm/tcNMwJ13J+x7xGbPOhSm
 9LKDCs6Z4Y/llRFuK3JSX55ClmDdmale2GMWZ4AnvMBwgRQgeeDmzYoKZWELI3xV/6o=
X-Gm-Gg: ASbGncvcNN5KWHvXPRnBp8wQWPNJYLAlt2mXypmnzvkFb8h7yd4V9GM2CtSAjk1UQlb
 gnV0soGVRyAJe6lGio3bokHYwsCPaVJ5LJ25qD80Xt+1CmCaGsPpoNDNgTklcUl0cacoizpIAc4
 NbH7+vtLz4Vc69BJb9pp1ewrniaWj98lccrSTdhbteDTy4tBbmRR44crGhF3i8hQj7cr58ymtx8
 8nB4VQOLNQ7eNdjCKlEWPDLEp9vVikAKMBuZaB0zAJN1jyqKbywwxehsLShDvpAveUyrcLHdWHT
 18Hh3dRGjSyCm2uBis3+/B47A0CCBYhDp5ob1JGUwkDKAoZr05bAs3DevnCUneTtvzZT+vooThm
 4238=
X-Google-Smtp-Source: AGHT+IFjeReXBA3k7+eClk/ifIE93Uzbc7oaZBkcYmdYTh/N0ppG05eqByPpmkkuYUzt5s/KtcZ0Xw==
X-Received: by 2002:a05:6870:783:b0:2eb:adf2:eb2 with SMTP id
 586e51a60fabf-2efed7a2a73mr9014336fac.36.1751312126689; 
 Mon, 30 Jun 2025 12:35:26 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:49cc:1768:3819:b67])
 by smtp.gmail.com with UTF8SMTPSA id
 586e51a60fabf-2efd50f7f6asm2908403fac.36.2025.06.30.12.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 12:35:26 -0700 (PDT)
Date: Mon, 30 Jun 2025 14:35:25 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <2033b9fa-7b0f-4617-b94e-7b0a51c5c4b1@sabinyo.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] spi: stm32: delete stray tabs in
	stm32h7_spi_data_idleness()
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

These lines were indented one tab more than they should be.  Delete
the stray tabs.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/spi/spi-stm32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 3d20f09f1ae7..afb54198bde7 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1895,8 +1895,8 @@ static void stm32h7_spi_data_idleness(struct stm32_spi *spi, struct spi_transfer
 		if (spi_delay_ns) {
 			dev_warn(spi->dev, "Overriding st,spi-midi-ns with word_delay_ns %d\n",
 				 spi_delay_ns);
-				spi->cur_midi = spi_delay_ns;
-			}
+			spi->cur_midi = spi_delay_ns;
+		}
 	} else {
 		spi->cur_midi = spi_delay_ns;
 	}
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
