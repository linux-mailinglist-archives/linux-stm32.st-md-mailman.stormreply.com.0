Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Dk/GcmHumnSXgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 12:08:57 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA5A2BA883
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 12:08:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BCCBC87ED2;
	Wed, 18 Mar 2026 11:08:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C0D8C87ECE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 11:08:55 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62I8spUp2730120
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 18 Mar 2026 11:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 brkBtSGLCz567cyJaMhUFUxm/AcccgNYRIMrR63I6Wo=; b=fPbHMay0Jir2ng62
 tdJZNm1JE8iGWPoNZl07UqAih8B9Q/6vNEOzw0JFfqoZJd2lFpVWHTN/1yJ+7iGf
 eiJWMCIvhKWf5wwT6CLNhEnifTHmDJLi2h0xcxkr0+zZ4BVufUPYo+p3pdPMnqYy
 BfomCmvFtt20ENF3AvtgPr49PuT+KgbS3EF5w/R9ahYrULKvaca2m0zcKTqAjFne
 1xCcmRXHafS/wGZADMYPJLSWDBxrW8ukXkB++e/5DtY64gfXnHEpLigyKOZL1Rvt
 6u/adY7Dh37SVAGGpRybB3Nz1thMgVlj712OI3zEIbuYnFs1e2xreHMmQmp9n2gO
 ue4khw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjvhbh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 11:08:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-509181cc6ebso18201151cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 04:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773832133; x=1774436933;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=brkBtSGLCz567cyJaMhUFUxm/AcccgNYRIMrR63I6Wo=;
 b=Q92YFWuecvF510rd1xhFu2Dv4osttmgyKy6Ucla9KTHYhQ2DBdSyDT33o1qRPFvR/t
 GzvTIpM/FtxjZALC6SeLt8iJsM6MhIHwhkNbynME3w5iTR3NsNlWYeA7lTCBnrFQBSdl
 t3dXzemawgACIJ+DJp0YKbr37qQ0+QR+qfqWFWC51WEnTgssoVksJghBxGtuI4HZbOTB
 kSyTkO815bx/GDr2feUEGP8E+zd7WErKLsy+j6xijPmIj6OyAMNZ4502dV81zoBac0IL
 R511pOLnEuqkEU+9G0/7N8vJDLI0pMev9jv2pe9baau7JWrpC811GTYwCoen8wlVqUYn
 aMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773832133; x=1774436933;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=brkBtSGLCz567cyJaMhUFUxm/AcccgNYRIMrR63I6Wo=;
 b=kdsg+Ibtw3+h6mNzNv8PxIBiep7HEnlfrr2+XJDRa7QJYJZWeH0mVEqhiM9FMaRxBY
 o6Ed1Vgj0znwLlueEcgGOjDRj4wDx3867M7HNuFBnUKt1UBGjj/G9bSnkkMJaVk4sBPT
 R3O7fzw8EjyztS162jfBn+q5dWnHIcwycQtFzH3Wd4ZT8xFCO2nf9JG9+671kIO8SWBH
 TcOLoQj68C7SCt15jn+HPW2vI3GBw3YjDBXCxOdkSim5R/oq5kWlNzRw8Fe9djNu/rT2
 o3Qm5XN16aM9QVnTBsqagWgAPzILgQD9tj8s6rKWwkWHd9O2hC8Qw0cGH9FyvlebhINZ
 NSig==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3F/CadgxpHsnZf5kFIMb2raApYNQ2pjjf3hVTqIQcQUTJv0N+xkod1SEOWNNCxyD2TdZK5obVrfsVOA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwzqcwiApDBEQdK4MqPMNlNncSTTzI8rlmVukVbbaGU+nxANTmr
 PdIbYo24THLCcnd50spQZ99RMOlO0iPpioM5VCz6ZSzCUAflgUyLWIkTInCjPVMoNbLBVQiHfCc
 6u2AKRNLLBoRWN3//HRzhzSUECMADZcsb1YRKTspxCn7guGkPeo5PqxZRIC8oeZ4E+9hVb7CoTF
 1aOYKTm/k=
X-Gm-Gg: ATEYQzy3YXdC2ZgcEzbhquv4bwX/UBYmHi5tHCuPkli5vWNiTmld5t8vnC4RuxaUFVG
 u6bitrOI8Fk9qVKH3Ns7gAwd3hUsqTuOnGbVbwxWN08MJtWWpz/qYsdPPXcsNPIR2t/RS95er63
 J4odA99If3yCsS2qFJKfAw8RDZQG0mr4SlkRnm4Ti10ElFmnpTKLlCvI3PonZcxeul1WsPhKpbF
 FoTsaI2RghDFBVTRur6lCzyYUAudPUL3jbg9jlBhP10B/I87Lpc60bVkAMXQBaghJJ7dCK3iCLz
 ItZpaxIccZ37hoJ3dN+iXO/f8ZbjGnIiJe5UcbsPp1PLqt0Yk41SAfBFuE0aHI9TyN5vLVDIXqM
 hVr8oOKxO69f+ROgxBNOs9+g3lbZSFVCHwvY61WwZYXPl
