Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TQAVI0OuRGq9ywoAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Jul 2026 08:05:55 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A2E6EA179
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Jul 2026 08:05:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=PVsHKBLx;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=hawNaT28;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26967C7C7CB;
	Wed,  1 Jul 2026 06:05:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79F3CC712A3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Jul 2026 06:05:53 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6615lOkq133226
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 1 Jul 2026 06:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3hzOvvQKWdguYtkPt+A8OQtsnHMjfxs8678kX7F8cLE=; b=PVsHKBLxQM+zMQde
 pQQfduVNwjXCTfsMXMLExDZzFsdxaNB1XpfVT+/Tl8JTpaP7xSAPkawxAz26bnU8
 p9C9HhcPINArAGEPmQLppk5w6p8OwuDr9TL12mVHQ15FVUILo5S07OHlhDpNfGNY
 /SmA1wqARsyjSpQp8B+F/AidHBYorsm/09Cy/HX5NW/U5Oqj4KnI+2KbJsdg9FGF
 m2Vw/1lLJGJ0qdloWvxY9B8gzyBtyawIam58eJ7WpSZTXiRzH+qMp95piLp2DByl
 XzvLko4W+ZJ0Jtp6WgytLTxnQwpOcimIYssWMdcFDVHBKOUT50IK8BlKHg8oPNzN
 GElFXQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy0yjx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Jul 2026 06:05:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-c9d5a5b63c5so212394a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2026 23:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782885951; x=1783490751;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3hzOvvQKWdguYtkPt+A8OQtsnHMjfxs8678kX7F8cLE=;
 b=hawNaT28NJtyw8Tt4UcFWy6Y11zP2NLc7XwHLAGslC6R28w/Shc9U6Jwa+ClkIX4cb
 Pmeo+qV9bAWw5MSwjqo7zCkZt4zGwfcqH845f6S2bSJcAG5jiU6Wks7AfH7hklw/Cnlw
 CqcWu35itgRmNahoMxLXVurgKHe3tD5f5wURx0K/ztONAvB2Pj/EZB6R5d0yEsjY2ptY
 hTmpTKgRq346S8yizS7hY8gVjZsB1icEemUhC2IsJzHPSa2psEDizwgtMtdS0cUfdzZZ
 nonbVit9Jx4BJDbKWu2PjZvynPtO+6qi014mwb2rOX+hUxs2UpCd16b8j6fQXshE/ABD
 mL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782885951; x=1783490751;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3hzOvvQKWdguYtkPt+A8OQtsnHMjfxs8678kX7F8cLE=;
 b=UOtq3Z5T0KkKJ78nNDJCNiOlOByAw5K5V1tiw95a5rVgxf7OWOwpuU6i+s9i7hVfqQ
 MtE+mnIlpMrGTiwgpkn2p39fsISNevUuyW3NvPGnL4bgUutik3p9hrADfv6jWVt3574N
 jnd0M2HFGKUsNgy0IQbc8udykq7V/9rCBhxPvNjdiDSH8l7F2LL7nWAYXrmlGufUKooW
 4udLVWjsKeN85wD8Q6FzghSZXUrkmymlZD0aTObpsXoNXbWX1fRo5IWFi/4cLso1I349
 Io33ZA1byN5nNiI93TGVv0WrlneShUd9QS+Nk6swKDyt6F1/OU7WDyO92lswiQhDb/RC
 XYDw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/BMMXIvXITM3+0Hq1JjqHk8Kev/Uljpp++iMFwixdUlraW0DN7m1seNMCGp+MLRjHGVSrWtjoV7ugl0A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxkVDuwucAd15zPb0GbYpYJOmh3xbL/8kkaTmEWqW37GDgaSaIP
 t7uPB9wJYF0yUEBZNhV8TEDd6g+nzrAsDkB65PskJJ/Xp9DSnzFkeuw2SVl4o9fz7E7DZtgBMM5
 NHQ5cSH/4qiwEIKhYHoIYR8drc0spvYVFrjDOHGuvnZsJiyn7moBPbdGtW1HMZoP7iYioAQlvJ5
 eJfMEfj/M=
X-Gm-Gg: AfdE7cnoOsdm6/O1UILd7W/cDxnCYpLje9X54B3T+k4DuafY+nyLbSNRFSDsFJfYLDX
 joYsLQ1aNLbaV7QrGhwzS9Ku6qmRU6GJErpGgLy9mk/TlkEH3yUEKRlTgmLNWiQdyyRjrN1tVOS
 6q9DYJUVtE7UWswjFxV8x4RiTJ3tWZ4svwb/mKXkvc6kRUMJAp/3mr9QLkg0OrtgEc9TmP3DP9U
 6kP+CT7V3Y4weLe4epddvziXY0dhCjABdhX5VXf4lTPszUb4UEoHRlZGhBv4zlDIrrYZqImT300
 AuH7xpWG9kiNBtwdgsdgsppWeEBQZ/UNg18N/FQ9ZkOwcPB5k6Ldce356ABYzVnV17flad4ENkX
 yDdAo0q9w/06Jjb0o7+MSXuPzcL3j5CFvplIgkP8FuwQfZ79bpwRm0pkPYDMMMYAgo0ZIheuOcw
 ==
