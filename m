Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vWfrB6tHUGoVwAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2026 03:15:23 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BF27367B6
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2026 03:15:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=nnVS1p25;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=iwJYfvq7;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95AFFC8F271;
	Fri, 10 Jul 2026 01:15:22 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7C0DC7BF8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 01:15:20 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 669HWrQT2563427
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 10 Jul 2026 01:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SNRPETvOBrdTccDym8kPa39iz5LMbvC8/K3rZA2zfJg=; b=nnVS1p25ngrUHNqW
 3dm6x+WHBvo0xmK/JYy4HazK7nIa1HZ6Y9r+S0Y8J2Etw6/x7+v3AAKeevLQjVb/
 vrmcbKbSjFMos3M5lx82N3ld9xuq0wfAO7RxQGhagm96TpmcJWknYtdSNvgNPNK9
 l7AWEuysmys1BSfuqMFxns1v+DwUzTVGt//yd/PQh+Lr5Jo/F9i37cwTtqWFJHQ1
 jYeVW/zzioRXHXuxjDwEhWx4pQRP8lVEYgrzXU5VIUO5XspH9bJHhYO+uubojI3o
 qe4TyM1H+KAitlAJC2g6O6bqCxp17XsQdNfCUNvcnAPRbs6AA0oPNqMtM8WbhLT6
 /sHClA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg3j4w3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 01:15:18 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-c891ed872ddso551569a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Jul 2026 18:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783646118; x=1784250918;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SNRPETvOBrdTccDym8kPa39iz5LMbvC8/K3rZA2zfJg=;
 b=iwJYfvq7z8Mv/Ve9aujYJB+gDxA0hRSWtdaKyEr2Lmt+ygtqfO4Y0PTzX9vq/Q9w9I
 mC9HabKKNyZ/Pydhq7ZOhl00i5jw9N8fxhZDvT0isZNNb0WePP/13qoR2/eD5HZXfb6D
 M3KPl+kU8wwh3GT4zKpapaWYzCYo2YuFC9y5SDRw3SeBQpooWeuItV+ulgQpegRWeVEq
 n6WnXwH42pxFWNULWJ8eJv3/Z7uT8g3lPuopaDTr9PUNDsxXi/PdsOc8UpT3RXZNJldH
 qCroUQdutC5li8J8s9mgzvID7IksdeFcoEu0/J5zMnYGNymQnKEa7B1oQ8yAX2EvNw/S
 OSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783646118; x=1784250918;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=SNRPETvOBrdTccDym8kPa39iz5LMbvC8/K3rZA2zfJg=;
 b=rp3xs8ARLdhzACwtk5uKw/IhZDsPVnmfGC5wbay5J6WiXIjmveMRTjlJeSpkoTKd0X
 oIiHGCXwnOh0zXE/Q+fpfL3ceofT5b4juNsUJHUsNaO9VlVPC8kx/+mjJ9xkdieU8Gok
 oHZvCzN0MuckDWvnXW6mRN83CqwxudbMizOPjAxzoUzE+BuHNPbyJjX44eQ8oxjjuyWT
 /0GBq6vAKWnODS9EPztuKlkAMSGmMNOSSsJN3d8wH2pPLqt0+Rmc3at5BDybx38sNXuy
 c5JX/45Bva9c72H9UwFGfppVA3K/tHtEqNlvLBWb7k4W3YnKPrdxwbnt3IGwzHlIi+Qy
 8lrA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrAUtaXfzJmkSCZky6CgodIlIQDaaxoZR7WjCcCm5LYe/HfagMepjZkJSW8oF+a/JMKuUSp6bbW232Sqw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxsuiPfgHz6Cex/emOn0UFRgiAHmPNZpucN8uBoV9dLsaaUOyyS
 Xnb57fZuJuHo/MmaI5liSfl8Xg3v8QY+PCLlZwa5dCZZPkLE80VCd4q4Zoteypk4FyQ4DupIh+q
 hPaqAFb/BuLRJnmsn467B63vREED9byT7VTDKiCDWVhIh8MOoGS/qYH5IIvflO82Csp3K1WF9lA
 gocHhh7DA=
X-Gm-Gg: AfdE7cmxrYLjg2/QvX2uUMe3e6tK6qyQGUIHmoTTq/copQQBsn+y1dbvA6ujMxSgcPM
 qvQfrfELFEuW4qgu4hcRFaAseTVlzeADz5sSW8pzvdji7l/dvTdPAZwk/KJigQ/AsoaTYfXBddd
 L0g/ORJCIpW0FmzdnbRpGEsftQUA9qAbMoQdEThSNyxWRKgaKDQdQ+ON1vY/IH3gQn5UKEBG6e/
 W/tFCQezxj337cZas0KvlYFV+CajORTYfAhTdGDsnuqezQ43uYdT8r85d2+O0t6q4XUVf1sb6NF
 jb8qSfStRSXq/+e2Qq6gXbJv4DJprbjldEow2jbJNQHpcxd0k7NwTby+tAAxhaC/AgYHaBI4qN3
 qjkY5GcBZnx0JKgAl1+43EzbA/ZyOUdRkQ047f2kmC17wCk79MXs62Na/4CmY30rqxe41+4iJMg
 ==