X-Received: by 2002:a05:622a:1b89:b0:509:882:9e7a with SMTP id
 d75a77b69052e-50b148bd94fmr31893521cf.70.1773832133453; 
 Wed, 18 Mar 2026 04:08:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1b89:b0:509:882:9e7a with SMTP id
 d75a77b69052e-50b148bd94fmr31893221cf.70.1773832132970; 
 Wed, 18 Mar 2026 04:08:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 04:08:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:08:41 +0100
MIME-Version: 1.0
Message-Id: <20260318-clk-qcom-headers-v1-2-d5c6a3b11b67@oss.qualcomm.com>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2550;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rwJ0s/faRqzjl1Gjd8c7YLwvyl8TT+CqHt9K4WZTzss=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe7tb3T1F//ePKnz2ZNSrG63JhuojRWfgyba
 or99fgohWGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHuwAKCRDBN2bmhouD
 15UyD/49o6xfpTW6OMtLVORG4Cq9Xen7SuTGalwr3Vpq02B62ezBLlRAtyMq8BKdosAfA92c87P
 ta0VJcgivQwTCE1kxLCsneYl8QGsrKOCBi1TRKXmcPHa2uQBTIl9SNK+LXbMzyxNPsaU+3xUx1l
 SzJeqAWeFgDddRWFfWJIOwwRMCHENdv8YmCIl1BozuvmtnSYarpJqYcOTwoE44FOeZ8kMGs2WrC
 b7FjNgta6idYoOCD/oS0uro98YEdnlq67AGUgyIr/3MQzcYymZqnEzr8fUTMduiiO8vWCSRHsNN
 UO1mgHIoIQOg4tZBSz8sU3Fm8TqNxEEIfTIKwUCJ1vJXX/Am3isOhlub4pTIjAyjuE+UipXl/x1
 923raUkaN5hKPSOKdCkWN9gtYqCvNuiNeClQWI1KIhmZCP8IeqOGTGCnEJbCXF0zHJBe0XPPxie
 IWuOY1eNb2oNQXwQwjH4z16Ej2BxhVX3llfkxFAM9PDbrgVbRfG7jSG3jJINU70rqAMxhctfPsR
 Gey8JKvidAKoTwLbSCm1EppQ4DrAK0YfLaju8sBmT36Gqnj1OxulLUvzUU64efzk+4ZXWvS05NG
 Al2EFC21I9lopynMLUm0xFMC9WS7Pm+CctgxpJfSv4ZJMaMcg0qESs9Ds7NSuB9CHoDGy2iStjF
 518b+5RVX852DmQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfXzkBcJmrbHb9o
 ctbwi1qs2bWOTS0//dJD/Djg9jTc+0DGJpkcp9nFHrh8+cVoaxYLT5uSGlPIZMv9Sw6DW6/YPrP
 wS1p2BmB4TR9iCksNQsbhssnuWhf2clEdGYj4aUvx3NQ+2YsllmZqrfEzNxa2NQ0yTgrScrFt1F
 XsZb//6+QIvHE5OcO5xD81Hw25IW2/UoM85Zoa0bfH6BGnl2DIDyP6eYLpExAGdBY7wGON5Ti1b
 3fbqKmCmO6julVItTLHpU4Cqfrmsy+jI/z+iZlVV2Iam4oNl9nJdqKLmaSfUWfsRgojpuZJOCPm
 8OSpwRnrGz/82fyJHE0n5hPfJsw7pajQi9GYrP3GeveYh0sAsefuK+scS4jHMKiJB3h1eLd4BqV
 Hw88rsPDn8kicFQizTXys8JcDU0Bh+h1/4T/iv22GG73iohkcQxY8UWezuhxcrdbWaIF1L8jsjU
 Ig5vboa/BKGzDIVuc8g==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69ba87c6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=n9SAOWaOJGgEd7NqaGEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: BROTPrPTGZtUmV7doKSryVHPTZTl-cwx
X-Proofpoint-GUID: BROTPrPTGZtUmV7doKSryVHPTZTl-cwx
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
Subject: [Linux-stm32] [PATCH 2/5] clk: qcom: glymur: Cleanup redundant
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
	NEURAL_HAM(-0.00)[-0.692];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 4DA5A2BA883
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove unused header includes - drivers do not use any OF or runtime PM
API.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-glymur.c  | 2 --
 drivers/clk/qcom/gcc-glymur.c     | 1 -
 drivers/clk/qcom/gpucc-glymur.c   | 1 -
 drivers/clk/qcom/tcsrcc-glymur.c  | 1 -
 drivers/clk/qcom/videocc-glymur.c | 1 -
 5 files changed, 6 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
index a8c3cbf591d1..fd085cb90667 100644
--- a/drivers/clk/qcom/dispcc-glymur.c
+++ b/drivers/clk/qcom/dispcc-glymur.c
@@ -6,9 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,glymur-dispcc.h>
diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 0f3981252a68..1a5d3d182705 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/gpucc-glymur.c b/drivers/clk/qcom/gpucc-glymur.c
index 2617de0cb1c9..1a1d946347d0 100644
--- a/drivers/clk/qcom/gpucc-glymur.c
+++ b/drivers/clk/qcom/gpucc-glymur.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index 9d9621a61072..9c0edebcdbb1 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/videocc-glymur.c b/drivers/clk/qcom/videocc-glymur.c
index 5dea01f9e20d..bb3aae6b8396 100644
--- a/drivers/clk/qcom/videocc-glymur.c
+++ b/drivers/clk/qcom/videocc-glymur.c
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
