Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id he4AKDYrKGrQ/QIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 17:03:18 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1936F6617AF
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 17:03:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=aglvGCQC;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=hXxC54M1;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4653C8F292;
	Tue,  9 Jun 2026 15:03:15 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6492C8F290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2026 15:03:13 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659CmRuT2625154
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 9 Jun 2026 15:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=88cwJVjL2lnzu2cVHtBfD3
 jOAXqQUPFnSKVzm/xtaEI=; b=aglvGCQCGidI5XCIJbp+GZNa1nQ1FJjU+LP7vo
 wQ7+ec43PuohSglEXOsgxFAGBOPD++z69+aTRHyvHVI4rHMq2ev6ZkOtzqjZnoFe
 p2uG4BPfUjDe+JA280ag11U5PJa30CIYH0Pu6cUZyK+vrqlcLur/lT3i6mZSkqyN
 3VuQN1thZ1eRFN2EAN6NQ4s5MXhXRK0WcaCebhHRknwZh9jvupER5vrVoRcb8/Rr
 jsmjA16PMwZHUZ+/3Yd24fA72VMFVPpRkKF0HOgWpo/uZIyH7Kxx6DGIjEDkifDg
 k14dXD2Lsu+jw2UIW6tyimzvbuC8LHsNNFgawH5faXuZhgeg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epddsadk3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jun 2026 15:03:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-8423f3e4728so3724052b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jun 2026 08:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781017391; x=1781622191;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=88cwJVjL2lnzu2cVHtBfD3jOAXqQUPFnSKVzm/xtaEI=;
 b=hXxC54M1TjgFEGhl8dZVlF1AuGgWqvzo9dEzODmkhz1D9hGQtUIG+vn0KZtBpiaJNQ
 iDYG80uRv5JfqySq5G49gvCA+O4u3XWjgf8/kftd4QxrQobc/oXyn0tRu8WTWe0nvBUw
 ZxAwA/P7AYHCYKqa8xbLyUTrA9L6eZuY2mO+5Et1ZZbci1rsa6Cdq6OfR6Q1UfmB0mBx
 tiom9VpBDT/WF1SmyElAXypov28tZ2hhN/gL/ZVn29jN26gSAkbGkRuTR+S+doYlhyca
 trgJSHBVce3SGEBn/9UxQFW4X03XjnDIk3n8Atkhb5l9diF4uCo35ry9J9DnBroum3aF
 pfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781017391; x=1781622191;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=88cwJVjL2lnzu2cVHtBfD3jOAXqQUPFnSKVzm/xtaEI=;
 b=JwFwcj+7OHu/uvVG3ZMCvxxKS4Lcgj64Z6Y14g19/jAx9g8DhyicvtihMMBTM80iKu
 arR3tjdZQ/Rq6yDifQAyXjxGmBDygiUrm/zh9fgHMEKhwB8KwXskb7V3HNlrdok6RIIA
 Yyk4qHQi5ZOso/GkKcgvRBEEzTBBb30sbIGpBqfvzLh3H59WvHggeE+nUDgy5/i4d6uE
 k4gMeZNR900MKSAneXnXDvRgmxmZG7MGzA4nX+cvFgcA1/YsllMKylz/pNHQHAuWSLzU
 sV9aBrMPrRnGStdebt0zh9Y38xfMPbnf3EGIeWzHX97pc3fZRg30coIcFR2nzM0demcq
 xNkw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8dibnszI54Hg9MS4WcyqweVj6nXuVqMd1Ajr/vdKbQyprSxysFqIYWzK5gfBcTPtPEvIPVrfVCQetnlQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwQTdeGQPRtE+qil3Q/B9SrHsbq4WQuesWtf25fzD750R/jfoSQ
 szezwZ73X9SbjOdjIVFyvisebAvYkYPHIkKRwWeNXfEo2WOk4Vhru6ofp13IDxc4hnzquCVTbTl
 OPVvVRgemiASqUHDbKWhn8vnQ9YKAgQ7H9Xn3dCRavsxFkipFb9VEGivwnMtOr+zEBvHS2VayxX
 QIAHUI4Bo=
X-Gm-Gg: Acq92OHTQxBnnBF4/nd1bl/FZkqyCmEe+nKODSIW6RDs/Ua11eGtAgxh3MTGYvZEwUG
 kHcvGSYDaTCS1pUhHjTsvBlKsFFeAbGG7Cy/A9/wKwTtiI8p1rXoIVlilNDgK0mW2DJE0HRrEE9
 6V7dBArJD/U04rpADBypkYz7FwE6l+GnNZkMxfbRuKaR2oRwFJJi2RM6GfTI+2siCeqlO3dkv5A
 sbqthv9tdCt8DMgDjXbZxjot1Y5YQTnirPrYkp/bdqjNPUwU+XZ1+V2J7lC06gOTOv0jXLmRWEt
 aJFwZGTt7K+jwGXpvdV6aE3SVHBPRisaFj16vDYjtViE9jrqtY0D1vCIv8/UGBlVW8m1GjoSVHR
 +8geCXzhQqa/b1guQU9/y0F4UjAr16Wyw6U9exYnGrgoEv8wtZ6SxwcmU
