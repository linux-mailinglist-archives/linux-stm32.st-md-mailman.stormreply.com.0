Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mvyWLqZHUGoOwAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2026 03:15:18 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F13E7367B0
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2026 03:15:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=cEVSLL7O;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=hIQKWsa3;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88425C8F297;
	Fri, 10 Jul 2026 01:15:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAB1BC7BF8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 01:15:15 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 669HYpH42519867
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 10 Jul 2026 01:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=ii/LdTnc46om4DGVyz/NYI
 KpJ3UQPwVgIjRx2xQN044=; b=cEVSLL7Otabi04fMxtMuVlqK+jG2V0lJoj48wk
 JNR6sjU0zro5GBF4E6vHGXmQBgrSuANmhO2SuS5Ax+p7eZxh2GHEFi1boYiEWHsG
 X8z+cYVvdoOj387HNLBZZAIXUKzoQeu4GPsz+jr0fcJf2oTpBm3TCOLDy69nBCEs
 ZedbStk0vNbTYBjXMWfIp0Yu5mAxs9XiRpF/Nvus+ijcky00R2vDFyDqD2uio4LI
 uhbCzWxRRhsjRTAzBA96kgh7SeCRDbVK92PMSfXK9Rzgg3qpagjuHnPJiP0agDOn
 NSXipbXqqfZg3N1mBMfKBQVcYjAsbX2RvFGXBkpdrWCVpO/w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeest2x4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 01:15:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2cccfa32670so4792155ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Jul 2026 18:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783646113; x=1784250913;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=ii/LdTnc46om4DGVyz/NYIKpJ3UQPwVgIjRx2xQN044=;
 b=hIQKWsa3vLzGOIFf/VU3wpXz3j3rke5dul29pkJbtVrlIh/lNqEBkboSjiLXQIdlMg
 k8HRIaAGHmmjG4PfKrrpJz78V/Jzq8exyDAzKJI0Kvy1NY/2vuTUvsFfJNGe2tn1Bw8u
 Z46UynkoVwGWuTTRnsvurwUWic7q5DJrQz1+2ytP7vcY/ilkEZ8HVG1PKUj1NfVpyPOA
 BfN85v/CzkVSTZBhFyM42d94QnKltZ1pzRy6sNTGMYhBXzwfAKY/Aq4gDeao2A/m85JX
 bqkngeuRaQRx+zTtSclQHAJwfW1Mb1PoW6wm7sKrTtv4uHeDRW1fWYMVnfJFfDo8R5Ae
 jG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783646113; x=1784250913;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ii/LdTnc46om4DGVyz/NYIKpJ3UQPwVgIjRx2xQN044=;
 b=ibpBAstZl54duiVzIfCQ3bI825qgsO/Abd64fnbxDF23dfXTR6mKJPFfNhCyh1MrI6
 WW5kD7zxI7VNEb4PH0w4Ad5Oh1mqBJSVCyHYk5COVkxAITWVvwtnMV6pd8H9UZz+Gnvb
 KstcjuXS1H8IaBwGZDJavA3SW8TDR2IxUUmDGHPDdoGsjKsKZZ1d6wH2T5eJLwjwVc8j
 H67RsPJdP1+WWCs4qw0rep2pYjgKBuPHENuOrhdNYJ6w+QMd5WF2RQ84vLQcdPTo6LUw
 5NWh3S/lEIimZW/IvvXb2vtPV6LkYMsqpnJHOHstKwjBbfiUu6Jo1nO9TfravYNCMnhb
 AtAg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqJ4Uk8bo/HbTd+Mwd1jh5lL3hFfRhiXCaFhSvsCvBxu5c9a2v2lFHEbqycw/xb1H2gag9kfCoDSh9upg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwEimsOq8NzlNylHzNOqoea76MA9tN8Cubc+7VxpZSpnmrMoMdf
 uizb+/URYKCRA+XrUi5UzDo0OgX5ovO09xTa4uGwyyfLMtJvE1e7QloyBvrN1ewp+QSAzeVo6Nw
 DLM66omVHrr5vFAM0UM81CLPmr6UoG6ZZ9+sXqFR8oCZKT5/xZ6lDYkwfCoAUAuS0K2UPhMGNjn
 rP5r0czkY=
