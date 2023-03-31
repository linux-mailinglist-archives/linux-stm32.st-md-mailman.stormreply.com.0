Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1996D2A24
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 23:46:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7012C6A5F2;
	Fri, 31 Mar 2023 21:46:40 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E2BFC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 21:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680299198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qACvXNoEnX2lVAx6UnLm5++0SRgSju5l/WpOwhVlX2M=;
 b=DzYDHYIINKS1s4PCVh9GSo6e7KXGCPo50auTVYs6R3yXn717W5EDDL6OvYQTMfVTjjq+pW
 PYpHKynn4TNgZJJ5h1CvI7UhPUX3tYhPNfCuQVuJqnAangWPem7ymMxSoRlbiepKeGLI0b
 LM16V35iKqRlgDNTnEa3vW6/XTS0574=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-QgHkwQRlNPOTDESfxv5yaw-1; Fri, 31 Mar 2023 17:46:32 -0400
X-MC-Unique: QgHkwQRlNPOTDESfxv5yaw-1
Received: by mail-oi1-f197.google.com with SMTP id
 i128-20020acaea86000000b003893eb09687so4516279oih.20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 14:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680299191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qACvXNoEnX2lVAx6UnLm5++0SRgSju5l/WpOwhVlX2M=;
 b=xHVjX4cr80NdS/So2sAAE1Ll17C5VT4UmkykEBcyjt16xpll5qhN5BhPzuMgazBmOh
 GIRF18jO97Lq89cybOgrmscse7cY3fTBF+zjICGuk17mj+vlRQC9ENZIPvtrIJ3MLMdi
 VpmvGjuFHNJmMV9zwwJIjJap2DXk39ImTWOXCDLxaEVoBJErhMsWriRph2d5rE3ooMVW
 z9x3fidkEecXOKNj8p0QcJu/B9gdw3oHGt3q5lM6Lyjf7UMu7USGSsG3KUulg43x6zKE
 w+rH37eHAV/FbxGdTpsk+WLwKneC2tEp/dt4AtUNKEy8BVIFl4a6SlBV3Y9vFb8Ds0RW
 7ONQ==
X-Gm-Message-State: AO0yUKWFl9lx3GoZ+f3YqcMq6RQXzE+LWKunHYkMLxKUbNpe9G3meDV3
 Pm/mcaF8pufv/7FAr2Dz/hHag/nvFgx7xK2DIidBjLWoFcuTWIVxJCYBIW7me2ThJj9ZA5Da7lM
 /ruI57cGyPMU5y0yrX7SIE/pk58Vfb1uU9fcl5TUx
X-Received: by 2002:a4a:4185:0:b0:533:c6b7:27dc with SMTP id
 x127-20020a4a4185000000b00533c6b727dcmr12902154ooa.0.1680299191480; 
 Fri, 31 Mar 2023 14:46:31 -0700 (PDT)
X-Google-Smtp-Source: AK7set822UYJHwGM7owlnRUxqK6f0CJtFjIBd5BokBFZ7cUXSCSQ9eyAJDzp0jQbAnb0TfpNiU6TyQ==
X-Received: by 2002:a4a:4185:0:b0:533:c6b7:27dc with SMTP id
 x127-20020a4a4185000000b00533c6b727dcmr12902133ooa.0.1680299191225; 
 Fri, 31 Mar 2023 14:46:31 -0700 (PDT)
Received: from halaney-x13s.attlocal.net
 (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
 by smtp.gmail.com with ESMTPSA id
 x80-20020a4a4153000000b0053d9be4be68sm1328531ooa.19.2023.03.31.14.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 14:46:30 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 31 Mar 2023 16:45:43 -0500
Message-Id: <20230331214549.756660-7-ahalaney@redhat.com>
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
Subject: [Linux-stm32] [PATCH net-next v3 06/12] net: stmmac: Fix DMA typo
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
