Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TnQNCa5HUGoYwAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2026 03:15:26 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB4B7367BE
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2026 03:15:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=k5qf5ez9;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=ZyRhuVs0;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC586C8F274;
	Fri, 10 Jul 2026 01:15:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDB2FC7BF8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 01:15:24 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 669HXEdn2420608
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 10 Jul 2026 01:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 G1wqDBsI3yCT2sfldRRfx2gkru7XASPgr4zytRr1nM0=; b=k5qf5ez9Yeo9+Ix/
 lr5RbW2d7gVVZ95E/fpmLKVdreoGXqKAm+4B+nVE6cgC5c/eqI3pCuCvpi4ztC2E
 DIhx4aSYMhx9lmV/L2mnDLrO5cYPT4d2xw2kcbeE31RHI04xlP2tzvXAFi/Q4342
 UbtEh+y/Prm44t67mdYGqDZ4uOCNurMIv3tTYFtBZrQ+zAbzg3E9YbwBzRhSknI2
 SbXRnl2Wpz7obqBqpYOVjlXsukrv7ZbCkp7p53W3oYlSccNoGnGni8vZ8N00TgW8
 cZTI4KsRRxkQDv6IGQ+mv/zByRR4u5GY+NAUny1VRWBckb6fvfXDm1N1nedmnSeY
 GKVYGw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvjaajx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 01:15:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2cc86a9ef97so6604225ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Jul 2026 18:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783646123; x=1784250923;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=G1wqDBsI3yCT2sfldRRfx2gkru7XASPgr4zytRr1nM0=;
 b=ZyRhuVs0U7NmlwntZbZfIiCJo9Q2TxZ/M/VfolWOtAwL5b5fiVHfLKELFmSFPoXUMf
 16UAXbi0oLVCU6WxZ3P1r7VaJfp5UWAu7kD2c++Q7EdIOr1ZyOT89edVbwDbiivK5OoR
 GnQY9jIqYiaeYiBB763y7p5TEGwq1kEGizzA/8BKB7YOEMNKeDoJ0FuMTe38XkcbC+0M
 Mjx2Qh8lhfMvAuOXYiLScFF5tcUahUfAGliwP15LBvipFz+xACahT+e+kPO3Btd7aCWg
 C5ZKGnizSpwoN724/1kmh+Dd+5lCfLqQkE1ChgGKGlGLRFuStJJzIAs52HGcVsqy29mD
 0oCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783646123; x=1784250923;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=G1wqDBsI3yCT2sfldRRfx2gkru7XASPgr4zytRr1nM0=;
 b=ML5H0zE+xCezV3deNKcyPicfUP0gA2LkKwXCqLx5F7KPhnFHNVs+yWZ/iGqHcJ/aoL
 w3DeN0hG+cnfqLcdRPoV80lKRB1U6DolwHlOZA/Azk4N2zyOmKcBDbiN5tAcX3TwYMYd
 XfVg+5relxY9kFHwHjWPZ9BBuAhPIO7/Ppy1Q7KHTsF8db5SelmXOwc9WM3mGf3gZCtJ
 MFzr5EJk4vu1huGKJMMk03hzfJT04mvGFK7B6g3k57UC/aReR2kVAoHzjnJVrqRu/g81
 ii2OEGXI0tZkQubvDimNAapQJjo9ih+VNi3gyPT3YlPDXVIHZCNjXyvJf3I3Sijap1IE
 blSQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq8zpirl9h4k/9uJlnl8ZyyHdytxrXPlm+F+EYZdmRXHjpalb/XgIC4p8JT8kqh3g8ZNkBNATEz50BY3g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy5tEoVqmGQEOG+Oeb5Ph+A21wpBHrxvaj8DTDSE45U8EJQmBCZ
 tTPF2Ug8YQw43Hc/uOKWkO8aVqX0hTnlHx0EB+vNVWAc82aakgj1hoZGrr359ABpjFrnNOPYDqP
 ehZc8IynWALmUL6iRvD4JvHhbn0naxo1inCvUysbMQUcoGVWbx6fuBWK3dTXH35iegRmROaEz94
 pmannn7x0=
X-Gm-Gg: AfdE7ckkAMnrnCkYNcU3a1qIB5fN0EQ80m3EJmOUYG4/55kMhPRxNjljtOnVrIqFflw
 QK7y02/dL5hIBTlbOQgXPc7gltocuct02Kvj1vJYawfMNcXx9tMR/JDbn+koFIXPzFC9QKAXbHd
 7MI88+CroyZXficDISdLo/17+hYgYKV/A7gj+aP5W0byDg+felQouNUjwfqfoLJ98LTF8MfXOHu
 fQUxrbs9IXkQUUzj/SWheNdTyjcirjHBBrMQZu+UUOq6mBR9GhoW6OuRaZ8eLJytGzuRcvDQVZi
 hOT2wcCa2+lYCkJreE7oiDwhQ4J9OkKISy1Y1jvzsdVOhkaBPGo1+P09iutntcgn1OhzoVZCKKy
 2AO3cnzYra1GKDlGNdX/9kSwSddlKISt/VZrl3UDlgD6qeeUzXMnhf4UIFD+X/ffycbZfVowWAA
 ==