X-Gm-Gg: AfdE7ckVhv6KjVPdFDnhCGSOGxaFeER1ljcCN552Jcy+YxDVB3SDhcqFR5yoOdc3Hu0
 vQaF5s5ALVBKxZMTitlxeAylzXUQsRPtFYLYHYggFI/0dHHspLpz36mOkarIuLZPz/1v+IhjEds
 lf3IKEIwPdqDyel9XC3g5VYIOU6YvpCwT50AAjan5GP9eQ3h44MI8q+hnUxoF4V12Ub3TOZqbO9
 vdatctbvaE3pt6RguQELHqGBqXaatxYomqA7L1BfkYlOPWSc2uLYB2B05HX/3dUpp8sXMN0JwnX
 s+ociYqp13Jmop1Hdpi2qbEwplgd/CcZHAlIFR/uMvt+tD44Rmd/cOfoieuD7jgh3QANrpFP5fI
 IKopzDmUne75FIva9LvSFfhs+sQJ3RCRetOhx6HGIw/lui0CtEk2BI5ZtCoUaur5WI2p9UtwTEQ
 ==
X-Received: by 2002:a05:6a20:938c:b0:3b3:fc6:6226 with SMTP id
 adf61e73a8af0-3c0bcede14fmr13931056637.24.1783646113033; 
 Thu, 09 Jul 2026 18:15:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:938c:b0:3b3:fc6:6226 with SMTP id
 adf61e73a8af0-3c0bcede14fmr13931003637.24.1783646112558; 
 Thu, 09 Jul 2026 18:15:12 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ca5b31628c1sm4431251a12.19.2026.07.09.18.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 18:15:11 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 09:14:46 +0800
Message-Id: <20260710-fix-clock-refcount-unbalance-v3-0-a37a1fb17981@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIdHUGoC/43NSw6CMBCA4auYri3pQwu48h7GRRkGaYRWW2gwh
 LtbWLkw0c0k/2TyzUwCeoOBnHYz8RhNMM6mkPsdgVbbG1JTpyaCCcVyxmljJgqdgzv12IAb7UB
 HW+lOW0CKORxUzqXShSKJeKQbM2385Zq6NWFw/rV9i3zd/glHThmVgtegJPCmZGcXQvYcdQeu7
 7M0yOpH8WmKH6ZIppCFbKqqLI8Cv5jLsrwBYbN/1CMBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783646107; l=6575;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=34mMKmz62IJJvQEQf4zpfUNRjPSA4yvuY3mKxmyPMcQ=;
 b=KF7fwSHd1M9K4mDW63yRx7Kh1NKtMqo+8BL/qyp05JXERIqtsYFyOnOTgL1EX9mrHxs3d5A32
 L28VmT9INGJD+8W/GufuXp8xAPeRtNf2hebaipcrCTyyeFQaGmwKKya
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: TrePTh8TIIYERdCiPQ3qlC6JrYw6zTi0
X-Authority-Analysis: v=2.4 cv=bbpbluPB c=1 sm=1 tr=0 ts=6a5047a2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9pHmQkOP4Je6lBMvZCAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAwOSBTYWx0ZWRfX5utskV9VJLAN
 XSlX2Ga0PwslOUtX4hmL371bcBhTol/LVsHFzkVhmrflPRjAbiWrxe/G6MHlfgs5MRcXVfVIvnw
 pk4BRR9YbdlP4BF47fenLZu+1yh0NOg=
