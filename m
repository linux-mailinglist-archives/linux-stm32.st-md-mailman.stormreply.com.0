Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id taQmDWInRmoeKwsAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Jul 2026 10:54:58 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B36A96F4FF1
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Jul 2026 10:54:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b="MqR/XBsZ";
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=WcpkczmR;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EA7DC8F262;
	Thu,  2 Jul 2026 08:54:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06A7CC7129F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2026 08:54:52 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6628VGTo3046717
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 2 Jul 2026 08:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9b/W7QGSCQ7+siyAOGDr0r/H8HglDIhkhzvNu/L2LPw=; b=MqR/XBsZP67EIomQ
 V5Ln9ipKy8ZfVDbnX6Ohxmk6GMvxeUdy6zqDg1YoBgeFX5JmV67bb0tnulHerPDM
 fjc77GP1cdm2rX8iqfYoT02/LHrQj5GbeUe7i2GxTOMLsMAubekVzRGARG9OrkMX
 s7H/AuKDgf6BV8Hi0NrjgaLyBryZrA2X73xc4lJEqZFC5SAU+tvGRWYfzdAuiof4
 rUX1rXsnD1kgKyd/dNFNp6QxkhHohV3PlwkJbVr17tw+ohydz3uR0uk2CsBkn7JV
 X9deovm4Sw0Jd11xk2/YwyQZc5gAco4rWvaWnwFl8WdAXASgRWf5uSgxGuv/rK7o
 EGs+Tw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f58k3ap0a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Jul 2026 08:54:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-845bc2e658aso1763025b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Jul 2026 01:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782982491; x=1783587291;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9b/W7QGSCQ7+siyAOGDr0r/H8HglDIhkhzvNu/L2LPw=;
 b=WcpkczmR7zkGgQ5HqLG+yTpry8k9pfHEltSdmQRuqanH5ByzN1Jr73EjMBwdpQNWWn
 Gfc6TezAIuexXvc6HQBd6EtBRi95xZ3W+fwpyzsiDFRWpcskDkt5DfY1x97sX42sOhLC
 IZt+SLhEKozZyq1Y6Rb7x5t9JpIKhTWBJoFG3aGZDwvdt+XHqx9uKr9MbuubPajy2ixZ
 5WRoJGxdCPOAMlHImyD+iw4XfBRHHflL4vr1G0VXNQEzskUcoOosN/SCfqeGRGZt1S1d
 ZN1ClFuLs3q1cRxyX1F3dVHo+uyKJLDkHJVycJjgxLGTF82mTPdFClyp3OscnEUHh0g+
 /41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782982491; x=1783587291;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9b/W7QGSCQ7+siyAOGDr0r/H8HglDIhkhzvNu/L2LPw=;
 b=nvgrf/Lu/bJIHxvZ/3GvpLdBO+lPJo+pqg2Tfx2TtwVN/bNoT89Qs8Nz1ize02U5gd
 r1B9vtILJ3HnkFag6EBqM/zEi2WzCkkPYAnTHrREa1pRKV7Qvf+jDZ+gsEm/10f/N5Aa
 zIxCPuS08C/hHGZvMzwnWHYBybYDe/wj06aFS2B/caMX8xFMGRyjbB6gd8zaeQbbzOTr
 t5WecVP82KUJgWX1cRKPfYm/tsftDX2HJ9yXA+kZyT++lprL1fUtkZwveqWJUEVvUxcK
 R4W0iqiSI/YhTwg78+1zLwD/KcAlVPW38dY4LBiO5rxPfQ1PDPRdcw2MalT059tswbLd
 ftQw==
X-Forwarded-Encrypted: i=1;
 AFNElJ82a9pKia4eIdbi3ip9kHCqYXt40qGv0mHZ3SnIBp6zvwssnwrfyBq3TzgL67wn9VZ3xI2BO2849GlDRw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz5HFxUe+kYlo+5K2aNsGFeIX03k9YQNis5C0rg0sIx6p17NpNp
 zrGKjwVd8rXIKoEzMp+9+VxSatbkdoFmBRaGievHxW+FVwuzVYhVm74ZpxUSgi8D/JzfuXQcO4g
 pnEdLg2aUJb+b+ZROFy3O4PZDqzwgsIlTWz8MlUoOJYX8thh2YRHHwXjI0lSqbTmMFzo6KwSt4Z
 bUCB3Fx6s=