X-Received: by 2002:a05:6a21:497:b0:3bf:b182:94b with SMTP id
 adf61e73a8af0-3c0bc8c4f4cmr11531100637.6.1783646118019; 
 Thu, 09 Jul 2026 18:15:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:497:b0:3bf:b182:94b with SMTP id
 adf61e73a8af0-3c0bc8c4f4cmr11531052637.6.1783646117407; 
 Thu, 09 Jul 2026 18:15:17 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ca5b31628c1sm4431251a12.19.2026.07.09.18.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 18:15:16 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 09:14:47 +0800
MIME-Version: 1.0
Message-Id: <20260710-fix-clock-refcount-unbalance-v3-1-a37a1fb17981@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783646107; l=9543;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=CaRcTvjJkzeu56Wpzri+PpTT/TNFxhgZxAMVCjmhO6A=;
 b=vAZYENsx4qUWBBBCeTvVmUT4isF/K64l25/OABZ6PLWQNFqIRsqm4g4hB1SBWoT4zy3ZaNO2q
 hM3dlTJNPAfBZOMwSJ4c5FDzuGgj23S1+SiXGK9OczVGCO9mePbup3N
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAwOSBTYWx0ZWRfX2z6ZBzvbbbf6
 uONFLQv9MSP7Z9Ed+HBcWiIPD17FYVMtcvFYdZ8auvd1z3MLt4xg6we6Qy26+RkoO3IpfuRbcMM
 zFJKN07Uq/hgI+ECZECXsGlztfdAtp9gbb6bjKFZDSJ3E71u2/4WT+UbmjBcgN7OEv3xyym0kIb
 ShpVzV0hq1kspn9kX8nL8kVd066LcknGLRstttEOQJ7oLUaZuWBFvl4R1ydfbuEP6lhp0U1aaEL
 TtjLdXwLZmwJPYPdPNmS8lrZ+PHqmNKBLWuiwuzI0Ab2tTrCZ3Q/PC+z53GLA54gGXjtWfnw4Q/
 ceHFxR5fCT7PCtDQjvKZgenLuwHEpg/W5GPRYe7SfjYpSducgshosa9AuLJ8RrB2wVszIhMDHCl
 qtO7kA7CGfy8iIkj48V0av9gr2FnTu8bqaIS+tEq9CCMCfaZy1p64ejsvvgN4abAwLdRFqhTY0A
 rTm1To1XEV5hcZLch1w==
X-Authority-Analysis: v=2.4 cv=ZcMt8MVA c=1 sm=1 tr=0 ts=6a5047a6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=RgdK3QP1sc-eABpqATIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAwOSBTYWx0ZWRfX+AhtCi8PZ9rT
 0R8p4v5ZgLb9h0+4DDrwvAPrRjT2Mq9e6SH0pAJo0E4knFwwGxllmc1ZAN77S8jmSU7TXVWyXgO
 cCdAHvOeg4AGt8116+pop0Jg2jfyUv4=
X-Proofpoint-GUID: sH1AfFFD42ofCRVclG9eBdOQxpu-tzJz
X-Proofpoint-ORIG-GUID: sH1AfFFD42ofCRVclG9eBdOQxpu-tzJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100009
Cc: coresight@lists.linaro.org, Jie Gan <jie.gan@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 1/2] coresight: Fix clock refcount
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2BF27367B6

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

Resume the device with pm_runtime_get_sync() before tearing it down so
the clocks are enabled again and balance the devm-managed disable. Then
pm_runtime_set_suspended() and pm_runtime_put_noidle() leave the device
in a coherent runtime PM state (suspended, usage count balanced) once
the devm action has disabled the clocks.

This affects all CoreSight platform drivers that obtain their clocks
through coresight_get_enable_clocks(): catu, cpu-debug, ctcu, etm4x,
funnel, replicator, stm, tmc and tpiu.

Fixes: 1abc1b212eff ("coresight: Appropriately disable programming clocks")
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c       |  8 ++++++++
 drivers/hwtracing/coresight/coresight-cpu-debug.c  |  8 ++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  |  8 ++++++++
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 13 +++++++++++--
 drivers/hwtracing/coresight/coresight-funnel.c     |  8 ++++++++
 drivers/hwtracing/coresight/coresight-replicator.c |  8 ++++++++
 drivers/hwtracing/coresight/coresight-stm.c        |  8 ++++++++
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  8 ++++++++
 drivers/hwtracing/coresight/coresight-tpiu.c       |  8 ++++++++
 9 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index ad8dafea7d2f..b72fa7f4bdeb 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -646,8 +646,16 @@ static void catu_platform_remove(struct platform_device *pdev)
 	if (WARN_ON(!drvdata))
 		return;
 
