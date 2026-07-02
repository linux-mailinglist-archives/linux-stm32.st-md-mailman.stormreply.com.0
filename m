Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KlCHEGUnRmogKwsAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Jul 2026 10:55:01 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA11C6F4FF9
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Jul 2026 10:55:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=UdjXxVnj;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=kJuaEQwR;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A70ABC8F262;
	Thu,  2 Jul 2026 08:55:00 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2153FC7129F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2026 08:54:59 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6628n3Ol3046377
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 2 Jul 2026 08:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7RfvxhoKMkOlLelhJkw1qbaw88LcKz5M6dptpjsm294=; b=UdjXxVnjJ0Lbjepl
 d01l53LVjvEcanOeQJK2wxMwNiKU1tigR/ZvFltkTW/e93UaKIws7OH/CC7rqwzV
 fqocvkww9rDDafZZCQxQbLNy60p2o2G4nJ/6iPuswXBg7h2LHroyHpC31QyIodgG
 8meBgN5U3fQMmvZWoge69MGAl7v1c/WBI+lhUGIF7FFZSmTY3G/FWjfof969/xOj
 tsOGUTqYNSoKxQM/5ZwvRlWAafhdzBrn1M12po3Fo7TuXRxU1+vdhs7HHtU5i/fV
 8FW/FaAau1uuaGT4BmL4O9/BRe7qrYnZ0+uXXDQWQfG8dIfjmVz9FzlRUAdaHJqB
 6FgE9g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f58k3ap0m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Jul 2026 08:54:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-845df469a26so3266584b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Jul 2026 01:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782982496; x=1783587296;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7RfvxhoKMkOlLelhJkw1qbaw88LcKz5M6dptpjsm294=;
 b=kJuaEQwR8D96n+TgXiaokP4QWfJNQR29dL+2hE2Pwz6Sr6DcY5RAwb8SWbB1dM8AsS
 YT7DAmmn0kMUXLGvCfBO7B9RTjW5c71VD09LZOtP0HBDENvK9DnPT93ZH+S9mTnc57tN
 TEzNbXzGht9dI6yorh6dJDDBFipLIZxuuyeOf9zfjBm0jekfzRRoKi18Q6SZ749Dfih4
 /6MRoEcLxONCsZThJg26RCmvHOzbZKvRaN2YMmDJ9/M/ObYL4f6CQMI91yVNLQVJakmj
 oN1H/emp7BMsCjaZRCWKgooD20L4yizMuOZVjoD+SQQmiUKWGmjBnDCvQzFNgGrLibI2
 yukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782982496; x=1783587296;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7RfvxhoKMkOlLelhJkw1qbaw88LcKz5M6dptpjsm294=;
 b=p0DBtiFy73BgoZ7yPSKE3BVvWPXbUcV/dRyvYuo2siHhDEMzAPQmR5G6lvdPn2uK8/
 joyad16Dr40qj6dKw95bhz/yTES5U9eGNtYZwT8aiUZSM1y7WQg9aWJwitlBtCuYUh8+
 6RJPM4nHIh/32gv56rlr+piiQ6VprdTvogyVQfkjJbDNH8e0L1qTut5dk1DPXLsXDePf
 s54LeVZlArxLAcicbjzIuHz/R0dyNHT9CeqXmJNnReXzrfcUCb/tbrWUUqE5rAdIPxjZ
 ycMVTBHZ6YDfvCBC15aTUWJoYRD3h0ldZfh97ctT98I6LUBPbBc2NXS5WYwNdooNYWgj
 ZS5w==
X-Forwarded-Encrypted: i=1;
 AHgh+Roshhr/OfCGCbgbKWsTNkg/E8/ewjkpotn7pBhXbu+iviHL4/vpkna9YFR/IDkxg0dPcpy45eQZi3acJw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyiT1PA2E9Q5DAJ/+271ZEy0tXuymyP2g4XeixppwChSVAHmvMa
 if5NY7cwkIAyd+QCN6omwS9xSg5VV58wteMb8kfIwI2/9VKobOvMCRksi3ttpuy/WoCg7e6ZH4a
 04J/oTHLhLB/nU98b68Y0lfxWtqBFxKCDDzH7ZTNsfxYp39frboshUWjQfvh8TcJFAhLHMorBxr
 K4YO4UVe0=