X-Received: by 2002:a05:6a21:682:b0:3bf:b50f:71bb with SMTP id
 adf61e73a8af0-3c0bc9acb33mr10934170637.27.1783646122612; 
 Thu, 09 Jul 2026 18:15:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:682:b0:3bf:b50f:71bb with SMTP id
 adf61e73a8af0-3c0bc9acb33mr10934141637.27.1783646122195; 
 Thu, 09 Jul 2026 18:15:22 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ca5b31628c1sm4431251a12.19.2026.07.09.18.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 18:15:21 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 09:14:48 +0800
MIME-Version: 1.0
Message-Id: <20260710-fix-clock-refcount-unbalance-v3-2-a37a1fb17981@oss.qualcomm.com>
References: <20260710-fix-clock-refcount-unbalance-v3-0-a37a1fb17981@oss.qualcomm.com>
In-Reply-To: <20260710-fix-clock-refcount-unbalance-v3-0-a37a1fb17981@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783646108; l=2017;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=zgpWTKXkYjMR3KQnvwavCbiRuaPSJpMbJdyDurbvDAY=;
 b=NAXkJc33uJVwLgYrVrmkafvT+Ldln/C52l3qKRuXu/BorYNKmlaYr0W9YEkPolki/ROMN11hg
 3D50TwOMEsqAa7LRtLjnBPZw2Tn22TpO/4pFo3vq0w3rk2wQfqdf/Ix
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAwOSBTYWx0ZWRfX2UsO6hrsJQ2P
 fgCsvoq3TmptdC/UwvH4nqtBLprqD7mezCyUZaHWTBbLbRplnAB2i3rSatS0Mtoc3x4834JAEvS
 MPuK7jDEH0cD6iNYhAjfVA0lhDeHQQJKtxvv6KPquRPgC4z/s/eVH4x89GXmkt5UX4Yh8E9EY+n
 qZI8qsOVfy3sWgfl8xsrYQ/MarsjC2bqN5e1fHxxtrw59NhAoNkAPmtTDKr8OA14bYLBtHEVL+X
 0uex/muJNUhp1cxo4AyQ6v2dCXrBywHqUWlNtxe1RKHaM1oFNjoDlkpyKW8J/G97e5hgGYW3Hjg
 xjHk+xBPpjn4ThgXs5drPtng5gUXrOpr2A9LMNAkchp6D59EbbRhnUhIiOnhJmdZOiTDK527TnX
 3J0BZiS9LcxSorYz3LkJlx+Rfj5brbZ1S0f5D1/eEGaQZ535/KtrTMxHiy6uwRMIVsfVMfxAQYQ
 adiViG6MFnrLoT4X5mw==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a5047ab cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=pvfjB89pdnN9FuMUozkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: whHQKhPdXqXxoeR2YI3RPd4heI6PVCvh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAwOSBTYWx0ZWRfX64K3gHRhLhfM
 v21sJRFDD3/AKQuCS29qwzOaTzbvkR5AcvFv4iSdy8McGJ6ZaqeB3Mbd9vYS1yj40f+MDbbzdMV
 68ojTKqbC5TM0h0CTaeAfI0f4mmTrbM=
X-Proofpoint-ORIG-GUID: whHQKhPdXqXxoeR2YI3RPd4heI6PVCvh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100009
Cc: coresight@lists.linaro.org, Jie Gan <jie.gan@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 2/2] coresight: tnoc: Fix clock refcount
 imbalance on platform remove
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
X-Rspamd-Action: no action
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
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:alexander.shishkin@linux.intel.com,m:anshuman.khandual@arm.com,m:yeoreum.yun@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:tingwei.zhang@oss.qualcomm.com,m:coresight@lists.linaro.org,m:jie.gan@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,linux.intel.com,oss.qualcomm.com,gmail.com,foss.st.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EFB4B7367BE

coresight_get_enable_clocks() enables the programming clock through
devm_clk_get_optional_enabled(), which also registers a devm action to
call clk_disable_unprepare() when the driver detaches.

After probe, pm_runtime_put() allows the device to suspend and the
runtime suspend callback disables the clock. During remove the device is
left runtime suspended, so pm_runtime_disable() freezes it with the
clock already disabled. The devm cleanup that runs afterwards calls
clk_disable_unprepare() a second time, underflowing the clock enable
refcount.

Resume the device with pm_runtime_get_sync() before tearing it down so
the clock is enabled again and balances the devm-managed disable. Then
pm_runtime_set_suspended() and pm_runtime_put_noidle() leave the device
in a coherent runtime PM state (suspended, usage count balanced) once
the devm action has disabled the clock.

Fixes: 1abc1b212eff ("coresight: Appropriately disable programming clocks")
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..eddfdcbaa3ec 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -299,8 +299,16 @@ static void itnoc_remove(struct platform_device *pdev)
 {
 	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
 
+	/*
+	 * Resume the device so its clocks are enabled again, balancing the
+	 * clk_disable_unprepare() that devm runs when the driver detaches.
+	 * Then mark it suspended and drop the usage count taken here.
+	 */
+	pm_runtime_get_sync(&pdev->dev);
 	coresight_unregister(drvdata->csdev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 #ifdef CONFIG_PM

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
