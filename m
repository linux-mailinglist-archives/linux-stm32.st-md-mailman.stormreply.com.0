Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5D48AABCD
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Apr 2024 11:49:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58674C7128C;
	Fri, 19 Apr 2024 09:49:36 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A633C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 09:49:34 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-78f0e3b6feeso68866785a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 02:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713520173; x=1714124973;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=X5IbU7HBHK5ZSrS81fN3o3XopIPldfFFy8PdyHH7F6Q=;
 b=Z0pTFJleGyXxJKrf2dFrA5iONziG2o1eXpOCrLObqkmxo7vv8hNswskEPHlHZWktZf
 0p9DNNgB75YapBxQYzzdckCEg+dwZLtef+9Kft+Wh+VXWdCoxSwy3zoLQNBzDHFSB9QB
 yteUlQnN013k181DG0yEPaj8IvFKWT4NLQ0u4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713520173; x=1714124973;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X5IbU7HBHK5ZSrS81fN3o3XopIPldfFFy8PdyHH7F6Q=;
 b=xJT26fET12rCCZ3bQT6c/gxM4M+KHY9sx08Co/SWSF/35HWcTxcsnTueVriVP9nygq
 GysudVtxQ/wOHMtMuNzEKTkiFHS8ZkCaBMAdGXqFa+5pBTy6hkRh5slQUmuiXvyCy7Gg
 LFtxiB0aYFNqP63R7i28Ca0gP5DQFD8AWwjy9Se+/lVdrbrtI9u2Dn4+5gftkwFZB+sN
 V7xBMR3oH3lCbFtTDqGFFW1/L2QEUxd9yyyaSvhC1CLSeMknRtLTjgecwERYyWrrvGtE
 7G+Zp23SdLnqX49aRd3BGj1NXrkvPTLCm8EsvnZG52nYqI7dkLZCtYu8S5z4xgtJ0+nY
 H/wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHyrWZm0mMO5vDdERRI+clza3UAcarc4RWgXWfPZEJnNPYbad4+isvT+cD8aDx2itW71k0a39zt2P159QA7fNq7JRRwT9CRNXvePZByzMxVtEkLoDFX720
X-Gm-Message-State: AOJu0YwferDEORHvoVFxz5wABQzn5WMsIZ/wVRMJ3bD8y4fOCtIbN0oH
 RNcqGsv+BYdm5j1MsoU2I7I7w/K0o1uUZhmPJhrZ9q77V/JwLwr8TshrTzSUwQ==
X-Google-Smtp-Source: AGHT+IEFPc2doe2D5XWkbZvTrB29BF0kfAeaqeMumnsEPsoEkeZEg2M8kAGfVkDU7KVIwRhvnXAZ7g==
X-Received: by 2002:a05:620a:3b84:b0:78e:dcb8:b4be with SMTP id
 ye4-20020a05620a3b8400b0078edcb8b4bemr1649647qkn.6.1713520173590; 
 Fri, 19 Apr 2024 02:49:33 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 02:49:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:58 +0000
MIME-Version: 1.0
Message-Id: <20240419-fix-cocci-v2-12-2119e692309c@chromium.org>
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
Subject: [Linux-stm32] [PATCH v2 12/26] media: platform: mtk-mdp3: Use
 refcount_t for job_count
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

Use an API that resembles more the actual use of job_count.

Found by cocci:
drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:527:5-24: WARNING: atomic_dec_and_test variation before object free at line 541.
drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:578:6-25: WARNING: atomic_dec_and_test variation before object free at line 581.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 10 +++++-----
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c |  6 +++---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h |  2 +-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c  |  6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index 1d64bac34b90..ea2ea119dd2a 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -524,7 +524,7 @@ static void mdp_auto_release_work(struct work_struct *work)
 	mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
 			    cmd->num_comps);
 
-	if (atomic_dec_and_test(&mdp->job_count)) {
+	if (refcount_dec_and_test(&mdp->job_count)) {
 		if (cmd->mdp_ctx)
 			mdp_m2m_job_finish(cmd->mdp_ctx);
 
@@ -575,7 +575,7 @@ static void mdp_handle_cmdq_callback(struct mbox_client *cl, void *mssg)
 		mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
 				    cmd->num_comps);
 
-		if (atomic_dec_and_test(&mdp->job_count))
+		if (refcount_dec_and_test(&mdp->job_count))
 			wake_up(&mdp->callback_wq);
 
 		mdp_cmdq_pkt_destroy(&cmd->pkt);
@@ -724,9 +724,9 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	int i, ret;
 	u8 pp_used = __get_pp_num(param->param->type);
 
-	atomic_set(&mdp->job_count, pp_used);
+	refcount_set(&mdp->job_count, pp_used);
 	if (atomic_read(&mdp->suspended)) {
-		atomic_set(&mdp->job_count, 0);
+		refcount_set(&mdp->job_count, 0);
 		return -ECANCELED;
 	}
 
@@ -764,7 +764,7 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		mdp_comp_clocks_off(&mdp->pdev->dev, cmd[i]->comps,
 				    cmd[i]->num_comps);
 err_cancel_job:
-	atomic_set(&mdp->job_count, 0);
+	refcount_set(&mdp->job_count, 0);
 
 	return ret;
 }
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 5209f531ef8d..c1f3bf98120a 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -380,14 +380,14 @@ static int __maybe_unused mdp_suspend(struct device *dev)
 
 	atomic_set(&mdp->suspended, 1);
 
-	if (atomic_read(&mdp->job_count)) {
+	if (refcount_read(&mdp->job_count)) {
 		ret = wait_event_timeout(mdp->callback_wq,
-					 !atomic_read(&mdp->job_count),
+					 !refcount_read(&mdp->job_count),
 					 2 * HZ);
 		if (ret == 0) {
 			dev_err(dev,
 				"%s:flushed cmdq task incomplete, count=%d\n",
-				__func__, atomic_read(&mdp->job_count));
+				__func__, refcount_read(&mdp->job_count));
 			return -EBUSY;
 		}
 	}
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index 8c09e984fd01..430251f63754 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -134,7 +134,7 @@ struct mdp_dev {
 	/* synchronization protect for m2m device operation */
 	struct mutex				m2m_lock;
 	atomic_t				suspended;
-	atomic_t				job_count;
+	refcount_t				job_count;
 };
 
 struct mdp_pipe_info {
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
index 35a8b059bde5..0e69128a3772 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
@@ -104,14 +104,14 @@ static void mdp_m2m_device_run(void *priv)
 	task.cb_data = NULL;
 	task.mdp_ctx = ctx;
 
-	if (atomic_read(&ctx->mdp_dev->job_count)) {
+	if (refcount_read(&ctx->mdp_dev->job_count)) {
 		ret = wait_event_timeout(ctx->mdp_dev->callback_wq,
-					 !atomic_read(&ctx->mdp_dev->job_count),
+					 !refcount_read(&ctx->mdp_dev->job_count),
 					 2 * HZ);
 		if (ret == 0) {
 			dev_err(&ctx->mdp_dev->pdev->dev,
 				"%d jobs not yet done\n",
-				atomic_read(&ctx->mdp_dev->job_count));
+				refcount_read(&ctx->mdp_dev->job_count));
 			goto worker_end;
 		}
 	}

-- 
2.44.0.769.g3c40516874-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
