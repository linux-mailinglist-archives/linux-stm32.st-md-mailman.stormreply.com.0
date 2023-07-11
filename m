Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1E774F973
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 22:58:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44077C6B457;
	Tue, 11 Jul 2023 20:58:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75FFBC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 20:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689109112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CvuwAv+s14TExJvbO2C4lPkzFf4n3yORaiUFHM896h4=;
 b=BbHA4gkiSFp38W3GTh5Q6s3A/SlPSWz0A1nBZOQpymyDCFijtWTCrhHJydWyHk1xumvxIe
 vs49D6/jMg1P8RPsF8PPMzQHZNr/QGt2ANxXlHnBALHjDPWuif/JMSBSBlfee0ZkjBp0Uj
 RX5c1YaeivprvBYYGcEqA9AKa6vG4jo=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-9U11pFjdNk2-1x6efhDD5w-1; Tue, 11 Jul 2023 16:58:31 -0400
X-MC-Unique: 9U11pFjdNk2-1x6efhDD5w-1
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-565cd3f645bso4284461eaf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 13:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689109110; x=1691701110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CvuwAv+s14TExJvbO2C4lPkzFf4n3yORaiUFHM896h4=;
 b=FxaDoGH+u7unG+jolZDHSTVUA3nP0eliVwuj+q/hJUkuvt4BPNAL6AB5FCuUdg1cS1
 MOpB8C2OuvFWkLNvZIPFKu/WETo+7G3Y8R5Ktk+5pTxUxt28IYz/vnCfVdw3nSYPJR1G
 0t8Bewhfwu/8ow8EzNBBxp2yCjefItm2txri+UdKZEJJx1w1K2ItY7+47ema3FxSY20+
 8wLDcy8ANrAKvLEu1pJwKoN0/XoCRa/VTz7RgumDzykDU57kkI426gYc52RvbyY1wJKc
 M6qGG+bl3ChkHtDTqRpM0RDoKdtIHzhLo9i6gVI3dLIAfxx5Z26FFANn3MjR/I/07TPH
 wiMg==
X-Gm-Message-State: ABy/qLaKMf2yxKlQVYgQzj476c2Cdb1xEl9mTxQNuoCJzDZSVqojpU1R
 nl1DON7Tkh+D0CHCrfNwH32FLwib4QGkvjkBqKg1nb2Tca85y26wsfSHUOzrJw0Rx7JU9agDMGc
 BIHj7OHfKlXduLKBPSrnqa21KrIXys6U9+3b2iXCM
X-Received: by 2002:a05:6358:340b:b0:134:c4dc:2c4e with SMTP id
 h11-20020a056358340b00b00134c4dc2c4emr5573624rwd.23.1689109110690; 
 Tue, 11 Jul 2023 13:58:30 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEDwoVz3zRB6ah8VU/FCjuuuOvOlH20gHcWLu5haldDqXSdHnX1ggzW6h5gC9xUcPFDK+Zpxw==
X-Received: by 2002:a05:6358:340b:b0:134:c4dc:2c4e with SMTP id
 h11-20020a056358340b00b00134c4dc2c4emr5573607rwd.23.1689109110337; 
 Tue, 11 Jul 2023 13:58:30 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::22])
 by smtp.gmail.com with ESMTPSA id
 j136-20020a81928e000000b00545a08184cesm785353ywg.94.2023.07.11.13.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 13:58:30 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 11 Jul 2023 15:35:32 -0500
Message-ID: <20230711205732.364954-4-ahalaney@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711205732.364954-1-ahalaney@redhat.com>
References: <20230711205732.364954-1-ahalaney@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: vkoul@kernel.org, bhupesh.sharma@linaro.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, jsuraj@qti.qualcomm.com, davem@davemloft.net,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH RFC/RFT net-next 3/3] net: stmmac: Use the max
	frequency possible for clk_ptp_ref
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

Using the max frequency allows for the best PTP timestamping resolution,
so let's default to that.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 231152ee5a32..c9a27a71a3f4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -602,6 +602,11 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		plat->clk_ptp_ref = NULL;
 		dev_info(&pdev->dev, "PTP uses main clock\n");
 	} else {
+		/* Get the best resolution possible */
+		rc = clk_set_rate(plat->clk_ptp_ref, ULONG_MAX);
+		if (rc)
+			dev_err(&pdev->dev,
+				"Failed to set clk_ptp_ref rate: %d\n", rc);
 		plat->clk_ptp_rate = clk_get_rate(plat->clk_ptp_ref);
 		dev_dbg(&pdev->dev, "PTP rate %d\n", plat->clk_ptp_rate);
 	}
-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
