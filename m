Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HNiiGj6uRGq4ywoAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Jul 2026 08:05:50 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7356EA171
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Jul 2026 08:05:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=OGYpZSjf;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=OIQU0wef;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17A50C8F265;
	Wed,  1 Jul 2026 06:05:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDB89C712A3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Jul 2026 06:05:48 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6615m6O0126942
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 1 Jul 2026 06:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WYlZ2aPEpqh61K7tMl0TS4HBIg4YZJn9Z3vmihGIy1Y=; b=OGYpZSjfrf7TJ7cE
 sWtNhxXmpDySRu6KWbyUJzxh5PZhTje+QJwFSIN1nqt+vvhpH6VrSs7ny1UnMfSY
 qEG6y0Lj5oCHJpJvbaAfVriZ1vSLD07vp3vpf5IFCWqnAL4vcEJkHBHfBCCTimbx
 j4bnKlNzJuxzJW3zK8Y2RKYqkM14iNF41Igp49gMlDMTCIzIZOsMoPAPXYPHiND9
 h30ywhOEd0I2GrLu65N6+nU7PJAN7Cc379OiVDhmbPh1IZzSOdv0XqDzmWto/drl
 BSYlnkmRvrGYGbe5Dsu3rL8rrRNabIC+xRw5Z1aXAV4edNn32ZgeIbNpslEc+fxK
 d4cGUA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4fc0bmc0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Jul 2026 06:05:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-847a483ea41so472437b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2026 23:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782885947; x=1783490747;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WYlZ2aPEpqh61K7tMl0TS4HBIg4YZJn9Z3vmihGIy1Y=;
 b=OIQU0wefbVuLR29BODI44M1DqD13yVM1ODbBYMQAseH9bzNAstl2K6J9Ab3SJsxVRF
 hQVctGytUViWdm1QXINgiiRofE6Le68mLMpDn6ATy4vm4USjLfDPBvquHSW0sX6xL2xz
 mLAFNuSZxvHo8TJQw1igBOPw7b3NgFWJKelEIrpldRcb74QbeSYf5cdnMBGVJ/guQ7Fa
 Mdi63Qp5chwxlRhcjuQ7sVHYaSw0ZJibSc4aTWutSOdW+byJjmuvN8Tp3qiIG5aNdEx7
 HGVCpyvu3jVHbeEaEkqspGOVkaJKmN7Suu3D8FwB3xVv7GiJKTv5tqrHVZXDI4RhlDBH
 QUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782885947; x=1783490747;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WYlZ2aPEpqh61K7tMl0TS4HBIg4YZJn9Z3vmihGIy1Y=;
 b=EVcHIlB4UrN/oHBQBlXmXhbwgvi5Wf/2yH0mlYviUZDiX9TapQjD79hqnynPbtbr8A
 jpsrsfZbwcVzSmQa8WVir0JcjVOBPz1IK5sVOjDQNwtGzioxvsMaWWjjzxV3odVwQBDs
 vYElT0Ot7v2134lU9jel+SIWUzYo6heeE7LrL4n8gf6TaeadbyK4hT6RgqIOwTcs6/Ty
 KwQhsVoXdD8mSgFLrkcIqHzOabPv/eTVNvEGYEseBTnSGLLy0f2fjgMuqbEraI3UnGeW
 HgK6jKBdNhNBMcb8aB1mmaDsuicd2FSP4FGGtrWSuOvpNlNhXKgwVx9f6I/OkeRgI39r
 QWww==
X-Forwarded-Encrypted: i=1;
 AHgh+RrQyBUAuQ6ONkAoYGgyfD7aIlKjSWnvF6b+EEYn1rNjCXQtOBMKOY5edT+yXNXCP4rWzM7aLy0jI8WD7w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz/4LQve7PsdO9vdoL8zv4JR5iVLBy18C7JqYKwWgc648NytCtn
 CqDHWvoJNmx72KtgiftMoa6aj2euGkojYPilp3fY193ggusKvUOKML4NAX90OVwFfgzY8c0Dh3s
 3gPrJ/M9+Hxp18ct1yVgnnr42LJ+3R8u744DRyM5Yf/FsUUrsBnsdmgRx5Xn5siqs3pFGx8Eank
 XcUnyf34fmEjKTIbKu7g==
