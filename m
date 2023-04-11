Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6707A6DE541
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Apr 2023 22:05:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AEF6C6A60A;
	Tue, 11 Apr 2023 20:05:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D894DC6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 20:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681243503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZWIvLHTbsZUrfZPZ+ixSWYku7exrmBkFXk3jbX419Vo=;
 b=IJgFgjs0IQ+hDKluqPisLKYLzbxO29r8wYgb0O64DUtifJv4iYZZl9rtivHvoVXi/Zf6++
 Whc6IGeEDTyuuYs8Nayzp5TA/DFLMULTHrxm4j3Paeu9N6Jhcwxve8/0YVX67szjrg7ykY
 XLrsgOmQC9zjdqshdzidnOVllPAUybc=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-dHF7Qp7FN72dEwgu5HuaTw-1; Tue, 11 Apr 2023 16:05:02 -0400
X-MC-Unique: dHF7Qp7FN72dEwgu5HuaTw-1
Received: by mail-ot1-f72.google.com with SMTP id
 t23-20020a9d66d7000000b0069f913914d8so2554400otm.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 13:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681243501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZWIvLHTbsZUrfZPZ+ixSWYku7exrmBkFXk3jbX419Vo=;
 b=FzNySaQE3ZQDzXOri01H8tW2NEhV33/WNwjMj1Ddp4RNXS17/4zsRgIVnNDsC4DaVJ
 G+Qr3Fl8N97kwdWiFM5eEjWJLUEqj2+6Tt9cBKimCJYfYkHrvuvtvOyJT4Stu3uDiebB
 bHNpn0K4Ra3tkBv1CS7qD7KbcVxtEgANnDQbY1MldmNxcv3GpCanBhH2Oaxbg5QYuI+V
 nv6eHIIdWp+Zisl0SlymTGktiwiDv1HtofWXjQIxiZ8x8OapX6E7r4hUTeUUJCdYlg1E
 4oZLh/rKu1csG2nE6RefUdzb4DnT0qPof1y48wscqiKu/OHWArZjA+IWeYRXKMRjkl6l
 3QBw==
X-Gm-Message-State: AAQBX9ew/14+NihMOP6y1n383xL+FQAvuaRu0NWzhypYLxFLcGENRVd7
 86B5dJFM6OFcMuqgxxCm/6MCfegtvIiwcuQr+USf7ao5jjC2pIBZaAPUaa0Zgvze7nnMDiMHhfL
 DSJNETWpPW5KgG5ECRysOnNz7RGFAQnHOBIzGtIxq
X-Received: by 2002:a05:6808:1823:b0:38b:973a:fe71 with SMTP id
 bh35-20020a056808182300b0038b973afe71mr6409918oib.40.1681243501170; 
 Tue, 11 Apr 2023 13:05:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350b0cAvz42Qlls8WIYBkHt9iLwhpGWw1ZoYTxtNtior36S9BhWlnFImaPqwchjhbT2TqrxZ8rg==
X-Received: by 2002:a05:6808:1823:b0:38b:973a:fe71 with SMTP id
 bh35-20020a056808182300b0038b973afe71mr6409904oib.40.1681243500915; 
 Tue, 11 Apr 2023 13:05:00 -0700 (PDT)
Received: from halaney-x13s.attlocal.net
 (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a056808149400b00387764759a3sm5868545oiw.24.2023.04.11.13.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 13:05:00 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 11 Apr 2023 15:04:03 -0500
Message-Id: <20230411200409.455355-7-ahalaney@redhat.com>
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
Subject: [Linux-stm32] [PATCH net-next v4 06/12] net: stmmac: Fix DMA typo
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

DAM is supposed to be DMA. Fix it to improve readability.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v3:
    * None

Changes since v2:
    * New patch, stumbled into this typo when refactoring

 drivers/net/ethernet/stmicro/stmmac/common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 54bb072aeb2d..4ad692c4116c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -242,7 +242,7 @@ struct stmmac_safety_stats {
 
 #define SF_DMA_MODE 1		/* DMA STORE-AND-FORWARD Operation Mode */
 
-/* DAM HW feature register fields */
+/* DMA HW feature register fields */
 #define DMA_HW_FEAT_MIISEL	0x00000001	/* 10/100 Mbps Support */
 #define DMA_HW_FEAT_GMIISEL	0x00000002	/* 1000 Mbps Support */
 #define DMA_HW_FEAT_HDSEL	0x00000004	/* Half-Duplex Support */
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