X-Received: by 2002:a05:6a00:2d96:b0:842:4982:82a with SMTP id
 d2e1a72fcca58-847c08af565mr183075b3a.45.1782885951136; 
 Tue, 30 Jun 2026 23:05:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d96:b0:842:4982:82a with SMTP id
 d2e1a72fcca58-847c08af565mr183048b3a.45.1782885950658; 
 Tue, 30 Jun 2026 23:05:50 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847a02cc6f2sm3317658b3a.30.2026.06.30.23.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 23:05:50 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 14:05:03 +0800
MIME-Version: 1.0
Message-Id: <20260701-fix-clock-refcount-unbalance-v1-2-321dc63c1f90@oss.qualcomm.com>
References: <20260701-fix-clock-refcount-unbalance-v1-0-321dc63c1f90@oss.qualcomm.com>
In-Reply-To: <20260701-fix-clock-refcount-unbalance-v1-0-321dc63c1f90@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782885937; l=1478;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=NCCuaWYH56yc4jsljXsw5WSLi4PnaOm05c4E0yC9dIc=;
 b=xIWQ1o/Enc3LrxgE+zJBk+Rq2NAbYnrCtsgpWAbMHgw9Q/m2Yolfn4OfKYdQgoB459di45I0T
 xveurW8Df8GDxHms5/6I2vPiBmPd/tUExKAOFXO4ddefJo/7hVne1Jy
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: 0aXuqJ7Xjw_8w0susaJi2DmuHsvChz-D
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a44ae40 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=4fW1H2bpnNfDCpRz6dIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA1OSBTYWx0ZWRfX8umWVF2uHVV6
 6lVPQyq5RjgnE2gkh+7jqA1P1KjWMQqaWQEKuKcXZX1hrpQ6ojH6lZ7DKNoL89cq1Dp3wjgCu+k
 InnTVz2QKlPgBxGa5sQT4bpZLQojRRI6yKPYLgOJvV0hczaLdCz8JZarswXMujmPtb5mePFvJ9C
 Lw+31md9TBXk9lL5epnct3nkuv8JQlHJI6h3tCTobQvzpq1wlzLzaG4Oi5yyH+31+guZ0bRPbPm
 kbQRgi9vp3nRlreJ5/KmCbGcZpoq5pkXIAszMMl4Y3dR9HUbX7mGrsTtT67dC6QyVEPW8KZCpYX
 dyWqNB/ULngRGM8vtN+juMlD4dAsE0p2YkYnUxtO+aNOhk556TY8O2cpCQD807uZScAXTWovd13
 njnMXN9Nhj8TioT09FFmo+vLzAyY7EyLXqKQyln9p+A0v8vL7w4Uh6uahCB1fKwy6dFTmH60adi
 HKAvLSmfFYX4yyDLuQQ==
X-Proofpoint-ORIG-GUID: 0aXuqJ7Xjw_8w0susaJi2DmuHsvChz-D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA1OSBTYWx0ZWRfX3Ajq1pHLYSCY
 yW656GH2Q26SVUy+YrleRgfI4DOy+IdkBj3vrAyU19gQak//dWcRKaHy0d6kKpUdtXc7nzMffZB
 e1HSEToskAVvgRaiLFHM63ui9DwlSOA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010059
Cc: coresight@lists.linaro.org, Jie Gan <jie.gan@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/2] coresight: tnoc: Fix clock refcount
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
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:alexander.shishkin@linux.intel.com,m:anshuman.khandual@arm.com,m:yeoreum.yun@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:tingwei.zhang@oss.qualcomm.com,m:coresight@lists.linaro.org,m:jie.gan@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59A2E6EA179

coresight_get_enable_clocks() enables the programming clock through
devm_clk_get_optional_enabled(), which also registers a devm action to
call clk_disable_unprepare() when the driver detaches.

After probe, pm_runtime_put() allows the device to suspend and the
runtime suspend callback disables the same clock. During remove the
device is left runtime suspended, so pm_runtime_disable() freezes it
with the clock already disabled. The devm cleanup that runs afterwards
calls clk_disable_unprepare() a second time, underflowing the clock
enable refcount.

Resume the device with pm_runtime_get_sync() before pm_runtime_disable()
so the clock is enabled again and balances the devm-managed disable.

Fixes: 5799dee92dc2 ("coresight-tnoc: add platform driver to support Interconnect TNOC")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..a4ac0eb02248 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -300,6 +300,7 @@ static void itnoc_remove(struct platform_device *pdev)
 	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
 
 	coresight_unregister(drvdata->csdev);
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