X-Gm-Gg: AfdE7cnhjVDED6uWUtYUzLCqHEWs+Q4DGbs/znG1m2F00u5ooLngNCV1JNhqOvTFb2l
 +TztGE0rfTljXgiCTwl1n0+2N9TqSpBOkGLtgh77H7Tfd4Pl7PwY8g2Vm+nZ3tf3U96oI8dhKeN
 ZMWw2Qp3VAkt3wyJtsFXyq+O8lQNHxtaUbwuusL2NT6d/HnZoONXDXaOR1ETenu9jt3rhWTw498
 m2N8fc//0OTcCq1ynNFsvVEG4Sv6wmtTQ6Os3sQ0xB7gvje39rDevY7rVAlHiuzkdgzsb+IDMMg
 IXpgfyh+q9RlivTMzPe/QziiQnWdehD9/iyhlk8XaiGYsZRtnp8sActP/HeMM2ZNwrWcVhYVibx
 O3be004OzlIu9sxqKB4mG/n1UYVpnAZ3vZhdof9AwdmqSYg+u+gPxj0z3FHkTMY6rpNBty7zV9g
 ==
X-Received: by 2002:a05:6a00:f8b:b0:847:9223:9726 with SMTP id
 d2e1a72fcca58-847a82d9976mr3848071b3a.18.1782885946584; 
 Tue, 30 Jun 2026 23:05:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:f8b:b0:847:9223:9726 with SMTP id
 d2e1a72fcca58-847a82d9976mr3848034b3a.18.1782885946032; 
 Tue, 30 Jun 2026 23:05:46 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847a02cc6f2sm3317658b3a.30.2026.06.30.23.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 23:05:45 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 14:05:02 +0800
MIME-Version: 1.0
Message-Id: <20260701-fix-clock-refcount-unbalance-v1-1-321dc63c1f90@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782885936; l=5885;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=eJfKlRK7k9b2kNcHtsJFOIUyVkQIXxfWWJmLMAk9pP0=;
 b=Ye3wjloLtfaNwOhrDBxIAdR1lVKRG4RSSV8jrcF2pU1QurgJEaGMXy5PRPwap01Uvx873zQ5h
 0XQ5KqPViSnAKt22bDp9kttNW9m3iCQbiK7pRRkqJ5cG0o+oVPQQjaT
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA2MCBTYWx0ZWRfXwVcNXCsWB+yC
 YmL8DBAOWPGri4YFYoS4MWnJqRZ8FLXoqQ8NLSsNAjtsjt+MPEFHlq7/UcP0C7WFBktlg5UrvLD
 TRUSd4ORm+ndUA/JkM16bA9xMQUJKXCbXBEfGSsja3oVGVwHk1T4/aGXPsdQt+8w+3zqz+IYx7n
 19aSQn4PTxNQxaS+vAbciMsfyjhpVkXt/79BzHo4Nh85Wy/CwDC8cpqNdOBhe/jVP5o5ikXBYWM
 kBIAyLM0Ck8bfpgkz0xCgfqFDsWsJO3WePootZJUD0njeqsb5gGduWfk6yYoqPbnqcxmgL3kV48
 ZPUu9ONO21M/LUYEFB1N2zmYVeEBPLlHm4ThdrABIAcqNABxhbRqXWsXbPg0hyYUX1Nkee1LX09
 ZmbA3HoNhustIo0SP7qGJD5P9m+exaaC+qek8UFT6czSllchfAomwby0nya/v1eLPuYu1Vw93vm
 bPtYgDx0RjYS/gHYHfQ==