X-Gm-Gg: AfdE7cljfK1po/DLXrH1AOS7SPOcrMa+ESu8JDh0FSvVTxJMTFVBa0Ppj6lygAj3oq/
 NqNgcEi9Zt/EPE9fyd0oJILS8ufRHPetVSIShW28OjC/GPk7+iw/QuukqCZk4GODsby9A3Re3SH
 l6GsHmKvJ7p9goRb0E7Lt7kVxIx39ESUKIz/k1uNvJZNBBfyoCyQOnAiybkR/ktZ9gCHewg8+jR
 nddMPiOB2A/NOaKTfs0+sZ9p4m90zxE5cp7bzpgpmWlNxVUuTLagOyHv28jsiU+cdL2FWyV36sC
 ARcyM0yLxeyDUdnGIXhzUMlytLMTqQiuUUKzRvOdM+yjNxswGWDTqJS9eb0ziJDrhu/qzmzQs4j
 5nwPuBa/TVtEt7sTbCqBZ9eGHGESweXrOjq8H5kcU8Pp6WM4uaa9js/EHPZqrsSM0OUVBdAjKYQ
 ==
X-Received: by 2002:a05:6a00:1392:b0:847:8d2d:713c with SMTP id
 d2e1a72fcca58-847c5193970mr3962647b3a.50.1782982490340; 
 Thu, 02 Jul 2026 01:54:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:1392:b0:847:8d2d:713c with SMTP id
 d2e1a72fcca58-847c5193970mr3962604b3a.50.1782982489602; 
 Thu, 02 Jul 2026 01:54:49 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847cb7933e1sm1003514b3a.26.2026.07.02.01.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 01:54:49 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 16:54:19 +0800
MIME-Version: 1.0
Message-Id: <20260702-fix-clock-refcount-unbalance-v2-1-2383fbb9952e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782982477; l=17419;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Q6tE3QCsZcbp/Lxk9tJoa+uyS/qXdWg0T3PWWYstidk=;
 b=9nc6eQUyghpOxTnqUETz42quTo3iHXWtnFsF0615lhSNzxWwcuW83gmHcJulqE0oie83nBI9a
 HAIu6TYgclfDVsX/veCSfGmEXd0rr/OGb7szoGuWXcQzF2UCi4CHZkM
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5MSBTYWx0ZWRfX/aH3DbBVSXTq
 udlRf8mwNivaIy5s4uEgWAzjGhpQha1KN72515c6vpME4BTDVKcppC2AkYX7An88/A7MUpVzBvv
 T95pW2H07vwOkh2mFDtnBYxaxfUQVMsa8wqyL3LWZM5ufvIn7YlPEmyJFeaBQQZHmqUGSgVKTOq
 2VyMjxJdiwdHF0Ikyjv+ec5AywM3eptHNR7XNh1a1Zw3Q+b7Z/lsTs9EdcVAlbKtAAWE9gtrk5r
 Tw8P4g/EOEJR/I0qfASFRzQgqlae6YuAc1XpOUrhHwps34wex2tYVvajC4sNo8hPDPXumk1g0fr
 WdFrXFKlboofM1x2KuCo9nMdbxUhnXliBSLMe1ptRUUGt1yEK2tfahfEX+fEUb29IPxfxci9UuK
 YO5mG4Tz/CQw4TnxVejTw2KpvbKaToBfah5D6h6YetvlI0pfTA3r4F+uPc5gtG5Gni0VtubTBnC
 59WBxrvY0Qq4NePgdXQ==
X-Authority-Analysis: v=2.4 cv=SuGgLvO0 c=1 sm=1 tr=0 ts=6a46275b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=hqFQHrWFFG5QrmS-gPsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5MSBTYWx0ZWRfX/2/zTGcLhsNJ
 XxN7TwsS1Iih8oRHLsnv4Os30UukkqJa61sAKtwEVw3JxcIvD+xOsY/fDJpqjoVgNvnoUep0Qoq
 z5ynSxQGVppEmkkqpu44qiJ7y6GnqZA=
