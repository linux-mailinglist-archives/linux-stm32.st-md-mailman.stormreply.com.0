Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMU7IMqHumnSXgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 12:08:58 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEE02BA891
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 12:08:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31BDCC8F263;
	Wed, 18 Mar 2026 11:08:58 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F8E2C8F262
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 11:08:57 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62I9DZ2H2730128
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 18 Mar 2026 11:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xxuF0A8lhlStGRLI4TU+YRZI01nCSaQ/oekeKcjZoXU=; b=TBpsbjZSx59FY0/u
 9lwU+bB1Dk9HqfJFUnlqQ8QoJNQIDRpoRyLfk++jBL15f5sSx/MJGC36P7ibfPSU
 duV3tKdpOqTZ7NfZzhapjK2qJb6fwIt8KgGorPT0j0LOwWxcSiT6v48Rn6/ueD1O
 tgywJttb4rSfYWqi3HZwZ80+YDnu3DGo2L0oHNRRctcrFYphkiamAN15LZAiMlMe
 nE8uQNdVnk1sH2w/6oKhOZqvHQGcwnU4scC3UZPV1ubp+NA9p0sEOz6zEYtUDd/a
 VRYEBtkbkyGL10v98zFQxxNmZyjBbtkh1fR4DfkSbA7iFBv+SL+3algykmIHVnpL
 GCtOxw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjvhbn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 11:08:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5093787e2fdso984497951cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 04:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773832135; x=1774436935;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xxuF0A8lhlStGRLI4TU+YRZI01nCSaQ/oekeKcjZoXU=;
 b=gmqKGlIPhUQ2+FvYXi1PjOFlU2pdpXsS75/BBzSCi/AhwWPh81C+b1Ha40Dy8zAnv5
 7hSPPI5Ct8lMVUQAE8QgXGNGqQBGsVC3GY5STpjbeY8qfHpMISZQ1W5chfMkE1pmf0d5
 XMj9sz1vF3y38WPFCl/TUFqM+WGOx2woT7DVJU0NbkHzGyhE4Zyi+8TxJC1BZAlMtZAu
 HGTuvIHUhLP5m52DvXF0LthDA/EOdUfW/2x83qwdhVsE7dQWgmNXMgIHRmcJe+xlKuJ6
 XXwfJkJmLSs/pae0scOXGm0/mHCM4X+3oLJ/yzTTJOP08s+ILiaQdaV3LAGYk9K7aXVA
 SKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773832135; x=1774436935;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xxuF0A8lhlStGRLI4TU+YRZI01nCSaQ/oekeKcjZoXU=;
 b=T6uAyd0kazMDCpxNz32gkwMyu3FoPQHxt2GUHPL86ZLQ0zg8uYLnTI8seKRuqwoV/V
 +nrCWHkL4bL7Nz5wnvHhmmH5JvvTaG9PabIlRzAtCujCxNoxdjchu0TUi6kZhDtNnHLY
 3YA/EjLTXXu5DepQ+3umZ9r4ZiYFI04P/HRtQtgHGzAgtbVPjcg00kGTjunajK0PYBhZ
 Ei4+RUx7/obRGlGT0FGoxKt3sAx7DSKR1VOOw1cP8b+kwQYek5oqMFVkXN1NuGLlku09
 uYM0adcdGAI+zv11Xw4+oSIGSY3NVr/MxdXkXz7OqbBYawEt6bEnnJKAHGQumpmmp1Rr
 Zx+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1I1wr+04Roqpr+ow98l4ybo05E1b3YQV6ZlCI4EUqd1s5G6m0wfVDkDChSg/+MkIuy8Qa+FJYEPHbpw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw5P/F5/XvVCn18f66CgFdI6pb1J8TjPuhpukuatXYYUQCDWWPa
 Bvhb/m70l0L1e3bOVDUiMxpS+OUKc6L/qpFYWoBJpJcSvZR7Y6VznEsoilcyp4gb/eWIF5EGBMv
 +f1aFOmVdGL9ANwWa2YBf0CNoSY5vpkhWGnm2IFLUNTHLDuOyPs/CxN35GXGzGf+1OupwtZ0Inf
 B5BM8+EKo=
X-Gm-Gg: ATEYQzzg/zMO2C0GDYSNEnfcUvC1A3OM4FlrZqLazBVaEviJ1ozHH7gowoJ2X/G3R4a
 YyO6ePg1AS6JqftjOZdz22SPUMtPuI7Dqetocl9MObeXJ2ygD6b0M16hyCBpo/bnz+URvvbIo/V
 J10gfbO4pU6q8P8/RiRFtA7YbZJwnUBDuYRbb6E4T5FoJ9XmeyTrA8AS1agMzpeojBtxJqygB9z
 b4oR3/DmCG2u/EUsg4bH6xenW517jOp/RoA9It+yJCGQKEMDuoCOnv8kkK1DcqkH/Q+OOSfqpQk
 kW+hoyosRhBCduHEGgPMxwYeyWLVTPuapCqPG9GFN97qmrnefiolcJ4qyxReKIR421uhqd9SGFu
 jrOR6K5LnP/rASHbb3qWjHdBBKkAs0EnM6SzKK7p8KczP
