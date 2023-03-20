Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B59A6C245F
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 23:17:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0ED33C6A603;
	Mon, 20 Mar 2023 22:17:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0A16C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 22:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679350627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uADkhSDU3kNDzAhx/ALq71/R+qHbMHup0NfIf4oXRRk=;
 b=bAOQ/wnAPB2pqQp9ZW/9j3a0vAI1BaIGY68qGiGTGrBezsfYSS2r5j+YDSXlKwy8yyYRXD
 hPX7pnezb8OQl9ttmSgXydBO0msx/AYy4xyuY/raGUx4WZG98BBRREp8sjcKgnkyJAWbEy
 Z7+i+lbMF0i+taVBeKXQdbk0mNh9A9I=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-SNPgYfDYN96x_IpcFgz3MQ-1; Mon, 20 Mar 2023 18:17:05 -0400
X-MC-Unique: SNPgYfDYN96x_IpcFgz3MQ-1
Received: by mail-oo1-f72.google.com with SMTP id
 r190-20020a4a37c7000000b0053b5762f31cso60473oor.22
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 15:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679350625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uADkhSDU3kNDzAhx/ALq71/R+qHbMHup0NfIf4oXRRk=;
 b=URwbnsvoULZ9pE51TA0LNJ5WufTpypb86jnb0MCN+cxyvEv88nYWHAySHYh9iqLNk9
 pgU2TBde5gOCdSJAMJ5z4qVHqWrgMSKV8CdDmljKqPeyfTgRKfjMW3dBicBAQjpQdmIm
 Jec7/f3ljulTJLbGYo3KA9yyXdl0tDa6ZVZud7QH9WGK0mZBrYpYN8CdlBO/jO0+HLI8
 4eEvyHU7QAsuHiMCAnlw0Ogb/eI+v2+bxTTN09bZVxcvMRlGV4Wulf/7YEDm960gCkDQ
 IF7cwKS5FpC7trnCc7ACG5QUI3xH1TY+aQMbsdsyV+GKmRnjp1i38HMvJBlS/gyixUaC
 ji7g==
X-Gm-Message-State: AO0yUKVc51jKj1EmV/qri5B+MCi6qBSA0nn3zmgpRbLf05BPbcAlP/7/
 IsTYkxIZmlevi64JFO8uJrBny9vUIh7W/+uUjq6KQSMofWPIhLifjlPXfZi8caxBuLaPLzERhJy
 uuNw6GNniwhSA6BuNQHmlGdnPhhtUcS7nR5pdjDh5
X-Received: by 2002:a4a:d38e:0:b0:53b:1086:7a09 with SMTP id
 i14-20020a4ad38e000000b0053b10867a09mr949149oos.3.1679350625163; 
 Mon, 20 Mar 2023 15:17:05 -0700 (PDT)
X-Google-Smtp-Source: AK7set8HeXukDtyerKLEQLIGqNPkUK2wofZTtG54Dcrc14ovssGSEI09uY51mICdr2wdiRw2g7QDRw==
X-Received: by 2002:a4a:d38e:0:b0:53b:1086:7a09 with SMTP id
 i14-20020a4ad38e000000b0053b10867a09mr949133oos.3.1679350624966; 
 Mon, 20 Mar 2023 15:17:04 -0700 (PDT)
Received: from halaney-x13s.redhat.com
 (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
 by smtp.gmail.com with ESMTPSA id
 q204-20020a4a33d5000000b0053853156b5csm4092465ooq.8.2023.03.20.15.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 15:17:04 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 20 Mar 2023 17:16:13 -0500
Message-Id: <20230320221617.236323-9-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320221617.236323-1-ahalaney@redhat.com>
References: <20230320221617.236323-1-ahalaney@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, linux@armlinux.org.uk,
 veekhee@apple.com, hisunil@quicinc.com, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org,
 Andrew Halaney <ahalaney@redhat.com>, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 agross@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
 echanude@redhat.com, mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: [Linux-stm32] [PATCH net-next v2 08/12] net: stmmac: Remove
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