X-Proofpoint-ORIG-GUID: sYuLnwokPANUckF5GoVnUNWTixCtWijZ
X-Proofpoint-GUID: sYuLnwokPANUckF5GoVnUNWTixCtWijZ
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
Subject: [Linux-stm32] [PATCH v2 1/2] coresight: Fix clock refcount
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo,qualcomm.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B36A96F4FF1

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
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c       | 8 ++++++++
 drivers/hwtracing/coresight/coresight-cpu-debug.c  | 8 ++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 8 ++++++++
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 8 ++++++++
 drivers/hwtracing/coresight/coresight-funnel.c     | 8 ++++++++
 drivers/hwtracing/coresight/coresight-replicator.c | 8 ++++++++
 drivers/hwtracing/coresight/coresight-stm.c        | 8 ++++++++
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 8 ++++++++
 drivers/hwtracing/coresight/coresight-tpiu.c       | 8 ++++++++
 9 files changed, 72 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index ad8dafea7d2f..b72fa7f4bdeb 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -629,42 +629,50 @@ static int catu_platform_probe(struct platform_device *pdev)
 
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __catu_probe(&pdev->dev, res);
 	pm_runtime_put(&pdev->dev);
 	if (ret)
 		pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
 
 static void catu_platform_remove(struct platform_device *pdev)
 {
 	struct catu_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
 
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
 static int catu_runtime_suspend(struct device *dev)
 {
 	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(drvdata->atclk);
 	clk_disable_unprepare(drvdata->pclk);
 
 	return 0;
 }
 
 static int catu_runtime_resume(struct device *dev)
 {
 	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
 	int ret;
 
 	ret = clk_prepare_enable(drvdata->pclk);
 	if (ret)
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 3a806c1d50ea..87b39874461e 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -693,42 +693,50 @@ static int debug_platform_probe(struct platform_device *pdev)
 
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __debug_probe(&pdev->dev, res);
 	if (ret) {
 		pm_runtime_put_noidle(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
 	}
 	return ret;
 }
 
 static void debug_platform_remove(struct platform_device *pdev)
 {
 	struct debug_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
 
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
 static const struct acpi_device_id debug_platform_ids[] = {
 	{"ARMHC503", 0, 0, 0}, /* ARM CoreSight Debug */
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, debug_platform_ids);
 #endif
 
 #ifdef CONFIG_PM
 static int debug_runtime_suspend(struct device *dev)
 {
 	struct debug_drvdata *drvdata = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(drvdata->pclk);
 
 	return 0;
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..e0e33e3ca5bf 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -248,42 +248,50 @@ static int ctcu_platform_probe(struct platform_device *pdev)
 
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	ret = ctcu_probe(pdev);
 	pm_runtime_put(&pdev->dev);
 	if (ret)
 		pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
 
 static void ctcu_platform_remove(struct platform_device *pdev)
 {
 	struct ctcu_drvdata *drvdata = platform_get_drvdata(pdev);
 
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
 static int ctcu_runtime_suspend(struct device *dev)
 {
 	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(drvdata->apb_clk);
 
 	return 0;
 }
 
 static int ctcu_runtime_resume(struct device *dev)
 {
 	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev);
 
 	return clk_prepare_enable(drvdata->apb_clk);
 }
 #endif
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 14bb31bd6a0b..a3ae8e1e3a1b 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2399,41 +2399,49 @@ static void etm4_remove_dev(struct etmv4_drvdata *drvdata)
 		etm_perf_symlink(drvdata->csdev, false);
 		cscfg_unregister_csdev(drvdata->csdev);
 		coresight_unregister(drvdata->csdev);
 	}
 }
 
 static void etm4_remove_amba(struct amba_device *adev)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(&adev->dev);
 
 	if (drvdata)
 		etm4_remove_dev(drvdata);
 }
 
 static void etm4_remove_platform_dev(struct platform_device *pdev)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
 
 	if (drvdata)
 		etm4_remove_dev(drvdata);
+	/*
+	 * Resume the device so its clocks are enabled again, balancing the
+	 * clk_disable_unprepare() that devm runs when the driver detaches.
+	 * Then mark it suspended and drop the usage count taken here.
+	 */
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 static const struct amba_id etm4_ids[] = {
 	CS_AMBA_ID(0x000bb95d),			/* Cortex-A53 */
 	CS_AMBA_ID(0x000bb95e),			/* Cortex-A57 */
 	CS_AMBA_ID(0x000bb95a),			/* Cortex-A72 */
 	CS_AMBA_ID(0x000bb959),			/* Cortex-A73 */
 	CS_AMBA_UCI_ID(0x000bb9da, uci_id_etm4),/* Cortex-A35 */
 	CS_AMBA_UCI_ID(0x000bbd05, uci_id_etm4),/* Cortex-A55 */
 	CS_AMBA_UCI_ID(0x000bbd0a, uci_id_etm4),/* Cortex-A75 */
 	CS_AMBA_UCI_ID(0x000bbd0c, uci_id_etm4),/* Neoverse N1 */
 	CS_AMBA_UCI_ID(0x000bbd41, uci_id_etm4),/* Cortex-A78 */
 	CS_AMBA_UCI_ID(0x000f0205, uci_id_etm4),/* Qualcomm Kryo */
 	CS_AMBA_UCI_ID(0x000f0211, uci_id_etm4),/* Qualcomm Kryo */
 	CS_AMBA_UCI_ID(0x000bb802, uci_id_etm4),/* Qualcomm Kryo 385 Cortex-A55 */
 	CS_AMBA_UCI_ID(0x000bb803, uci_id_etm4),/* Qualcomm Kryo 385 Cortex-A75 */
 	CS_AMBA_UCI_ID(0x000bb805, uci_id_etm4),/* Qualcomm Kryo 4XX Cortex-A55 */
 	CS_AMBA_UCI_ID(0x000bb804, uci_id_etm4),/* Qualcomm Kryo 4XX Cortex-A76 */
 	CS_AMBA_UCI_ID(0x000bbd0d, uci_id_etm4),/* Qualcomm Kryo 5XX Cortex-A77 */
 	CS_AMBA_UCI_ID(0x000cc0af, uci_id_etm4),/* Marvell ThunderX2 */
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 0abc11f0690c..d69cd66e8394 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -316,42 +316,50 @@ static int funnel_platform_probe(struct platform_device *pdev)
 
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	ret = funnel_probe(&pdev->dev, res);
 	pm_runtime_put(&pdev->dev);
 	if (ret)
 		pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
 
 static void funnel_platform_remove(struct platform_device *pdev)
 {
 	struct funnel_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
 
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
 	{.compatible = "arm,coresight-static-funnel"},
 	{}
 };
 
 MODULE_DEVICE_TABLE(of, funnel_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id funnel_acpi_ids[] = {
 	{"ARMHC9FE", 0, 0, 0}, /* ARM Coresight Static Funnel */
 	{"ARMHC9FF", 0, 0, 0}, /* ARM CoreSight Dynamic Funnel */
 	{},
 };
 
 MODULE_DEVICE_TABLE(acpi, funnel_acpi_ids);
 #endif
 
 static struct platform_driver funnel_driver = {
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 2f382de357ee..1df01deb2f69 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -295,42 +295,50 @@ static int replicator_platform_probe(struct platform_device *pdev)
 
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	ret = replicator_probe(&pdev->dev, res);
 	pm_runtime_put(&pdev->dev);
 	if (ret)
 		pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
 
 static void replicator_platform_remove(struct platform_device *pdev)
 {
 	struct replicator_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
 
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
 static int replicator_runtime_suspend(struct device *dev)
 {
 	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(drvdata->atclk);
 	clk_disable_unprepare(drvdata->pclk);
 
 	return 0;
 }
 
 static int replicator_runtime_resume(struct device *dev)
 {
 	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
 	int ret;
 
 	ret = clk_prepare_enable(drvdata->pclk);
 	if (ret)
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 4e860519a73f..a75b1c56a867 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -1008,42 +1008,50 @@ static int stm_platform_probe(struct platform_device *pdev)
 
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __stm_probe(&pdev->dev, res);
 	pm_runtime_put(&pdev->dev);
 	if (ret)
 		pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
 
 static void stm_platform_remove(struct platform_device *pdev)
 {
 	struct stm_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
 
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
 static const struct acpi_device_id stm_acpi_ids[] = {
 	{"ARMHC502", 0, 0, 0}, /* ARM CoreSight STM */
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, stm_acpi_ids);
 #endif
 
 static struct platform_driver stm_platform_driver = {
 	.probe	= stm_platform_probe,
 	.remove = stm_platform_remove,
 	.driver	= {
 		.name			= "coresight-stm-platform",
 		.acpi_match_table	= ACPI_PTR(stm_acpi_ids),
 		.suppress_bind_attrs	= true,
 		.pm			= &stm_dev_pm_ops,
 	},
 };
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc5a133ada3e..ed40bfea32f9 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -971,42 +971,50 @@ static int tmc_platform_probe(struct platform_device *pdev)
 
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __tmc_probe(&pdev->dev, res);
 	pm_runtime_put(&pdev->dev);
 	if (ret)
 		pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
 
 static void tmc_platform_remove(struct platform_device *pdev)
 {
 	struct tmc_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
 
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
 static int tmc_runtime_suspend(struct device *dev)
 {
 	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(drvdata->atclk);
 	clk_disable_unprepare(drvdata->pclk);
 
 	return 0;
 }
 
 static int tmc_runtime_resume(struct device *dev)
 {
 	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
 	int ret;
 
 	ret = clk_prepare_enable(drvdata->pclk);
 	if (ret)
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 7b029d2eb389..775507d0bb36 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -268,42 +268,50 @@ static int tpiu_platform_probe(struct platform_device *pdev)
 
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __tpiu_probe(&pdev->dev, res);
 	pm_runtime_put(&pdev->dev);
 	if (ret)
 		pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
 
 static void tpiu_platform_remove(struct platform_device *pdev)
 {
 	struct tpiu_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
 
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
 static const struct acpi_device_id tpiu_acpi_ids[] = {
 	{"ARMHC979", 0, 0, 0}, /* ARM CoreSight TPIU */
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, tpiu_acpi_ids);
 #endif
 
 static struct platform_driver tpiu_platform_driver = {
 	.probe	= tpiu_platform_probe,
 	.remove = tpiu_platform_remove,
 	.driver = {
 		.name			= "coresight-tpiu-platform",
 		.acpi_match_table	= ACPI_PTR(tpiu_acpi_ids),
 		.suppress_bind_attrs	= true,
 		.pm			= &tpiu_dev_pm_ops,
 	},
 };

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