+	/*
+	 * Resume the device so its clocks are enabled again, balancing the
+	 * clk_disable_unprepare() that devm runs when the driver detaches.
+	 * Then mark it suspended and drop the usage count taken here.
+	 */
+	pm_runtime_get_sync(&pdev->dev);
 	__catu_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 3a806c1d50ea..87b39874461e 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -710,8 +710,16 @@ static void debug_platform_remove(struct platform_device *pdev)
 	if (WARN_ON(!drvdata))
 		return;
 
+	/*
+	 * Resume the device so its clocks are enabled again, balancing the
+	 * clk_disable_unprepare() that devm runs when the driver detaches.
+	 * Then mark it suspended and drop the usage count taken here.
+	 */
+	pm_runtime_get_sync(&pdev->dev);
 	__debug_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 #ifdef CONFIG_ACPI
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..e0e33e3ca5bf 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -265,8 +265,16 @@ static void ctcu_platform_remove(struct platform_device *pdev)
 	if (WARN_ON(!drvdata))
 		return;
 
+	/*
+	 * Resume the device so its clocks are enabled again, balancing the
+	 * clk_disable_unprepare() that devm runs when the driver detaches.
+	 * Then mark it suspended and drop the usage count taken here.
+	 */
+	pm_runtime_get_sync(&pdev->dev);
 	ctcu_remove(pdev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 14bb31bd6a0b..dd5d26717f15 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2414,9 +2414,18 @@ static void etm4_remove_platform_dev(struct platform_device *pdev)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
 
-	if (drvdata)
-		etm4_remove_dev(drvdata);
+	if (WARN_ON(!drvdata))
+		return;
+	/*
+	 * Resume the device so its clocks are enabled again, balancing the
+	 * clk_disable_unprepare() that devm runs when the driver detaches.
+	 * Then mark it suspended and drop the usage count taken here.
+	 */
+	pm_runtime_get_sync(&pdev->dev);
+	etm4_remove_dev(drvdata);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 static const struct amba_id etm4_ids[] = {
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 0abc11f0690c..d69cd66e8394 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -333,8 +333,16 @@ static void funnel_platform_remove(struct platform_device *pdev)
 	if (WARN_ON(!drvdata))
 		return;
 
+	/*
+	 * Resume the device so its clocks are enabled again, balancing the
+	 * clk_disable_unprepare() that devm runs when the driver detaches.
+	 * Then mark it suspended and drop the usage count taken here.
+	 */
+	pm_runtime_get_sync(&pdev->dev);
 	funnel_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 static const struct of_device_id funnel_match[] = {
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 2f382de357ee..1df01deb2f69 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -312,8 +312,16 @@ static void replicator_platform_remove(struct platform_device *pdev)
 	if (WARN_ON(!drvdata))
 		return;
 
+	/*
+	 * Resume the device so its clocks are enabled again, balancing the
+	 * clk_disable_unprepare() that devm runs when the driver detaches.
+	 * Then mark it suspended and drop the usage count taken here.
+	 */
+	pm_runtime_get_sync(&pdev->dev);
 	replicator_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 4e860519a73f..a75b1c56a867 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -1025,8 +1025,16 @@ static void stm_platform_remove(struct platform_device *pdev)
 	if (WARN_ON(!drvdata))
 		return;
 
+	/*
+	 * Resume the device so its clocks are enabled again, balancing the
+	 * clk_disable_unprepare() that devm runs when the driver detaches.
+	 * Then mark it suspended and drop the usage count taken here.
+	 */
+	pm_runtime_get_sync(&pdev->dev);
 	__stm_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 #ifdef CONFIG_ACPI
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc5a133ada3e..ed40bfea32f9 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -988,8 +988,16 @@ static void tmc_platform_remove(struct platform_device *pdev)
 	if (WARN_ON(!drvdata))
 		return;
 
+	/*
+	 * Resume the device so its clocks are enabled again, balancing the
+	 * clk_disable_unprepare() that devm runs when the driver detaches.
+	 * Then mark it suspended and drop the usage count taken here.
+	 */
+	pm_runtime_get_sync(&pdev->dev);
 	__tmc_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 7b029d2eb389..775507d0bb36 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -285,8 +285,16 @@ static void tpiu_platform_remove(struct platform_device *pdev)
 	if (WARN_ON(!drvdata))
 		return;
 
+	/*
+	 * Resume the device so its clocks are enabled again, balancing the
+	 * clk_disable_unprepare() that devm runs when the driver detaches.
+	 * Then mark it suspended and drop the usage count taken here.
+	 */
+	pm_runtime_get_sync(&pdev->dev);
 	__tpiu_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 #ifdef CONFIG_ACPI

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