X-Proofpoint-ORIG-GUID: TrePTh8TIIYERdCiPQ3qlC6JrYw6zTi0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAwOSBTYWx0ZWRfX2K5qcZf0/xg2
 ojMuiJXD5UQKWfmQtacK1/kszy1sQX7QHorPrMxt3UsV9XxbF5oHcwRRncu0ORVp8YCJ3dN/ZJW
 yKEVj448SdyGZJ6ArLFvBscylEKXzbGICdBK50Ep7cpS87ug/bmeklGhJ9khT7fFgxgRq9QIG6E
 q4utmqyzyI6rXHCxdFp6jL5wd3L0q9frx+9HWGRi1kqcgoeT9Ps2EfHNT81hOoWqxkxZeiO1fl9
 GkDbCjILUxrpHdq1yEl3+RfOt0rKyy6YX2fHd8qEhM/ly/UAKvIiyT70sBqU7C8HepJfQc2+rbh
 obtjRWuk+70c1YQAJTZXx4u4z54hXwmfoxpQRezzZVkg7+iNYGZyRds1u8c2YAhoAXOMNyvTZVF
 G/EzrjdErYPvjB/lbQwtVHTLCHZGZgnSREdvdz4s6mGd2jthORNtMm9Pkjs8m+We7m255OMwoE/
 0Fxuouttsj05uIg/qAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100009
Cc: coresight@lists.linaro.org, Jie Gan <jie.gan@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 0/2] fix clock refcount imbalance for all
 Coresight platform drivers
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F13E7367B0

Found a clock imbalance issue when remove the CTCU module.

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

Calltrace:

[  194.074015] ------------[ cut here ]------------
[  194.078779] qdss already disabled
[  194.082210] WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0x238/0x240, CPU#4: rmmod/508
[  194.090976] Modules linked in: coresight_ctcu(-) snd_soc_hdmi_codec snd_soc_core snd_compress snd_pcm_dmaengine snd_pcm snd_timer snd soundcore 8021q garp mrp phy_qcom_edp stp af_alg llc anx7625 typec pci_pwrctrl_pwrseq hci_uart qcom_iris v4l2_mem2mem btqca btbcm qcom_pon videobuf2_dma_contig rtc_pm8xxx nvmem_qcom_spmi_sdam qcom_spmi_temp_alarm videobuf2_memops qrtr videobuf2_v4l2 bluetooth msm qcom_stats pwrseq_qcom_wcn ubwc_config videodev ocmem ecdh_generic drm_gpuvm videobuf2_common drm_exec gpu_sched qcom_q6v5_pas kpp marvell videocc_sa8775p camcc_sa8775p ecc drm_dp_aux_bus dispcc0_sa8775p spi_geni_qcom i2c_qcom_geni llcc_qcom mc qcom_refgen_regulator phy_qcom_snps_femto_v2 phy_qcom_qmp_usb icc_bwmon phy_qcom_sgmii_eth dwmac_qcom_ethqos qcom_pil_info gpucc_sa8775p qcom_q6v5 stmmac_platform stmmac ufs_qcom qcom_sysmon drm_display_helper qcom_common pcs_xpcs phylink cec qcom_glink_smem qcrypto drm_client_lib mdt_loader dispcc1_sa8775p qmi_helpers phy_qcom_qmp_ufs libdes qcom_ic
 e display_connector phy_qcom_qmp_pcie