X-Proofpoint-GUID: 3jzH70v6b7zORXgumGsGXGoEPSvZjz3x
X-Proofpoint-ORIG-GUID: 3jzH70v6b7zORXgumGsGXGoEPSvZjz3x
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=6a44ae3b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4U_dmyjyNprtKVz-Sb4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA2MCBTYWx0ZWRfX2+4u+B9kxE9C
 gx/i2WSrMu35s6stzbN/US6m+LtQ08R3tFwWj2Az01F2ICoZovRIe01t2Tv5DQGArew/ed1Boge
 jOrHh+QcRVMTnsl7i2+m6uq/VSE6x8s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010060
Cc: coresight@lists.linaro.org, Jie Gan <jie.gan@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/2] coresight: Fix clock refcount imbalance
 on platform remove
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
X-Rspamd-Queue-Id: 4F7356EA171

coresight_get_enable_clocks() enables the programming clock and the
optional AT clock through devm_clk_get_optional_enabled(), which also
registers a devm action to call clk_disable_unprepare() when the driver
detaches.

After probe, pm_runtime_put() allows the device to suspend and the
runtime suspend callback disables the same clocks. During remove the
device is left runtime suspended, so pm_runtime_disable() freezes it
with the clocks already disabled. The devm cleanup that runs afterwards
calls clk_disable_unprepare() a second time, underflowing the clock
enable refcount.

Resume the device with pm_runtime_get_sync() before pm_runtime_disable()
so the clocks are enabled again and balance the devm-managed disable.

This affects all CoreSight platform drivers that obtain their clocks
through coresight_get_enable_clocks(): catu, cpu-debug, ctcu, etm4x,
funnel, replicator, stm, tmc and tpiu.

Fixes: 1abc1b212eff ("coresight: Appropriately disable programming clocks")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c       | 1 +
 drivers/hwtracing/coresight/coresight-cpu-debug.c  | 1 +
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 1 +
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 1 +
 drivers/hwtracing/coresight/coresight-funnel.c     | 1 +
 drivers/hwtracing/coresight/coresight-replicator.c | 1 +
 drivers/hwtracing/coresight/coresight-stm.c        | 1 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 1 +
 drivers/hwtracing/coresight/coresight-tpiu.c       | 1 +
 9 files changed, 9 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index ad8dafea7d2f..f7e501e6cbd7 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -647,6 +647,7 @@ static void catu_platform_remove(struct platform_device *pdev)
 		return;
 
 	__catu_remove(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 3a806c1d50ea..f7efae5b5ce5 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -711,6 +711,7 @@ static void debug_platform_remove(struct platform_device *pdev)
 		return;
 
 	__debug_remove(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..9b6da29d9735 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -266,6 +266,7 @@ static void ctcu_platform_remove(struct platform_device *pdev)
 		return;
 
 	ctcu_remove(pdev);
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 14bb31bd6a0b..147761024c0f 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2416,6 +2416,7 @@ static void etm4_remove_platform_dev(struct platform_device *pdev)
 
 	if (drvdata)
 		etm4_remove_dev(drvdata);
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 0abc11f0690c..4c5b94640e6a 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -334,6 +334,7 @@ static void funnel_platform_remove(struct platform_device *pdev)
 		return;
 
 	funnel_remove(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 2f382de357ee..2d765f1f73b3 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -313,6 +313,7 @@ static void replicator_platform_remove(struct platform_device *pdev)
 		return;
 
 	replicator_remove(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 4e860519a73f..a653f1eebeca 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -1026,6 +1026,7 @@ static void stm_platform_remove(struct platform_device *pdev)
 		return;
 
 	__stm_remove(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc5a133ada3e..c9cf486873e2 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -989,6 +989,7 @@ static void tmc_platform_remove(struct platform_device *pdev)
 		return;
 
 	__tmc_remove(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 7b029d2eb389..72ac93749be1 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -286,6 +286,7 @@ static void tpiu_platform_remove(struct platform_device *pdev)
 		return;
 
 	__tpiu_remove(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
