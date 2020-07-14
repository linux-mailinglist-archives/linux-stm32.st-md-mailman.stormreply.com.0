Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2554621FE14
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jul 2020 22:05:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC4F5C36B2F;
	Tue, 14 Jul 2020 20:05:06 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B8D1C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2020 20:05:03 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id o1so7482539plk.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2020 13:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vHRO/0KjGNxIcLdu4Nprxq06C5XRM7DNFyiZUQDkaSQ=;
 b=HpKSrt/sw9Twx4HYSQuRe7qY2HexRKWuCG6/YkmnOA1TfIJTbMVco+HycC/GnXMpqP
 TZjyyRVe2FYTRm6E0s1cgTTjq+iiCo3g1yeKhd0cWSLw3rA+TxicbTqNBW0/wNK0siox
 +4ufU5GgjwoozEWZ7ZG+coKhws4dDc1NiLjSoEp6fJFDtEtjlbLGjaJK4nwdHstyPfK0
 Ir/2CdmVsKStSv9gbs4F3IEeC5GR7ZYr/BNed2kbgBJWjQO4HqrpjfdjU/HcWhDO1G0u
 eqQ72tDURayiZEW86/BZcasUcGJL3JXeC8E9ACR7ZQ+INM8BG+R5MIswuWu8usBVk0be
 FBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vHRO/0KjGNxIcLdu4Nprxq06C5XRM7DNFyiZUQDkaSQ=;
 b=Krw+MddjxLsxVU8hWwEMhXrJdbRDGPxOwbeoPd4dFahykKSw04C3xtEUDrTshvgNk4
 PiC9388P3cIlEWQaP3NjlvGVUfsQFEgMlcx6BTyB3K8Om7UsGuRGX5dNLJXyUTUn3oE/
 YYhdIX+44Gda4KdFzEblSJWDwMRQjvDdpcVqsOXJ1L3OvYTMVtGdwqfSs70ODL48vM8M
 O+G/vBgG8Lp+XekYWbxJ9Qo2ZJV2VKolBu5P+hUMxS7BK1r5XNcViaOBvJogV7bgyunY
 OLTaAMU4cygXE3uE0PumKt6IoRuOEnSaZD86fkHSpwx9zTlipOVUCkZefg9kjGAcMQxD
 W1qA==
X-Gm-Message-State: AOAM530lZmKWqK2IqzahziKv8ocdmABb/9Rwi/gX60mYbJCgWFENQvtm
 pL0Et0K9zRYol4PtYFPymXOLyQ==
X-Google-Smtp-Source: ABdhPJzf7Ljcc070FSCCrVZHXRqFKMPunWgU55weQAyEjLHUA8bgjcOZIqobpXzGVURx+JoT/+hOTA==
X-Received: by 2002:a17:90a:304d:: with SMTP id
 q13mr6267566pjl.73.1594757101831; 
 Tue, 14 Jul 2020 13:05:01 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id t13sm3262959pjs.17.2020.07.14.13.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 13:05:01 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
 arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Date: Tue, 14 Jul 2020 14:04:45 -0600
Message-Id: <20200714200445.1427257-12-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
References: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v6 11/11] remoteproc: stm32: Update M4 state
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
