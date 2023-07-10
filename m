Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE3674DF07
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 22:17:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 861E2C6B457;
	Mon, 10 Jul 2023 20:17:42 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 189DBC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 20:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689020260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZfBCs08BCyvb4rUBf/lFUidTAq5uH0UA99R+iDtQ+Ug=;
 b=Vte6DMJequp4VaHVSbynVId14j94TYH8zqSPUMuTVZ5MHtzjTgtVm1AJ4PkD1AhhAzfKKH
 STqMUNgKDuygO59j23fYJdvf0Uuf7iKOWEfh/8hZw3bJvc7nvAflwYAHg3T6+QYKsJgU7b
 YTHCqeqUzAwuWm2JAppvrpWv9RLQW4s=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-UuS3XuZgPFOO658H8Kaclg-1; Mon, 10 Jul 2023 16:17:39 -0400
X-MC-Unique: UuS3XuZgPFOO658H8Kaclg-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-1b457db8244so2563618fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 13:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689020258; x=1691612258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZfBCs08BCyvb4rUBf/lFUidTAq5uH0UA99R+iDtQ+Ug=;
 b=kV/fCJse1QcH6vshvEdlAVsjQ1erferOlCgm0xuB7k2PNz716t0UEsWg/baTni6Xk7
 Y8RbOl/2zu5Np90zH/DK9ihX/G3yQSXwuXfmCISCyo6Xs+SEhPwSi5Z3rQ6lInn8Trz4
 P//ODtgddhbqeOG2oFazib60Ppd8MSE+vnd683LING8qWI5NiYqrGaQIi/a0/bAEmgCx
 Hr02jkiAMd7DO0g29xY1Ic0cWTVmxbg3eCo3/K2FMauDRdBu7QVXTQ3OK3SPQrwXm1Ko
 XT/f02zDILWebHf1os6KmonmtrvQdA3Etkows33hRYKhHtyc15474U36m4p3qWB6f9wH
 caHw==
X-Gm-Message-State: ABy/qLbH7bjIXZiyr5WvGJ7JCxyfTcX/ad/bA3/akNNaisTGPPWFa+XC
 rA02ZmUMUa1o8VWZktzV/4v/FnF5bwflohNXRwGcMxsEEb9xHUVyEuj9BuuPgXKVWZ6Jeqxn/f0
 m8NJq+/Yc0dVCrORkFdsJ6ZlXQ2C6BC2W/GD5kfZeunvo7Sr9
X-Received: by 2002:a05:6870:440b:b0:19f:9353:d9b0 with SMTP id
 u11-20020a056870440b00b0019f9353d9b0mr13312416oah.24.1689020258009; 
 Mon, 10 Jul 2023 13:17:38 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG/yzsbrle2mK4hDSP+ymIcBBFgugjNQj9A986L5d0AncrnW2gjIY3q9PjS07ExUBl/iRYYsw==
X-Received: by 2002:a05:6870:440b:b0:19f:9353:d9b0 with SMTP id
 u11-20020a056870440b00b0019f9353d9b0mr13312403oah.24.1689020257748; 
 Mon, 10 Jul 2023 13:17:37 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::22])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a81920c000000b0056d2a19ad91sm155097ywg.103.2023.07.10.13.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 13:17:37 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 10 Jul 2023 15:06:38 -0500
Message-ID: <20230710201636.200412-3-ahalaney@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230710201636.200412-1-ahalaney@redhat.com>
References: <20230710201636.200412-1-ahalaney@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: vkoul@kernel.org, bhupesh.sharma@linaro.org, andrew@lunn.ch,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, simon.horman@corigine.com, kuba@kernel.org,
 pabeni@redhat.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v2 2/3] net: stmmac:
	dwmac-qcom-ethqos: Use dev_err_probe()
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

Using dev_err_probe() logs to devices_deferred which is helpful
when debugging.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v1:
    * Collect tags (Andrew Lunn)

 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ebafdadb28d5..1e103fd356b7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -710,8 +710,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat)) {
-		dev_err(dev, "dt configuration failed\n");
-		return PTR_ERR(plat_dat);
+		return dev_err_probe(dev, PTR_ERR(plat_dat),
+				     "dt configuration failed\n");
 	}
 
 	plat_dat->clks_config = ethqos_clks_config;
-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
