Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFCC217A7A
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jul 2020 23:31:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D98AEC36B30;
	Tue,  7 Jul 2020 21:31:28 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07440C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2020 21:31:28 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id u18so3674352pfk.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jul 2020 14:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QJEcAvXCkMubZ5CvQAwW4/233WmH+zu/CCD6+/Cfr60=;
 b=IE5epYPw1RKLJGcDCbEzvXqg/wzIPCWzzN5MF6MfqI9d6CQG5XFJfTcsGCoYnO5zor
 NlARFp0Hv7XGJIFLWDcqOl9OywPlN3WnMHXoaQ5VxZprr2okYGkcu+k0H04R5MX4oOxg
 NsV5m8lBFwZ2URIidMlNWX5GhkIlPnuVMB0Ky5FoKFHSDZVq1WnqoBVY1S65x6IReMVb
 ahpQc0LDTA9QmW3dmoQMLqWffbFzmuL7b9Cok+0Xi0y+l3kwb3A4HD5mYFXCd2lLKSly
 iCapvghsBYMN77c9lcOBiDhFr5vvYBEBuHFADT3RvDeGvWp7YtUDQBW4K7Tw51DAZElE
 DazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QJEcAvXCkMubZ5CvQAwW4/233WmH+zu/CCD6+/Cfr60=;
 b=or0Flr3A1lMlNryXuCIlPVRHSKl2UfBRqinlOOcvIYHwAu8RvTdIvwiOH12baXLIui
 0zImJVndgqzG45qhJ42WB+catMzbxUqCIN0fHUhnS7QfRzydSKudoKSrLYUZxTY1xeI5
 hv72+15CbeZl1QGf39IzUUks59gIe7DG2Jbc5ogECTBl9PD+SGPJOTGPt3jTrFDBjFaG
 sHtsZGq1Og11EJYc6/54RID6op9NsRoe9yE1gGbmY0C4GHHqaNR4cGNg/fb6I7kjw36H
 irmp5ey9lamepHK2NXdgTHgeY/yb7Gnl9JVwC86tEpJcTCjXfxUVB3SXbYHBbtYK/s4s
 5ltQ==
X-Gm-Message-State: AOAM533c04wW4TRXIidUrryYPy5e9bDYUuZEBCXPyvPhex0VtJZkTrg7
 rQnffQPnoLwp4jquB0Ndq9QQHA==
X-Google-Smtp-Source: ABdhPJyfGJ+vJd9xYmAfFuTKVM4A+h+OYVeHtTcdBy6UX/Eo2auv4jd0+FrywfGIrrOD4bTAWKK3Eg==
X-Received: by 2002:a62:fcca:: with SMTP id
 e193mr41781795pfh.307.1594157486584; 
 Tue, 07 Jul 2020 14:31:26 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id o128sm23560832pfg.127.2020.07.07.14.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 14:31:26 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
 arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Date: Tue,  7 Jul 2020 15:31:11 -0600
Message-Id: <20200707213112.928383-11-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707213112.928383-1-mathieu.poirier@linaro.org>
References: <20200707213112.928383-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v5 10/11] remoteproc: stm32: Introduce new
	attach() operation
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

Introduce new attach function to be used when attaching to a
remote processor.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 882229f3b1c9..7145cd49616e 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -460,6 +460,13 @@ static int stm32_rproc_start(struct rproc *rproc)
 	return stm32_rproc_set_hold_boot(rproc, true);
 }
 
+static int stm32_rproc_attach(struct rproc *rproc)
+{
+	stm32_rproc_add_coredump_trace(rproc);
+
+	return stm32_rproc_set_hold_boot(rproc, true);
+}
+
 static int stm32_rproc_stop(struct rproc *rproc)
 {
 	struct stm32_rproc *ddata = rproc->priv;
@@ -525,6 +532,7 @@ static void stm32_rproc_kick(struct rproc *rproc, int vqid)
 static struct rproc_ops st_rproc_ops = {
 	.start		= stm32_rproc_start,
 	.stop		= stm32_rproc_stop,
+	.attach		= stm32_rproc_attach,
 	.kick		= stm32_rproc_kick,
 	.load		= rproc_elf_load_segments,
 	.parse_fw	= stm32_rproc_parse_fw,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
