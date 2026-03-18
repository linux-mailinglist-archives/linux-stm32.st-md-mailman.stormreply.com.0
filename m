Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFLVKM6HumnSXgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 12:09:02 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 904592BA8A0
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 12:09:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5688AC8F266;
	Wed, 18 Mar 2026 11:09:02 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FA4AC8F263
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 11:09:00 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62IAi7pX008810
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 18 Mar 2026 11:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8f4wOWdkvIrOAWf4nJEx6g4vy/GU23SFx8tLsGL9aLA=; b=mIbYs81ep9WbbYOQ
 BapTIaBpEriJEWLwOZA3uIVP3HQYcHf3MkPRDl4rN+Exk8zf8Cc4I6bnKp6pb8ZX
 U5cafXU8ZLCz4aRjq+tm9GH1FqbPVpvmtheFaM1biNipilrrVuhSP17kOSUCM1pf
 n4Pwr88Y6HvJQhe92viMenlX6zmIyEuJDqfwQUMKZNP0LPK48eWsRXN33dwvIgQ0
 +CeSPgx4MiDWxnGK3Jz2j/BC5CIjj0FxxDNA1eJQHETYqoK4mAHPypyfyo71X9KU
 /dwSf7hXtCWtbi9Ic732YTwiU8AKPVGbbBOkFsCJ1JgEuYuUcxt1iQgJkRAitR1w
 nO0yzQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj502s3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 11:08:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5094741c1c1so5946181cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 04:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773832139; x=1774436939;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8f4wOWdkvIrOAWf4nJEx6g4vy/GU23SFx8tLsGL9aLA=;
 b=aPg6cLbsneiCxxcq9wWTMfzOfdcYXVqK2WzUOD4ZauxSi//aeEeOI5wRZUGMGQC9YW
 z8SRAfaef0g8MqkCDCxlWLTa3EWk9oJb+bMbEmX5k2IY9ISCw8WTWkvQWBh5J5x9mwUB
 L1MxrIqCkNFAqvEAQYYckSArz0EGOHD5/i9LcbXydSBsfocC6EOJ6HyVBWOuM07rCt2A
 i4S3GcDjNs+HcOSZ9nwHrCDoJsE3LAxcELZ0Kqfc0k6lEumqPPMr5d9ANI00t3ryMal1
 EKOgVjB/UpuqXfYqC0QeghAIIq75IdN+2U5TSx3fHqFiMfHoqoH9sItBVAAOGjbLyVRY
 53Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773832139; x=1774436939;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8f4wOWdkvIrOAWf4nJEx6g4vy/GU23SFx8tLsGL9aLA=;
 b=hAylKkzYnFs5jkUWm0Dr2GR7b0Rz8o141VK8aYZMftCUmMCj1D9KbAdmTbtrHYX2gP
 oYUYqQOhcAwKbBeMgWymoxWxkq/Euh8vurbT1NNBuquHXiWcGWwnuEjBc0WJgMQjuYCz
 kBe7wGGSA0+XLpLz+tnfVAqPZGQoGrTPx4v38lA0ctQ5qMOJjmEbLhTUFvJekjxeV7j2
 hPnwYy2z43b+W92m9SIFy4QSQHVtRjFeYGualTtayIyTYPlEMfkeGkxLtk5gjXlYHwAd
 EtE7QY1Yr2LD2oZI1q8q2sE3FcG4pLsxNwT+BRUnVb8oY967nyS77rFksFLMLG7JZ52a
 rCPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmxKfjN5F6biygHMac+gubI6HKLUaj+6D4/unehFBfwAB24jfo8Jl9QwiXX+oxlhT/EVYYzmoRtU+qAQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwV0h9xhZDhLaefa0qdUC45N41msuCXHr39LaXrDigM8pbleNIl
 ErQBH21lPkWkdJE7Hfte04wFG5WQ4yDoW73Tjy3+gRvYfLjNmAFhw8+N2impECOSmSZ6LC/ODcF
 P6PWGFtfYHKpMuEKU02nVcGMzk9Dvjm7JXuu/VUZSjo79ogoVNn3K3kKDzttjSb/qk+E6u3MV/s
 dXr9hjkYA=
X-Gm-Gg: ATEYQzzorVOsItTfWyLR2FblUrhgAliUu3FQRx4TOtKGh92Yabfge8BxwV0DRYYNr0d
 BWflPQO45644dAtMEXSn0aUg5ZurYhjmvSTOIFETDKW3+0pZMv9JOWXaBZIgNEwafCvYDoxIjyF
 wcaLa5eDBJZc6aQke8FAcVFU2EaOKnnCc1CJZZAmRjoQwx+i+zdHIsQA7AVzt8s/Lp2o9ww8c8j
 JHVYOfhKlfAt6obISxkZW3PpYSCOwuR9t8toai4EnIZHiUKEFHHBVfEnHRGlTRWIxvs/24StVxM
 Dy7OVb0Cfon+bzYtsBakj/PcXzwrO5RWrgwSehfaFTBBRXwaoE2oOvhD+5/uZCFBpKXHmnbRcW3
 qH9nWYahareJBR0AjHXSDzykLZ1r3G3gy4HaucRhiCoR7