[  194.091130]  qcom_wdt qcomtee nvmem_reboot_mode icc_osm_l3 qcom_rng drm_kms_helper cfg80211 rfkill socinfo fuse drm backlight stm_p_basic
[  194.196124] CPU: 4 UID: 0 PID: 508 Comm: rmmod Not tainted 7.1.0-next-20260623-00008-ga4671328ba36 #831 PREEMPT
[  194.206566] Hardware name: Qualcomm SA8775P Ride (DT)
[  194.211771] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  194.218938] pc : clk_core_disable+0x238/0x240
[  194.223426] lr : clk_core_disable+0x238/0x240
[  194.227908] sp : ffff8000889fbb40
[  194.231327] x29: ffff8000889fbb40 x28: ffff0000972eb580 x27: 0000000000000000
[  194.238662] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
[  194.245995] x23: ffffd181d3de4620 x22: ffff8000889fbc28 x21: ffff000082382810
[  194.253322] x20: ffff000082334a00 x19: ffff000082334a00 x18: 0000000000000006
[  194.260658] x17: ffffd181d293fb18 x16: ffffd181d295c3c8 x15: ffff8000889fb550
[  194.267991] x14: 0000000000000000 x13: ffffd181d4eea620 x12: 00000000000004cf
[  194.275346] x11: 0000000000000e6d x10: ffffd181d4f42620 x9 : ffffd181d4eea620
[  194.282676] x8 : 3fffffffffffefff x7 : ffffd181d4f42620 x6 : bffffffffffff000
[  194.290007] x5 : ffff000ead974248 x4 : 0000000000000000 x3 : ffff2e8cd9611000
[  194.297338] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000972eb580
[  194.304671] Call trace:
[  194.307199]  clk_core_disable+0x238/0x240 (P)
[  194.311687]  clk_disable+0x30/0x4c
[  194.315192]  clk_disable_unprepare+0x18/0x30
[  194.319596]  devm_clk_release+0x24/0x3c
[  194.323578]  dr_node_release+0x1c/0x28
[  194.327466]  release_nodes+0x5c/0x90
[  194.331147]  devres_release_all+0x90/0x104
[  194.335364]  device_unbind_cleanup+0x2c/0x84
[  194.339762]  device_release_driver_internal+0x200/0x23c
[  194.345153]  driver_detach+0x4c/0x94
[  194.348835]  bus_remove_driver+0x6c/0xbc
[  194.352872]  driver_unregister+0x30/0x60
[  194.356914]  platform_driver_unregister+0x14/0x20
[  194.361753]  ctcu_driver_exit+0x18/0xdf8 [coresight_ctcu]
[  194.367308]  __arm64_sys_delete_module+0x1bc/0x298
[  194.372240]  invoke_syscall+0x54/0x10c
[  194.376114]  el0_svc_common.constprop.0+0xc0/0xe0
[  194.380956]  do_el0_svc+0x1c/0x28
[  194.384374]  el0_svc+0x54/0x3a0
[  194.387626]  el0t_64_sync_handler+0xa0/0xe4
[  194.391951]  el0t_64_sync+0x198/0x19c

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v3:
- etm4x: bail out with WARN_ON() when drvdata is missing instead of
  silently skipping teardown, and call etm4_remove_dev() after
  pm_runtime_get_sync() so the device is resumed before it is torn down.
- collect reviewed-by tag from Leo.
- Link to v2: https://lore.kernel.org/r/20260702-fix-clock-refcount-unbalance-v2-0-2383fbb9952e@oss.qualcomm.com

Changes in v2:
- Balance the runtime PM state in the remove path: after
  pm_runtime_get_sync() and pm_runtime_disable(), also call
  pm_runtime_set_suspended() and pm_runtime_put_noidle() so the device is
  left suspended with a balanced usage count once the devm action has
  disabled the clocks.
- Picked up Reviewed-by from Yeoreum Yun on patch 1.
- Link to v1: https://lore.kernel.org/r/20260701-fix-clock-refcount-unbalance-v1-0-321dc63c1f90@oss.qualcomm.com

---
Jie Gan (2):
      coresight: Fix clock refcount imbalance on platform remove
      coresight: tnoc: Fix clock refcount imbalance on platform remove

 drivers/hwtracing/coresight/coresight-catu.c       |  8 ++++++++
 drivers/hwtracing/coresight/coresight-cpu-debug.c  |  8 ++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  |  8 ++++++++
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 13 +++++++++++--
 drivers/hwtracing/coresight/coresight-funnel.c     |  8 ++++++++
 drivers/hwtracing/coresight/coresight-replicator.c |  8 ++++++++
 drivers/hwtracing/coresight/coresight-stm.c        |  8 ++++++++
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  8 ++++++++
 drivers/hwtracing/coresight/coresight-tnoc.c       |  8 ++++++++
 drivers/hwtracing/coresight/coresight-tpiu.c       |  8 ++++++++
 10 files changed, 83 insertions(+), 2 deletions(-)
---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260701-fix-clock-refcount-unbalance-e7c467136a86

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