X-Received: by 2002:ac8:7dc2:0:b0:509:2efa:f054 with SMTP id
 d75a77b69052e-50b148b588bmr34689161cf.60.1773832135292; 
 Wed, 18 Mar 2026 04:08:55 -0700 (PDT)
X-Received: by 2002:ac8:7dc2:0:b0:509:2efa:f054 with SMTP id
 d75a77b69052e-50b148b588bmr34688621cf.60.1773832134757; 
 Wed, 18 Mar 2026 04:08:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 04:08:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:08:42 +0100
MIME-Version: 1.0
Message-Id: <20260318-clk-qcom-headers-v1-3-d5c6a3b11b67@oss.qualcomm.com>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1224;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rwd+fdD+sjWN3bjprGZY/SteXlcdMNP4NDxbH5slEHA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe8EOeRZLJaD7GgO6dv0KuniqRRyymTla7vh
 JTqjRW4usOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHvAAKCRDBN2bmhouD
 14sgD/9622J1xmbx/NPB8y+YfXK2DT8IpBi8tjYWPpNqXKCpfTO/RdFRwwCnCR1f7nekFuxhRcp
 3K+Vcd2wPOqKMfPsM8rsaSPsXaE/6GavEiBIiNedsVosrjpqZhvTQQoAfbiKgsRbUiMVIkYmQPm
 ekWpQ7DNPFAvoT9KHrLK34jLFJa0sBbjKsX7jwBfwlp8Bz0BVk+4LOYl7YqHrGjGYhaXl1M2Bbb
 ONDUfhSw+21vS1NbmfUM0TctuhCH2IOFTRDfulOhX5VS/La/5Dl1/99Zx1kXSUZ3d7eeUSBhUA1
 i0E8OTCrSXHIK+Mixth4vRvoGeF8g2Udvye8CPMXJlCGfFKlCMPJrVGj9YLYlm9VntTFIIl+JA2
 isXpztQcCBiafjhPol+VAhUbP4qZ1QL/V58Yy+pNkNPSr7h2C2ymme7gywfImhpZuVVcNBXnMO6
 vkgI+mv2ya1mUPNjBqLifviR6XUOFGB5KL/FfScVUGqRTlREvzYrUNEtDiPF78qM/JZ388esGz4
 PLB/B1OxCDdZIhevE7mL/9zfSvG0T+j/xoFVNLucXezbc3VkL2ZOtnr72YsQ4MG/KTPthSbH1oz
 Fi6FZBhAEb/Ci96N2/YGEd0wxDWenbEbGI0oXCc7OKvrprdLPtCNwtmPHoXnIesZx3v7+wY+lya
 aW5An99GP7lXqyg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfXwJsoLoeAxps3
 UVSBgH9Z+YIsiZ4a2h7Ziby46l/n/ISQQstQGuYjVhvsrgMM84LNpvtlM5TwcJxmzchnvBUNK2M
 E3BFm/GBFA/ISSDIJAWeDyqx3kA/jBXgERkdM9vPltQAq5dQZ8bnKrafirGvVnA3PWCExn1GJqC
 9pV1Xo6Ea5PrUAVdTAY7giMZyyQ/Obfu/LsDAtkcpRqzeH5oMBVSus+BgfP75mcXfbzXga/ZZX9
 vwpk/L+nGnRKsVn0YGDgWX3MARLdn9+a8gZ4/Rwr7ppU6IhmpfPidiOoKp/oMxd2n7GPBKMav7F
 e2Rs5NU+7WJTESCDD+cTneTCQZZWoavQ46gTJE2QYYY5v6zXlcCvz648AVs84am7Li1aUCHYhUr
 zpzahZLCB8DYF7in9l8GLS9i34pPuBsykm4vXF7aiWhdmQHGIL+4bxApvQirVq0oaTOPp3uMcRe
 +kkkx0MyCmam6yoyhkg==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69ba87c7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=J5YPY8RFlEepJke0YncA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: vE81AvUuaTo2AHDrMpPmBrVqIDz2b-TM
X-Proofpoint-GUID: vE81AvUuaTo2AHDrMpPmBrVqIDz2b-TM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180094
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/5] clk: qcom: sm8750: Cleanup redundant
	header includes
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.684];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 6CEE02BA891
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove unused header includes - drivers do not use any OF or runtime PM
API, but they need declaration of of_device_id table.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-sm8750.c  | 2 +-
 drivers/clk/qcom/videocc-sm8750.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-sm8750.c b/drivers/clk/qcom/tcsrcc-sm8750.c
index 242e320986ef..46af98760197 100644
--- a/drivers/clk/qcom/tcsrcc-sm8750.c
+++ b/drivers/clk/qcom/tcsrcc-sm8750.c
@@ -4,8 +4,8 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/videocc-sm8750.c b/drivers/clk/qcom/videocc-sm8750.c
index 823aca2bdd34..5c1034dd5f57 100644
--- a/drivers/clk/qcom/videocc-sm8750.c
+++ b/drivers/clk/qcom/videocc-sm8750.c
@@ -7,7 +7,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,sm8750-videocc.h>

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
