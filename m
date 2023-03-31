Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D03AF6D2A22
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 23:46:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 909E9C69069;
	Fri, 31 Mar 2023 21:46:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37E16C6904F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 21:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680299190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lI/wTNKANfMxYvWqJ0umcXHaHwboSDwAnj65voZzExc=;
 b=g6Sd8A7sSwezAAcFSLbYv/kO/OhXh70MZ2wI5+tg3sSVNcWqZVUs9FoLLlw3DcxbXI3XIq
 t/etMbA3rHV39ytK0lS+u9vazKrdrBl+ecZQBfN0iwGcjjr1Wrsgs+wRii/t6j5f3ZS4wY
 DyvfqrBgDMWzmweWzZNdK8iqzdJYdPY=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-5oRythVBNBOtGcMXpRj1-g-1; Fri, 31 Mar 2023 17:46:28 -0400
X-MC-Unique: 5oRythVBNBOtGcMXpRj1-g-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-17fd0d597dcso4623972fac.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 14:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680299187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lI/wTNKANfMxYvWqJ0umcXHaHwboSDwAnj65voZzExc=;
 b=VgXt1L8iKPlgg8tVgEONr3jwl0evLCYzJqImCkkkxf3lxvMclcdpI98cgTF541yQQh
 PYdAZE4FfUtEbPmZhILXuTAYYyEK+rVED1wTeJweBG66Si3nCR5jrq0RFdehhEcfVMaL
 Ze4Kv3+tXtMSWem1EWGOYTnTLB7NYS/PKB9gxnyTxSLKgdGHK+pp5vQ0L22KXPJTjPdD
 v8LpgVLOCei6KSq9Lg48xUb1WfgnED/ffcVKLhfjf3KIhP7hs4Jg4ANpHHnIawv8j+AU
 8wHDB4pZSd3zPrsfuGfqgWWh2z+8il4446ND+iad18j1lQ738BgkwfiJQ9CD0fswljAJ
 o+iQ==
X-Gm-Message-State: AO0yUKX3uCXPt7WAEQ9ZEkisd9sNWFcRimB9TrJ4IlqA/P0CF3ZY5Drh
 RKzPZto8o0xX4bp0FIykHd/vJywxr7Vad76uVqH9GXOLHELP5Idxj0E0tpmMrH6DDumXRms/kfp
 fX4F+UARrcKv1W+O3ZJDL7iu1p8gfPjl6f9TJL7Vz
X-Received: by 2002:a05:6808:4246:b0:384:41e3:75d0 with SMTP id
 dp6-20020a056808424600b0038441e375d0mr13650086oib.21.1680299187644; 
 Fri, 31 Mar 2023 14:46:27 -0700 (PDT)
X-Google-Smtp-Source: AK7set+cnC/lvq+HQYTkPySHxCv7Oqj79qtnzLha/xwBat64KUQy8cafpalczgXYXQNna9WcIF3elQ==
X-Received: by 2002:a05:6808:4246:b0:384:41e3:75d0 with SMTP id
 dp6-20020a056808424600b0038441e375d0mr13650046oib.21.1680299187462; 
 Fri, 31 Mar 2023 14:46:27 -0700 (PDT)
Received: from halaney-x13s.attlocal.net
 (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
 by smtp.gmail.com with ESMTPSA id
 x80-20020a4a4153000000b0053d9be4be68sm1328531ooa.19.2023.03.31.14.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 14:46:27 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 31 Mar 2023 16:45:42 -0500
Message-Id: <20230331214549.756660-6-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331214549.756660-1-ahalaney@redhat.com>
References: <20230331214549.756660-1-ahalaney@redhat.com>
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
Subject: [Linux-stm32] [PATCH net-next v3 05/12] net: stmmac: Remove
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

Changes since v2:
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