X-Gm-Gg: AfdE7ck9l/Yufk18VU8m+3ELXmXcQ3ntMMiahpJ3PNxkGklcTsL5M5yJEJtAUJxLtfn
 JOJLn6gRWvW+Xxh0TtwVHCc1gulhdIHU8IGjr0eZI/rXtIw+cHfIk1LZ2asN5yebnSUXCVj/EXH
 WOam/Gkkg2/qCvCMmn81FrhZHJ9EI39OklbrBEJBf/xpoIWGx7bklKvo2JX1V7DykuPayF9pDcg
 gwR9j7ySleLFV4Y17E3TkvLxgB6V0olXF6ur1szcOkqFiajxikf0hQwGGpDirPymKi3ws/ItK7S
 V2pfSNb3YTUczrROZdeHH8+7PJne7gJj/a2JqLTxfTyKphvI34X9ItAx3Ojak+wUSZReenqiHxX
 3ukZdzptnMIWfxhxP8A9kxjL3PznOGYXrmr0W69H78I8ZcG7VPCQDylj766FiL6ZbbC1mG7bKCg
 ==
X-Received: by 2002:a05:6a00:3cce:b0:845:c6c3:5e75 with SMTP id
 d2e1a72fcca58-847c5141ba9mr4510322b3a.42.1782982495646; 
 Thu, 02 Jul 2026 01:54:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:3cce:b0:845:c6c3:5e75 with SMTP id
 d2e1a72fcca58-847c5141ba9mr4510267b3a.42.1782982494957; 
 Thu, 02 Jul 2026 01:54:54 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847cb7933e1sm1003514b3a.26.2026.07.02.01.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 01:54:54 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 16:54:20 +0800
MIME-Version: 1.0
Message-Id: <20260702-fix-clock-refcount-unbalance-v2-2-2383fbb9952e@oss.qualcomm.com>
References: <20260702-fix-clock-refcount-unbalance-v2-0-2383fbb9952e@oss.qualcomm.com>
In-Reply-To: <20260702-fix-clock-refcount-unbalance-v2-0-2383fbb9952e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782982478; l=2754;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=4Fs1C4uICLTweg+DB4xkt+CkKczMp5yN/3q/4y+AiFc=;
 b=2XzSNBg9oJGtUlNBbUKjeXrNszri4tquvx+19GLkvutbVwlbSK0IBNkNYcgdCgb6r340eQmDd
 3vJVtjMMxD1CYwo7ay2I/JcAQo9SOYTQKwpE5uFjXWuXDDgRYs8fm6F
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5MSBTYWx0ZWRfX+Xwj/TN2ye++
 zozhQMUClwP9Y/PaLz1HhlMs2wV43taZNRXuQoVqbtWl4N9kTYBBLsROTxOojz0zWX7r2lgFaiy
 LiT22j8fXFG0aU7aRYkbjiiguYKQi0DqZ5EYFsGSkA6aOgEvDclkshm6Q+lDKXK6bE2UupwbOej
 pzxrXqpcm2OW8ALXqD8xhZVSn4dDE6b+VN0SP1fp9a8yPTIX9h0Z6GzBEITFlNJ4l8VTxBnlePF
 MSD467v1m+X2ITVTloRH2pMlGZyAsAs5fCzfbOo0amSnvEe+TgHFx3NDwBCwMagodGcB51D3cv2
 HybayefNiXj/IFbmyMJbalh7LniqZRDqEQQYBOAPpHEL77X5qib4Po2lPk6Xl+nJ56btDTgcljF
 qBFMU3dPrVVTK7MLuXXoLoZzuydE78cb01o7xnSXphYbvjGiVXVG7O+MTfBwM5Auq+KSsmgvlf1
 E93fosNcqL07uv6t19w==
X-Authority-Analysis: v=2.4 cv=SuGgLvO0 c=1 sm=1 tr=0 ts=6a462761 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=GvhjM3dZ3B1J12qe5RMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5MSBTYWx0ZWRfXyYiXfH37oeJ+
 pMVnqPhN+CSJzaNRHl1+pAAMctBBs8X0FPTTZrrFHRF612Uss07EsjUrERk11c73IHuT+B+qpsu
 HZ1S1J92IOWVF7Hr3wogOLqsP4tIkj8=
X-Proofpoint-ORIG-GUID: BQ8m_i5Famj22xTo-vjvAikVOO8Y9BJL
X-Proofpoint-GUID: BQ8m_i5Famj22xTo-vjvAikVOO8Y9BJL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020091
Cc: coresight@lists.linaro.org, Jie Gan <jie.gan@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 2/2] coresight: tnoc: Fix clock refcount
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo,qualcomm.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA11C6F4FF9

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
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..eddfdcbaa3ec 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -282,42 +282,50 @@ static int itnoc_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	int ret;
 
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	ret = _tnoc_probe(&pdev->dev, res);
 	pm_runtime_put(&pdev->dev);
 	if (ret)
 		pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
 
 static void itnoc_remove(struct platform_device *pdev)
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
 static int itnoc_runtime_suspend(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(drvdata->pclk);
 
 	return 0;
 }
 
 static int itnoc_runtime_resume(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
 	return clk_prepare_enable(drvdata->pclk);
 }
 #endif
 

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
