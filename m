Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5505B6DE540
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Apr 2023 22:05:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17E9AC6A60A;
	Tue, 11 Apr 2023 20:05:01 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78038C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 20:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681243498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zenMfB5Zn+UbigAKsZIPpQknObixx5MnqQjCcDXL53w=;
 b=bducVpbizCaDzJWm8M4wekFItk9AQ9e73Qpzvz+YeYJu3MQWNOx8HAbR7yoLfaqRxmUG1H
 4CPu7fuLvQxmCjbAPbJlRnL0lqhet0gtjQXSg6Wwy6vFbplHxzjm7sznuV4UYcdh6Zyh/0
 8CEIuA/h2onOhelrElkKIeKmVoQbbwo=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-duP3tCCsNfCZROEGo2IRig-1; Tue, 11 Apr 2023 16:04:55 -0400
X-MC-Unique: duP3tCCsNfCZROEGo2IRig-1
Received: by mail-ot1-f69.google.com with SMTP id
 t23-20020a9d66d7000000b0069f913914d8so2554343otm.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 13:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681243495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zenMfB5Zn+UbigAKsZIPpQknObixx5MnqQjCcDXL53w=;
 b=j5hQ4B9TZ3j3SvMI9m3Ik/WqJxgX3eE0iV93ua0Kis6Gq0Ny7WFl3XT6pKLo6YLoEG
 3nqj587n3MTuehU3m2EiBo18DcK/KcNRFd7rworFh2kz03NXN6QjKLZjIdhoS7hBU9+7
 xqEGABy/BwHY0F8TTvBmhBVHH9xb3KDXjiwvR2aanAvr6DpjMpkIWtQ27McNobPs/TaG
 kRzOkjOijpx/iqaGSasOUVuBVU8EXMUQg9r7IQr3dO5tEuHaaDLXQLeI66KAiUQjadLW
 45nqID41xdIndG+2BGT8Xztywo+5slANyhGHqDcvNwGQfnJFhTlJLYcaEd8UA8esUfXl
 LNiA==
X-Gm-Message-State: AAQBX9d5a3HuaE9Rc7EwNd2UOqRbZ0UiqxiFR9wrkGE2B5wLq0PJqSg2
 dNiihfqjoan5xXDRTEOMN9/8YSYLiGd79Zqf+JFW0mlQAVjYvIbV54Ns9fYX+aTBrUjovDBe3Nb
 cW+BAMgp/e3ewkQsH9TDxZgukYpPxyKq4686ELFp5
X-Received: by 2002:aca:1a09:0:b0:387:29c3:f0a2 with SMTP id
 a9-20020aca1a09000000b0038729c3f0a2mr4713873oia.9.1681243494810; 
 Tue, 11 Apr 2023 13:04:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z2XdmlUFC0MeVBWwPYue4CzrV/HIPiMXHL6V/DCyUF8qsQRSj5c1pDR57qf/aw++mecVdqjw==
X-Received: by 2002:aca:1a09:0:b0:387:29c3:f0a2 with SMTP id
 a9-20020aca1a09000000b0038729c3f0a2mr4713854oia.9.1681243494605; 
 Tue, 11 Apr 2023 13:04:54 -0700 (PDT)
Received: from halaney-x13s.attlocal.net
 (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a056808149400b00387764759a3sm5868545oiw.24.2023.04.11.13.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 13:04:54 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 11 Apr 2023 15:04:02 -0500
Message-Id: <20230411200409.455355-6-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411200409.455355-1-ahalaney@redhat.com>
References: <20230411200409.455355-1-ahalaney@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-stm32@st-md-mailman.stormreply.com, tee.min.tan@linux.intel.com,
 samuel@sholland.org, linux@armlinux.org.uk, jernej.skrabec@gmail.com,
 veekhee@apple.com, wens@csie.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org,
 Andrew Halaney <ahalaney@redhat.com>, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, echanude@redhat.com,
 konrad.dybcio@linaro.org, vkoul@kernel.org, hisunil@quicinc.com,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: [Linux-stm32] [PATCH net-next v4 05/12] net: stmmac: Remove
	unnecessary if statement brackets
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

The brackets are unnecessary, remove them to match the coding style
used in the kernel.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v2/v3:
    * None

Changes since v1:
    * This patch is split from the next patch since it is a logically
      different change (Andrew Lunn)

 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 21aaa2730ac8..6807c4c1a0a2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -281,9 +281,8 @@ static int stmmac_mdio_read_c22(struct mii_bus *bus, int phyaddr, int phyreg)
 	value |= (phyreg << priv->hw->mii.reg_shift) & priv->hw->mii.reg_mask;
 	value |= (priv->clk_csr << priv->hw->mii.clk_csr_shift)
 		& priv->hw->mii.clk_csr_mask;
-	if (priv->plat->has_gmac4) {
+	if (priv->plat->has_gmac4)
 		value |= MII_GMAC4_READ;
-	}
 
 	data = stmmac_mdio_read(priv, data, value);
 
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