X-Received: by 2002:ac8:7c42:0:b0:509:3c33:9d25 with SMTP id
 d75a77b69052e-50b1477e302mr36059261cf.15.1773832139152; 
 Wed, 18 Mar 2026 04:08:59 -0700 (PDT)
X-Received: by 2002:ac8:7c42:0:b0:509:3c33:9d25 with SMTP id
 d75a77b69052e-50b1477e302mr36058361cf.15.1773832138604; 
 Wed, 18 Mar 2026 04:08:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 04:08:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:08:44 +0100
MIME-Version: 1.0
Message-Id: <20260318-clk-qcom-headers-v1-5-d5c6a3b11b67@oss.qualcomm.com>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7vmfmVTf1sjmsQtQiKvutgOgGxTZ7kdgXKEyXYC7s4g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe+N33ivwaWe6BXKCojvQtemLpM2oysrGfqs
 SGMVzmXDy6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHvgAKCRDBN2bmhouD
 11E9D/9X0bFqIQ0WUbs/0t6VOpmqg60At5JzdaQHV/nDaIdSLauMo/g8yEnoHKHhSWttJSl543e
 SkftcPjGYwt8d6vaFS7F+Md/n+ElnK7CXvwUOuP5BkZ0CnegvxkLOSrxnwka4gRcQPMZ1o7WZdi
 v4Mu6Z38qPc3DGLA5tLddd1zAUfoefkMNuVGsrIJlD1uRVjiNwlf5mazLxNdcuPmXvJULvRRjMS
 mmqkqjK8LneHUE/lVMo1rhhz7WGvhVgdcPoUnW5LLjnBxW0skHqF2/HvmlR/VHKkWLBwTkr6SWk
 dGVFLOyzV4+BHdVBWWnu51l+KGB1zhyNrb1rbXRtzCavk91zPVuU/aKkYaocvvSWOVBpHmFw0R0
 wOiR12Z5Rg02yFsEaO3Swa6sWu78jXdppkKIqYzkpPmkmKi0dcepVWE+nVReVm10tahEyO4rPoX
 wp6Gko3nWLsYGssJNiplPknAvkmW5xxFacsco4i3Qm0+lraVuPgDgZ2n3y1o+Y84Up/wrpQ122r
 dDj2+SYF8nnjFFRhTzsEHSWUS+gB8SynYItA9vqQdMqVXQxvDI6Yka/Df7hDl6B2xdRjzCBo+rP
 TR++V1c9me6Cjc/awkLQg7iRQFuOF76zqAz+FFFfbL6OI72pWhrV9U/ZpalblFpGp5Lba0c8Bv3
 x9syeqq9RIHeeTQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfX6BbKOUMD3ezC
 zW0FKLQUIIGdi7uLhDYC2fFxmCqeOFeLnx5KToEFWR1/lAY5EMT+y7y3L+D4W+NrDtICMae/82P
 LmfzOFLe5ZMGbVBQ4EPNxlcy5Gm2Xhkl4kDaCEkfZ8SOSFy7ed/9pnIusCGzlv9Aeag4qJgbZbE
 IohU0mXNbIJuNDGZ4K7r0NDn7TuNVREfRo0BPpD4QaKRj4jGQDijjyX9Cm+JGt4cCA6xzI4OmD7
 tzcM8AEiJETYwZb0rL713zw/l2zsoHEs/m/ofIaLwth/LNUQ+TnkiJ1U935R08Uomm9X7BI/ok6
 n3LpgZP2Fsm2RMHX/5zOlrYQOStd1UzGToGywGGgwUGfkZWfjnDVs1O25rzVGPKPw4CgWk+4hqj
 dzldWsfoagdd2MQ49bxhN4dcqsGjgsG4TkjowgAghzs5TIWaF0QeV6bwjeE4m8cPfBEn0N4qxba
 pqueztD9HrIGHz380fA==
X-Proofpoint-ORIG-GUID: 3KyeY8_JEDGGe6DJNkGPzzB0o6QiJmVD
X-Proofpoint-GUID: 3KyeY8_JEDGGe6DJNkGPzzB0o6QiJmVD
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69ba87cb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2pKPMeBpY-3N91LQmWcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180094
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/5] clk: qcom: eliza: Cleanup redundant
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
	NEURAL_HAM(-0.00)[-0.656];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 904592BA8A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove unused header includes - drivers do not use any OF API.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-eliza.c    | 1 -
 drivers/clk/qcom/tcsrcc-eliza.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
index eeec4ebdd5c2..06ee1469badd 100644
--- a/drivers/clk/qcom/gcc-eliza.c
+++ b/drivers/clk/qcom/gcc-eliza.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/tcsrcc-eliza.c b/drivers/clk/qcom/tcsrcc-eliza.c
index ef9b6393f57e..5a47a4c77cb5 100644
--- a/drivers/clk/qcom/tcsrcc-eliza.c
+++ b/drivers/clk/qcom/tcsrcc-eliza.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
