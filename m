Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CB3aLcyHumnSXgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 12:09:00 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C70D2BA899
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 12:09:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44156C8F262;
	Wed, 18 Mar 2026 11:09:00 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93B20C87ED2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 11:08:59 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62I96oxf402541
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 18 Mar 2026 11:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0PjbE43U45ekaiKlhEpJ+BxmCsrp4DUyy7FOKAt/8M4=; b=TdW5sT7azmyOXmDa
 YF7IKYmMUXhW1FA/DfvlvKTEiYyKWmsmL7+EUHq2UZQY11wc0wYjwB7Jq8NSmA8y
 Q2eIuEtCbpAjWxMgdAmfO5B1YVbaJN8MB/TRujfEa1TLuvF5WrrTz0CO1zQYDb2Z
 747OGpGQkuBSFGTkWhO9t+DNnoRtOnCe6TPpgZBf6A2GOmY4+ELxOxxgOKR9iosL
 xBYfyWcch1uOykkY66OQFLPJe/i8dS4LpPlreMCQ12W3L1ccgWS9aJwMC+b5EmsP
 8mKuckiOj0reACKzC1hHcQKKJ05CGg4aVBnks4L0PwGaukV/8dpZ9w6mG0ktm5nn
 Y0uZ9A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4duetn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 11:08:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5093b92f327so59036811cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 04:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773832137; x=1774436937;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0PjbE43U45ekaiKlhEpJ+BxmCsrp4DUyy7FOKAt/8M4=;
 b=khpMSk68a8FXrTcdiE0/kzesw+EZ4K+nEd0KP73cRizl7oMcrJ/rqdfaaetsbE8Hvx
 iYyaKhd5+W2gro7jz1SIhisKhLyDiWC9dwvkjpS1hsSSY7gTAkihi97IJOCf6vjAqf5s
 vaqDUHXX0CrsJccFfmjagQMjUdkCqU2E/o1WKXiD5oOjAhjamwZp2l7R9MdNJron3SkG
 AgajEAAHoTWJVovSyWnGGP9ntQeSji3d1WnVs/KhRjqqXhkQrn5LRmGm3E1YbdyUTFRZ
 SBowI7bFkxWTQw6yGoblKCmkOWAaXOpxBKibCZ7AgyUawS9c9eQNvQVEfVrZdPQvkQOX
 /BZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773832137; x=1774436937;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0PjbE43U45ekaiKlhEpJ+BxmCsrp4DUyy7FOKAt/8M4=;
 b=Wl1BwC2hfPcZ35mQgpLAir6y7kQN0BPKPXrayBBs2oo5a48YBHSIx5km1HS+c3zJGX
 pq7UvOEjh6pC044v9wbPqIv6Ja/ZdSvyK6XTRhMpIuKU9bA/IRyOiYpltjyFpPfPVd3E
 sWUhdV6wpiYPLzrq0QKL6pwM6KGi04f2+FhnEm/LYr5Ul5zVCKjes6S2krR99pgzSpdo
 yhXbXjbeUMuUv19QQc59WA4ZgoDs7rlg6ebYceOpYowit599ylKP64M8C748GW9o/Nyq
 nIp/gre4Nttn/walivm5XPbc0zdx/+GQgZPNhIE9qjHd+rFBnUJ3tNrzVFcME9OoJd+O
 07Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZJUZ3omFzMuE+8mi4FHDsQCE3w6ZKfSMZADb3KZ7QghlcLKEMxlkRZclLiMIVybOliFugcSYRsOlIHg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyGtW3Ycjzde8hQ9PT+py7O2ABzKpkbzwfv3G/Dpr0Y8ChoaL2X
 hZlKF5Yxso0nwztM/qcm8EC6iwPgI0PNGrzD5HE+S64h1kIJunNnhHdUCVHmQr/hcdOEJH2Vvny
 mT8Fz+M5dmRCPhfWj8fGOio5Dn99Lhd+Ybw+5OO5cTt+ebxnf5jH//jsanY9IDlH1eNpb1JjVau
 4ACKieoH8JnJ7zrXU=
X-Gm-Gg: ATEYQzx1ISfwmoFwyBUK7SfkfSlCCVz0zJdpQ2s5+mMZQs0kdwUhmU0tUNl0PmlBUps
 9KJEhgnntNVNG4ib0bFoJBPGHupsFzDnx8BSADP3vF6VraswgRNwg28A+2cuUrEmca9MpM29dnj
 C5YnStxhMsACcDeKU0BKg4ZsrPAFTuQ6yCOMtW7bQINHN8EgLZ+9qUI1rzeRG2UyJ0RFQ0VNlIW
 6xAiU8m+lmU8LKGCpWUpBS09vvRCUhXLTiVS3qMIJDpJikRcwYakBuJ54EqCVdV0TtiW2KjdAGc
 aLIrwPRiDK316BQY84B2yHXK9fHnlxw6YkN6q7LvYW15HbRSQMrzYLjtKFLOx7gi2Bm2qKEUHxv
 gRPM0SaAiIMRJRE63n4Nu00AKcgPgbKWjWc9GDVghitfh
