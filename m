Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1557F8A63D8
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 08:35:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7032C6DD67;
	Tue, 16 Apr 2024 06:35:02 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82729C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 19:34:31 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-5aa17c69cf7so2691376eaf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 12:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713209670; x=1713814470;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vq+7mr1szAOvpscJpegvOEKeeaK/lFJAotzxeoFP90w=;
 b=iiP2duz2CcpcQs+ChW8Kxtyk8thO6hBjsMz18+G0cSOmlwC71WRJcK3sxv8fC7Fqsn
 Gq40ny3poav8ORL90GiyirI69NTOHo6pw3Hq3CUjCAC2lN3mX4GA5U/L/m7nxx+awIDl
 OuHtWWjDt4skf63RqQJFgpaLdjRzubwZs3Q5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713209670; x=1713814470;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vq+7mr1szAOvpscJpegvOEKeeaK/lFJAotzxeoFP90w=;
 b=i0wrgpJSJAYVeAPohsOgUMzrv+Ldt8HMBIeMnO+R1DQgFV2jDdZj4xFh1QuVnur0+C
 IZxbakRs1d5fcVLOTYsHxjlk3eyeic6S7uejYpbvcnSnNNXcaT0PKzjxkcBovIQTx8Ut
 WlJ0KTwzwUqo2I/vZdRw4LQTONPeIlrmCMf17PN26Xw/2bbPXZTrlQAEGWYLWigKQ94h
 /UiJV2JpVuVjYP7z/NiWvdHAdglxfQX0bS36o9GG28lLRW85kSzuKUhAkCA9Yscxe2z+
 HBB5hkqE1OxA179Ff0TDhecknBhQl96eLMjkjVqiLeeWBHyiItAhK5qFBOsGzR6y3X1y
 TWRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS7YaIzZjEqsXt90gIH2AcctJW9z305e0y1ve/n3D68CrCBHO239hlRbzLisdM8OpRF1EwiSHsj9pPThjkMQuuo3NGt5A8ilmS3R28pJLPRYzR1cbaNcrc
X-Gm-Message-State: AOJu0YzKgnMmWKhqmXA/jbS2sztA2AUQbkBuUDCGKAXhp9XQaAaLuD5H
 1Z6Jpao8Ejg4Mj7HGlqmbD85m3XALKU0mUdDWL9PpwZWEI3cngPXYW0DvPtGQQ==
X-Google-Smtp-Source: AGHT+IFDs72yHh14dMP/v3LcOXYq1AzGZaPkrHXx/btoSixg8uGduMLiI7a2hIPG7rGea4VcIV3D3Q==
X-Received: by 2002:a05:6870:9a97:b0:22a:2e6:b82e with SMTP id
 hp23-20020a0568709a9700b0022a02e6b82emr13491647oab.38.1713209670403; 
 Mon, 15 Apr 2024 12:34:30 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 12:34:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:20 +0000
MIME-Version: 1.0
Message-Id: <20240415-fix-cocci-v1-3-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
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
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
X-Mailer: b4 0.12.4
X-Mailman-Approved-At: Tue, 16 Apr 2024 06:35:01 +0000
Cc: linux-arm-msm@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 03/35] media: uvcvideo: Refactor iterators
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

Avoid using the iterators after the list_for_each() constructs.
This patch should be a NOP, but makes cocci, happier:

drivers/media/usb/uvc/uvc_ctrl.c:1861:44-50: ERROR: invalid reference to the index variable of the iterator on line 1850
drivers/media/usb/uvc/uvc_ctrl.c:2195:17-23: ERROR: invalid reference to the index variable of the iterator on line 2179

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e59a463c2761..a4a987913430 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1850,16 +1850,18 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
 	list_for_each_entry(entity, &chain->entities, chain) {
 		ret = uvc_ctrl_commit_entity(chain->dev, entity, rollback,
 					     &err_ctrl);
-		if (ret < 0)
+		if (ret < 0) {
+			if (ctrls)
+				ctrls->error_idx =
+					uvc_ctrl_find_ctrl_idx(entity, ctrls,
+							       err_ctrl);
 			goto done;
+		}
 	}
 
 	if (!rollback)
 		uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);
 done:
-	if (ret < 0 && ctrls)
-		ctrls->error_idx = uvc_ctrl_find_ctrl_idx(entity, ctrls,
-							  err_ctrl);
 	mutex_unlock(&chain->ctrl_mutex);
 	return ret;
 }
@@ -2165,7 +2167,7 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
 int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 	struct uvc_xu_control_query *xqry)
 {
-	struct uvc_entity *entity;
+	struct uvc_entity *entity, *iter;
 	struct uvc_control *ctrl;
 	unsigned int i;
 	bool found;
@@ -2175,16 +2177,16 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 	int ret;
 
 	/* Find the extension unit. */
-	found = false;
-	list_for_each_entry(entity, &chain->entities, chain) {
-		if (UVC_ENTITY_TYPE(entity) == UVC_VC_EXTENSION_UNIT &&
-		    entity->id == xqry->unit) {
-			found = true;
+	entity = NULL;
+	list_for_each_entry(iter, &chain->entities, chain) {
+		if (UVC_ENTITY_TYPE(iter) == UVC_VC_EXTENSION_UNIT &&
+		    iter->id == xqry->unit) {
+			entity = iter;
 			break;
 		}
 	}
 
-	if (!found) {
+	if (!entity) {
 		uvc_dbg(chain->dev, CONTROL, "Extension unit %u not found\n",
 			xqry->unit);
 		return -ENOENT;

-- 
2.44.0.683.g7961c838ac-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
