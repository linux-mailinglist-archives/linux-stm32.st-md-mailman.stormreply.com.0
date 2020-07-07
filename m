Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECA9217A7B
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jul 2020 23:31:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5FE0C36B2A;
	Tue,  7 Jul 2020 21:31:32 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E1D2C36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2020 21:31:29 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id l6so235080pjq.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jul 2020 14:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vHRO/0KjGNxIcLdu4Nprxq06C5XRM7DNFyiZUQDkaSQ=;
 b=ey7CtPdAXBygQ5ue7SuxHQa8Oatdp7d/GiJ6UliPUKy1Vxnu6d7REZvKf42X4XJrc+
 gY9p8DUab2i02whZGWnlgg7cj4kHgZ8572tSvVo7eqlourW1R7v6EL3PcWDYQKgR1WsV
 PvV3BudNIq71bKku0JFVw6kjNUGKaPlzT3x5F5M6xzYnU8fOV1EXn36ARjOxE9dC2uQH
 sCxFKe0sfIs03HaokbWOaXYGsIJDDGoRVZgufD3TwVZQNJxzIMdprZmjndWJsKqx7wyg
 aDqN8xfSO50Kml6C3gTqgdIBucz3N9b4iQB8NeNk14+i+PTtMBYpaKkY0k5yoclOjuRM
 jDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vHRO/0KjGNxIcLdu4Nprxq06C5XRM7DNFyiZUQDkaSQ=;
 b=jvsoWQXz6QR6I66RSfgGNLzPv7DXtIzq8TdAzKcCqNElyu+3OTCei5van9Emu99z4z
 OnYMEcUFf3pS+emVl5vaLnIA4WMhxD34ECxYPjioUSRQqEfEnivFohTsxARoVWEKE0Vx
 KAdpVwnXkn6IagZsud9/2RMGCRCd6QFkgLeSC9/5sbCQuU1SaGdHH5FnRu84cipd5Bjt
 WgcdvVc7w9N3yynlM7b7ydFsb6vymtXY8NBk005NI6cBk3RvMSAiftDUCeYqfA9YPFNb
 jQGame5pghV00w1CAfaj7FlE69QxNSm0hJZ8f/02Y+Ds2+qIWXS0HCnRyKA5dcYQdhC6
 1mjA==
X-Gm-Message-State: AOAM532PoEM9I4Dyazf1hiOycPyV+13pCcKl7SUwfPh3R25x5VyiSDGc
 ETov/M2pelw2asOl+1w7Nds+L4o5z2w=
X-Google-Smtp-Source: ABdhPJwYd2Jg2XN/sDXvOil97+lxOhcMuirGZInRZuWanbK+jPdSPTrtzm7fd4Zhai9XJwwp1UAigA==
X-Received: by 2002:a17:902:507:: with SMTP id
 7mr46010520plf.186.1594157487779; 
 Tue, 07 Jul 2020 14:31:27 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id o128sm23560832pfg.127.2020.07.07.14.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 14:31:27 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
 arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Date: Tue,  7 Jul 2020 15:31:12 -0600
Message-Id: <20200707213112.928383-12-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707213112.928383-1-mathieu.poirier@linaro.org>
References: <20200707213112.928383-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v5 11/11] remoteproc: stm32: Update M4 state
	in stm32_rproc_stop()
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

Update the co-processor state in function stm32_rproc_stop() so that
it can be used in scenarios where the remoteproc core is attaching
to the M4.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/stm32_rproc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 7145cd49616e..f4da42fc0eeb 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -504,6 +504,18 @@ static int stm32_rproc_stop(struct rproc *rproc)
 		}
 	}
 
+	/* update coprocessor state to OFF if available */
+	if (ddata->m4_state.map) {
+		err = regmap_update_bits(ddata->m4_state.map,
+					 ddata->m4_state.reg,
+					 ddata->m4_state.mask,
+					 M4_STATE_OFF);
+		if (err) {
+			dev_err(&rproc->dev, "failed to set copro state\n");
+			return err;
+		}
+	}
+
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