X-Received: by 2002:a05:6a00:1946:b0:842:75d0:7e88 with SMTP id
 d2e1a72fcca58-842b1064cc1mr22480489b3a.27.1781017390591; 
 Tue, 09 Jun 2026 08:03:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:1946:b0:842:75d0:7e88 with SMTP id
 d2e1a72fcca58-842b1064cc1mr22480295b3a.27.1781017389562; 
 Tue, 09 Jun 2026 08:03:09 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-842828d6bd1sm26987659b3a.44.2026.06.09.08.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 08:03:09 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 20:32:51 +0530
Message-Id: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABsrKGoC/x3MSwqAMAwA0atI1haK1qBeRaTUGDXgjxaKKN7d4
 vItZh4I7IUDtNkDnqMEOfYEzDOgxe0zKxmTodAFatSNGoziVW5nt80S2YgKDVFZjcZhU0PqTs+
 TXP+z69/3Ax0TjeRjAAAA
X-Change-ID: 20260609-b4-eliza_mm_cc_v6-64cc35d4a698
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: CDCM7Mn2K1UAKSjyA766SR336Swtal4x
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a282b30 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8HYrQF7E7KXWYYjJzRwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: CDCM7Mn2K1UAKSjyA766SR336Swtal4x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MiBTYWx0ZWRfX5wY97h6iFQyL
 NmXdEinGr0+Yi1b3IS5i0O3PHRoUo3g8KQooFWPegKP8D3hlwS7QQW+SzX6MFgWEaB1e3RLkLED
 O/uDSdllWB+H8+TCSdQO/FescTDOBkvsRuLaQeH36+3TAVvXfMssGJFLPdxfwFILoFmBg2ZxUOP
 bfvDJQxyB6s11ldu3lSo/QDiWqdhnfyK9mgofQ2+4V8dwJ6Wsd8Z/EPqhWPyXJLeFql9i4/R1Q3
 VnRhcSyowkH6/1nmUfe7qn9AsKcdRe161PaNSnT12A6kvHj7nZGnQXs0rXB8j4dDZH/eFkzGF65
 v7tAfi8nk+dJoCGJWF2/woePJ/u2t6nW0M5wl5ZwzTYrvrdGs3pz9wArXcAfCUrQh/GMT5BItSI
 AqemQdkY7OESd6/0l5yZbSiHF7Q6kLb66iaXasGV4uABcLPSgX9PrJTv3/PgEfdwa4NVAUHVfiy
 e2bHzsriwhWugdvN/hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090142
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 0/7] Add support for Video, Camera,
 Graphics clock controllers on Eliza
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
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:konrad.dybcio@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1936F6617AF

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
and MXC rails dependency. Since CX and MX rails are already ON when APPS
is active, explicit power-domain voting is not required similar to Milos.
Hence extended the Milos camcc & videocc documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v6:
  - Update device tree to latest linux-next.
  - Update commit text for no ABI breakage for VideoCC and CAMCC
    binding [Krzysztof]
  - Added the RB-by from patchset v5.
  - Link to v5: https://lore.kernel.org/r/20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com

Changes in v5:
- Taken care of comments from v3, v4.
- Update milos-videocc and milos-camcc bindings to add '#power-domain-cells'
  as required property in bindings.
- Remove duplicate clock 'gpu_cc_gpu_smmu_vote_clk' from driver and
  bindings.
- Add '#power-domain-cells' for 'camcc' and 'cambistmclkcc' device node.
- Link to v4: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com

Changes in v4:
- Update the clock ordering for camcc and cambistmclkcc in milos.dtsi.
- Link to v3: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com

Changes in v3:
- Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
- Dropped the defconfig patch and included the drivers as m from Kconfig itself.
- Update the header inclusion in the milos.dtsi.
- Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com

Changes in v2:
 - rebased the patches on the latest linux-next.
 - Add new bindings for Video and Camcc.
 - Remove commented code in GPUCC (limiter code).
 - Add device nodes for the corresponding clock controllers.
 - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
 - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (7):
      dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,milos-camcc.yaml           |   12 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |   10 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   61 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  607 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 14 files changed, 4666 insertions(+), 4 deletions(-)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-b4-eliza_mm_cc_v6-64cc35d4a698

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
