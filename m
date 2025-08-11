Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47666B20695
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 12:56:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05065C32E8E;
	Mon, 11 Aug 2025 10:56:58 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B30DAC32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 10:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754909815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t+Rztee25JuVOb3qnfGrbYzil++DqREMLNxo1mFDVeU=;
 b=ZmKz3ngKEg085dC3N9H8JghM1nP36OE5KfMbtmfqSgrdaaB5LpYJk5odYroEKPl3tQoNWc
 M9PeWGFglU7zJE6QqV/8rRo2jpsOHWxBPSLEIpStNCLAb6tu5U+b8Uja+ls4hzYjgDLHm6
 4H6nFHaVG0mJKNCaUFW6Z8niikKdrAw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-m2bBHtZ4PXKVisjsER7hdQ-1; Mon, 11 Aug 2025 06:56:52 -0400
X-MC-Unique: m2bBHtZ4PXKVisjsER7hdQ-1
X-Mimecast-MFC-AGG-ID: m2bBHtZ4PXKVisjsER7hdQ_1754909812
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e826e0d7abso887676885a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 03:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754909812; x=1755514612;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t+Rztee25JuVOb3qnfGrbYzil++DqREMLNxo1mFDVeU=;
 b=gfiLgRWaysbz0C+lSsayYvIOuTTT2nQ2JdDQ5hBK03I9UgRMSlq6JXMDHXo+Agqu6F
 QL2kxdYsIf1sIOAH594y4ofMZbzYB6niDSSeibGbBhfIh2SWOYZLqOzV84lgsO5+wo6Q
 n6ex5CgG98fLs5WuQqqgFG8oAYV97TjXkllrIZIdjvXhsE+KRPnHL7sddKGXRLhSKjWC
 gpZ6n5nkpctqi70BLnEqYQjZqF1c2hHCeotaL1IB2jYpWyr6YldACSY+bKy2O6VKOREQ
 DWOoR4y65ZQSWnEzLkAFbzeICak6uoU/nWR7GjrQjUFXMckRYhXZyRBx0bpNFsah3LSj
 YVkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRl9aU0+wf68AQWTEtrKpcqw2c85VEVA7qoHZr/XD2RMr6bNY3lhQ1fHvNnNZQbKkPSE8WduW7DgZk3A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy4LnlMa4D9T17Sc6APwefcM4VAqmi18oWMVm3LqvDOVUf0Jeu0
 YvoXtD1FWMRrpWpiF3qCQwSaUUW3tG4BULfjXJNZTfnt4ezRC+/qe7wijpujy1LII58e/l6pOLU
 rCbr9r0wOvMjRJX3dSxS5idMIHu9AblRLoOB49defuX384pCoVdc+eWM6rK+6ktIbLiw7Vec2Sl
 GwT00C7w==
X-Gm-Gg: ASbGncv+O5ygPQf4s5XP7Kzrl/EI24NX1Libs+WF7A8ojz60DSxnK75pefZIuzS5a/n
 577OkMIOzUHleUjpnUYsCFYyBPOQZU2Duct2o/YTW/fq8AiEWRVXBzJ0yCA+z1n27WRBfc/BXkp
 nG4mOj6/XTRSyRzAbbKQPUdI20Kby0zaHisAr9ZJC9msQB4Haj3S8gnK7a0baSvlIjkJTDd9DaE
 qqpSA2OjCIEHHKhO4n9c/VlKatFG0eQXzHY3gthVDusHS7eybvLukWETPL4GnDOxWY/iexQVrHC
 n+BAerQfzA1X6PnsMUBAWo1j4ZFKxkdVglG9dDPXl55/vwd9OhLi4toIdRPIelsLowYpTEbO+Yr
 +Htg=
X-Received: by 2002:a05:620a:c50:b0:7e8:1b64:2187 with SMTP id
 af79cd13be357-7e82c75f958mr1792739185a.33.1754909811720; 
 Mon, 11 Aug 2025 03:56:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK2Etk94d7jqWBuBTsPUBpC0ORVIn7oE21Xh8O9EOQgSk7vq5RIMLYWuxIl1Nwz+nt1Y38MA==
X-Received: by 2002:a05:620a:c50:b0:7e8:1b64:2187 with SMTP id
 af79cd13be357-7e82c75f958mr1792735585a.33.1754909811152; 
 Mon, 11 Aug 2025 03:56:51 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:56:50 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:12 -0400
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-8-4a91ccf239cf@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1693;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=4SmOn45QQwwyMezbBb5tx+ffOCKNsfDDe6H8Sa9QRwg=;
 b=D6lQv4uU9BbCtmlsDXvXPLa8dR0h0DlOWWckbVaEkFndxlEt+IyMNkfDuSVR8NgDYOThGx2MA
 72BwKh/6cLNDsrNiAlNie395a35C4+/kjwVpt/wftlDiaqzAFDkxkOV
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CenYMGfcraantsM26DCVV2ojQ5SEHPeA1kjjqLiGJRU_1754909812
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Brian Masney <bmasney@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 8/9] drm/sun4i/sun4i_hdmi_ddc_clk: convert
 from round_rate() to determine_rate()
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
index 12430b9d4e930f7e7b0536a5cabdf788ba182176..b1beadb9bb59f8fffd23fd5f1a175d7385cd5e06 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
@@ -59,13 +59,15 @@ static unsigned long sun4i_ddc_calc_divider(unsigned long rate,
 	return best_rate;
 }
 
-static long sun4i_ddc_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *prate)
+static int sun4i_ddc_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct sun4i_ddc *ddc = hw_to_ddc(hw);
 
-	return sun4i_ddc_calc_divider(rate, *prate, ddc->pre_div,
-				      ddc->m_offset, NULL, NULL);
+	req->rate = sun4i_ddc_calc_divider(req->rate, req->best_parent_rate,
+					   ddc->pre_div, ddc->m_offset, NULL, NULL);
+
+	return 0;
 }
 
 static unsigned long sun4i_ddc_recalc_rate(struct clk_hw *hw,
@@ -101,7 +103,7 @@ static int sun4i_ddc_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops sun4i_ddc_ops = {
 	.recalc_rate	= sun4i_ddc_recalc_rate,
-	.round_rate	= sun4i_ddc_round_rate,
+	.determine_rate = sun4i_ddc_determine_rate,
 	.set_rate	= sun4i_ddc_set_rate,
 };
 

-- 
2.50.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