X-Received: by 2002:ac8:7f49:0:b0:508:ff9c:b9b6 with SMTP id
 d75a77b69052e-50b1479780bmr35543821cf.19.1773832137219; 
 Wed, 18 Mar 2026 04:08:57 -0700 (PDT)
X-Received: by 2002:ac8:7f49:0:b0:508:ff9c:b9b6 with SMTP id
 d75a77b69052e-50b1479780bmr35543471cf.19.1773832136760; 
 Wed, 18 Mar 2026 04:08:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 04:08:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:08:43 +0100
MIME-Version: 1.0
Message-Id: <20260318-clk-qcom-headers-v1-4-d5c6a3b11b67@oss.qualcomm.com>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=880;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1ljK/bO9o6mZ4HLRc+18Ogbkuf5uNqqxM034sgMWf2w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe93mjmetZrRPgAsC5Qc+kQAHIvszCOM8P/L
 6mnrmwA8J2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHvQAKCRDBN2bmhouD
 12fMD/9bLyR+bZvWFZSQ/S6LHSPwdk4KMMNlO1F1BzFb+oOME9LshAEoe/gSJ4B4XvSPdXpw3Uk
 oeEiaBPOmOTdkEWzIECpYhuqlLLOaMXqITAG82xydt10Xn+MXTjTZAHVHYy9V7EbE6D6FhYYDha
 hxCV8dGGd3PFoDoY4qZAAqSerC2OmXSQi6pqmaiIirIPLdRerTUUNkf/J11lUp5G/aQVdoNf4/I
 BEyKc2gP7d8Ga+zysmNcKbRNcvmirv+NS9brtDzv6zja5QGrF5PTNmzcjPc6UTOuJOPPiEuNboi
 lxmjQPQkECLjLyaxR5YNrOXzK6CAOTFBaO30OZc1nGVj7f4pGvb3jbGtgjej8pheq7SZzXiOJl6
 lwN3+61POKTFMqFcyu6JDUa5Tz2NEnuw2JsqwjRTqCh4bbXmhl9tT5V9gm0zklhqO7wAIpSYBS4
 9D6R9RG3lQzzhiT4ZyKobMQ++xFUalF6hkkXDyInCJJ7A/Uqu+KU36SDwk4XY0htlAX5E+4+RYe
 +BxGiO+mQl+M8eM+wcSMx2CXEoZj5XDiJm7Y6VXqXCrs1pdy24DO+pA4sXEF020o+YvLmIhqaWp
 xExTZWN5d8fkx7ouLveJpWU1nCA4z6ncvsMMloVwME+tUt947bVeYZsRif6mbniZer5qfN4Fuwq
 0DIUVdrEZ0Z2biQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfX+aUtVgKdqGMp
 awz8+2nPLszZVnjC6CReF/Q+HWp6yuNjlPRpOaFM3kS5xPmpFeKEuJMfkYq6GWNhqfZDmpf3Zh0
 2Pw7MrtzMPKkfFUhY3+s5/P7XAyzjD2bumsOCFdA1YdJCvkqV91wqFS8vF9Hueo6drhCzfBVUYE
 vnow9erTtknf3IBgiF5Hr5JaE5iF+kpS6lDeJs0gbXc02FncPGwDQU2VaGVBKQw0pJmwkNXUb3+
 ZGX83KUn7QRkcG0M7zrQJ8MgxqI2rXe2TunLvJUGJNMFQ/pmgsvuHk09MCM05mFoUYlWbJq26bw
 AX2Bx8TTSFlZCUk87iqyToB9o6mQhFZ0zMzzPvNaZaKqPoPt5u0OJJV4w4t0VEDJpzYaQDmWlQ7
 vHvG1JG+kxC1YV7/VjPOamy3YMgc/yVIasY9sMCvHD4jD3sveeou+TeP6rtVNCQF1z29oQ0tSEJ
 Z+gKdxfyBgR8bY+suJg==
X-Proofpoint-GUID: c5Q55GLDwqsWNP90Zv4OBz-ylXVypxqn
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69ba87ca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=7lwp6ARP5289FNF9c8EA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: c5Q55GLDwqsWNP90Zv4OBz-ylXVypxqn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180094
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/5] clk: qcom: milos: Cleanup redundant
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
	NEURAL_HAM(-0.00)[-0.657];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,oss.qualcomm.com:mid,fairphone.com:email]
X-Rspamd-Queue-Id: 7C70D2BA899
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove unused header includes - drivers do not use any clk, OF or
PTR_ERR API, but they need declaration of of_device_id table.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-milos.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-milos.c b/drivers/clk/qcom/dispcc-milos.c
index 339cb1c63ba7..0a483fb6683a 100644
--- a/drivers/clk/qcom/dispcc-milos.c
+++ b/drivers/clk/qcom/dispcc-milos.c
@@ -4,12 +4,10 @@
  * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
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
